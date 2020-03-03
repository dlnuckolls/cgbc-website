using System;
using System.Collections.Generic;
using System.ServiceModel.Syndication;
using System.Text;
using System.Xml;

namespace Cedar_Grove.helpers {
  public class SermonSyndicationService {
    /// <summary>
    /// Private Feed Header
    /// </summary>
    /// <returns></returns>
    private static SyndicationFeed GetFeedHeader() {
      try {
        var feed = new SyndicationFeed(SiteFeedSettings.StaticInstance.Title, SiteFeedSettings.StaticInstance.Description, new Uri(SiteFeedSettings.StaticInstance.Uri));
        feed.Authors.Add(new SyndicationPerson(SiteFeedSettings.StaticInstance.Author));
        feed.Description = new TextSyndicationContent(SiteFeedSettings.StaticInstance.Description);
        SiteFeedSettings.StaticInstance.Categories.ForEach(cat => { feed.Categories.Add(new SyndicationCategory(cat)); });
        return feed;
      } catch (Exception feedEx) {
        SystemErrorHandler.LogError("RSS Feeds", feedEx);
        throw feedEx;
      }
    }

    /// <summary>
    /// Populate the items in the syndicatied feed for Rss or Atom
    /// </summary>
    /// <param name="inFeed"></param>
    private static void AddFeedItems(ref SyndicationFeed inFeed) {
      SiteFeedSettings.StaticInstance.LoadSermonsForFeed();
      List<SyndicationItem> items = new List<SyndicationItem>();
      SiteFeedSettings.StaticInstance.Sermons.ForEach(sermon => { items.Add(new SyndicationItem(sermon.Title, sermon.Description, new Uri(sermon.SourceUrl), sermon.Id, sermon.Published)); });
      inFeed.Items = items;
    }

    /// <summary>
    /// Base RSS Formatted feed for Syndication
    /// </summary>
    /// <returns>Rss 2.0 formatted syndication</returns>
    public static Rss20FeedFormatter GetRssSermons() {
      var feed = GetFeedHeader();
      AddFeedItems(ref feed);
      return new Rss20FeedFormatter(feed);
    }

    /// <summary>
    /// Syndication feed for sermons
    /// </summary>
    /// <returns>Xml document version of the feed from Rss 2.0</returns>
    public static string GetRssSermonsFeed() {
      var feed = GetFeedHeader();
      AddFeedItems(ref feed);
      var rssFormat = new Rss20FeedFormatter(feed, false);
      var output = new StringBuilder();
      using (var writer = XmlWriter.Create(output, new XmlWriterSettings { Indent = true })) { rssFormat.WriteTo(writer); writer.Flush(); }
      return output.ToString();
    }
  }
}