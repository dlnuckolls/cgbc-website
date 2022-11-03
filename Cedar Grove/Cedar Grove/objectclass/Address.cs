namespace Cedar_Grove.objectclass {
  public class Address {
    public string Id { get; set; }
    public string Address1 { get; set; }
    public string Address2 { get; set; }
    public string City { get; set; }
    public int StateId { get; set; }
    public string State { get; set; }
    public string StateAbbreviation { get; set; }
    public string PostalCode { get; set; }
    public string PostalExtension { get; set; }
    public string PostalCodeFormatted => "{0}{1}".FormatWith(PostalCode, (!PostalExtension.IsNullOrEmpty()) ? "-{0}".FormatWith(PostalExtension) : string.Empty);
    public bool Primary { get; set; }
  }
}