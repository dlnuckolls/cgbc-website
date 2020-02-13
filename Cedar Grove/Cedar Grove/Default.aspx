﻿<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Cedar_Grove.Default" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="Server">
  <link href="styles/default.css" rel="stylesheet" />
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <telerik:RadPageLayout runat="server" ID="RadPageLayout1">
    <Rows>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn CssClass="jumbotron">
            <h3>Welcome to Cedar Grove Baptist Church, join us for Sunday School and Worship starting at 9:30 AM</h3>
            <h1>Every Sunday</h1>
            <h3>We would love to see you there!</h3>
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn HiddenMd="true" HiddenSm="true" HiddenXs="true">
            <h3>Upcoming events you don't want to miss!</h3>
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
  <telerik:RadListView runat="server" OnNeedDataSource="UpcomingEvents_NeedDataSource" ID="UpcomingEvents" AllowPaging="true" PageSize="3">
    <LayoutTemplate>
      <div class="listView1">
        <asp:Panel ID="itemPlaceholder" runat="server">
        </asp:Panel>
      </div>
    </LayoutTemplate>
    <ItemTemplate>
      <div class="listViewItem">
        <h4>
          <img src="/images/megaphone.png" />
          <telerik:RadLabel ID="RadLabel1" runat="server" Text='<%# Bind("Title") %>' />&nbsp;&nbsp;<telerik:RadLabel ID="RadLabel2" runat="server" Text='<%# Bind("EventDate") %>' />
        </h4>
        <p>
          <asp:Literal runat="server" ID="Literal1" Text='<%# Bind("Description") %>' />
        </p>
      </div>
    </ItemTemplate>
  </telerik:RadListView>
</asp:Content>
