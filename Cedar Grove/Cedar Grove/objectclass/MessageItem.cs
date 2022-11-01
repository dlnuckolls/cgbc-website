using System;

namespace Cedar_Grove {
  public class MessageItem {
    private static MessageItem _instance;
    public string Id;
    public string Title;
    public string Description;
    public DateTime EventDate;

    public static MessageItem StaticInstance => _instance.IsNullOrEmpty() ? _instance = new MessageItem() : _instance;

    public MessageItem() { }
    public MessageItem(string id) {
      var dataRow = SqlHelpers.Select(SqlStatements.SQL_GET_MEMBER_MESSAGES_BY_ID.FormatWith(id)).Rows[0];
      Id = dataRow["Id"].ToString();
      Title = dataRow["Title"].ToString();
      Description = dataRow["Description"].ToString();
      EventDate = dataRow["Expiry"].ToString().GetAsDate();
    }

    public void ClearEventItem() => _instance = new MessageItem();

    public void LoadEventItem(string id) { _instance = new MessageItem(id); }

    public void SaveEventItem() {
      if (Id.IsNullOrEmpty()) {
        _ = SqlHelpers.Insert(SqlStatements.SQL_INSERT_MEMBER_MESSAGES.FormatWith(Title.FixSqlString(), Description.FixSqlString(), EventDate.ConvertSqlDateTime()));
      } else {
        _ = SqlHelpers.Update(SqlStatements.SQL_UPDATE_MEMBER_MESSAGES.FormatWith(Title.FixSqlString(), Description.FixSqlString(), EventDate.ConvertSqlDateTime(), Id));
      }
    }
  }
}