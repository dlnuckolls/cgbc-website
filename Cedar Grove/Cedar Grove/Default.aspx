<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Cedar_Grove.Default" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <telerik:RadPageLayout runat="server" ID="RadPageLayout1">
    <Rows>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="12">
            <telerik:RadAjaxPanel ID="AjaxPanel1" runat="server">
              <telerik:RadPageLayout runat="server" ID="RadPageLayout2">
                <Rows>
                  <telerik:LayoutRow>
                    <Columns>
                      <telerik:LayoutColumn Span="7" SpanMd="9" SpanSm="12" HiddenXs="true">
                        <div class="messageEventHeader">Quick Messages</div>
                        <telerik:RadListView runat="server" ID="MemberMessages" AllowPaging="true" PageSize="6" Skin="Silk" OnNeedDataSource="MemberMessages_NeedDataSource">
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
                      <telerik:LayoutColumn Span="5" SpanMd="3" SpanSm="12" SpanXs="12">
                        <div class="messageEventHeader">Members</div>
                        <telerik:RadListView runat="server" ID="MemberList" AllowPaging="true" PageSize="4" Skin="Silk" OnNeedDataSource="MemberList_NeedDataSource">
                          <LayoutTemplate>
                            <div class="RadListView RadListViewFloated RadListView_<%# Container.Skin %>">
                              <div class="rlvFloated rlvAutoScroll">
                                <div id="itemPlaceholder" runat="server">
                                </div>
                              </div>
                            </div>
                          </LayoutTemplate>
                          <ItemTemplate>
                            <div class="memberListViewItem">
                              <telerik:RadPageLayout runat="server">
                                <Rows>
                                  <telerik:LayoutRow>
                                    <Columns>
                                      <telerik:LayoutColumn Span="4">
                                        <img id="Image1" runat="server" src='<%# Bind("ImageUrl") %>' alt="Unavailable" />
                                      </telerik:LayoutColumn>
                                      <telerik:LayoutColumn Span="8">
                                        <h4>
                                          <telerik:RadLabel ID="RadLabel1" runat="server" Text='<%# Bind("DisplayName") %>' />
                                        </h4>
                                          <em>
                                            <telerik:RadLabel ID="RadLabel2" runat="server" Text='<%# Bind("Title") %>' />
                                          </em>
                                          <br />
                                          Address Goes Here
                                <telerik:RadLabel ID="RadLabel3" runat="server" Text='<%# Bind("PrimaryAddress") %>' />
                                      </telerik:LayoutColumn>
                                    </Columns>
                                  </telerik:LayoutRow>
                                </Rows>
                              </telerik:RadPageLayout>
                            </div>
                          </ItemTemplate>
                        </telerik:RadListView>
                        <style>
                          .RadGrid {
                            border-radius: 10px;
                            overflow: hidden;
                          }
                        </style>
                        <telerik:RadGrid Skin="WebBlue" RenderMode="Auto" runat="server" ID="EventsList" Width="100%" PagerStyle-AlwaysVisible="false"
                          HorizontalAlign="Left" AutoGenerateColumns="False" CellPadding="0" BorderWidth="0px" BorderStyle="None" MasterTableView-CellPadding="0" MasterTableView-CellSpacing="0"
                          MasterTableView-GridLines="None" GroupingSettings-CaseSensitive="false" ShowHeader="true">
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
                    </Columns>
                  </telerik:LayoutRow>
                </Rows>
              </telerik:RadPageLayout>
              <telerik:RadWindow RenderMode="Lightweight" ID="modalPopup" runat="server" Width="620px" Height="500px" CenterIfModal="true" AutoSize="false" Title="Event Details"
                Modal="true" OffsetElementID="main" Skin="Outlook" Style="z-index: 100001;" VisibleOnPageLoad="false" IconUrl="/images/megaphone.png" VisibleStatusbar="false" Behaviors="Close">
                <ContentTemplate>
                  <div class="listViewItemPopup">
                    <h4>
                      <telerik:RadLabel ID="MessageTitle" runat="server" />
                    </h4>
                    <p>
                      <asp:Literal runat="server" ID="MessageDescription" />
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
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>
</asp:Content>
