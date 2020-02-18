using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cedar_Grove.admin {
  public partial class AdminCalendar : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      // Set page name in the title section
      SessionInfo.CurrentPage = PageNames.Calendar;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      if (!SessionInfo.IsAuthenticated) Response.Redirect("/");
      if (!SessionInfo.IsAdmin) Response.Redirect("~/admin/default.aspx");
      PageContentBlock.Text = SessionInfo.PageContent(PageContentBlocks.CalendarPage);
      ChurchCalendar.SelectedDate = DateTime.Now;
    }

    protected void ChurchCalendar_AppointmentDataBound(object sender, Telerik.Web.UI.SchedulerEventArgs e) {

    }

    //protected void ChurchCalendar_AppointmentUpdate(object sender, Telerik.Web.UI.AppointmentUpdateEventArgs e) {

    //}

    //protected void ChurchCalendar_AppointmentInsert(object sender, Telerik.Web.UI.AppointmentInsertEventArgs e) {
    //  _ = SqlHelpers.Insert(SqlStatements.SQL_CREATE_APPOINTMENT.FormatWith(e.Appointment.Subject.FixSqlString(), e.Appointment.Description.FixSqlString(),
    //    e.Appointment.Start.ConvertSqlDateTime(), e.Appointment.End.ConvertSqlDateTime(), "0", e.Appointment.RecurrenceRule.FixSqlString(), e.Appointment.RecurrenceParentID.ToString()));
    //}

    //protected void ChurchCalendar_AppointmentDelete(object sender, Telerik.Web.UI.AppointmentDeleteEventArgs e) {

    //}
  }
}