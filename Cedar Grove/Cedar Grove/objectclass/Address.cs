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
    public bool Primary { get; set; }
  }
}