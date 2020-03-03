using Cedar_Grove.helpers;
using System;
using System.Collections.Generic;
using System.ServiceModel.Syndication;
using System.Text;
using System.Xml;

namespace Cedar_Grove.feeds {
  /// <summary>
  /// Base feed service for Rss and Atom feeds of sermon content
  /// </summary>
  public class SermonService : ISermonService {
    
    /// <summary>
    /// Private Feed Header
    /// </summary>
    /// <returns></returns>
    private SyndicationFeed GetFeedHeader() {
      SyndicationFeed feed = null;
      try {
        feed = new SyndicationFeed("Cedar Grove Baptist Church", "Recent Sermons", new Uri("https://cgbc.glorykidd.com/feeds/SermonService.svc/GetRssSermonsFeed"));
        feed.Authors.Add(new SyndicationPerson("office@cedargrovebaptist.church"));
        feed.Categories.Add(new SyndicationCategory("Sermons"));
        feed.Description = new TextSyndicationContent("This is a posting of recent sermons from Cedar Grove Baptist Church");
      } catch (Exception feedEx) {
        SystemErrorHandler.LogError("RSS Feeds", feedEx);
      }
      return feed;
    }

    /// <summary>
    /// Populate the items in the syndicatied feed for Rss or Atom
    /// </summary>
    /// <param name="inFeed"></param>
    private void AddFeedItems(ref SyndicationFeed inFeed) {
      SyndicationItem item1 = new SyndicationItem(
          "Item One",
          "This is the content for item one",
          new Uri("http://localhost/Content/One"),
          "ItemOneID",
          DateTime.Now);

      SyndicationItem item2 = new SyndicationItem(
          "Item Two",
          "This is the content for item two",
          new Uri("http://localhost/Content/Two"),
          "ItemTwoID",
          DateTime.Now);

      SyndicationItem item3 = new SyndicationItem(
          "Item Three",
          "This is the content for item three",
          new Uri("http://localhost/Content/three"),
          "ItemThreeID",
          DateTime.Now);

      List<SyndicationItem> items = new List<SyndicationItem>();

      items.Add(item1);
      items.Add(item2);
      items.Add(item3);

      inFeed.Items = items;
    }

    /// <summary>
    /// Base RSS Formatted feed for Syndication
    /// </summary>
    /// <returns>Rss 2.0 formatted syndication</returns>
    public Rss20FeedFormatter GetRssSermons() {
      var feed = GetFeedHeader();
      AddFeedItems(ref feed);
      return new Rss20FeedFormatter(feed);
    }

    /// <summary>
    /// Syndication feed for sermons
    /// </summary>
    /// <returns>Xml document version of the feed from Rss 2.0</returns>
    public string GetRssSermonsFeed() {
      var feed = GetFeedHeader();
      AddFeedItems(ref feed);
      var rssFormat = new Rss20FeedFormatter(feed, false);
      var output = new StringBuilder();
      using (var writer = XmlWriter.Create(output, new XmlWriterSettings { Indent = true })) {
        rssFormat.WriteTo(writer);
        writer.Flush();
      }
      return output.ToString();
    }
  }
}
