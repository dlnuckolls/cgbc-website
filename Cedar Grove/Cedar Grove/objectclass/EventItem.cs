using System;

namespace Cedar_Grove {
  public class EventItem {
    private static EventItem _instance;
    public string Id;
    public string Title;
    public string Description;
    public DateTime EventDate;
    public DateTime EventEnd;

    public static EventItem StaticInstance => _instance.IsNullOrEmpty() ? _instance = new EventItem() : _instance;

    public EventItem() { }
    public EventItem(string id) {
      var dataRow = SqlHelpers.Select(SqlStatements.SQL_GET_EVENT_BY_ID.FormatWith(id)).Rows[0];
      Id = dataRow["Id"].ToString();
      Title = dataRow["Title"].ToString();
      Description = dataRow["Description"].ToString();
      EventDate = dataRow["EventDate"].ToString().GetAsDate();
      EventEnd = dataRow["EventEnd"].ToString().GetAsDate();
    }

    public void ClearEventItem() => _instance = new EventItem();

    public void LoadEventItem(string id) { _instance = new EventItem(id); }

    public void SaveEventItem() {
      if (Id.IsNullOrEmpty()) {
        _ = SqlHelpers.Insert(SqlStatements.SQL_INSERT_EVENT.FormatWith(Title.FixSqlString(), Description.FixSqlString(), EventDate.ConvertSqlDateTime(), EventEnd.ConvertSqlDateTime()));
      } else {
        _ = SqlHelpers.Update(SqlStatements.SQL_UPDATE_EVENT.FormatWith(Title.FixSqlString(), Description.FixSqlString(), EventDate.ConvertSqlDateTime(), EventEnd.ConvertSqlDateTime(), Id));
      }
    }
  }
}