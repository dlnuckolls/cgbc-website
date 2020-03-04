using Cedar_Grove.helpers;
using System;
using Telerik.Web.UI;

namespace Cedar_Grove.pages {
  public partial class Sermons : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.Sermons;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
    }

    protected void SermonPodcasts_NeedDataSource(object sender, Telerik.Web.UI.RadListViewNeedDataSourceEventArgs e) {
      var feed = SermonSyndicationService.GetRssSermons();
      ((RadListView)sender).DataSource = feed.Feed.Items;
    }
  }
}