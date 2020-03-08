using System;

namespace Cedar_Grove.pages {
  public partial class EmbraceLife : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.EmbraceLife;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      PageContentBlock.Text = SessionInfo.PageContent(PageContentBlocks.EmbraceLifePage);
      ImageGallery1.CurrentPage = PageContentBlocks.EmbraceLifePage;
      ImageGallery1.CurrentMinistry = MinistryArea.EmbraceLife;
    }
  }
}