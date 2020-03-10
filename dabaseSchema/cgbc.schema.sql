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

SELECT @majorVersion = 1, @minorVersion = 3;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_3
    -- States with Abbreviations
	  CREATE TABLE [dbo].[States] (
      [Id]           INT         NOT NULL IDENTITY(1,1),
	    [State]        VARCHAR(50) NOT NULL,
      [Abbreviation] VARCHAR(2)  NOT NULL,
      CONSTRAINT PK_States PRIMARY KEY CLUSTERED (
        [Id] ASC
      ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

    INSERT INTO dbo.States (Abbreviation,State) 
	  VALUES ('AL', 'Alabama'),('AK', 'Alaska'),('AZ', 'Arizona'),('AR', 'Arkansas'),('CA', 'California'),('CO', 'Colorado'),('CT', 'Connecticut'),
		       ('DE', 'Delaware'),('DC', 'District of Columbia'),('FL', 'Florida'),('GA', 'Georgia'),('HI', 'Hawaii'),('ID', 'Idaho'),('IL', 'Illinois'),
		       ('IN', 'Indiana'),('IA', 'Iowa'),('KS', 'Kansas'),('KY', 'Kentucky'),('LA', 'Louisiana'),('ME', 'Maine'),('MD', 'Maryland'),('MA', 'Massachusetts'),
		       ('MI', 'Michigan'),('MN', 'Minnesota'),('MS', 'Mississippi'),('MO', 'Missouri'),('MT', 'Montana'),('NE', 'Nebraska'),('NV', 'Nevada'),
           ('NH', 'New Hampshire'),('NJ', 'New Jersey'),('NM', 'New Mexico'),('NY', 'New York'),('NC', 'North Carolina'),('ND', 'North Dakota'),
		       ('OH', 'Ohio'),('OK', 'Oklahoma'),('OR', 'Oregon'),('PA', 'Pennsylvania'),('PR', 'Puerto Rico'),('RI', 'Rhode Island'),('SC', 'South Carolina'),
		       ('SD', 'South Dakota'),('TN', 'Tennessee'),('TX', 'Texas'),('UT', 'Utah'),('VT', 'Vermont'),('VA', 'Virginia'),('WA', 'Washington'),
		       ('WV', 'West Virginia'),('WI', 'Wisconsin'),('WY', 'Wyoming'),('AS', 'American Samoa'),('FM', 'Micronesia'),('VI', 'U.S. Virgin Islands'),
           ('PW', 'Palau'),('AA', 'U.S. Armed Forces America'),('GU', 'Guam'),('MP', 'Northern Mariana Islands'),('AE', 'U.S. Armed Forces Europe'),
           ('MH', 'Marshall Islands'),('AP', 'U.S. Armed Forces Pacific');    

    DELETE [dbo].[AdminRoles];

    INSERT INTO [dbo].[AdminRoles] (Id, RoleName, Notes) 
    VALUES ('7ec7d607-18b1-452d-8d78-3d065959d358','Registered', 'New Registration'),
           ('a7107c8f-ff15-4d5a-bba1-6db286fcef0a','User','User level access'),
           ('b6522703-8844-4cff-8fc1-916ba90f515b','System User','System Administrator');
    
    -- Create default user
    INSERT INTO [dbo].[AdminUsers] ([Id], [RoleId], [DisplayName], [UserName], [UserPass], [Notes], 
           [Deleted], [SuperAdmin], [PasswordReset])
    VALUES (newid(),'b6522703-8844-4cff-8fc1-916ba90f515b','David Nuckolls','dlnuckolls@gmail.com','5zO9V86nJwv4G04yfZ/V++IhIqOytb8ot3XcpsxjfPw=','System Created',0,1,0);

    INSERT INTO [dbo].[SystemConfigs] ([Id],[MailServer],[ServerPort],[SmtpUser],[SmtpPassword],[FromEmail],[FromUsername],[RequireSsl],[RequireAuth])
    VALUES (NEWID(),'glorykidd.com',465,'social@usfarmexchange.com','ZC6L0WZ5liUtx/9a8eNzlRApzF/ftLg2h4CyvctmkzM=','postmaster@glorykidd.com','GloryKidd Postmaster',1,1)

    -- Add tables for dynamic page content
    CREATE TABLE [dbo].[PageLocations] (
	    [Id]          UNIQUEIDENTIFIER NOT NULL,
	    [Description] VARCHAR(255)         NULL,
      CONSTRAINT [PK_PageLocations] PRIMARY KEY CLUSTERED ( 
	      [Id] ASC
      ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY];

    ALTER TABLE [dbo].[PageLocations] ADD  CONSTRAINT [DF_PageLocations_Id]  DEFAULT (NEWID()) FOR [Id];

    CREATE TABLE [dbo].[PageContent](
	    [Id]           UNIQUEIDENTIFIER NOT NULL,
	    [PageLocation] UNIQUEIDENTIFIER NOT NULL,
	    [Description]  VARCHAR(max)         NULL,
      CONSTRAINT [PK_PageContent] PRIMARY KEY CLUSTERED (
	      [Id] ASC
      ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

    ALTER TABLE [dbo].[PageContent] ADD  CONSTRAINT [DF_PageContent_Id]  DEFAULT (NEWID()) FOR [Id];

    ALTER TABLE [dbo].[PageContent] WITH CHECK ADD FOREIGN KEY([PageLocation]) REFERENCES [dbo].[PageLocations] ([Id]);

    INSERT INTO [dbo].[PageLocations] (Id, [Description])
    VALUES ('4667B33D-BE48-4B7D-816E-D705F1F732C5', 'Home Page Content'),
           ('06688FA2-EBCB-4F42-9F63-091524C9B839', 'Admin Home Content'),
           ('61175E8D-6131-4789-8989-DC4C4695E711', 'Page Management Header'),
           ('D42ABA67-51F4-4416-AFA4-A4015551B07C', 'Dashboard Header');

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_3
END

SELECT @majorVersion = 1, @minorVersion = 4;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_4

    CREATE TABLE dbo.NewsArticles (
      [Id]           INT              NOT NULL IDENTITY(1,1),
	    [PageLocation] UNIQUEIDENTIFIER NOT NULL,
      [Title]        VARCHAR(100)     NOT NULL, 
      [Intro]        VARCHAR(500)         NULL,      
      [Description]  VARCHAR(MAX)         NULL,      
      [ByLine]       VARCHAR(75)          NULL,
      [UserId]       UNIQUEIDENTIFIER NOT NULL,
      [Created]      DATETIME         NOT NULL DEFAULT GETDATE(),
	    CONSTRAINT [PK_NewsArticles] PRIMARY KEY CLUSTERED (
	        [Id] ASC
        ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY];

    ALTER TABLE [dbo].NewsArticles WITH CHECK ADD FOREIGN KEY([PageLocation]) REFERENCES [dbo].[PageLocations] ([Id]);

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_4
END

SELECT @majorVersion = 1, @minorVersion = 5;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_5
    INSERT INTO [dbo].[PageLocations] (Id, [Description])
    VALUES ('8F9B4D10-6294-45AC-9692-9A29335F1661', 'Mens Page Content'),
           ('D9E75614-BEA8-472D-9A42-E37CAEAA7506', 'Womens Page Content'),
           ('329D0E46-3C1E-4B53-9C6C-4CA7BAAE6536', 'Youth Page Content'),
           ('BB0F852F-2C0E-4C2E-8CE0-59319318BC38', 'Childrens Page Content'),
           ('A1E9F1FF-9D7C-45A2-94A4-E9BDBFC13CF3', 'Outreach Page Content');

    INSERT INTO [dbo].[PageContent] (PageLocation, [Description])
    VALUES ('8F9B4D10-6294-45AC-9692-9A29335F1661', 'Mens Page Content'),
           ('D9E75614-BEA8-472D-9A42-E37CAEAA7506', 'Womens Page Content'),
           ('329D0E46-3C1E-4B53-9C6C-4CA7BAAE6536', 'Youth Page Content'),
           ('BB0F852F-2C0E-4C2E-8CE0-59319318BC38', 'Childrens Page Content'),
           ('A1E9F1FF-9D7C-45A2-94A4-E9BDBFC13CF3', 'Outreach Page Content');

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_5
END

SELECT @majorVersion = 1, @minorVersion = 6;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_6
    CREATE TABLE dbo.GalleryImages (
	    [Id]           UNIQUEIDENTIFIER NOT NULL,
	    [PageLocation] UNIQUEIDENTIFIER NOT NULL,
      [ImageUrl]     VARCHAR(250)         NULL, 
      [Description]  VARCHAR(MAX)         NULL, 
      [Title]        VARCHAR(100)         NULL,
	    [Active]       BIT              NOT NULL DEFAULT 1,
      [Created]      DATETIME         NOT NULL DEFAULT GETDATE(),
	    CONSTRAINT [PK_GalleryImages] PRIMARY KEY CLUSTERED (
	        [Id] ASC
        ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY];

    ALTER TABLE [dbo].[GalleryImages] ADD  CONSTRAINT [DF_GalleryImages_Id]  DEFAULT (NEWID()) FOR [Id];
    
    ALTER TABLE dbo.NewsArticles ADD Active BIT NOT NULL DEFAULT 1;

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_6
END

SELECT @majorVersion = 1, @minorVersion = 7;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_7
    CREATE TABLE dbo.Ministry (
      [Id]        INT          IDENTITY(1,1) NOT NULL,  
      [Title]     VARCHAR(255)               NOT NULL,  
      CONSTRAINT [PK_Ministry] PRIMARY KEY CLUSTERED ([Id]),  
    ) ON [PRIMARY];
    
    CREATE TABLE [dbo].[Appointments] (  
      [Id]                    INT           IDENTITY(1,1) NOT NULL,  
      [Subject]               VARCHAR(255)                NOT NULL,  
      [Description]           VARCHAR(1024)                   NULL,  
      [Start]                 DATETIME                    NOT NULL,  
      [End]                   DATETIME                    NOT NULL,
      [MinistryId]            INT                             NULL,
      [RecurrenceRule]        VARCHAR(1024)                   NULL,  
      [RecurrenceParentId]    INT                             NULL,  
      [Reminder]              VARCHAR(255)                    NULL,  
      [Annotations]           VARCHAR(50)                     NULL,  
      CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED ([Id]),  
      CONSTRAINT [FK_Appointments_ParentAppointments] FOREIGN KEY ([RecurrenceParentId]) REFERENCES [Appointments] ([Id]), 
      CONSTRAINT [FK_Appointments_Ministries] FOREIGN KEY ([MinistryId]) REFERENCES [Ministry] ([Id]), 
    ) ON [PRIMARY];

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_7
END

SELECT @majorVersion = 1, @minorVersion = 8;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_8

    TRUNCATE TABLE [dbo].[SystemExceptions];

    ALTER TABLE [dbo].[SystemExceptions]
      ALTER COLUMN [ExceptionTimeStamp] [datetime] NOT NULL;
    
    ALTER TABLE [dbo].[SystemExceptions]
      DROP CONSTRAINT [PK_SystemExceptions];

    ALTER TABLE [dbo].[SystemExceptions]
     ADD CONSTRAINT [PK_SystemExceptions] PRIMARY KEY CLUSTERED (
			  [ExceptionTimeStamp] DESC
		  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_8
END

SELECT @majorVersion = 1, @minorVersion = 9;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_9
    INSERT INTO [dbo].[PageLocations] (Id, [Description])
    VALUES ('3219C52F-0056-4818-9831-F81B0AC023E6', 'Believe Page'),
           ('715A4FC2-41CB-4499-B4FD-358186F1937F', 'Believe Page Statement'),
           ('F89AB4CA-D663-4731-A67D-3526FEC8A9AB', 'Constitution Page'),
           ('EF9B3A69-C04B-43FD-93B4-C7B8DA4C7916', 'Constitution Page Statement');

    INSERT INTO [dbo].[PageContent] (PageLocation, [Description])
    VALUES ('3219C52F-0056-4818-9831-F81B0AC023E6', 'Believe Page Content'),
           ('715A4FC2-41CB-4499-B4FD-358186F1937F', ''),
           ('F89AB4CA-D663-4731-A67D-3526FEC8A9AB', 'Constitution Page Content'),
           ('EF9B3A69-C04B-43FD-93B4-C7B8DA4C7916', '');

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_9
END

SELECT @majorVersion = 1, @minorVersion = 10;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_10
    INSERT INTO [dbo].[PageLocations] (Id, [Description])
    VALUES ('AD344A0E-8151-4846-A503-985D1F284D8D', 'Contact Page'),
           ('BE5DF028-0EEA-4118-8431-0A31F347AA0C', 'About Page');

    INSERT INTO [dbo].[PageContent] (PageLocation, [Description])
    VALUES ('AD344A0E-8151-4846-A503-985D1F284D8D', 'Contact Page Content'),
           ('BE5DF028-0EEA-4118-8431-0A31F347AA0C', 'About Page Content');

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_10
END

SELECT @majorVersion = 1, @minorVersion = 11;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_11
    CREATE TABLE dbo.StaffMembers (
	    [Id]           UNIQUEIDENTIFIER NOT NULL,
      [Name]         VARCHAR(100)     NOT NULL, 
      [Title]        VARCHAR(100)         NULL,
      [Bio]          VARCHAR(200)         NULL,
      [ImageUrl]     VARCHAR(256)         NULL,
      [DisplayOrder] INT              NOT NULL DEFAULT 0,
	    CONSTRAINT [PK_StaffMembers] PRIMARY KEY CLUSTERED (
	        [Id] ASC
        ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY];

    ALTER TABLE [dbo].[StaffMembers] ADD  CONSTRAINT [DF_StaffMembers_Id]  DEFAULT (NEWID()) FOR [Id];
    
    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_11
END

SELECT @majorVersion = 1, @minorVersion = 12;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_12
    CREATE TABLE dbo.SermonSyndicationFeed (
	    [Id]           UNIQUEIDENTIFIER NOT NULL,
      [Published]    SMALLDATETIME    NOT NULL, 
      [Title]        VARCHAR(100)     NOT NULL,
      [Description]  VARCHAR(200)         NULL,
      [SourceUrl]    VARCHAR(256)         NULL,
	    CONSTRAINT [PK_SermonSyndicationFeed] PRIMARY KEY CLUSTERED (
	        [Id] ASC
        ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY];

    ALTER TABLE [dbo].[SermonSyndicationFeed] ADD  CONSTRAINT [DF_SermonSyndicationFeed_Id]  DEFAULT (NEWID()) FOR [Id];
    
    ALTER TABLE [dbo].[SystemConfigs] ADD
      [FeedTitle]       VARCHAR(100)  NULL,
      [FeedDescription] VARCHAR(255)  NULL,
      [FeedUri]         VARCHAR(255)  NULL,
      [FeedAuthor]      VARCHAR(255)  NULL,
      [FeedCategory]    VARCHAR(255)  NULL;

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_12
END

SELECT @majorVersion = 1, @minorVersion = 13;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_13
    UPDATE [dbo].[SystemConfigs] 
       SET [FeedTitle] = 'Cedar Grove Baptist Church', [FeedDescription] = 'Cedar Grove Baptist Church Recent Sermons', 
           [FeedUri] = 'https://cgbc.glorykidd.com/feeds/SermonService.svc/GetRssSermonsFeed', [FeedAuthor] = 'office@cedargrovebaptist.church', 
           [FeedCategory] = 'Religious,Sermons';

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_13
END

SELECT @majorVersion = 1, @minorVersion = 14;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_14
    ALTER TABLE [dbo].[SermonSyndicationFeed] ADD
      [Author] VARCHAR(100) NULL;

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_14
END

SELECT @majorVersion = 1, @minorVersion = 15;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_15
    ALTER TABLE dbo.UpcomingEvents ADD
      [EventEnd] DATETIME NULL;
    
    ALTER TABLE [dbo].[StaffMembers] ADD
      [EmailAddress] VARCHAR(50) NULL;

    INSERT INTO [dbo].[PageLocations] (Id, [Description])
    VALUES ('8D18BCE8-8473-4763-9209-F6095DA03DA5', 'Missions Page Content'),
           ('A2444FC2-F610-4B19-B566-39A3A4ACD82D', 'Sermons Page Content'),
           ('E2439935-28F4-49F0-95E9-D323F4CA09AB', 'Home Page Banner Content'),
           ('CBB3ED8F-F5BF-4661-9693-7AD387050793', 'Home Page Event Title Content');

    INSERT INTO [dbo].[PageContent] (PageLocation, [Description])
    VALUES ('8D18BCE8-8473-4763-9209-F6095DA03DA5', 'Missions Page Content'),
           ('A2444FC2-F610-4B19-B566-39A3A4ACD82D', 'Sermons Page Content'),
           ('E2439935-28F4-49F0-95E9-D323F4CA09AB', 'Home Page Banner Content'),
           ('CBB3ED8F-F5BF-4661-9693-7AD387050793', 'Home Page Event Title Content');

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_15
END

SELECT @majorVersion = 1, @minorVersion = 16;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_16
    INSERT INTO [dbo].[PageLocations] (Id, [Description])
    VALUES ('D378CB45-7391-44FA-9603-1428AED3208D', 'Child Protection Page Header'),
           ('8CCA9FAE-E135-4DA4-8268-F53C53D967BC', 'Child Protection Page Content');

    INSERT INTO [dbo].[PageContent] (PageLocation, [Description])
    VALUES ('D378CB45-7391-44FA-9603-1428AED3208D', 'Child Protection Page Header'),
           ('8CCA9FAE-E135-4DA4-8268-F53C53D967BC', 'Child Protection Page Content');

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_16
END

SELECT @majorVersion = 1, @minorVersion = 17;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_17
    CREATE TABLE dbo.AdminPermissions (
	    [UserId]       UNIQUEIDENTIFIER NOT NULL,
	    [PageId]       UNIQUEIDENTIFIER NOT NULL
    ) ON [PRIMARY];

    ALTER TABLE [dbo].[PageLocations] ADD
      [CanAdmin]   BIT NOT NULL DEFAULT 0,
      [HasGallery] BIT NOT NULL DEFAULT 1;

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_17
END

SELECT @majorVersion = 1, @minorVersion = 18;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_18
    INSERT INTO [dbo].[PageLocations] (Id, [Description])
    VALUES ('5F70F0DA-229A-47C3-9A6A-20369BA22C15', 'Embrace Grace Page'),
           ('81DF6CEB-5CC8-4055-AE6E-C199FBD03A5B', 'Embrace Life Page');

    INSERT INTO [dbo].[PageContent] (PageLocation, [Description])
    VALUES ('5F70F0DA-229A-47C3-9A6A-20369BA22C15', 'Embrace Grace Page Content'),
           ('81DF6CEB-5CC8-4055-AE6E-C199FBD03A5B', 'Embrace Life Page Content');

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_18
END

SELECT @majorVersion = 1, @minorVersion = 19;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_19
    ALTER TABLE [dbo].[PageLocations] ADD
      [AdminOnly]   BIT NOT NULL DEFAULT 1;

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_19
END

SELECT @majorVersion = 1, @minorVersion = 20;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_20
    INSERT INTO [dbo].[PageLocations] (Id, [Description], [CanAdmin], [HasGallery], [AdminOnly])
    VALUES ('3AB7B9CE-A432-47ED-B441-597097AE2313', 'Calendar Header Page', 0, 0, 1),
           ('FDD565B5-54FE-4A9E-9486-8E9ED1770E4B', 'Event Header Page'   , 0, 0, 1),
           ('E0A66F2B-9965-4064-9F76-604D08CDE4F8', 'Gallery Header Page' , 0, 0, 1),
           ('F8409812-85FA-45A7-83F6-2A902BF64DF0', 'Sermon Header Page'  , 0, 0, 1),
           ('C49B5CC7-D290-4192-97BB-B5C443BBC71E', 'Staff Header Page'   , 0, 0, 1),
           ('60D63750-0123-4F48-B775-8E698F5A45EF', 'Users Header Page'   , 0, 0, 1);

    INSERT INTO [dbo].[PageContent] (PageLocation, [Description])
    VALUES ('3AB7B9CE-A432-47ED-B441-597097AE2313', 'Calendar Header Page'),
           ('FDD565B5-54FE-4A9E-9486-8E9ED1770E4B', 'Event Header Page'   ),
           ('E0A66F2B-9965-4064-9F76-604D08CDE4F8', 'Gallery Header Page' ),
           ('F8409812-85FA-45A7-83F6-2A902BF64DF0', 'Sermon Header Page'  ),
           ('C49B5CC7-D290-4192-97BB-B5C443BBC71E', 'Staff Header Page'   ),
           ('60D63750-0123-4F48-B775-8E698F5A45EF', 'Users Header Page'   );

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_20
END

SELECT @majorVersion = 1, @minorVersion = 21;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_21
    CREATE TABLE dbo.TrainingVideos (
	    [Id]           INT              NOT NULL IDENTITY(1,1),
	    [Title]        VARCHAR(100)     NOT NULL,
	    [Description]  VARCHAR(1000)        NULL,
	    [VideoUrl]     VARCHAR(256)     NOT NULL
    ) ON [PRIMARY];

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_21
END

/* 

D378CB45-7391-44FA-9603-1428AED3208D
8CCA9FAE-E135-4DA4-8268-F53C53D967BC

  Use this model to create database changes
  Just change NEWVERSION to the next number in the sequence

SELECT @majorVersion = 1, @minorVersion = NEWVERSION;
IF NOT EXISTS(SELECT * FROM SchemaVersion WHERE (MajorVersion = @majorVersion) AND (MinorVersion = @minorVersion))
BEGIN
  BEGIN TRANSACTION Version1_NEWVERSION

    INSERT INTO SchemaVersion values (newid(), @majorVersion, @minorVersion, getutcdate());
  COMMIT TRANSACTION Version1_NEWVERSION
END
*/
