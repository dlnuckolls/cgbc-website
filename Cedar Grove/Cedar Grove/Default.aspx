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
  <telerik:RadPageLayout runat="server" ID="RadPageLayout2">
    <Rows>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="4" SpanMd="4" SpanSm="12" SpanXs="12" >
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
          <telerik:LayoutColumn Span="8" SpanMd="8" SpanSm="12" SpanXs="12" >
             <div class="messageEventHeader">Upcoming Events</div>
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
                      <telerik:RadLabel ID="RadLabel1" runat="server" Text='<%# Bind("Title") %>' />
                      &nbsp;&nbsp;<telerik:RadLabel ID="RadLabel2" runat="server" Text='<%# Bind("EventDate") %>' />
                    </h4>
                    <p>
                      <asp:Literal runat="server" ID="Literal1" Text='<%# Bind("Description") %>' />
                    </p>
                  </div>
                </ItemTemplate>
              </telerik:RadListView>
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>
</asp:Content>
