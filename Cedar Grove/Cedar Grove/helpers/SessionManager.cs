using System.Collections.Generic;
using System.Net;
using System.Net.Mail;

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
        Port = 587,
        EnableSsl = true,
        Host = "smtp.gmail.com"
      };
      if (Settings.RequireAuth) {
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new NetworkCredential("general@cedargrovebaptist.church", "lwpnkiwndjznzidg");
      }
      return smtp;
    }

    public void SendResetEmail(SystemUser user, string tempPassword) {
      var mail = new MailMessage {
        From = new MailAddress("general@cedargrovebaptist.church", "CGBC Website"),
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
      new MinistryBackground() { Id=1, MinistryName="Mens", DisplayColour="lightblue", FontColour="blue" },
      new MinistryBackground() { Id=2, MinistryName="Women's", DisplayColour="lightcoral", FontColour="brown" },
      new MinistryBackground() { Id=8, MinistryName="Embrace Grace", DisplayColour="lightcoral", FontColour="brown" },
      new MinistryBackground() { Id=9, MinistryName="Embrace Life", DisplayColour="lightcoral", FontColour="brown" },
      new MinistryBackground() { Id=3, MinistryName="Youth", DisplayColour="burlywood", FontColour="darkgreen" },
      new MinistryBackground() { Id=4, MinistryName="Childrens", DisplayColour="khaki", FontColour="darkslateblue" },
      new MinistryBackground() { Id=5, MinistryName="Outreach", DisplayColour="lightcyan", FontColour="orangered" },
      new MinistryBackground() { Id=7, MinistryName="Missions", DisplayColour="lightgreen", FontColour="black" },
      new MinistryBackground() { Id=6, MinistryName="General", DisplayColour="lightslategray", FontColour="black" },
    };
  }
}