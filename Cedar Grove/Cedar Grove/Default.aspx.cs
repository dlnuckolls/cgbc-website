﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Cedar_Grove {
  public partial class Default : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.Home;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      HomeTop.Text = SessionInfo.PageContent(PageContentBlocks.Dashboard);
    }
  }
}

