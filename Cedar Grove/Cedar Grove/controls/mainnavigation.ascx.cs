using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Cedar_Grove {
  public partial class MainNavigation : BaseControl {

    public RadMenu CurrentPageMenu;

    protected override void OnInit(EventArgs e) {
      CurrentPageMenu = RadMenu1;
      base.OnInit(e);
    }

    protected void Page_Load(object sender, EventArgs e) {
      if (SessionInfo.IsAuthenticated && !RadMenu1.Items.FindItemByText("Admin").IsNullOrEmpty()) {
        RadMenu1.Items.FindItemByText("Admin").Text = "Dashboard";
        RadMenu1.Items.Add(new RadMenuItem() { IsSeparator = true });
        RadMenu1.Items.Add(new RadMenuItem("Logout", "~/admin/Logout.aspx"));
      }
    }
  }
}