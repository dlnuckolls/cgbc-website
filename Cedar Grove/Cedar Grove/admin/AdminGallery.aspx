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
  <div id="messageDisplayArea">
    <telerik:RadLabel runat="server" ID="MessageDisplay"></telerik:RadLabel>
  </div>
  <telerik:RadGrid RenderMode="Auto" runat="server" ID="gImageGallery" AllowPaging="true" GridLines="Horizontal"
    CellPadding="0" BorderWidth="0px" BorderStyle="None" MasterTableView-CellPadding="0" MasterTableView-CellSpacing="0" MasterTableView-GridLines="Horizontal"
    Skin="WebBlue" OnNeedDataSource="gImageGallery_NeedDataSource" OnUpdateCommand="gImageGallery_UpdateCommand" OnItemDataBound="gImageGallery_ItemDataBound"
    OnInsertCommand="gImageGallery_InsertCommand" Width="100%" OnDeleteCommand="gImageGallery_DeleteCommand" AutoGenerateColumns="False">
    <MasterTableView EditMode="InPlace" DataKeyNames="Id" GridLines="None"
      ClientDataKeyNames="Id" CommandItemDisplay="TopAndBottom" InsertItemPageIndexAction="ShowItemOnFirstPage">
      <Columns>
        <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ItemStyle-VerticalAlign="Top" HeaderText="Edit" ItemStyle-Width="30px" />
        <telerik:GridButtonColumn ConfirmText="Delete this entry?" ConfirmDialogType="Classic" ConfirmTitle="Delete" ButtonType="FontIconButton" HeaderText="Delete"
          CommandName="Delete" ItemStyle-Width="30px" ItemStyle-VerticalAlign="Top" />
        <telerik:GridTemplateColumn UniqueName="LinkItem" HeaderText="Resource Links">
          <ItemTemplate>
            <telerik:RadPageLayout runat="server" ID="RadPageLayout2">
              <Rows>
                <telerik:LayoutRow>
                  <Columns>
                    <telerik:LayoutColumn Span="4" SpanMd="4" SpanSm="12">
                      <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Title</div>
                      <telerik:RadLabel ID="RadLabel1" runat="server" Text='<%# Bind("Title") %>' Width="100%" />
                      <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Description</div>
                      <telerik:RadLabel ID="RadLabel2" runat="server" Text='<%# Bind("Description") %>' Width="100%" />
                      <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Page Location</div>
                      <telerik:RadLabel ID="RadLabel3" runat="server" Text='<%# Bind("PageLocation") %>' Width="100%" />
                    </telerik:LayoutColumn>
                    <telerik:LayoutColumn Span="8" SpanMd="8" SpanSm="12">
                      <div class="adminTiles">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("ImageUrl") %>' Width="300" Height="200" />
                      </div>
                    </telerik:LayoutColumn>
                  </Columns>
                </telerik:LayoutRow>
              </Rows>
            </telerik:RadPageLayout>
          </ItemTemplate>
          <EditItemTemplate>
            <telerik:RadPageLayout runat="server" ID="RadPageLayout2">
              <Rows>
                <telerik:LayoutRow>
                  <Columns>
                    <telerik:LayoutColumn Span="4" SpanMd="4" SpanSm="12">
                      <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Title</div>
                      <telerik:RadTextBox ID="ResourceTitle" runat="server" RenderMode="Auto" Width="100%" EmptyMessage="Enter a Title" Skin="Silk" Text='<%# Bind("Title") %>' />
                      <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Description</div>
                      <telerik:RadTextBox ID="ResourceURL" runat="server" RenderMode="Auto" Width="100%" EmptyMessage="Enter a Title" Skin="Silk" Text='<%# Bind("Description") %>' />
                      <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Page Location</div>
                      <telerik:RadComboBox ID="ddlPageLocation" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Description" DataValueField="PageLocation"></telerik:RadComboBox>
                    </telerik:LayoutColumn>
                    <telerik:LayoutColumn Span="8" SpanMd="8" SpanSm="12">
                      <div class="adminTiles">
                        <telerik:RadAsyncUpload RenderMode="Lightweight" runat="server" Skin="Silk" ID="AsyncUpload1" HideFileInput="true" AllowedFileExtensions=".jpeg,.jpg,.png,.gif"
                          OnFileUploaded="AsyncUpload1_FileUploaded" />
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("ImageUrl") %>' Width="300" Height="200" />
                      </div>
                    </telerik:LayoutColumn>
                  </Columns>
                </telerik:LayoutRow>
              </Rows>
            </telerik:RadPageLayout>
          </EditItemTemplate>
        </telerik:GridTemplateColumn>
      </Columns>
    </MasterTableView>
    <ClientSettings EnableRowHoverStyle="true">
      <Selecting AllowRowSelect="True"></Selecting>
    </ClientSettings>
    <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
  </telerik:RadGrid>
  <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetPageLocationsForImages" TypeName="Cedar_Grove.SqlDatasets" />
</asp:Content>
