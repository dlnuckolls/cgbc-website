<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="imagegallery.ascx.cs" Inherits="Cedar_Grove.controls.imagegallery" %>

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
  <script>
    function pageLoad() {
      $find("<%= RadImageGallery1.ClientID %>").playSlideshow();
    }
  </script>

