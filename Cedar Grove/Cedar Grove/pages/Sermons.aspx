<%@ Page Title="" Language="C#" MasterPageFile="~/pages/PagesMasterPage.Master" AutoEventWireup="true" CodeBehind="Sermons.aspx.cs" Inherits="Cedar_Grove.pages.Sermons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
  <link href="/styles/default.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <telerik:RadPageLayout runat="server" ID="JumbotronLayout" GridType="Fluid">
    <Rows>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="1" HiddenMd="true" />
          <telerik:LayoutColumn Span="10" SpanMd="12" SpanSm="12" SpanXs="12">
            <telerik:RadListView runat="server" OnNeedDataSource="SermonPodcasts_NeedDataSource" ID="SermonPodcasts" AllowPaging="true" PageSize="12">
              <LayoutTemplate>
                <asp:Panel ID="itemPlaceholder" runat="server">
                </asp:Panel>
              </LayoutTemplate>
              <ItemTemplate>
                <div class="podcastListViewItem">
                  <div class="mediaPlayerFeed">
                    <p>
                      <strong>
                        <telerik:RadLabel ID="RadLabel1" runat="server" Text='<%# Bind("Title.Text") %>' />
                      </strong>
                      <br />
                      Published
                    <telerik:RadLabel ID="RadLabel4" runat="server" Text='<%# Eval("PublishDate", "{0:dd/M/yyyy}") %>' />
                      <br />
                      <em>
                        <telerik:RadLabel ID="RadLabel2" runat="server" Text='<%# Eval("Authors[0].Name") %>' />
                      </em>
                      <br />
                      <br />
                      <telerik:RadLabel ID="RadLabel3" runat="server" Text='<%# Bind("Content.Text") %>' />
                    </p>
                  </div>
                  <audio runat="server" id="MediaPlayer1" controls="controls" src='<%# Bind("BaseUri") %>' />
                </div>
              </ItemTemplate>
            </telerik:RadListView>
          </telerik:LayoutColumn>
          <telerik:LayoutColumn Span="1" HiddenMd="true" />
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>

</asp:Content>
