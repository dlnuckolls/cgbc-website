<%@ Page Title="" Language="C#" MasterPageFile="~/pages/PagesMasterPage.Master" AutoEventWireup="true" CodeBehind="YouthMinistry.aspx.cs" Inherits="Cedar_Grove.pages.YouthMinistry" %>
<%@ Register Src="~/controls/imagegallery.ascx" TagPrefix="uc1" TagName="ImageGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <telerik:RadPageLayout runat="server" ID="JumbotronLayout" CssClass="jumbotron" GridType="Fluid">
    <Rows>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="6" SpanMd="7" SpanSm="12" SpanXs="12">
            <asp:Literal ID="PageContentBlock" runat="server" />
          </telerik:LayoutColumn>
          <telerik:LayoutColumn Span="6" SpanMd="5" SpanSm="12" SpanXs="12">
            <uc1:ImageGallery runat="server" ID="ImageGallery1" />
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>
</asp:Content>
