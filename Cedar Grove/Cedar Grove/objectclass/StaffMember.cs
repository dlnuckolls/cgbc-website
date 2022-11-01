namespace Cedar_Grove.objectclass {
  public class StaffMember {
    public string Id { get; set; }
    public string Name { get; set; }
    public string Title { get; set; }
    public string Bio { get; set; }
    public string ImageUrl { get; set; }
    public string EmailAddress { get; set; }
    public int DisplayOrder { get; set; }

    public StaffMember() { }

    public StaffMember(string id) {
      var dataRow = SqlHelpers.Select(SqlStatements.SQL_GET_STAFF_MEMBER_BY_ID.FormatWith(id)).Rows[0];
      Id = dataRow["Id"].ToString();
      Name = dataRow["Name"].ToString();
      Title = dataRow["Title"].ToString();
      Bio = dataRow["Bio"].ToString();
      ImageUrl = dataRow["ImageUrl"].ToString();
      EmailAddress = dataRow["EmailAddress"].ToString();
      DisplayOrder = dataRow["DisplayOrder"].ToString().GetInt32();
    }

    public void SaveStaffMember() {
      if (Id.IsNullOrEmpty()) {
        _ = SqlHelpers.Insert(SqlStatements.SQL_INSERT_STAFF_MEMBERS.FormatWith(
          Name.FixSqlString(), Title.FixSqlString(), Bio.FixSqlString(), ImageUrl.FixSqlString(), DisplayOrder, EmailAddress.FixSqlString()));
      } else {
        _ = SqlHelpers.Update(SqlStatements.SQL_UPDATE_STAFF_MEMBERS.FormatWith(
          Name.FixSqlString(), Title.FixSqlString(), Bio.FixSqlString(), ImageUrl.FixSqlString(), DisplayOrder, EmailAddress.FixSqlString(), Id));
      }
    }
  }
}