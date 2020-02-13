<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Cedar_Grove.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <telerik:RadAjaxPanel runat="server">
    <telerik:RadPageLayout runat="server" ID="loginPage" OnPreRender="loginPage_PreRender">
      <Rows>
        <telerik:LayoutRow>
          <Columns>
            <telerik:LayoutColumn Span="4" SpanMd="3" SpanSm="12" HiddenXs="true" />
            <telerik:LayoutColumn Span="4" SpanMd="6" SpanSm="12">
                    <div style="width: 500px;">
                      <div style="width: 100%; padding: 5px;">
                        <telerik:RadTextBox ID="LoginId" runat="server" Width="100%" Label="Email Address" CssClass="MyEnabledTextBox" LabelCssClass="MyLabel2" Enabled="False" />
                      </div>
                      <div style="width: 100%; padding: 5px;">
                        <telerik:RadTextBox ID="DisplayName" runat="server" Width="100%" Label="Display Name" CssClass="MyEnabledTextBox" LabelCssClass="MyLabel2">
                          <HoveredStyle CssClass="MyHoveredTextBox"></HoveredStyle>
                          <FocusedStyle CssClass="MyFocusedTextBox"></FocusedStyle>
                        </telerik:RadTextBox>
                      </div>
                      <div style="width: 100%; padding: 5px;">
                        <telerik:RadTextBox ID="NewPassword" TextMode="Password" runat="server" Width="100%" Label="New Password" CssClass="MyEnabledTextBox" LabelCssClass="MyLabel2">
                          <HoveredStyle CssClass="MyHoveredTextBox"></HoveredStyle>
                          <FocusedStyle CssClass="MyFocusedTextBox"></FocusedStyle>
                        </telerik:RadTextBox>
                      </div>
                      <div style="width: 100%; padding: 5px;">
                        <telerik:RadTextBox ID="ConfirmPassword" TextMode="Password" runat="server" Width="100%" Label="Confirm Password" CssClass="MyEnabledTextBox" LabelCssClass="MyLabel2">
                          <HoveredStyle CssClass="MyHoveredTextBox"></HoveredStyle>
                          <FocusedStyle CssClass="MyFocusedTextBox"></FocusedStyle>
                        </telerik:RadTextBox>
                      </div>
                      <div style="width: 100%; padding: 5px; margin-left: 170px;">
                        <telerik:RadButton ID="RadButton4" runat="server" Skin="Silk" RenderMode="Auto" Text="Save" OnClick="RadButton3_OnClick" CssClass="css3Simple" />
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
