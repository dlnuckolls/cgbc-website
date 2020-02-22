using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Cedar_Grove.pages {
  public partial class WomensMinistry : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.Womens;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      PageContentBlock.Text = SessionInfo.PageContent(PageContentBlocks.WomensPage);
      ImageGallery1.CurrentPage = PageContentBlocks.WomensPage;
      ImageGallery1.CurrentMinistry = MinistryArea.Womens;
    }
  }
}