﻿using System;

namespace Cedar_Grove {
  public partial class ForgotPassword : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      // Set page name in the title section
      SessionInfo.CurrentPage = PageNames.ForgotPassword;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
    }
    protected void SubmitLogin_OnClick(object sender, EventArgs e) {
      try {
        var s = (new SystemUser()).ValidateUser(userName.Text.Trim());
        if (!s.IsNullOrEmpty()) {
          var usrRec = new SystemUser();
          usrRec.LoadUserDetails(s);
          var tempPassword = usrRec.ResetUserPassword(s);
          SessionInfo.SendResetEmail(usrRec, tempPassword);
          lErrorMessage.Text = "A password reset has been emailed";
          SubmitLogin.Visible = false;
          ReturnToLogin.Text = "Done";
        } else
          lErrorMessage.Text = "Email address not found";
      } catch (Exception ex) {
        lErrorMessage.Text = ex.Message;
        SessionInfo.Settings.LogError("User: Forgot Password", ex);
      }
    }
    protected void ReturnToLogin_OnClick(object sender, EventArgs e) { Response.Redirect("~/login"); }
  }
}