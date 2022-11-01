using System;
using Telerik.Web.UI;

namespace Cedar_Grove.controls {
  public partial class imagegallery : BaseControl {
    public PageContentBlocks CurrentPage;
    public MinistryArea CurrentMinistry;

    protected void Page_Load(object sender, EventArgs e) {

    }

    protected void RadImageGallery1_NeedDataSource(object sender, Telerik.Web.UI.ImageGalleryNeedDataSourceEventArgs e) {
      ((RadImageGallery)sender).DataSource = SqlHelpers.Select(SqlStatements.SQL_GET_PAGE_GALLERY_BY_LOCATION.FormatWith(CurrentPage.TextValue()));
    }

    protected void EventsList_NeedDataSource(object sender, GridNeedDataSourceEventArgs e) { ((RadGrid)sender).DataSource = SqlHelpers.Select(SqlStatements.SQL_GET_MINISTRY_EVENTS.FormatWith((int)CurrentMinistry)); }
  }
}