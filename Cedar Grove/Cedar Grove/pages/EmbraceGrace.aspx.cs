using System;

namespace Cedar_Grove.pages {
  public partial class EmbraceGrace : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.EmbraceGrace;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      PageContentBlock.Text = SessionInfo.PageContent(PageContentBlocks.EmbraceGracePage);
      ImageGallery1.CurrentPage = PageContentBlocks.EmbraceGracePage;
      ImageGallery1.CurrentMinistry = MinistryArea.EmbraceGrace;
    }
  }
}