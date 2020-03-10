using System;

namespace Cedar_Grove {
  [AttributeUsage(AttributeTargets.Enum)]
  public class CustomEnumAttribute : Attribute {
    public bool IsCustomEnum { get; set; }
    public CustomEnumAttribute(bool isCustomEnum) : this() { IsCustomEnum = isCustomEnum; }
    private CustomEnumAttribute() { IsCustomEnum = false; }
  }

  [AttributeUsage(AttributeTargets.Field)]
  class TextValueAttribute : CustomEnumAttribute {
    public string Value { get; set; }
    public TextValueAttribute(string textValue) : this() { Value = textValue ?? throw new NullReferenceException("Null not allowed in textValue at TextValue attribute"); }
    private TextValueAttribute() : base(true) => Value = string.Empty;
  }

  [CustomEnum(true)]
  public enum PageNames {
    [TextValue("Login Page")] Login,
    [TextValue("Cedar Grove Baptist")] Home,
    [TextValue("About Us")] About,
    [TextValue("Contact Us")] Contact,
    [TextValue("Find Events")] Search,
    [TextValue("Questions")] FAQ,
    [TextValue("Sermon Podcasts")] Sermons,
    [TextValue("Men on Mission")] Mens,
    [TextValue("Women's Ministry")] Womens,
    [TextValue("Embrace Grace")] EmbraceGrace,
    [TextValue("Embrace Life")] EmbraceLife,
    [TextValue("Youth Ministry")] Youth,
    [TextValue("Childrens Ministry")] Childrens,
    [TextValue("Admin Dashboard")] Admin,
    [TextValue("Page Management")] PageAdmin,
    [TextValue("My Dashboard")] Dashboard,
    [TextValue("Outreach Ministry")] Outreach,
    [TextValue("Forgot Password")] ForgotPassword,
    [TextValue("Reset Password")] ResetPassword,
    [TextValue("Chruch Calendar")] Calendar,
    [TextValue("What we Believe")] Believe,
    [TextValue("Church By-Laws")] Constitution,
    [TextValue("Child Protection")] ChildProtection,
    [TextValue("Missions")] Missions,
    [TextValue("Training")] Training,
  }

  [CustomEnum(true)]
  public enum PageContentBlocks {
    //Admin
    [TextValue("4667B33D-BE48-4B7D-816E-D705F1F732C5")] AdminHomeTop,
    [TextValue("06688FA2-EBCB-4F42-9F63-091524C9B839")] AdminHomeToolHeader,
    [TextValue("61175E8D-6131-4789-8989-DC4C4695E711")] PageAdminHeader,
    [TextValue("D42ABA67-51F4-4416-AFA4-A4015551B07C")] DashboardHeader,
    [TextValue("3AB7B9CE-A432-47ED-B441-597097AE2313")] CalendarHeader,
    [TextValue("FDD565B5-54FE-4A9E-9486-8E9ED1770E4B")] EventHeader,
    [TextValue("E0A66F2B-9965-4064-9F76-604D08CDE4F8")] GalleryHeader,
    [TextValue("F8409812-85FA-45A7-83F6-2A902BF64DF0")] SermonHeader,
    [TextValue("C49B5CC7-D290-4192-97BB-B5C443BBC71E")] StaffHeader,
    [TextValue("60D63750-0123-4F48-B775-8E698F5A45EF")] UsersHeader,
    [TextValue("69CA95DB-30CB-4B8C-A4EA-42DF50331BD3")] TrainingHeader,
    //Ministries
    [TextValue("8F9B4D10-6294-45AC-9692-9A29335F1661")] MensPage,
    [TextValue("D9E75614-BEA8-472D-9A42-E37CAEAA7506")] WomensPage,
    [TextValue("5F70F0DA-229A-47C3-9A6A-20369BA22C15")] EmbraceGracePage,
    [TextValue("81DF6CEB-5CC8-4055-AE6E-C199FBD03A5B")] EmbraceLifePage,
    [TextValue("329D0E46-3C1E-4B53-9C6C-4CA7BAAE6536")] YouthPage,
    [TextValue("BB0F852F-2C0E-4C2E-8CE0-59319318BC38")] ChildrensPage,
    [TextValue("A1E9F1FF-9D7C-45A2-94A4-E9BDBFC13CF3")] OutreachPage,
    [TextValue("8D18BCE8-8473-4763-9209-F6095DA03DA5")] MissionsPage,
    //General Pages
    [TextValue("8508EBC6-6582-4C3F-B85E-CA10F7E25619")] CalendarPage,
    [TextValue("3219C52F-0056-4818-9831-F81B0AC023E6")] BelievePageHeader,
    [TextValue("715A4FC2-41CB-4499-B4FD-358186F1937F")] BelievePageBody,
    [TextValue("F89AB4CA-D663-4731-A67D-3526FEC8A9AB")] ConstitutionPageHeader,
    [TextValue("EF9B3A69-C04B-43FD-93B4-C7B8DA4C7916")] ConstitutionPageBody,
    [TextValue("AD344A0E-8151-4846-A503-985D1F284D8D")] ContactUsPageBody,
    [TextValue("BE5DF028-0EEA-4118-8431-0A31F347AA0C")] AboutUsPageBody,
    [TextValue("A2444FC2-F610-4B19-B566-39A3A4ACD82D")] SermonFeedPageBody,
    [TextValue("E2439935-28F4-49F0-95E9-D323F4CA09AB")] HomeJumbotronPageBody,
    [TextValue("CBB3ED8F-F5BF-4661-9693-7AD387050793")] HomeEventTitlePageBody,
    [TextValue("D378CB45-7391-44FA-9603-1428AED3208D")] ChildProtectionPageHeader,
    [TextValue("8CCA9FAE-E135-4DA4-8268-F53C53D967BC")] ChildProtectionPageBody,
  }

  [CustomEnum(true)]
  public enum MinistryArea {
    Mens = 1,
    Womens = 2,
    Youth = 3,
    Childrens = 4,
    Outreach = 5,
    General = 6,
    Missions = 7,
    EmbraceGrace = 8,
    EmbraceLife = 9,
  }
}