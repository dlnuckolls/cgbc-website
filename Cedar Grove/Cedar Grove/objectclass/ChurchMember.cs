using System.Collections.Generic;
using System.Linq;

namespace Cedar_Grove.objectclass {
  public class ChurchMember {
    public string Id { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string DisplayName { get; set; }
    public string Title { get; set; }
    public string Bio { get; set; }
    public string ImageUrl { get; set; }
    public List<Address> Addresses { get; set; }
    public Address PrimaryAddress => Addresses.FirstOrDefault(a => a.Primary == true) ?? new Address();
    public List<EmailAddress> EmailAddresses { get; set; }
    public EmailAddress PrimaryEmail => EmailAddresses.FirstOrDefault(e => e.Primary == true) ?? new EmailAddress();
    public List<Phone> Phones { get; set; }
    public Phone PrimaryPhone => Phones.FirstOrDefault(p => p.Primary == true) ?? new Phone();

    public ChurchMember() {
      Addresses = new List<Address>();
      EmailAddresses = new List<EmailAddress>();
      Phones = new List<Phone>();
    }

    public void SaveChurchMember() {
      //if(Id.IsNullOrEmpty()) {
      //  _ = SqlHelpers.Insert(SqlStatements.SQL_INSERT_STAFF_MEMBERS.FormatWith(
      //    Name.FixSqlString(), Title.FixSqlString(), Bio.FixSqlString(), ImageUrl.FixSqlString(), DisplayOrder, EmailAddress.FixSqlString()));
      //} else {
      //  _ = SqlHelpers.Update(SqlStatements.SQL_UPDATE_STAFF_MEMBERS.FormatWith(
      //    Name.FixSqlString(), Title.FixSqlString(), Bio.FixSqlString(), ImageUrl.FixSqlString(), DisplayOrder, EmailAddress.FixSqlString(), Id));
      //}
    }
  }
}