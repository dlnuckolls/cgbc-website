<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Cedar_Grove.admin.AdminDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:Literal ID="AdminHomeTop" runat="server" />
  <telerik:RadPageLayout runat="server" ID="RadPageLayout1">
    <Rows>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="1" HiddenMd="true" />
          <telerik:LayoutColumn Span="10" SpanMd="12">
            <div style="text-align: center; width: 100%;">
              <asp:Literal ID="AdminHomeToolHeader" runat="server" />
            </div>
            <div class="adminTiles">
              <telerik:RadIconTile ID="PageAdmin" runat="server" ImageUrl="~/images/menutiles/pages.png" AutoPostBack="true" OnClick="PageAdmin_Click">
                <Title Text="Page Contents"></Title>
              </telerik:RadIconTile>
              <telerik:RadIconTile ID="EventAdmin" runat="server" ImageUrl="~/images/menutiles/quotes.png" AutoPostBack="true" OnClick="EventAdmin_Click">
                <Title Text="Events"></Title>
              </telerik:RadIconTile>
              <telerik:RadIconTile ID="CalendarAdmin" runat="server" ImageUrl="~/images/menutiles/calendar.png" AutoPostBack="true" OnClick="CalendarAdmin_Click">
                <Title Text="Calendar"></Title>
              </telerik:RadIconTile>
              <telerik:RadIconTile ID="ImageAdmin" runat="server" ImageUrl="~/images/menutiles/internet.png" AutoPostBack="true" OnClick="ImageAdmin_Click">
                <Title Text="Gallery Images"></Title>
              </telerik:RadIconTile>
              <telerik:RadIconTile ID="UserAdmin" runat="server" ImageUrl="~/images/menutiles/users.png" AutoPostBack="true" OnClick="UserAdmin_Click">
                <Title Text="Users"></Title>
              </telerik:RadIconTile>
              <telerik:RadIconTile ID="SermonAdmin" runat="server" ImageUrl="~/images/menutiles/audio.png" AutoPostBack="true" OnClick="SermonAdmin_Click">
                <Title Text="Sermons"></Title>
              </telerik:RadIconTile>
              <telerik:RadIconTile ID="StaffAdmin" runat="server" ImageUrl="~/images/menutiles/name_tag.png" AutoPostBack="true" OnClick="StaffAdmin_Click">
                <Title Text="Staff"></Title>
              </telerik:RadIconTile>
              <telerik:RadIconTile ID="TrainingAdmin" runat="server" ImageUrl="~/images/menutiles/classroom.png" AutoPostBack="true" OnClick="TrainingAdmin_Click">
                <Title Text="Staff"></Title>
              </telerik:RadIconTile>
            </div>
          </telerik:LayoutColumn>
          <telerik:LayoutColumn Span="1" HiddenMd="true" />
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>
</asp:Content>
