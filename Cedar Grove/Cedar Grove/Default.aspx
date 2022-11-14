<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Cedar_Grove.Default" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <telerik:RadPageLayout runat="server" ID="RadPageLayout1" >
    <Rows>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="12">
            <telerik:RadAjaxPanel ID="AjaxPanel1" runat="server">
              <telerik:RadPageLayout runat="server" ID="RadPageLayout2">
                <Rows>
                  <telerik:LayoutRow>
                    <Columns>
                      <telerik:LayoutColumn Span="3" SpanMd="3" HiddenSm="true">
                        <div class="messageEventHeader">Quick Messages</div>
                        <telerik:RadListView runat="server" ID="MemberMessages" AllowPaging="true" PageSize="2" Skin="Silk" OnNeedDataSource="MemberMessages_NeedDataSource">
                          <LayoutTemplate>
                            <div class="RadListView RadListViewFloated RadListView_<%# Container.Skin %>">
                              <telerik:RadDataPager RenderMode="Lightweight" ID="MessagePager" runat="server" PagedControlID="MemberMessages"
                                PageSize="2">
                                <Fields>
                                  <telerik:RadDataPagerButtonField FieldType="FirstPrev"></telerik:RadDataPagerButtonField>
                                  <telerik:RadDataPagerButtonField FieldType="NextLast"></telerik:RadDataPagerButtonField>
                                </Fields>
                              </telerik:RadDataPager>
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
                      <telerik:LayoutColumn Span="9" SpanMd="9" SpanSm="12">
                        <div class="messageEventHeader">Members</div>
                        <telerik:RadPageLayout runat="server">
                          <Rows>
                            <telerik:LayoutRow>
                              <Columns>
                                <telerik:LayoutColumn Span="8" SpanMd="12">
                                  <telerik:RadDataPager RenderMode="Lightweight" ID="RadDataPager1" runat="server" PagedControlID="MemberList"
                                    PageSize="8">
                                    <Fields>
                                      <telerik:RadDataPagerButtonField FieldType="FirstPrev"></telerik:RadDataPagerButtonField>
                                      <telerik:RadDataPagerButtonField FieldType="Numeric"></telerik:RadDataPagerButtonField>
                                      <telerik:RadDataPagerButtonField FieldType="NextLast"></telerik:RadDataPagerButtonField>
                                    </Fields>
                                  </telerik:RadDataPager>
                                </telerik:LayoutColumn>
                                <telerik:LayoutColumn Span="4" HiddenMd="true">
                                  <telerik:RadButton ID="RadImageButton1" runat="server" Text="Add New" CssClass="menubuttons" OnClick="RadImageButton1_Click" CommandArgument='0'>
                                  </telerik:RadButton>
                                </telerik:LayoutColumn>
                              </Columns>
                            </telerik:LayoutRow>
                          </Rows>
                        </telerik:RadPageLayout>
                        <telerik:RadListView runat="server" ID="MemberList" AllowPaging="true" PageSize="8" Skin="Silk" OnNeedDataSource="MemberList_NeedDataSource" OnItemDataBound="MemberList_ItemDataBound">
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
<telerik:RadCard ID="RadCard1" runat="server">
  <telerik:CardHeaderComponent runat="server" ID="CardHeader"></telerik:CardHeaderComponent>
  <telerik:CardTitleComponent runat="server" ID="CardTitle"></telerik:CardTitleComponent>
