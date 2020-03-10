using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cedar_Grove.admin {
  public partial class Logout : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentUser.LogoutUser();
      Response.Redirect("~/");
    }
  }
}