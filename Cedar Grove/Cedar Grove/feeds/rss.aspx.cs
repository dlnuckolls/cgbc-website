using Cedar_Grove.helpers;
using System;

namespace Cedar_Grove.feeds {
  public partial class rss : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      RssFeed.Text = SermonSyndicationService.GetRssSermonsFeed();
    }
  }
}