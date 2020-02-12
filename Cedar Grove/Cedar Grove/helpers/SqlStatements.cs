using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cedar_Grove {
  public static class SqlStatements {
    //private const string USER = "a7107c8f-ff15-4d5a-bba1-6db286fcef0a";
    //private const string ADMIN = "b6522703-8844-4cff-8fc1-916ba90f515b";

    // System Settings
    public const string SQL_GET_MAIL_SETTINGS = "SELECT Id, MailServer, ServerPort, SmtpUser, SmtpPassword, FromEmail, FromUsername, RequireAuth, RequireSsl FROM dbo.SystemConfigs;";
    public const string SQL_UPDATE_MAIL_SETTINGS = "UPDATE dbo.SystemConfigs SET MailServer = '{0}', ServerPort = {1}, SmtpUser = '{2}', SmtpPassword = '{3}', FromEmail = '{4}', FromUsername = '{5}', RequireAuth = {6}, RequireSsl = {7} WHERE Id = '{8}';";

    // User and authentication
    public const string SQL_AUTHENTICATE_USER = "SELECT * FROM dbo.AdminUsers WHERE UserName = '{0}' AND UserPass = '{1}' AND Deleted = 0;";
    public const string SQL_GET_USER_ROLE = "SELECT RoleName FROM dbo.AdminRoles WHERE Id = '{0}';";
    public const string SQL_GET_USER_DETAILS = "SELECT * FROM dbo.AdminUsers WHERE Id = '{0}';";
    public const string SQL_UPDATE_USER_DETAILS = "UPDATE dbo.AdminUsers SET DisplayName = '{0}', UserName = '{1}', Notes = '{2}' WHERE Id = '{3}';";
    public const string SQL_RESET_USER_PASSWORD = "UPDATE dbo.AdminUsers SET UserPass = '{0}', PasswordReset = 1 WHERE Id = '{1}';";
    public const string SQL_UPDATE_USER_PASSWORD = "UPDATE dbo.AdminUsers SET UserPass = '{0}', PasswordReset = 0 WHERE Id = '{1}';";
    public const string SQL_CREATE_USER_DETAILS = "INSERT INTO dbo.AdminUsers (RoleId, DisplayName, UserName, Notes) OUTPUT inserted.Id  VALUES ('e544d9f4-c6f6-4c25-b828-de13141f37e2', '{0}', '{1}', '{2}');";
    public const string SQL_CREATE_ADMIN_USER_DETAILS = "INSERT INTO dbo.AdminUsers (RoleId, DisplayName, UserName, Notes, SuperAdmin) OUTPUT inserted.Id  VALUES ('1af14abd-5937-4475-8de7-3da0536613c8', '{0}', '{1}', '{2}', {3});";
    public const string SQL_UPDATE_ADMIN_USER_DETAILS = "UPDATE dbo.AdminUsers SET DisplayName = '{0}', UserName = '{1}', Notes = '{2}', SuperAdmin = {3} WHERE Id = '{4}';";
    public const string SQL_DELETE_USER = "UPDATE dbo.AdminUsers SET Deleted = 1 WHERE Id = '{0}';";
    public const string SQL_VALIDATE_USER = "SELECT Id FROM dbo.AdminUsers WHERE UserName = '{0}' AND Deleted = 0;";

    // Exceptions
    public const string SQL_LOG_EXCEPTION = "INSERT INTO dbo.SystemExceptions (ExceptionTimeStamp, Module, Exception, StackTrace) VALUES ({0}, '{1}', '{2}', '{3}');";
    public const string SQL_READ_EXCEPTIONS = "SELECT * FROM dbo.SystemExceptions ORDER BY ExceptionTimeStamp DESC;";

    public const string SQL_READ_EVENTS = "SELECT [Id], [Title], [Description], CONVERT(VARCHAR, [EventDate], 107) [EventDate] FROM dbo.UpcomingEvents ORDER BY [EventDate] DESC;";

  }
}