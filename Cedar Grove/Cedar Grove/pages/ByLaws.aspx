<%@ Page Title="" Language="C#" MasterPageFile="~/pages/PagesMasterPage.Master" AutoEventWireup="true" CodeBehind="ByLaws.aspx.cs" Inherits="Cedar_Grove.pages.ByLaws" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <telerik:RadPageLayout runat="server" ID="JumbotronLayout" GridType="Fluid">
    <Rows>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="1" HiddenMd="true">
          </telerik:LayoutColumn>
          <telerik:LayoutColumn Span="10" SpanMd="12" SpanSm="12" SpanXs="12">
            <asp:Literal ID="PageContentBlock" runat="server" />
          </telerik:LayoutColumn>
          <telerik:LayoutColumn Span="1" HiddenMd="true">
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="1" HiddenMd="true">
          </telerik:LayoutColumn>
          <telerik:LayoutColumn Span="10" SpanMd="12" SpanSm="12" SpanXs="12">
            <div class="pageContentBlocks2">
              <asp:Literal ID="PageContentStatement" runat="server" />
            </div>
          </telerik:LayoutColumn>
          <telerik:LayoutColumn Span="1" HiddenMd="true">
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>
</asp:Content>
