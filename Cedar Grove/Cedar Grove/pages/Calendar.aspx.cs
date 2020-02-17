using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cedar_Grove.pages {
  public partial class Calendar : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.Calendar;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      PageContentBlock.Text = SessionInfo.PageContent(PageContentBlocks.CalendarPage);
      ChurchCalendar.SelectedDate = DateTime.Now;
    }

    protected void ChurchCalendar_AppointmentDataBound(object sender, Telerik.Web.UI.SchedulerEventArgs e) {

    }
  }
}