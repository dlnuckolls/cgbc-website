<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Classroom.aspx.cs" Inherits="Cedar_Grove.admin.Classroom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:Literal ID="TrainingAdminHeader" runat="server" />
  <telerik:RadListView runat="server" OnNeedDataSource="TraingVideos_NeedDataSource" ID="TraingVideos" AllowPaging="true" PageSize="6" Skin="Silk">
    <LayoutTemplate>
      <div class="RadListView RadListViewFloated RadListView_<%# Container.Skin %>">
        <div class="rlvFloated rlvAutoScroll">
          <div id="itemPlaceholder" runat="server">
          </div>
        </div>
      </div>
    </LayoutTemplate>
    <ItemTemplate>
      <div class="trainingViewItem">
        <h4>
          <telerik:RadLabel ID="RadLabel1" runat="server" Text='<%# Bind("Title") %>' />
        </h4>
        <telerik:RadMediaPlayer ID="RadMediaPlayer1" runat="server" Height="360px" Width="600px" AutoPlay="false" Source='<%# Bind("VideoUrl") %>' />
      </div>
    </ItemTemplate>
  </telerik:RadListView>
</asp:Content>
