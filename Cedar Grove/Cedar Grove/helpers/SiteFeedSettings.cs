using Cedar_Grove.objectclass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Cedar_Grove.helpers {
  public class SiteFeedSettings {
    public string Id { get; set; }
    public string Title { get; set; }
    public string Description { get; set; }
    public string Uri { get; set; }
    public string Author { get; set; }
    public List<string> Categories { get; set; }
    public List<SermonItem> Sermons { get; set; }

    private static SiteFeedSettings _instance = null;

    /// <summary>
    /// Static Instance of SiteFeedSettings
    /// </summary>
    public static SiteFeedSettings StaticInstance => _instance.IsNullOrEmpty() ? _instance = LoadFeedSettings() : _instance;

    /// <summary>
    /// Load the site settings into the instance
    /// </summary>
    /// <returns></returns>
    private static SiteFeedSettings LoadFeedSettings() {
      try {
        var dataRow = SqlHelpers.Select(SqlStatements.SQL_GET_FEED_SETTINGS).Rows[0];
        return new SiteFeedSettings() {
          Id = dataRow["Id"].ToString(),
          Title = dataRow["FeedTitle"].ToString(),
          Description = dataRow["FeedDescription"].ToString(),
          Uri = dataRow["FeedUri"].ToString(),
          Author = dataRow["FeedAuthor"].ToString(),
          Categories = dataRow["FeedCategory"].ToString().Split(',').ToList<string>()
        };
      } catch (Exception ex) {
        SqlHelpers.Insert(SqlStatements.SQL_LOG_EXCEPTION.FormatWith(DateTime.Now.ConvertSqlDateTime(), "FeedSettings", ex.Message.FixSqlString(), ex.StackTrace.FixSqlString()));
        throw new ApplicationException("Sql Server Not accessible");
      }
    }

    public void LoadSermonsForFeed() {
      var sermons = SqlHelpers.Select(SqlStatements.SQL_GET_TOP_SERMONS);
      Sermons = new List<SermonItem>();
      foreach (DataRow dr in sermons.Rows) { Sermons.Add(new SermonItem(dr)); }
    }

    /// <summary>
    /// Update details for the SiteFeedSettings
    /// </summary>
    public void UpdateFeedSettings() {
      SqlHelpers.Update(SqlStatements.SQL_UPDATE_FEED_SETTINGS.FormatWith(
        Title.FixSqlString(), Description.FixSqlString(), Uri.FixSqlString(), Author.FixSqlString(), Categories.FixListToSqlString(), Id));
      _instance = LoadFeedSettings();
    }
  }
}