<%@ Page Title="" Language="C#" MasterPageFile="~/pages/PagesMasterPage.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Cedar_Grove.pages.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
  <link href="/styles/default.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <telerik:RadPageLayout runat="server" ID="JumbotronLayout" GridType="Fluid">
    <Rows>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="6" SpanMd="12" SpanSm="12" SpanXs="12">
            <div class="pageContentBlocks">
              <asp:Literal ID="AboutPageContentBlock" runat="server" />
            </div>
            <telerik:RadListView runat="server" Skin="Silk" OnNeedDataSource="StaffCards_NeedDataSource" ID="StaffDisplayList" AllowPaging="true" PageSize="9">
              <LayoutTemplate>
                <div class="RadListView RadListViewFloated RadListView_<%# Container.Skin %>">
                  <div class="rlvFloated rlvAutoScroll">
                    <div id="itemPlaceholder" runat="server">
                    </div>
                  </div>
                </div>
              </LayoutTemplate>
              <ItemTemplate>
              <div class="staffContactBox">
                <img id="Image1" runat="server" src='<%# Bind("ImageUrl") %>' alt="Unavailable" />
                <p><strong><telerik:RadLabel ID="RadLabel1" runat="server" Text='<%# Bind("Name") %>' /></strong><br />
                <em><telerik:RadLabel ID="RadLabel2" runat="server" Text='<%# Bind("Title") %>' /></em><br /><telerik:RadLabel ID="RadLabel3" runat="server" Text='<%# Bind("EmailAddress") %>' /></p>
              </div>
              </ItemTemplate>
            </telerik:RadListView>
          </telerik:LayoutColumn>
          <telerik:LayoutColumn Span="6" SpanMd="12" SpanSm="12" SpanXs="12">
            <div class="pageContentBlocks">
              <asp:Literal ID="ContactPageContentBlock" runat="server" />
            </div>
            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
              <telerik:RadTextBox ID="ContactName" runat="server" Width="100%" MaxLength="256" Label="Your Name" CssClass="MyEnabledTextBox" LabelCssClass="MyContactLabel">
                <HoveredStyle CssClass="MyHoveredTextBox"></HoveredStyle>
                <FocusedStyle CssClass="MyFocusedTextBox"></FocusedStyle>
              </telerik:RadTextBox>
              <asp:RequiredFieldValidator ID="ContactNameValidator" runat="server" ControlToValidate="ContactName" EnableClientScript="false" ValidationGroup="Group"
                ErrorMessage="Please fill in your name" Display="Dynamic" ForeColor="Red" />
              <telerik:RadTextBox ID="ContactEmail" runat="server" Width="100%" MaxLength="256" Label="Your Email" CssClass="MyEnabledTextBox" LabelCssClass="MyContactLabel">
                <HoveredStyle CssClass="MyHoveredTextBox"></HoveredStyle>
                <FocusedStyle CssClass="MyFocusedTextBox"></FocusedStyle>
              </telerik:RadTextBox>
              <asp:RequiredFieldValidator ID="ContactEmailValidator" runat="server" ControlToValidate="ContactEmail" EnableClientScript="false" ValidationGroup="Group"
                ErrorMessage="Please fill in your email" Display="Dynamic" ForeColor="Red" />
              <telerik:RadTextBox ID="ContactSubject" runat="server" Width="100%" MaxLength="256" Label="Subject" CssClass="MyEnabledTextBox" LabelCssClass="MyContactLabel">
                <HoveredStyle CssClass="MyHoveredTextBox"></HoveredStyle>
                <FocusedStyle CssClass="MyFocusedTextBox"></FocusedStyle>
              </telerik:RadTextBox>
              <telerik:RadTextBox ID="ContactMessage" runat="server" Width="100%" Label="Message" CssClass="MyEnabledTextBox" LabelCssClass="MyContactLabel" TextMode="MultiLine" Rows="8" Resize="None">
                <HoveredStyle CssClass="MyHoveredTextBox"></HoveredStyle>
                <FocusedStyle CssClass="MyFocusedTextBox"></FocusedStyle>
              </telerik:RadTextBox>
              <div style="padding-left: 100px; padding-top: 10px; padding-bottom: 10px;">
                <telerik:RadCaptcha ID="RadCaptcha1" runat="server" ErrorMessage="The code you entered is not valid." ForeColor="Red"
                  ValidationGroup="Group" EnableRefreshImage="true" CaptchaTextBoxCssClass="MyCaptchaTextBox" CaptchaTextBoxLabel="Please enter code">
                  <CaptchaImage ImageCssClass="imageClass" />
                </telerik:RadCaptcha>
                <telerik:RadButton ID="SendMessage" runat="server" Skin="Silk" RenderMode="Auto" Text="Send Message" ValidationGroup="Group" OnClick="SendMessage_Click" CssClass="css3Simple" />
              </div>
            </telerik:RadAjaxPanel>

          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>
</asp:Content>
