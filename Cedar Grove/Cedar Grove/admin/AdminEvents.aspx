<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminEvents.aspx.cs" Inherits="Cedar_Grove.admin.AdminEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
  <style>
    .RadGrid {
      border-radius: 10px;
      overflow: hidden;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:Literal ID="PageAdminHeader" runat="server" />
  <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
    <div id="messageDisplayArea">
      <telerik:RadLabel runat="server" ID="MessageDisplay"></telerik:RadLabel>
    </div>
    <telerik:RadGrid Skin="WebBlue" RenderMode="Auto" runat="server" ID="EventsList" AllowPaging="true" Width="100%" PagerStyle-AlwaysVisible="True" AllowSorting="true"
      HorizontalAlign="Left" AutoGenerateColumns="False" CellPadding="0" BorderWidth="0px" BorderStyle="None" MasterTableView-CellPadding="0" MasterTableView-CellSpacing="0"
      MasterTableView-GridLines="Horizontal" DataSourceID="UserListSource" GroupingSettings-CaseSensitive="false" OnDeleteCommand="EventsList_DeleteCommand"
      OnUpdateCommand="EventsList_UpdateCommand" OnInsertCommand="EventsList_InsertCommand">
      <MasterTableView AutoGenerateColumns="False" EditMode="InPlace" DataKeyNames="Id" GridLines="None"
        ClientDataKeyNames="Id" CommandItemDisplay="TopAndBottom" InsertItemPageIndexAction="ShowItemOnFirstPage">
        <Columns>
          <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ItemStyle-Width="32px" EditText="Edit" HeaderText="Edit" />
          <telerik:GridButtonColumn ConfirmText="Delete this entry?" ConfirmDialogType="RadWindow" ConfirmTitle="Delete" ButtonType="FontIconButton" HeaderText="Delete"
            CommandName="Delete" ItemStyle-Width="30px" />
          <telerik:GridBoundColumn ShowFilterIcon="False" DataField="Title" AllowFiltering="False" HeaderText="Title" AllowSorting="true" ItemStyle-Width="350px" ColumnEditorID="TitleEditor" />
          <telerik:GridDateTimeColumn ShowFilterIcon="false" DataField="EventDate" AllowFiltering="False" HeaderText="Event Date" AllowSorting="true" PickerType="DateTimePicker" ItemStyle-Width="250px" ColumnEditorID="DatePicker" />
          <telerik:GridDateTimeColumn ShowFilterIcon="false" DataField="EventEnd" AllowFiltering="False" HeaderText="Event End" AllowSorting="true" PickerType="DateTimePicker" ItemStyle-Width="250px" ColumnEditorID="DatePicker" />
          <telerik:GridHTMLEditorColumn ShowFilterIcon="false" DataField="Description" AllowFiltering="False" HeaderText="Description" />
        </Columns>
        <CommandItemSettings AddNewRecordText="Add New Event" ShowRefreshButton="true"></CommandItemSettings>
      </MasterTableView>
      <ClientSettings EnableRowHoverStyle="true">
        <Selecting AllowRowSelect="True" />
      </ClientSettings>
      <PagerStyle Mode="NextPrevAndNumeric" />
    </telerik:RadGrid>
    <telerik:GridTextBoxColumnEditor runat="server" ID="TitleEditor">
      <TextBoxStyle Width="100%" />
    </telerik:GridTextBoxColumnEditor>
    <telerik:GridDateTimeColumnEditor runat="server" ID="DatePicker">
      <TextBoxStyle Width="100%" />
    </telerik:GridDateTimeColumnEditor>
    <asp:SqlDataSource ID="UserListSource" runat="server" ConnectionString='<%$ ConnectionStrings:CedarGrove %>' SelectCommand="SELECT [Id],[Title],[Description],[EventDate],[EventEnd] FROM [dbo].[UpcomingEvents] ORDER BY [EventDate] DESC;" />
  </telerik:RadAjaxPanel>
</asp:Content>
