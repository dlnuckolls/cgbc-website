using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Cedar_Grove {
  public partial class MainNavigation :BaseControl {

    public RadMenu CurrentPageMenu;

    protected override void OnInit(EventArgs e) {
      CurrentPageMenu = RadMenu1;
      base.OnInit(e);
    }

    protected void Page_Load(object sender, EventArgs e) {
    }
  }
}