using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Syndication;
using System.Text;

namespace Cedar_Grove.feeds {
  // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
  [ServiceContract]
  public interface Sermons {
    [OperationContract]
    Rss20FeedFormatter GetRssSermons();
  }
  public class SermonFeed : Sermons {
    /// <summary>
    /// Get an RSS Feed for the sermons
    /// </summary>
    /// <returns></returns>
    public Rss20FeedFormatter GetRssSermons() {

      SyndicationFeed feed = new SyndicationFeed("Cedar Grove Baptist Church", "Recent Sermons", new Uri("https://cgbc.glorykidd.com/feeds"));
      feed.Authors.Add(new SyndicationPerson("someone@microsoft.com"));
      feed.Categories.Add(new SyndicationCategory("How To Sample Code"));
      feed.Description = new TextSyndicationContent("This is a how to sample that demonstrates how to expose a feed using RSS with WCF");

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

      feed.Items = items;

      return new Rss20FeedFormatter(feed);

    }

  }
}
