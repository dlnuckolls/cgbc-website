<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminUsers.aspx.cs" Inherits="Cedar_Grove.admin.AdminUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:Literal ID="PageAdminHeader" runat="server" />
  <div id="messageDisplayArea">
    <telerik:RadLabel runat="server" ID="MessageDisplay"></telerik:RadLabel>
  </div>
  <telerik:RadGrid Skin="Silk" RenderMode="Auto" runat="server" ID="UserAccountsList" AllowPaging="true" Width="100%" PagerStyle-AlwaysVisible="True" AllowSorting="true"
    HorizontalAlign="Left" AutoGenerateColumns="False" CellPadding="0" BorderWidth="0px" BorderStyle="None" MasterTableView-CellPadding="0" MasterTableView-CellSpacing="0"
    MasterTableView-GridLines="Horizontal" DataSourceID="UserListSource" GroupingSettings-CaseSensitive="false" OnDeleteCommand="UserAccountsList_DeleteCommand"
    OnUpdateCommand="UserAccountsList_UpdateCommand" OnInsertCommand="UserAccountsList_InsertCommand" OnItemCommand="UserAccountsList_ItemCommand">
    <MasterTableView AutoGenerateColumns="False" EditMode="InPlace" DataKeyNames="Id" GridLines="None"
      ClientDataKeyNames="Id" CommandItemDisplay="Bottom" InsertItemPageIndexAction="ShowItemOnFirstPage">
      <Columns>
        <telerik:GridBoundColumn ShowFilterIcon="False" DataField="DisplayName" AllowFiltering="False" HeaderText="Display Name" ItemStyle-Width="175px" />
        <telerik:GridBoundColumn ShowFilterIcon="false" DataField="UserName" AllowFiltering="False" HeaderText="Email Address" ItemStyle-Width="175px" />
        <telerik:GridButtonColumn ShowFilterIcon="false" HeaderText="User Password" ButtonType="LinkButton" Text="Reset&nbsp;Password" CommandName="ResetPassword" ShowInEditForm="False" ItemStyle-Width="150px" />
        <telerik:GridBoundColumn ShowFilterIcon="false" DataField="Notes" AllowFiltering="False" HeaderText="Notes" />
        <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ItemStyle-Width="32px" EditText="Edit" HeaderText="Edit" />
        <telerik:GridButtonColumn ConfirmText="Delete this entry?" ConfirmDialogType="RadWindow" ConfirmTitle="Delete" ButtonType="FontIconButton" HeaderText="Delete"
          CommandName="Delete" ItemStyle-Width="30px" />
      </Columns>
      <CommandItemSettings AddNewRecordText="Add New User" ShowRefreshButton="true"></CommandItemSettings>
    </MasterTableView>
    <ClientSettings EnableRowHoverStyle="true">
      <Selecting AllowRowSelect="True" />
    </ClientSettings>
    <PagerStyle Mode="NextPrev" />
  </telerik:RadGrid>
  <asp:SqlDataSource ID="UserListSource" runat="server" ConnectionString='<%$ ConnectionStrings:CedarGrove %>' SelectCommand="SELECT [Id],[DisplayName],[UserName],[Notes] FROM [dbo].[AdminUsers];" />
</asp:Content>
