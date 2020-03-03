using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Syndication;
using System.ServiceModel.Web;
using System.Text;

namespace Cedar_Grove.feeds {
  // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ISermonService" in both code and config file together.
  [ServiceContract]
  public interface ISermonService {
    [OperationContract]
    [WebGet]
    Rss20FeedFormatter GetRssSermons();

    [OperationContract]
    [WebGet(ResponseFormat = WebMessageFormat.Xml)]
    string GetRssSermonsFeed();
  }
}
