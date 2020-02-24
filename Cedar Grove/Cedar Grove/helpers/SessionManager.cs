using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace Cedar_Grove {
  public class SessionManager {
    #region Sitewide Details
    public SystemSettings Settings => SystemSettings.StaticInstance;
    #endregion

    #region Page Management
    public PageNames CurrentPage { get; set; }
    public string DisplayCurrentPage => "<title>{0}</title>".FormatWith(CurrentPage.TextValue());
    public string PageContent(PageContentBlocks pageLocation) => SqlHelpers.SelectScalar(SqlStatements.SQL_GET_PAGE_CONTENT_FOR_DISPLAY.FormatWith(pageLocation.TextValue())).ToString();
    #endregion

    #region GalleryImage/Events Management
    public GalleryImage CurrentGalleryImage => GalleryImage.StaticInstance;
    public EventItem CurrentEvent => EventItem.StaticInstance;
    #endregion

    #region Current User Details
    public SystemUser CurrentUser => SystemUser.StaticInstance;
    public bool IsAuthenticated => CurrentUser.IsAuthenticated;
    public bool IsAdmin => CurrentUser.IsAdmin;
    #endregion

    #region Email Settings
    private SmtpClient SetMailServerSettings() {
      var smtp = new SmtpClient {
        Port = Settings.ServerPort,
        EnableSsl = Settings.RequireSsl,
        DeliveryMethod = SmtpDeliveryMethod.Network,
        Host = Settings.MailServer
      };
      if (Settings.RequireAuth) {
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new NetworkCredential(Settings.SmtpUser, Settings.SmtpPassword);
      }
      return smtp;
    }

    public void SendResetEmail(SystemUser user, string tempPassword) {
      var mail = new MailMessage {
        From = new MailAddress(Settings.FromEmail, Settings.FromUsername),
        IsBodyHtml = true,
        Subject = "Password Reset Confirmation",
        Body = "Your new password has been set to: {0}<br /><br />Please login to change your password to something you can remember.<br /><br />Thanks,<br />{1}".FormatWith(tempPassword, Settings.FromUsername)
      };
      mail.To.Add(new MailAddress(user.UserName));
      SmtpClient smtp = SetMailServerSettings();
      smtp.Send(mail);
    }

    public void SendContactEmail(ref MailMessage msg) {
      SmtpClient smtp = SetMailServerSettings();
      smtp.Send(msg);
    }
    #endregion

    public List<MinistryBackground> MinistryColours = new List<MinistryBackground>() {
      new MinistryBackground() { Id=1, MinistryName="MensMinistry", DisplayColour="lightblue", FontColour="blue" },
      new MinistryBackground() { Id=2, MinistryName="WomensMinistry", DisplayColour="lightcoral", FontColour="brown" },
      new MinistryBackground() { Id=3, MinistryName="YouthMinistry", DisplayColour="burlywood", FontColour="darkgreen" },
      new MinistryBackground() { Id=4, MinistryName="ChildrensMinistry", DisplayColour="khaki", FontColour="darkslateblue" },
      new MinistryBackground() { Id=5, MinistryName="OutreachMinistry", DisplayColour="lightcyan", FontColour="orangered" },
      new MinistryBackground() { Id=6, MinistryName="GeneralMinistry", DisplayColour="lightslategray", FontColour="black" }
    };
  }
}