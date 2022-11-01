using System.Collections.Generic;

namespace Cedar_Grove.objectclass {
  public class ChurchMember {
    public string Id;
    public string FirstName;
    public string LastName;
    public string DisplayName;
    public string Title;
    public string Bio;
    public string ImageUrl;
    public List<EmailAddress> EmailAddresses;
    public List<Address> Addresses;

    public ChurchMember() { }

    public ChurchMember(string id) {
      var dataRow = SqlHelpers.Select(SqlStatements.SQL_GET_STAFF_MEMBER_BY_ID.FormatWith(id)).Rows[0];
      Id = dataRow["Id"].ToString();
      Name = dataRow["Name"].ToString();
      Title = dataRow["Title"].ToString();
      Bio = dataRow["Bio"].ToString();
      ImageUrl = dataRow["ImageUrl"].ToString();
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