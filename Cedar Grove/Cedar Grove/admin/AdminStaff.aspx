<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminStaff.aspx.cs" Inherits="Cedar_Grove.admin.AdminStaff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:Literal ID="PageAdminHeader" runat="server" />
  <div id="messageDisplayArea">
    <telerik:RadLabel runat="server" ID="MessageDisplay"></telerik:RadLabel>
  </div>
  <telerik:RadGrid Skin="WebBlue" RenderMode="Auto" runat="server" ID="StaffList" AllowPaging="true" Width="100%" PagerStyle-AlwaysVisible="True" AllowSorting="true"
    HorizontalAlign="Left" AutoGenerateColumns="False" CellPadding="0" BorderWidth="0px" BorderStyle="None" MasterTableView-CellPadding="0" MasterTableView-CellSpacing="0"
    MasterTableView-GridLines="Horizontal" DataSourceID="StaffSource" GroupingSettings-CaseSensitive="false" OnDeleteCommand="StaffList_DeleteCommand"
    OnUpdateCommand="StaffList_UpdateCommand" OnInsertCommand="StaffList_InsertCommand" OnItemCommand="StaffList_ItemCommand">
    <MasterTableView AutoGenerateColumns="False" EditMode="InPlace" DataKeyNames="Id" GridLines="None"
      ClientDataKeyNames="Id" CommandItemDisplay="Bottom" InsertItemPageIndexAction="ShowItemOnFirstPage">
      <Columns>
        <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ItemStyle-Width="32px" EditText="Edit" HeaderText="Edit" />
        <telerik:GridButtonColumn ConfirmText="Delete this entry?" ConfirmDialogType="RadWindow" ConfirmTitle="Delete" ButtonType="FontIconButton" HeaderText="Delete"
          CommandName="Delete" ItemStyle-Width="30px" />
        <telerik:GridBoundColumn ShowFilterIcon="False" DataField="Name" AllowFiltering="False" HeaderText="Name" ItemStyle-Width="175px" />
        <telerik:GridBoundColumn ShowFilterIcon="false" DataField="Title" AllowFiltering="False" HeaderText="Title" ItemStyle-Width="175px" />
        <telerik:GridBoundColumn ShowFilterIcon="false" DataField="Bio" AllowFiltering="False" HeaderText="Bio" ItemStyle-Width="300px" />
        <telerik:GridBoundColumn ShowFilterIcon="false" DataField="EmailAddress" AllowFiltering="False" HeaderText="Email Address" ItemStyle-Width="175px" />
        <telerik:GridBoundColumn ShowFilterIcon="false" DataField="DisplayOrder" AllowFiltering="False" HeaderText="Order" ItemStyle-Width="50px" />
        <telerik:GridImageColumn ShowFilterIcon="false" DataImageUrlFields="ImageUrl" ImageAlign="Middle" ImageHeight="100px" ImageWidth="100px" AllowFiltering="False" HeaderText="Image" ItemStyle-Width="110px" />
      </Columns>
      <CommandItemSettings AddNewRecordText="Add New Staff" ShowRefreshButton="true"></CommandItemSettings>
    </MasterTableView>
    <ClientSettings EnableRowHoverStyle="true">
      <Selecting AllowRowSelect="True" />
    </ClientSettings>
    <PagerStyle Mode="NextPrev" />
  </telerik:RadGrid>
  <asp:SqlDataSource ID="StaffSource" runat="server" ConnectionString='<%$ ConnectionStrings:CedarGrove %>' SelectCommand="SELECT [Id],[Name],[Title],[Bio],[ImageUrl],[DisplayOrder],[EmailAddress] FROM [dbo].[StaffMembers];" />
</asp:Content>
