<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminSermons.aspx.cs" Inherits="Cedar_Grove.admin.AdminSermons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:Literal ID="SermonAdminHeader" runat="server" />
  <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
    <div id="messageDisplayArea">
      <telerik:RadLabel runat="server" ID="MessageDisplay"></telerik:RadLabel>
    </div>
    <telerik:RadGrid Skin="WebBlue" RenderMode="Auto" runat="server" ID="SermonFeedList" AllowPaging="true" Width="100%" PagerStyle-AlwaysVisible="True" AllowSorting="true"
      HorizontalAlign="Left" AutoGenerateColumns="False" CellPadding="0" BorderWidth="0px" BorderStyle="None" MasterTableView-CellPadding="0" MasterTableView-CellSpacing="0"
      MasterTableView-GridLines="Horizontal" DataSourceID="SermonListSource" GroupingSettings-CaseSensitive="false" OnDeleteCommand="SermonFeedList_DeleteCommand"
      OnUpdateCommand="SermonFeedList_UpdateCommand" OnInsertCommand="SermonFeedList_InsertCommand">
      <MasterTableView AutoGenerateColumns="False" EditMode="EditForms" DataKeyNames="Id" GridLines="None"
        ClientDataKeyNames="Id" CommandItemDisplay="TopAndBottom" InsertItemPageIndexAction="ShowItemOnFirstPage">
        <Columns>
          <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ItemStyle-Width="32px" EditText="Edit" HeaderText="Edit" />
          <telerik:GridButtonColumn ConfirmText="Delete this entry?" ConfirmDialogType="RadWindow" ConfirmTitle="Delete" ButtonType="FontIconButton" HeaderText="Delete"
            CommandName="Delete" ItemStyle-Width="30px" />
          <telerik:GridBoundColumn ShowFilterIcon="false" DataField="Published" DataFormatString="{0:MM/dd/yyyy}" AllowFiltering="False" HeaderText="Published" AllowSorting="true" ItemStyle-Width="100px" />
          <telerik:GridBoundColumn ShowFilterIcon="False" DataField="Title" AllowFiltering="False" HeaderText="Title" ItemStyle-Width="225px" />
          <telerik:GridBoundColumn ShowFilterIcon="False" DataField="Author" AllowFiltering="False" HeaderText="Author" ItemStyle-Width="175px" />
          <telerik:GridBoundColumn ShowFilterIcon="false" DataField="Description" AllowFiltering="False" HeaderText="Description" />
        </Columns>
        <EditFormSettings UserControlName="~/controls/editupdatesermon.ascx" EditFormType="WebUserControl">
          <EditColumn UniqueName="EditCommandColumn1">
          </EditColumn>
        </EditFormSettings>
        <CommandItemSettings AddNewRecordText="Add New Sermon" ShowRefreshButton="true"></CommandItemSettings>
      </MasterTableView>
      <ClientSettings EnableRowHoverStyle="true">
        <Selecting AllowRowSelect="True" />
      </ClientSettings>
      <PagerStyle Mode="NextPrev" />
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SermonListSource" runat="server" ConnectionString='<%$ ConnectionStrings:CedarGrove %>'
      SelectCommand="SELECT [Id], [Published], [Title], [Author], [Description], [SourceUrl] FROM [dbo].[SermonSyndicationFeed] ORDER BY [Published] DESC;" />
  </telerik:RadAjaxPanel>
</asp:Content>
