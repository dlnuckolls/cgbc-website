<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mainnavigation.ascx.cs" Inherits="Cedar_Grove.MainNavigation" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<telerik:RadMenu ID="RadMenu1" runat="server" RenderMode="Auto">
  <Items>
    <telerik:RadMenuItem Text="Home" NavigateUrl="/" />
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="Ministries">
      <Items>
        <telerik:RadMenuItem Text="Men On Mission" NavigateUrl="~/pages/MensMinistry.aspx" />
        <telerik:RadMenuItem Text="Womens" NavigateUrl="~/pages/WomensMinistry.aspx" />
        <telerik:RadMenuItem Text="Youth" NavigateUrl="~/pages/YouthMinistry.aspx" />
        <telerik:RadMenuItem Text="Children" NavigateUrl="~/pages/ChildrensMinistry.aspx" />
        <telerik:RadMenuItem Text="Outreach" />
      </Items>
    </telerik:RadMenuItem>
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="Calendar" />
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="Sermons" />
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="Galary" />
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="About Us" />
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="Contact Us" />
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="Admin" />
  </Items>
</telerik:RadMenu>
