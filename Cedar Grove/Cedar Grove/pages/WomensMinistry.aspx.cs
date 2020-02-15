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
    }
    protected void RadImageGallery1_NeedDataSource(object sender, Telerik.Web.UI.ImageGalleryNeedDataSourceEventArgs e) {
      ((RadImageGallery)sender).DataSource = SqlHelpers.Select(SqlStatements.SQL_GET_PAGE_GALLERY_BY_LOCATION.FormatWith(PageContentBlocks.WomensPage.TextValue()));
    }
  }
}