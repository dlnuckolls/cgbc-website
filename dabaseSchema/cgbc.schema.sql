/*
    Cedar Grove Baptist Church Core Database
 	  Username: cgbc_user
    Password: XJ$7d{84)sa(kV4
  */ 
 USE Master;
 SET NOCOUNT ON;
 
 IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'CGBC') BEGIN
   DECLARE @tail       INT
   DECLARE @basefolder NVARCHAR(MAX)
   DECLARE @datafile   NVARCHAR(MAX)
   DECLARE @logfile    NVARCHAR(MAX)
 
   SET @tail = (SELECT CHARINDEX('\',REVERSE(physical_name)) FROM Master.sys.master_files WHERE name = 'master')
   SET @basefolder = (SELECT SUBSTRING(physical_name,1,LEN(physical_name)-@tail) FROM Master.sys.master_files WHERE name = 'master')
   SET @datafile = @basefolder + '\CGBC.mdf'
   SET @logfile = @basefolder + '\CGBC.ldf'
   DECLARE @sql NVARCHAR(MAX)
   SET @sql = 'CREATE DATABASE [CGBC] ON PRIMARY ' +
   '( NAME = N''CGBC'', FILENAME = ''' + @datafile + ''', SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ) ' +
    ' LOG ON ' + 
   '( NAME = N''CGBC_log'', FILENAME = ''' + @logfile + ''', SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)'
   EXEC(@sql)
   
   ALTER DATABASE CGBC SET COMPATIBILITY_LEVEL = 100;
   ALTER DATABASE CGBC SET ANSI_NULL_DEFAULT OFF;
   ALTER DATABASE CGBC SET ANSI_NULLS OFF;
   ALTER DATABASE CGBC SET ANSI_PADDING OFF; 
   ALTER DATABASE CGBC SET ANSI_WARNINGS OFF; 
   ALTER DATABASE CGBC SET ARITHABORT OFF; 
   ALTER DATABASE CGBC SET AUTO_CLOSE OFF; 
   ALTER DATABASE CGBC SET AUTO_CREATE_STATISTICS ON; 
   ALTER DATABASE CGBC SET AUTO_SHRINK OFF; 
   ALTER DATABASE CGBC SET AUTO_UPDATE_STATISTICS ON; 
   ALTER DATABASE CGBC SET CURSOR_CLOSE_ON_COMMIT OFF; 
   ALTER DATABASE CGBC SET CURSOR_DEFAULT  GLOBAL; 
   ALTER DATABASE CGBC SET CONCAT_NULL_YIELDS_NULL OFF; 
   ALTER DATABASE CGBC SET NUMERIC_ROUNDABORT OFF; 
   ALTER DATABASE CGBC SET QUOTED_IDENTIFIER OFF; 
   ALTER DATABASE CGBC SET RECURSIVE_TRIGGERS OFF; 
   ALTER DATABASE CGBC SET AUTO_UPDATE_STATISTICS_ASYNC OFF; 
   ALTER DATABASE CGBC SET DATE_CORRELATION_OPTIMIZATION OFF; 
   ALTER DATABASE CGBC SET TRUSTWORTHY OFF; 
   ALTER DATABASE CGBC SET ALLOW_SNAPSHOT_ISOLATION OFF; 
   ALTER DATABASE CGBC SET PARAMETERIZATION SIMPLE; 
   ALTER DATABASE CGBC SET READ_WRITE; 
   ALTER DATABASE CGBC SET RECOVERY SIMPLE; 
   ALTER DATABASE CGBC SET MULTI_USER; 
   ALTER DATABASE CGBC SET PAGE_VERIFY CHECKSUM;  
   ALTER DATABASE CGBC SET DB_CHAINING OFF; 
     
      IF(@@ERROR <> 0) BEGIN
        RETURN
      END
 END
 GO
 
USE CGBC;

SET NOCOUNT ON;

DECLARE @majorVersion INT;
DECLARE @minorVersion INT;

-- Start the main transaction: Initialize the database with SchemaVersion table and data
BEGIN TRANSACTION initialCreate;
  IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[SchemaVersion]')) 
  BEGIN
    CREATE TABLE [dbo].[SchemaVersion](
      Id           UNIQUEIDENTIFIER  NOT NULL DEFAULT NEWID(),
      MajorVersion INT               NOT NULL,
      MinorVersion INT               NOT NULL,
      InstallDate  DATETIMEOFFSET(7) NOT NULL
     CONSTRAINT PK_SchemaVersion PRIMARY KEY CLUSTERED 
      (MajorVersion, MinorVersion ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
    ) ON [PRIMARY]
  END
  
  IF(@@ERROR <> 0)
  BEGIN
    ROLLBACK TRANSACTION;
    RETURN;
  END

  SET @majorVersion = 1;
  SET @minorVersion = 0;
  IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
  BEGIN
    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  END
  
  IF(@@ERROR <> 0)
  BEGIN
    ROLLBACK TRANSACTION;
    RETURN;
  END
COMMIT TRANSACTION initialCreate;

-- Begin database modifications here
SELECT @majorVersion = 1, @minorVersion = 1;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_1

	  CREATE TABLE [dbo].[AdminRoles](
		  [Id]       [uniqueidentifier] NOT NULL,
		  [RoleName] [varchar](50)          NULL,
		  [Notes]    [varchar](250)         NULL,
	  CONSTRAINT [PK_AdminRoles] PRIMARY KEY CLUSTERED (
			  [Id] ASC
		  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	  ) ON [PRIMARY];
	
	  ALTER TABLE [dbo].[AdminRoles] ADD  DEFAULT (newid()) FOR [Id];

	  CREATE TABLE [dbo].[AdminUsers](
		  [Id]            [uniqueidentifier] NOT NULL,
		  [RoleId]        [uniqueidentifier] NOT NULL,
		  [DisplayName]   [varchar](50)          NULL,
		  [UserName]      [varchar](50)      NOT NULL,
		  [UserPass]      [varchar](256)         NULL,
		  [Notes]         [varchar](250)         NULL,
		  [Deleted]       [tinyint]          NOT NULL,
		  [SuperAdmin]    [bit]              NOT NULL,
		  [PasswordReset] [bit]              NOT NULL,
	  CONSTRAINT [PK_AdminUsers] PRIMARY KEY CLUSTERED (
			  [Id] ASC
		  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	  ) ON [PRIMARY];

	  ALTER TABLE [dbo].[AdminUsers] ADD  DEFAULT (newid()) FOR [Id];
	  ALTER TABLE [dbo].[AdminUsers] ADD  DEFAULT ((0)) FOR [Deleted];
	  ALTER TABLE [dbo].[AdminUsers] ADD  DEFAULT ((0)) FOR [SuperAdmin];
	  ALTER TABLE [dbo].[AdminUsers] ADD  DEFAULT ((0)) FOR [PasswordReset];

	  CREATE TABLE [dbo].[SystemExceptions](
		  [Id]                 [uniqueidentifier]  NOT NULL,
		  [ExceptionTimeStamp] [date]              NOT NULL,
		  [Module]             [varchar](50)       NOT NULL,
		  [Exception]          [varchar](255)      NOT NULL,
		  [StackTrace]         [varchar](2000)     NOT NULL,
	  CONSTRAINT [PK_SystemExceptions] PRIMARY KEY CLUSTERED (
			  [Id] ASC
		  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	  ) ON [PRIMARY];

	  ALTER TABLE [dbo].[SystemExceptions] ADD  CONSTRAINT [DF_SystemExceptions_Id]  DEFAULT (newid()) FOR [Id];

    CREATE TABLE [dbo].[SystemConfigs](
	    [Id]           [uniqueidentifier] NOT NULL,
	    [MailServer]   [varchar](75)          NULL,
	    [ServerPort]   [int]                  NULL,
	    [SmtpUser]     [varchar](75)          NULL,
	    [SmtpPassword] [varchar](256)         NULL,
	    [FromEmail]    [varchar](75)          NULL,
	    [FromUsername] [varchar](75)          NULL,
	    [RequireSsl]   [bit]              NOT NULL,
	    [RequireAuth]  [bit]              NOT NULL
    ) ON [PRIMARY]

    ALTER TABLE [dbo].[SystemConfigs] ADD  DEFAULT ((1)) FOR [RequireSsl];
    ALTER TABLE [dbo].[SystemConfigs] ADD  DEFAULT ((1)) FOR [RequireAuth];

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_1
END

SELECT @majorVersion = 1, @minorVersion = 2;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_2
    CREATE TABLE dbo.UpcomingEvents (
	    [Id]           UNIQUEIDENTIFIER NOT NULL,
	    [Title]        VARCHAR(75)          NULL,
	    [Description]  VARCHAR(500)         NULL,
      [EventDate]    DATETIME         NOT NULL,
	  CONSTRAINT [PK_UpcomingEvents] PRIMARY KEY CLUSTERED (
			  [Id] ASC
		  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY];

	  ALTER TABLE [dbo].[UpcomingEvents] ADD  CONSTRAINT [DF_UpcomingEvents_Id]  DEFAULT (newid()) FOR [Id];

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_2
END

