<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="imagegallery.ascx.cs" Inherits="Cedar_Grove.controls.imagegallery" %>

<telerik:RadPageLayout runat="server" ID="JumbotronLayout" GridType="Fluid">
  <Rows>
    <telerik:LayoutRow>
      <Columns>
        <telerik:LayoutColumn Span="12" SpanMd="12" SpanSm="12" HiddenXs="true">
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
        </telerik:LayoutColumn>
      </Columns>
    </telerik:LayoutRow>
    <telerik:LayoutRow>
      <Columns>
        <telerik:LayoutColumn Span="12" SpanMd="12" SpanSm="12" HiddenXs="true">
          <br />
          <br />
          <telerik:RadGrid Skin="WebBlue" RenderMode="Auto" runat="server" ID="EventsList" Width="100%" PagerStyle-AlwaysVisible="false"
            HorizontalAlign="Left" AutoGenerateColumns="False" CellPadding="0" BorderWidth="0px" BorderStyle="None" MasterTableView-CellPadding="0" MasterTableView-CellSpacing="0"
            MasterTableView-GridLines="None" OnNeedDataSource="EventsList_NeedDataSource" GroupingSettings-CaseSensitive="false" ShowHeader="true">
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id" GridLines="None"
              ClientDataKeyNames="Id" CommandItemDisplay="None" InsertItemPageIndexAction="ShowItemOnFirstPage" AllowNaturalSort="False" ShowHeadersWhenNoRecords="true">
              <CommandItemSettings ShowAddNewRecordButton="False" ShowRefreshButton="False"></CommandItemSettings>
              <Columns>
                <telerik:GridTemplateColumn ShowFilterIcon="False" AllowFiltering="False" HeaderText="Up Next" AllowSorting="true" UniqueName="ComingEvents">
                  <ItemTemplate>
                    <telerik:RadLabel ID="RadLabel1" runat="server" Text='<%# Bind("Subject") %>'></telerik:RadLabel>
                    <hr />
                    <telerik:RadLabel ID="RadLabel2" runat="server" Text='<%# Eval("Start", "{0:d}") %>' />
                    <telerik:RadLabel ID="RadLabel3" runat="server" Text='<%# Eval("Start", "{0:h:mm tt}") %>' />
                    -
                    <telerik:RadLabel ID="RadLabel4" runat="server" Text='<%# Eval("End", "{0:h:mm tt}") %>' />
                    <hr />
                    Description:
                    <asp:Literal ID="EventLiteral1" runat="server" Text='<%# Bind("Description") %>' />
                  </ItemTemplate>
                </telerik:GridTemplateColumn>
              </Columns>
            </MasterTableView>
          </telerik:RadGrid>

        </telerik:LayoutColumn>
      </Columns>
    </telerik:LayoutRow>
  </Rows>
</telerik:RadPageLayout>