</telerik:RadCard>
                              <telerik:RadPageLayout runat="server">
                                <Rows>
                                  <telerik:LayoutRow>
                                    <Columns>
                                      <telerik:LayoutColumn Span="4" SpanSm="1">
                                        <img id="Image1" runat="server" src='<%# Bind("ImageUrl") %>' alt="Unavailable" />
                                      </telerik:LayoutColumn>
                                      <telerik:LayoutColumn Span="8" SpanSm="11">
                                        <h4>
                                          <telerik:RadLabel ID="RadLabel1" runat="server" Text='<%# Bind("DisplayName") %>' />
                                        </h4>
                                        <em>
                                          <telerik:RadLabel ID="RadLabel2" runat="server" Text='<%# Bind("Title") %>' />
                                        </em>
                                        <br />
                                        <telerik:RadLabel ID="RadLabel3" runat="server" Text='<%# Bind("PrimaryAddress.Address1") %>' />
                                        <br />
                                        <div class="address">
                                          <telerik:RadLabel ID="RadLabel5" runat="server" Text='<%# Bind("PrimaryAddress.City") %>' />
                                          ,&nbsp;<telerik:RadLabel ID="RadLabel6" runat="server" Text='<%# Bind("PrimaryAddress.StateAbbreviation") %>' />
                                          &nbsp;&nbsp;<telerik:RadLabel ID="RadLabel7" runat="server" Text='<%# Bind("PrimaryAddress.PostalCodeFormatted") %>' />
                                        </div>
                                        <div class="phone">
                                          <telerik:RadLabel ID="RadLabel4" runat="server" Text='<%# Bind("PrimaryPhone.PhoneNumber") %>' />
                                        </div>
                                        <div class="relations">
                                          
                                        </div>
                                      </telerik:LayoutColumn>
                                    </Columns>
                                  </telerik:LayoutRow>
                                </Rows>
                              </telerik:RadPageLayout>
                              <div class="editSave">
                                <telerik:RadButton ID="RadImageButton1" runat="server" Width="35px" Height="35px" OnClick="RadImageButton1_Click" CommandArgument='<%# Bind("Id") %>'>
                                  <Image ImageUrl="images/edit.png"></Image>
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
              <telerik:RadWindow RenderMode="Lightweight" ID="modalPopup2" runat="server" Width="900px" Height="500px" CenterIfModal="true" AutoSize="false" Title="Member Details"
                Modal="true" OffsetElementID="main" Skin="Outlook" Style="z-index: 100001;" VisibleOnPageLoad="false" IconUrl="/images/contacts.png" VisibleStatusbar="false" Behaviors="Close">
                <ContentTemplate>
                  <div class="listViewItemPopup">
                    <telerik:RadPageLayout runat="server" Width="840px">
                      <Rows>
                        <telerik:LayoutRow>
                          <Columns>
                            <telerik:LayoutColumn Span="2" CssClass="title">
                              Name
                            </telerik:LayoutColumn>
                            <telerik:LayoutColumn Span="5">
                              <telerik:RadTextBox ID="FirstName" runat="server" Width="100%" EmptyMessage="First Name"></telerik:RadTextBox>
                            </telerik:LayoutColumn>
                            <telerik:LayoutColumn Span="5">
                              <telerik:RadTextBox ID="LastName" runat="server" Width="100%" EmptyMessage="Last Name"></telerik:RadTextBox>
                            </telerik:LayoutColumn>
                          </Columns>
                        </telerik:LayoutRow>
                        <telerik:LayoutRow>
                          <Columns>
                            <telerik:LayoutColumn Span="2" CssClass="title">
                              Address
                            </telerik:LayoutColumn>
                            <telerik:LayoutColumn Span="10">
                              <telerik:RadTextBox ID="Address" runat="server" Width="100%" EmptyMessage="Address"></telerik:RadTextBox>
                            </telerik:LayoutColumn>
                          </Columns>
                        </telerik:LayoutRow>
                        <telerik:LayoutRow>
                          <Columns>
                            <telerik:LayoutColumn Span="2" CssClass="title">
                              City, State, Zip
                            </telerik:LayoutColumn>
                            <telerik:LayoutColumn Span="7">
                              <telerik:RadTextBox ID="City" runat="server" Width="100%" EmptyMessage="City"></telerik:RadTextBox>
                            </telerik:LayoutColumn>
                            <telerik:LayoutColumn Span="1">
                              
                            </telerik:LayoutColumn>
                            <telerik:LayoutColumn Span="2">
                              <telerik:RadTextBox ID="PostalCode" runat="server" Width="100%" EmptyMessage="Zip"></telerik:RadTextBox>
                            </telerik:LayoutColumn>
                          </Columns>
                        </telerik:LayoutRow>
                      </Rows>
                    </telerik:RadPageLayout>
                    <div class="listViewItemReadmore">
                      <telerik:RadButton RenderMode="Lightweight" ID="RadButton1" runat="server" Primary="true" Text="Save" OnClick="RadButton1_Click" />
                      &nbsp;&nbsp;&nbsp;<telerik:RadButton RenderMode="Lightweight" ID="RadButton2" runat="server" Primary="true" Text="Cancel" OnClientClick="Close();return false;" />
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
