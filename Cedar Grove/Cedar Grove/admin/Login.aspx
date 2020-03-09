<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Cedar_Grove.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <telerik:RadAjaxPanel runat="server">
    <telerik:RadPageLayout runat="server" ID="loginPage">
      <Rows>
        <telerik:LayoutRow>
          <Columns>
            <telerik:LayoutColumn Span="4" SpanMd="3" SpanSm="12" HiddenXs="true" />
            <telerik:LayoutColumn Span="4" SpanMd="6" SpanSm="12">
              <div class="adminTiles">
                <div style="width: 500px;">
                  <div style="width: 100%; padding: 5px;">
                    <telerik:RadTextBox ID="userName" runat="server" Width="100%" Label="Email Address" CssClass="MyEnabledTextBox" LabelCssClass="MyLabel">
                      <HoveredStyle CssClass="MyHoveredTextBox"></HoveredStyle>
                      <FocusedStyle CssClass="MyFocusedTextBox"></FocusedStyle>
                    </telerik:RadTextBox>
                  </div>
                  <div style="width: 100%; padding: 5px;">
                    <telerik:RadTextBox ID="password" TextMode="Password" runat="server" Width="100%" Label="Password" CssClass="MyEnabledTextBox" LabelCssClass="MyLabel">
                      <HoveredStyle CssClass="MyHoveredTextBox"></HoveredStyle>
                      <FocusedStyle CssClass="MyFocusedTextBox"></FocusedStyle>
                    </telerik:RadTextBox>
                  </div>
                  <div style="width: 100%; padding: 5px; margin-left: 150px;">
                    <telerik:RadButton ID="SubmitLogin" runat="server" Skin="Silk" RenderMode="Auto" Text="Login" OnClick="SubmitLogin_OnClick" CssClass="css3Simple2" />
                    &nbsp;&nbsp;&nbsp;<telerik:RadLabel ID="lErrorMessage" runat="server" CssClass="appErrorMessage" />
                  </div>
                  <div style="width: 100%; padding: 5px; margin-left: 153px;">
                    <asp:LinkButton ID="ForgotPassword" runat="server" CssClass="forgotText" Text="Forgot&nbsp;Password" OnClick="ForgotPassword_OnClick" />
                  </div>
                  <div style="width: 100%; padding: 5px; margin-left: 153px;">
                    <%--<asp:LinkButton ID="RegisterNewUser" runat="server" CssClass="forgotText" Text="Register&nbsp;New&nbsp;User" OnClick="RegisterNewUser_Click" />--%>
                  </div>
                </div>
              </div>
            </telerik:LayoutColumn>
            <telerik:LayoutColumn Span="4" SpanMd="3" SpanSm="12" HiddenXs="true" />
          </Columns>
        </telerik:LayoutRow>
      </Rows>
    </telerik:RadPageLayout>
  </telerik:RadAjaxPanel>
</asp:Content>
