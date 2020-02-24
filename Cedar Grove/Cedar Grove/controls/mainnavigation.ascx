<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mainnavigation.ascx.cs" Inherits="Cedar_Grove.MainNavigation" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<telerik:RadMenu ID="RadMenu1" runat="server" RenderMode="Auto">
  <Items>
    <telerik:RadMenuItem Text="Home" NavigateUrl="~/" />
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="Ministries">
      <Items>
        <telerik:RadMenuItem Text="Men On Mission" NavigateUrl="~/pages/MensMinistry.aspx" />
        <telerik:RadMenuItem Text="Womens" NavigateUrl="~/pages/WomensMinistry.aspx" />
        <telerik:RadMenuItem Text="Youth" NavigateUrl="~/pages/YouthMinistry.aspx" />
        <telerik:RadMenuItem Text="Children" NavigateUrl="~/pages/ChildrensMinistry.aspx" />
        <telerik:RadMenuItem Text="Outreach" NavigateUrl="~/pages/OutreachMinistry.aspx" />
      </Items>
    </telerik:RadMenuItem>
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="Calendar" NavigateUrl="~/pages/Calendar.aspx" />
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="Sermons" />
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="About Us">
      <Items>
        <telerik:RadMenuItem Text="What We Believe" NavigateUrl="~/pages/WhatWeBelieve.aspx" />
        <telerik:RadMenuItem IsSeparator="true" />
        <telerik:RadMenuItem Text="Contact Us" />
      </Items>
    </telerik:RadMenuItem>
    <telerik:RadMenuItem IsSeparator="true" />
    <telerik:RadMenuItem Text="Admin" NavigateUrl="~/admin/Login.aspx" />
  </Items>
</telerik:RadMenu>
