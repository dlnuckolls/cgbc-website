<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminGallery.aspx.cs" Inherits="Cedar_Grove.admin.AdminGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
  <style>
    .RadGrid {
      border-radius: 10px;
      overflow: hidden;
    }

    .RadGrid_Silk .rgFilterRow > td > [type="text"] {
      width: 90% !important;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:Literal ID="PageAdminHeader" runat="server" />
  <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
    <div id="messageDisplayArea">
      <telerik:RadLabel runat="server" ID="MessageDisplay"></telerik:RadLabel>
    </div>
    <telerik:RadGrid RenderMode="Auto" runat="server" ID="gImageGallery" AllowPaging="true" GridLines="Horizontal" AllowFilteringByColumn="true" AllowSorting="true"
      CellPadding="0" BorderWidth="0px" BorderStyle="None" MasterTableView-CellPadding="0" MasterTableView-CellSpacing="0" MasterTableView-GridLines="Horizontal"
      Skin="WebBlue" OnNeedDataSource="gImageGallery_NeedDataSource" OnUpdateCommand="gImageGallery_UpdateCommand" OnItemDataBound="gImageGallery_ItemDataBound"
      OnInsertCommand="gImageGallery_InsertCommand" Width="100%" OnDeleteCommand="gImageGallery_DeleteCommand" AutoGenerateColumns="False">
      <MasterTableView EditMode="InPlace" DataKeyNames="Id" GridLines="None" ClientDataKeyNames="Id" CommandItemDisplay="TopAndBottom" InsertItemPageIndexAction="ShowItemOnFirstPage">
        <Columns>
          <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ItemStyle-VerticalAlign="Top" HeaderText="Edit" ItemStyle-Width="30px" />
          <telerik:GridTemplateColumn UniqueName="TitleDescription" HeaderText="Title / Description" ItemStyle-Width="550px" AllowFiltering="false" FilterControlWidth="300px"
            AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="true">
            <ItemTemplate>
              <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Title</div>
              <telerik:RadLabel ID="RadLabel1" runat="server" Text='<%# Bind("Title") %>' Width="100%" />
              <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Description</div>
              <telerik:RadLabel ID="RadLabel2" runat="server" Text='<%# Bind("Description") %>' Width="100%" />
            </ItemTemplate>
            <EditItemTemplate>
              <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Title</div>
              <telerik:RadTextBox ID="ResourceTitle" runat="server" RenderMode="Auto" Width="100%" EmptyMessage="Enter a Title" Skin="Silk" Text='<%# Bind("Title") %>' />
              <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Description</div>
              <telerik:RadTextBox ID="ResourceURL" runat="server" RenderMode="Auto" Width="100%" EmptyMessage="Enter a Title" Skin="Silk" Text='<%# Bind("Description") %>' />
            </EditItemTemplate>
          </telerik:GridTemplateColumn>
          <telerik:GridDropDownColumn UniqueName="ddlPageLoocations" ListTextField="Description" ListValueField="PageLocation" DataSourceID="ObjectDataSource1"
            HeaderText="Page Location" DataField="PageLocation" DropDownControlType="RadComboBox" AllowSorting="true" ColumnEditorID="TitleEditor">
            <FilterTemplate>
              <telerik:RadComboBox RenderMode="Lightweight" ID="RadComboBoxTitle" DataSourceID="ObjectDataSource1" DataTextField="Description"
                DataValueField="PageLocation" Width="100%" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("ddlPageLoocations").CurrentFilterValue %>'
                runat="server" OnClientSelectedIndexChanged="TitleIndexChanged">
                <Items>
                  <telerik:RadComboBoxItem Text="All" />
                </Items>
              </telerik:RadComboBox>
              <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                <script type="text/javascript">
                  function TitleIndexChanged(sender, args) {
                    var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                    tableView.filter("ddlPageLoocations", args.get_item().get_value(), "EqualTo");
                  }
                </script>
              </telerik:RadScriptBlock>
            </FilterTemplate>
          </telerik:GridDropDownColumn>
          <telerik:GridTemplateColumn ShowFilterIcon="false" DataField="ImageUrl" AllowFiltering="False" HeaderText="Image" ItemStyle-Width="110px">
            <ItemTemplate>
              <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("ImageUrl") %>' Width="300" Height="200" />
            </ItemTemplate>
            <EditItemTemplate>
              <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("ImageUrl") %>' Width="300" Height="200" />
              <telerik:RadAsyncUpload RenderMode="Lightweight" runat="server" Skin="Silk" ID="AsyncUpload1" HideFileInput="true" AllowedFileExtensions=".jpeg,.jpg,.png,.gif" />
            </EditItemTemplate>
          </telerik:GridTemplateColumn>
          <telerik:GridButtonColumn ConfirmText="Delete this entry?" ConfirmDialogType="Classic" ConfirmTitle="Delete" ButtonType="FontIconButton" HeaderText="Delete"
            CommandName="Delete" ItemStyle-Width="30px" ItemStyle-VerticalAlign="Top" />
        </Columns>
      </MasterTableView>
      <ClientSettings EnableRowHoverStyle="true">
        <Selecting AllowRowSelect="True"></Selecting>
      </ClientSettings>
      <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
    </telerik:RadGrid>
    <telerik:GridDropDownListColumnEditor runat="server" ID="TitleEditor">
      <DropDownStyle Width="100%" />
    </telerik:GridDropDownListColumnEditor>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetPageLocationsForImages" TypeName="Cedar_Grove.SqlDatasets" />
  </telerik:RadAjaxPanel>
</asp:Content>
