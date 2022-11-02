namespace Cedar_Grove {
  public static class SqlStatements {
    private const string USER = "a7107c8f-ff15-4d5a-bba1-6db286fcef0a";
    private const string ADMIN = "b6522703-8844-4cff-8fc1-916ba90f515b";

    // System Settings
    public const string SQL_GET_MAIL_SETTINGS = "SELECT Id, MailServer, ServerPort, SmtpUser, SmtpPassword, FromEmail, FromUsername, RequireAuth, RequireSsl FROM dbo.SystemConfigs;";
    public const string SQL_UPDATE_MAIL_SETTINGS = "UPDATE dbo.SystemConfigs SET MailServer = '{0}', ServerPort = {1}, SmtpUser = '{2}', SmtpPassword = '{3}', FromEmail = '{4}', FromUsername = '{5}', RequireAuth = {6}, RequireSsl = {7} WHERE Id = '{8}';";
    public const string SQL_GET_FEED_SETTINGS = "SELECT Id, FeedTitle, FeedDescription, FeedUri, FeedAuthor, FeedCategory FROM dbo.SystemConfigs;";
    public const string SQL_UPDATE_FEED_SETTINGS = "UPDATE dbo.SystemConfigs SET FeedTitle = '{0}', FeedDescription = '{1}', FeedUri = '{2}', FeedAuthor = '{3}', FeedCategory = '{4}' WHERE Id = '{5}';";

    // User and authentication
    public const string SQL_AUTHENTICATE_USER = "SELECT * FROM dbo.AdminUsers WHERE UserName = '{0}' AND UserPass = '{1}' AND Deleted = 0;";
    public const string SQL_GET_USER_ROLE = "SELECT RoleName FROM dbo.AdminRoles WHERE Id = '{0}';";
    public const string SQL_GET_USER_DETAILS = "SELECT * FROM dbo.AdminUsers WHERE Id = '{0}';";
    public const string SQL_UPDATE_USER_DETAILS = "UPDATE dbo.AdminUsers SET DisplayName = '{0}', UserName = '{1}', Notes = '{2}' WHERE Id = '{3}';";
    public const string SQL_RESET_USER_PASSWORD = "UPDATE dbo.AdminUsers SET UserPass = '{0}', PasswordReset = 1 WHERE Id = '{1}';";
    public const string SQL_UPDATE_USER_PASSWORD = "UPDATE dbo.AdminUsers SET UserPass = '{0}', PasswordReset = 0 WHERE Id = '{1}';";
    public const string SQL_CREATE_USER_DETAILS = "INSERT INTO dbo.AdminUsers (RoleId, DisplayName, UserName, Notes) OUTPUT inserted.Id  VALUES ('" + USER + "', '{0}', '{1}', '{2}');";
    public const string SQL_CREATE_ADMIN_USER_DETAILS = "INSERT INTO dbo.AdminUsers (RoleId, DisplayName, UserName, Notes, SuperAdmin) OUTPUT inserted.Id  VALUES ('" + ADMIN + "', '{0}', '{1}', '{2}', {3});";
    public const string SQL_UPDATE_ADMIN_USER_DETAILS = "UPDATE dbo.AdminUsers SET DisplayName = '{0}', UserName = '{1}', Notes = '{2}', SuperAdmin = {3} WHERE Id = '{4}';";
    public const string SQL_DELETE_USER = "DELETE dbo.AdminUsers WHERE Id = '{0}';";
    public const string SQL_VALIDATE_USER = "SELECT Id FROM dbo.AdminUsers WHERE UserName = '{0}' AND Deleted = 0;";

    // Exceptions
    public const string SQL_LOG_EXCEPTION = "INSERT INTO dbo.SystemExceptions (ExceptionTimeStamp, Module, Exception, StackTrace) VALUES ({0}, '{1}', '{2}', '{3}');";
    public const string SQL_READ_EXCEPTIONS = "SELECT * FROM dbo.SystemExceptions ORDER BY ExceptionTimeStamp DESC;";

    // Page Content Blocks
    public const string SQL_GET_PAGE_LOCATIONS = "SELECT [Id],[Description] FROM [dbo].[PageLocations] WHERE [AdminOnly] = 0;";
    public const string SQL_GET_ALL_PAGE_LOCATIONS = "SELECT [Id],[Description] FROM [dbo].[PageLocations];";
    public const string SQL_GET_PAGE_CONTENTS = "SELECT ISNULL([Description],'') [Description] FROM [dbo].[PageContent] WHERE [PageLocation] = '{0}';";
    public const string SQL_GET_PAGE_CONTENT_FOR_DISPLAY = "SELECT ISNULL(a.[Description],'') [Description] FROM [dbo].[PageContent] a WHERE a.[PageLocation] = '{0}';";
    public const string SQL_SAVE_PAGE_CONTENTS = "UPDATE [dbo].[PageContent] SET [Description] = '{0}' WHERE [PageLocation] = '{1}';";

    // Gallery Management
    public const string SQL_GET_PAGE_GALLERY_BY_LOCATION = "SELECT [ImageUrl], [Description], [Title] FROM GalleryImages WHERE [PageLocation] = '{0}';";
    public const string SQL_GET_PAGE_LOCATION_FOR_IMAGES = "SELECT [Id] PageLocation,[Description] FROM [dbo].[PageLocations] WHERE [HasGallery] = 1;";
    public const string SQL_GET_PAGE_LOCATION_NAME_FOR_IMAGES = "SELECT [Description] FROM [dbo].[PageLocations] WHERE Id = '{0}';";
    public const string SQL_GET_PAGE_GALLERY_IMAGES = "SELECT [Id], [PageLocation], [ImageUrl], [Description], [Title], [Active], [Created] FROM GalleryImages;";
    public const string SQL_GET_PAGE_GALLERY_BY_ID = "SELECT [Id], [PageLocation], [ImageUrl], [Description], [Title], [Active], [Created] FROM GalleryImages WHERE [Id] = '{0}';";
    public const string SQL_INSERT_PAGE_GALLERY_IMAGE = "INSERT INTO dbo.GalleryImages ([PageLocation], [ImageUrl], [Description], [Title], [Active], [Created]) VALUES ('{0}', '{1}', '{2}', '{3}', 1, GETDATE());";
    public const string SQL_UPDATE_PAGE_GALLERY_IMAGE = "UPDATE dbo.GalleryImages SET [PageLocation] = '{0}', [ImageUrl] = '{1}', [Description] = '{2}', [Title] = '{3}' WHERE [Id] = '{4}';";
    public const string SQL_DELETE_PAGE_GALLERY_IMAGE = "DELETE dbo.GalleryImages WHERE [Id] = '{0}';";

    public const string SQL_READ_MEMBER_MESSAGES = "SELECT [Id], [Title], [Description], CONVERT(VARCHAR, [Expiry], 107) [Expiry] FROM dbo.MemberMessages WHERE ([Expiry] > GETDATE()) OR [Expiry] IS NULL ORDER BY [Expiry] DESC;";
    public const string SQL_GET_MEMBER_MESSAGES_BY_ID = "SELECT [Id],[Title],[Description], CONVERT(VARCHAR, [Expiry], 107) [Expiry] FROM dbo.MemberMessages WHERE [Id] = '{0}';";
    public const string SQL_INSERT_MEMBER_MESSAGES = "INSERT INTO [dbo].[MemberMessages] ([Title],[Description],[Expiry]) VALUES ('{0}', '{1}', {2});";
    public const string SQL_UPDATE_MEMBER_MESSAGES = "UPDATE [dbo].[MemberMessages] SET [Title] = '{0}', [Description] = '{1}', [Expiry] = {2} WHERE [Id] = '{3}';";
    public const string SQL_DELETE_MEMBER_MESSAGES = "UPDATE [dbo].[MemberMessages] SET [Expiry] = '2000-01-01' WHERE [Id] = '{0}';";

    public const string SQL_READ_CHURCH_MEMBERS = "SELECT CONVERT(VARCHAR(50),cm.Id) 'Id', cm.FirstName, cm.LastName, cm.FirstName + ' ' + cm.LastName AS DisplayName, cmr.Title, cm.Bio, cm.ImageUrl FROM dbo.ChurchMembers cm INNER JOIN dbo.ChurchMemberRoles cmr ON cmr.Id = cm.Title ORDER BY cmr.DisplayOrder, cm.LastName";
    public const string SQL_READ_CHURCH_MEMBER_ADDRESSES = "SELECT CONVERT(VARCHAR(50),cma.Id) 'Id', cma.Address1, cma.Address2, cma.City, cma.[State] 'StateId', s.[State], s.Abbreviation, cma.ZipCode, cma.ZipExt, cma.[Primary] FROM dbo.ChurchMemberAddress cma INNER JOIN dbo.ChurchMemberAddress_XRef cmax ON cmax.AddressId = cma.Id INNER JOIN dbo.States s ON cma.[State] = s.Id WHERE cmax.MemberId = '{0}' ORDER BY cma.Address1";
    public const string SQL_READ_CHURCH_MEMBER_EMAILS = "SELECT CONVERT(VARCHAR(50),cme.Id) 'Id', cme.Email, cme.Display, cme.[Primary] FROM dbo.ChurchMemberEmail cme INNER JOIN dbo.ChurchMemberEmail_XRef cmax ON cmax.EmailId = cme.Id WHERE cmax.MemberId = '{0}' ORDER BY cme.Display";
    public const string SQL_READ_CHURCH_MEMBER_PHONES = "SELECT CONVERT(VARCHAR(50),cmp.Id) 'Id', cmp.Phone, cmp.[Primary] FROM dbo.ChurchMemberPhone cmp INNER JOIN dbo.ChurchMemberPhone_XRef cmax ON cmax.PhoneId = cmp.Id WHERE cmax.MemberId = '{0}'";

    // Events Management
    public const string SQL_READ_EVENTS = "SELECT [Id], [Title], [Description], CONVERT(VARCHAR, [EventDate], 107) [EventDate], CONVERT(VARCHAR, [EventEnd], 107) [EventEnd] FROM dbo.UpcomingEvents WHERE [EventEnd] > GETDATE() ORDER BY [EventDate] DESC;";
    public const string SQL_GET_EVENT_BY_ID = "SELECT [Id],[Title],[Description],[EventDate],[EventEnd] FROM [dbo].[UpcomingEvents] WHERE [Id] = '{0}';";
    public const string SQL_INSERT_EVENT = "INSERT INTO [dbo].[UpcomingEvents] ([Title],[Description],[EventDate],[EventEnd]) VALUES ('{0}', '{1}', {2}, {3});";
    public const string SQL_UPDATE_EVENT = "UPDATE [dbo].[UpcomingEvents] SET [Title] = '{0}', [Description] = '{1}', [EventDate] = {2}, [EventEnd] = {3} WHERE [Id] = '{4}';";
    public const string SQL_DELETE_EVENT = "DELETE [dbo].[UpcomingEvents] WHERE [Id] = '{0}';";
    public const string SQL_GET_MINISTRY_EVENTS = @"
SELECT a.[Id],a.[Subject],a.[Description],ISNULL(o.[StartDate],a.[Start]) [Start],ISNULL(o.[EndDate],a.[End]) [End], [MinistryId] 
  FROM Appointments a 
 OUTER APPLY dbo.ExpandRecurrence(a.RecurrenceRule, CAST(GETDATE() AS DATETIME), CAST(GETDATE() + 7 AS DATETIME)) o 
 WHERE a.[MinistryId] = {0}
   AND ISNULL(o.[StartDate],a.[Start]) >= GETDATE() AND ISNULL(o.[EndDate],a.[End]) <= CAST(GETDATE() + 7 AS DATETIME)
 ORDER BY ISNULL(o.[StartDate],a.[Start]) ASC;";
    public const string SQL_GET_ALL_MINISTRY_EVENTS = @"
SELECT a.[Id],a.[Subject],a.[Description],ISNULL(o.[StartDate],a.[Start]) [Start],ISNULL(o.[EndDate],a.[End]) [End], [MinistryId] 
  FROM Appointments a 
 OUTER APPLY dbo.ExpandRecurrence(a.RecurrenceRule, CAST(GETDATE() AS DATETIME), CAST(GETDATE() + 7 AS DATETIME)) o 
 WHERE ISNULL(o.[StartDate],a.[Start]) >= GETDATE() AND ISNULL(o.[EndDate],a.[End]) <= CAST(GETDATE() + 7 AS DATETIME)
 ORDER BY ISNULL(o.[StartDate],a.[Start]) ASC;";

    // Sermon Podcast Feed Management
    public const string SQL_GET_ALL_SERMONS = "SELECT [Id], [Published], [Title], [Author], [Description], [SourceUrl] FROM [dbo].[SermonSyndicationFeed] ORDER BY [Published] DESC;";
    public const string SQL_GET_TOP_SERMONS = "SELECT TOP 15 [Id], [Published], [Title], [Author], [Description], [SourceUrl] FROM [dbo].[SermonSyndicationFeed] WHERE [Published] <= GETDATE() ORDER BY [Published] DESC;";
    public const string SQL_GET_SERMON_BY_ID = "SELECT [Id], [Published], [Title], [Author], [Description], [SourceUrl] FROM [dbo].[SermonSyndicationFeed] WHERE [Id] = '{0}';";
    public const string SQL_INSERT_SERMON = "INSERT INTO [dbo].[SermonSyndicationFeed] ([Published], [Title], [Author], [Description], [SourceUrl]) VALUES ({0}, '{1}', '{2}', '{3}', '{4}');";
    public const string SQL_UPDATE_SERMON = "UPDATE [dbo].[SermonSyndicationFeed] SET [Published] = {0}, [Title] = '{1}', [Author] = '{2}', [Description] = '{3}', [SourceUrl] = '{4}' WHERE [Id] = '{5}';";
    public const string SQL_DELETE_SERMON = "DELETE [dbo].[SermonSyndicationFeed] WHERE [Id] = '{0}';";

    // Staff Management
    public const string SQL_GET_ALL_STAFF_MEMBERS = "SELECT [Id],[Name],[Title],[Bio],[ImageUrl],[DisplayOrder],[EmailAddress] FROM [dbo].[StaffMembers] ORDER BY [DisplayOrder], [Name] ASC;";
    public const string SQL_GET_STAFF_MEMBER_BY_ID = "SELECT [Id],[Name],[Title],[Bio],[ImageUrl],[DisplayOrder],[EmailAddress] FROM [dbo].[StaffMembers] WHERE [Id] = '{0}';";
    public const string SQL_DELETE_STAFF_MEMBERS = "DELETE [dbo].[StaffMembers] WHERE [Id] = '{0}';";
    public const string SQL_UPDATE_STAFF_MEMBERS = "UPDATE [dbo].[StaffMembers] SET [Name] = '{0}',[Title] = '{1}',[Bio] = '{2}',[ImageUrl] = '{3}',[DisplayOrder] = {4},[EmailAddress] = '{5}' WHERE [Id] = '{6}';";
    public const string SQL_INSERT_STAFF_MEMBERS = "INSERT INTO [dbo].[StaffMembers] ([Name],[Title],[Bio],[ImageUrl],[DisplayOrder],[EmailAddress]) VALUES ('{0}','{1}','{2}','{3}',{4},'{5}');";

  }
}