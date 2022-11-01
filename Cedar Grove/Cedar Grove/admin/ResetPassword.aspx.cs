using System;

namespace Cedar_Grove {
  public partial class ResetPassword : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      // Set page name in the title section
      SessionInfo.CurrentPage = PageNames.ResetPassword;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
    }

    protected void loginPage_PreRender(object sender, EventArgs e) {
      LoginId.Text = SessionInfo.CurrentUser.UserName;
      DisplayName.Text = SessionInfo.CurrentUser.DisplayName;
    }

    protected void RadButton3_OnClick(object sender, EventArgs e) {
      var locationRedirect = string.Empty;
      try {
        if (!NewPassword.Text.IsNullOrEmpty() && !NewPassword.Text.Trim().Equals(ConfirmPassword.Text.Trim())) {
          throw new ApplicationException("New Password and Confirmation do not match");
        }
        if (!NewPassword.Text.IsNullOrEmpty() && NewPassword.Text.Trim().Length < 6) {
          throw new ApplicationException("New Password must be at least 6 characters");
        }
        SessionInfo.CurrentUser.Notes = "Password updated {0}".FormatWith(DateTime.Now.ToShortDateString());
        SessionInfo.CurrentUser.SaveUserDetails();
        if (!NewPassword.Text.Trim().IsNullOrEmpty()) {
          SessionInfo.CurrentUser.SetUserPassword(SessionInfo.CurrentUser.Id, NewPassword.Text.Trim());
        }
        locationRedirect = "~/admin/dashboard";
      } catch (Exception ex) {
        SessionInfo.Settings.LogError("User: Password Update Failed", ex);
      }
      if (!locationRedirect.IsNullOrEmpty()) Response.Redirect(locationRedirect);
    }
  }
}