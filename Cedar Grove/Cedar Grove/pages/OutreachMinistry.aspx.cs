﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cedar_Grove.pages {
  public partial class OutreachMinistry : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.Outreach;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      PageContentBlock.Text = SessionInfo.PageContent(PageContentBlocks.OutreachPage);
      ImageGallery1.CurrentPage = PageContentBlocks.OutreachPage;
      ImageGallery1.CurrentMinistry = MinistryArea.Outreach;
    }
  }
}