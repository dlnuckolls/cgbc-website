using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Cedar_Grove.admin {
  public partial class AdminCalendar : BasePage {
    private static List<RadButton> SelectionButtons;

    protected void Page_Load(object sender, EventArgs e) {
      // Set page name in the title section
      SessionInfo.CurrentPage = PageNames.Calendar;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      if (!SessionInfo.IsAuthenticated) Response.Redirect("/");
      if (!SessionInfo.IsAdmin) Response.Redirect("~/admin/dashboard");
      PageContentBlock.Text = SessionInfo.PageContent(PageContentBlocks.CalendarPage);
      ChurchCalendar.SelectedDate = DateTime.Now;
      SelectionButtons = SelectionButtons ?? new List<RadButton>();
      LoadMinistryButtons();
      ((AdminMasterPage)this.Master).DataBindBreadCrumbSiteMap(new RadMenuItem() { Text = "Calendar Admin", NavigateUrl = "~/admin/calendar" });
    }

    private void LoadMinistryButtons() {
      ToggleButtons.Controls.Clear();
      SessionInfo.MinistryColours.ForEach(mc => {
        var button = new RadButton {
          ButtonType = RadButtonType.LinkButton,
          ID = mc.MinistryName,
          RenderMode = RenderMode.Lightweight,
          ToggleType = ButtonToggleType.CheckBox,
          Checked = true
        };
        button.Click += new EventHandler(btnToggle_Click);
        //button.CssClass = mc.CssClass;
        button.Style.Add("color", "{0};".FormatWith(mc.FontColour));
        button.Style.Add("border", "solid 1px {0};".FormatWith(mc.DisplayColour));
        button.Style.Add("background", "{0} !important;".FormatWith(mc.DisplayColour));
        button.Style.Add("padding", "2px 5px");
        button.Style.Add("margin-bottom", "5px");
        button.Style.Add("margin-right", "5px");
        button.ToggleStates.Add(new RadButtonToggleState() { Text = mc.MinistryName, Selected = true, PrimaryIconCssClass = "rbToggleCheckboxChecked p-i-checkbox-checked" });
        button.ToggleStates.Add(new RadButtonToggleState() { Text = mc.MinistryName, PrimaryIconCssClass = "rbToggleCheckbox p-i-checkbox" });
        ToggleButtons.Controls.Add(button);
        SelectionButtons.Add(button);
      });
    }

    private static void FilterAppointment(Appointment appointment, ICheckBoxControl checkBox, int resourceId) {
      if (appointment.Resources.GetResource("Ministry", resourceId) != null && checkBox.Checked) {
        appointment.Visible = true;
      }
    }

    protected void btnToggle_Click(object sender, EventArgs e) { ChurchCalendar.Rebind(); }

    protected void ChurchCalendar_AppointmentDataBound(object sender, Telerik.Web.UI.SchedulerEventArgs e) {
      e.Appointment.Visible = false;
      var ctr = 1;
      foreach (RadButton b in ToggleButtons.Controls) {
        FilterAppointment(e.Appointment, b, ctr);
        ctr++;
      }
    }
  }
}