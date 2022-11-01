using System;
using Telerik.Web.UI;

namespace Cedar_Grove.admin {
  public partial class Classroom : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.Training;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      TrainingAdminHeader.Text = SessionInfo.PageContent(PageContentBlocks.TrainingHeader);
      ((AdminMasterPage)this.Master).DataBindBreadCrumbSiteMap(new RadMenuItem() { Text = "Training", NavigateUrl = "~/training" });
    }

    protected void TraingVideos_NeedDataSource(object sender, RadListViewNeedDataSourceEventArgs e) { ((RadListView)sender).DataSource = SqlHelpers.Select("SELECT Id, Title, VideoUrl FROM dbo.TrainingVideos;"); }
  }
}