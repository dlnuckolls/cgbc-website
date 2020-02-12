﻿using System;

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
    [TextValue("Helpful Links")] Resources,
    [TextValue("Podcasts")] Communications,
    [TextValue("News")] News,
    [TextValue("Admin Dashboard")] Admin,
    [TextValue("Page Management")] PageAdmin,
    [TextValue("My Dashboard")] Dashboard,
    [TextValue("Link Management")] ResourceLinks
  }
  [CustomEnum(true)]
  public enum PageContentBlocks {
    [TextValue("4667B33D-BE48-4B7D-816E-D705F1F732C5")] AdminHomeTop,
    [TextValue("06688FA2-EBCB-4F42-9F63-091524C9B839")] AdminHomeToolHeader,
    [TextValue("61175E8D-6131-4789-8989-DC4C4695E711")] PageAdminHeader,
    [TextValue("D42ABA67-51F4-4416-AFA4-A4015551B07C")] DashboardHeader,
    [TextValue("8F9B4D10-6294-45AC-9692-9A29335F1661")] HomePageBottom,
    [TextValue("D9E75614-BEA8-472D-9A42-E37CAEAA7506")] AboutUsHomeContent,
    [TextValue("329D0E46-3C1E-4B53-9C6C-4CA7BAAE6536")] ResourceLinksContent,
    [TextValue("BB0F852F-2C0E-4C2E-8CE0-59319318BC38")] ResourceLinksManagement,
    [TextValue("A1E9F1FF-9D7C-45A2-94A4-E9BDBFC13CF3")] ContactUsHomeContent,
  }
}