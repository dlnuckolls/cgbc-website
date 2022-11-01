using System;

namespace Cedar_Grove.admin {
  public partial class Logout : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentUser.LogoutUser();
      Response.Redirect("~/");
    }
  }
}