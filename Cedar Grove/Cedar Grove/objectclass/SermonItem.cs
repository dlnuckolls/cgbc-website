using System;
using System.Data;

namespace Cedar_Grove.objectclass {
  public class SermonItem {

    public string Id { get; set; }
    public DateTime Published { get; set; }
    public string Title { get; set; }
    public string Author { get; set; }
    public string Description { get; set; }
    public string SourceUrl { get; set; }

    /// <summary>
    /// Basic Constructor for Empty SermonItem
    /// </summary>
    public SermonItem() { }

    /// <summary>
    /// Constructor for SermonItem by Id
    /// </summary>
    /// <param name="id"></param>
    public SermonItem(string id) {
      var dataRow = SqlHelpers.Select(SqlStatements.SQL_GET_SERMON_BY_ID.FormatWith(id)).Rows[0];
      Id = dataRow["Id"].ToString();
      Published = dataRow["Published"].ToString().GetAsDate();
      Title = dataRow["Title"].ToString();
      Author = dataRow["Author"].ToString();
      Description = dataRow["Description"].ToString();
      SourceUrl = dataRow["SourceUrl"].ToString();
    }

    /// <summary>
    /// Constructor for SermonItem from a DataRow
    /// </summary>
    /// <param name="dataRow"></param>
    public SermonItem(DataRow dataRow) {
      Id = dataRow["Id"].ToString();
      Published = dataRow["Published"].ToString().GetAsDate();
      Title = dataRow["Title"].ToString();
      Author = dataRow["Author"].ToString();
      Description = dataRow["Description"].ToString();
      SourceUrl = dataRow["SourceUrl"].ToString();
    }

    public void SaveSermonItem() {
      if (Id.IsNullOrEmpty()) {
        _ = SqlHelpers.Insert(SqlStatements.SQL_INSERT_SERMON.FormatWith(Published.ConvertSqlDate(), Title.FixSqlString(), Author.FixSqlString(), Description.FixSqlString(), SourceUrl.FixSqlString()));
      } else {
        _ = SqlHelpers.Update(SqlStatements.SQL_UPDATE_SERMON.FormatWith(Published.ConvertSqlDate(), Title.FixSqlString(), Author.FixSqlString(), Description.FixSqlString(), SourceUrl.FixSqlString(), Id));
      }
    }
  }
}