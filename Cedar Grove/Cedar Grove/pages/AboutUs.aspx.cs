using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Cedar_Grove.pages {
  public partial class AboutUs : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.About;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      AboutPageContentBlock.Text = SessionInfo.PageContent(PageContentBlocks.AboutUsPageBody);
      ContactPageContentBlock.Text = SessionInfo.PageContent(PageContentBlocks.ContactUsPageBody);

      RadCaptcha1.CaptchaImage.LineNoise = CaptchaLineNoiseLevel.Low;
      RadCaptcha1.CaptchaImage.FontWarp = CaptchaFontWarpFactor.Low;
      RadCaptcha1.MinTimeout = 15;
      RadCaptcha1.ProtectionMode = RadCaptcha.ProtectionStrategies.Captcha;
      RadCaptcha1.CaptchaImage.TextLength = 6;
      RadCaptcha1.CaptchaImage.FontFamily = "Verdana";
      RadCaptcha1.CaptchaImage.TextColor = System.Drawing.Color.FromName("Green");
      RadCaptcha1.CaptchaImage.BackgroundColor = System.Drawing.Color.FromName("White");
      RadCaptcha1.CaptchaImage.BackgroundNoise = CaptchaBackgroundNoiseLevel.Low;
    }

    protected void SendMessage_Click(object sender, EventArgs e) {
      if (!Page.IsValid) return;
      //_ = SqlHelpers.Insert(SqlStatements.SQL_INSERT_NEWSLETTER_ADDRESS.FormatWith(ContactName.Text.Trim().FixSqlString(), ContactEmail.Text.Trim().FixSqlString()));
      var msg = new MailMessage {
        IsBodyHtml = false,
        From = new MailAddress(ContactEmail.Text.Trim(), ContactName.Text.Trim()),
        Subject = ContactSubject.Text.Trim(),
        Body = ContactMessage.Text.Trim()
      };
      //msg.To.Add(new MailAddress("contactus@usfarmexchange.com", "USFarmExchange Contact Service"));
      //SessionInfo.SendContactEmail(ref msg);
    }

    protected void StaffCards_NeedDataSource(object sender, RadListViewNeedDataSourceEventArgs e) { ((RadListView)sender).DataSource = SqlHelpers.Select(SqlStatements.SQL_GET_ALL_STAFF_MEMBERS); }
  }
}