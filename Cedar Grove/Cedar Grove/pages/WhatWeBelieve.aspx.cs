using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cedar_Grove.pages {
  public partial class WhatWeBelieve : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.Believe;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
    }
  }
}