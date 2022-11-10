using System;

namespace Cedar_Grove {
  public partial class Login : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      // Set page name in the title section
      SessionInfo.CurrentPage = PageNames.Login;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      lErrorMessage.Text = string.Empty;
      if (SessionInfo.IsAuthenticated) Response.Redirect("~/");
    }

    protected void SubmitLogin_OnClick(object sender, EventArgs e) {
      var locationRedirect = string.Empty;
      try {
        SessionInfo.CurrentUser.AuthenticateUser(userName.Text.Trim(), password.Text.Trim().EncryptString());
        if (!SessionInfo.IsAuthenticated) { lErrorMessage.Text = "Username or password do not match"; SessionInfo.Settings.LogError("Login: Login Failed", "Invalid credentials"); return; }
        locationRedirect = (SessionInfo.CurrentUser.UserPassReset) ? "~/reset" : "~/";
      } catch (Exception ex) {
        lErrorMessage.Text = "Login failed; please verify your username and password";
        SessionInfo.Settings.LogError("Login: Login Failed", ex);
      }
      if (!locationRedirect.IsNullOrEmpty()) Response.Redirect(locationRedirect);
    }
    protected void ForgotPassword_OnClick(object sender, EventArgs e) {
      Response.Redirect("~/forgot");
    }

    //protected void RegisterNewUser_Click(object sender, EventArgs e) {
    //  Response.Redirect("Register.aspx");
    //}
  }
}