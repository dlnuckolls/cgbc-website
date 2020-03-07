<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mainnavigation.ascx.cs" Inherits="Cedar_Grove.MainNavigation" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<telerik:RadMenu ID="RadMenu1" runat="server" RenderMode="Auto">
  <Items>
    <telerik:RadMenuItem Text="Home" NavigateUrl="~/" />
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="Ministries">
      <Items>
        <telerik:RadMenuItem Text="Men On Mission" NavigateUrl="~/mens" />
        <telerik:RadMenuItem Text="Womens" NavigateUrl="~/womens" />
        <telerik:RadMenuItem Text="Youth" NavigateUrl="~/youth" />
        <telerik:RadMenuItem Text="Children" NavigateUrl="~/childrens" />
        <telerik:RadMenuItem Text="Outreach" NavigateUrl="~/outreach" />
        <telerik:RadMenuItem Text="Missions" NavigateUrl="~/missions" />
      </Items>
    </telerik:RadMenuItem>
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="Calendar" NavigateUrl="~/calendar" />
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="Sermons" NavigateUrl="~/sermons" />
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="About Us">
      <Items>
        <telerik:RadMenuItem Text="Service Times" NavigateUrl="~/aboutus" />
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="What We Believe" NavigateUrl="~/whatwebelieve" />
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="Church Constitution" NavigateUrl="~/bylaws" />
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="Child Protection" NavigateUrl="~/childprotection" />
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="About Us" NavigateUrl="~/aboutus" />
      </Items>
    </telerik:RadMenuItem>
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="Admin" NavigateUrl="~/admin/dashboard" />
  </Items>
</telerik:RadMenu>
