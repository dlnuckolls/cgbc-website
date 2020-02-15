<%@ Page Title="" Language="C#" MasterPageFile="~/pages/PagesMasterPage.Master" AutoEventWireup="true" CodeBehind="WomensMinistry.aspx.cs" Inherits="Cedar_Grove.pages.WomensMinistry" %>

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
            <telerik:RadImageGallery RenderMode="Auto" ID="RadImageGallery1" runat="server" OnNeedDataSource="RadImageGallery1_NeedDataSource"
              DataDescriptionField="Description" DataImageField="ImageUrl" DataTitleField="Title" Width="600px" Height="480px" LoopItems="true" DisplayAreaMode="Image"
              ShowLoadingPanel="true">
              <ThumbnailsAreaSettings ThumbnailWidth="120px" ThumbnailHeight="80px" Height="80px" Mode="ImageSliderPreview" ShowScrollButtons="False" />
              <ClientSettings>
                <AnimationSettings SlideshowSlideDuration="5000">
                  <NextImagesAnimation Type="DiagonalResize" Easing="EaseInExpo" Speed="1000" />
                  <PrevImagesAnimation Type="VerticalStripes" Easing="EaseOutBack" Speed="1000" />
                </AnimationSettings>
              </ClientSettings>
              <ImageAreaSettings Height="400px" NavigationMode="Zone" ShowNextPrevImageButtons="False" />
              <ToolbarSettings ShowItemsCounter="False"></ToolbarSettings>
              <PagerStyle ShowPagerText="False"></PagerStyle>
            </telerik:RadImageGallery>
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>
  <script>
    function pageLoad() {
      $find("<%= RadImageGallery1.ClientID %>").playSlideshow();
    }
  </script>
</asp:Content>
