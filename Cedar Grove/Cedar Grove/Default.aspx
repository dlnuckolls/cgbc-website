<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Cedar_Grove.Default" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="Server">
  <link href="/styles/default.css" rel="stylesheet" />
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <telerik:RadPageLayout runat="server" ID="RadPageLayout1">
    <Rows>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn CssClass="jumbotron">
            <asp:Literal ID="HomeJumbotron" runat="server"></asp:Literal>
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn HiddenMd="true" HiddenSm="true" HiddenXs="true">
            <asp:Literal ID="EventHeader" runat="server"></asp:Literal>
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
  <telerik:RadAjaxPanel ID="AjaxPanel1" runat="server">
    <telerik:RadPageLayout runat="server" ID="RadPageLayout2">
      <Rows>
        <telerik:LayoutRow>
          <Columns>
            <telerik:LayoutColumn Span="4" SpanMd="4" SpanSm="12" SpanXs="12">
              <style>
                .RadGrid {
                  border-radius: 10px;
                  overflow: hidden;
                }
              </style>
              <telerik:RadGrid Skin="WebBlue" RenderMode="Auto" runat="server" ID="EventsList" Width="100%" PagerStyle-AlwaysVisible="false"
                OnItemDataBound="EventsList_ItemDataBound"
                HorizontalAlign="Left" AutoGenerateColumns="False" CellPadding="0" BorderWidth="0px" BorderStyle="None" MasterTableView-CellPadding="0" MasterTableView-CellSpacing="0"
                MasterTableView-GridLines="None" OnNeedDataSource="EventsList_NeedDataSource" GroupingSettings-CaseSensitive="false" ShowHeader="true">
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id" GridLines="None"
                  ClientDataKeyNames="Id" CommandItemDisplay="None" InsertItemPageIndexAction="ShowItemOnFirstPage" AllowNaturalSort="False" ShowHeadersWhenNoRecords="true">
                  <CommandItemSettings ShowAddNewRecordButton="False" ShowRefreshButton="False"></CommandItemSettings>
                  <Columns>
                    <telerik:GridTemplateColumn ShowFilterIcon="False" AllowFiltering="False" HeaderText="This Week at CGBC" AllowSorting="true" UniqueName="ComingEvents" HeaderStyle-CssClass="messageEventHeader">
                      <ItemTemplate>
                        <telerik:RadLabel ID="RadLabel1" runat="server" Text='<%# Bind("Subject") %>'></telerik:RadLabel>
                        <hr />
                        <telerik:RadLabel ID="RadLabel2" runat="server" Text='<%# Eval("Start", "{0:d}") %>' />
                        <telerik:RadLabel ID="RadLabel3" runat="server" Text='<%# Eval("Start", "{0:h:mm tt}") %>' />
                        -
                    <telerik:RadLabel ID="RadLabel4" runat="server" Text='<%# Eval("End", "{0:h:mm tt}") %>' />
                        <hr />
                        Description:
                    <asp:Literal ID="EventLiteral1" runat="server" Text='<%# Bind("Description") %>' />
                      </ItemTemplate>
                    </telerik:GridTemplateColumn>
                  </Columns>
                </MasterTableView>
              </telerik:RadGrid>
            </telerik:LayoutColumn>
            <telerik:LayoutColumn Span="8" SpanMd="8" SpanSm="12" SpanXs="12">
              <div class="messageEventHeader">Upcoming Events</div>
              <telerik:RadListView runat="server" OnNeedDataSource="UpcomingEvents_NeedDataSource" ID="UpcomingEvents" AllowPaging="true" PageSize="6" Skin="Silk">
                <LayoutTemplate>
                  <div class="RadListView RadListViewFloated RadListView_<%# Container.Skin %>">
                    <div class="rlvFloated rlvAutoScroll">
                      <div id="itemPlaceholder" runat="server">
                      </div>
                    </div>
                  </div>
                </LayoutTemplate>
                <ItemTemplate>
                  <div class="listViewItem">
                    <h4>
                      <img src="/images/megaphone.png" />
                      <telerik:RadLabel ID="RadLabel1" runat="server" Text='<%# Bind("Title") %>' />
                      <br />
                      <telerik:RadLabel ID="RadLabel2" runat="server" Text='<%# Bind("EventDate") %>' />
                    </h4>
                    <p>
                      <asp:Literal runat="server" ID="Literal1" Text='<%# Bind("Description") %>' />
                    </p>
                    <div class="listViewItemFade"></div>
                    <div class="listViewItemReadmore">
                      <telerik:RadButton RenderMode="Lightweight" ID="btnReadMore" runat="server" OnClick="btnReadMore_Click" Primary="true" Text="Learn More" CommandArgument='<%# Bind("Id") %>'>
                        <Icon PrimaryIconCssClass="rbNext" />
                      </telerik:RadButton>
                    </div>
                  </div>
                </ItemTemplate>
              </telerik:RadListView>
            </telerik:LayoutColumn>
          </Columns>
        </telerik:LayoutRow>
      </Rows>
    </telerik:RadPageLayout>
    <telerik:RadWindow RenderMode="Lightweight" ID="modalPopup" runat="server" Width="500px" Height="450px" CenterIfModal="true" AutoSize="false" Title="Event Details"
      Modal="true" OffsetElementID="main" Skin="Outlook" Style="z-index: 100001;" VisibleOnPageLoad="false" IconUrl="/images/megaphone.png" VisibleStatusbar="false" Behaviors="Close">
      <ContentTemplate>
        <div class="listViewItemPopup">
          <h4>
            <telerik:RadLabel ID="EventTitle" runat="server" />
            <br />
            <telerik:RadLabel ID="EventDate" runat="server" />
          </h4>
          <p>
            <asp:Literal runat="server" ID="EventDescription" />
          </p>
          <div class="listViewItemReadmore">
            <telerik:RadButton RenderMode="Lightweight" ID="btnClose" runat="server" Primary="true" Text="Close" OnClientClick="Close();return false;" />
          </div>
        </div>
      </ContentTemplate>
    </telerik:RadWindow>
    <script type="text/javascript">
      function GetRadWindow() {
        var oWindow = null;
        if (window.radWindow) oWindow = window.radWindow;
        else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
        return oWindow;
      }

      function Close() {
        GetRadWindow().close();
      }
    </script>
  </telerik:RadAjaxPanel>
</asp:Content>
