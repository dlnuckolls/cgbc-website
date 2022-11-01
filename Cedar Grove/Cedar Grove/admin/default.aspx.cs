using System;

namespace Cedar_Grove.admin {
  public partial class AdminDefault : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.Admin;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      AdminHomeTop.Text = SessionInfo.PageContent(PageContentBlocks.AdminHomeTop);
      AdminHomeToolHeader.Text = SessionInfo.PageContent(PageContentBlocks.AdminHomeToolHeader);
      if (!SessionInfo.IsAuthenticated) Response.Redirect("~/login");
      if (!SessionInfo.IsAdmin) Response.Redirect("~/");
      if (!SessionInfo.CurrentUser.IsSuperAdmin) {
        UserAdmin.Visible = false;
      }
    }

    protected void ImageAdmin_Click(object sender, EventArgs e) { Response.Redirect("~/admin/photos"); }

    protected void PageAdmin_Click(object sender, EventArgs e) { Response.Redirect("~/admin/pages"); }

    protected void EventAdmin_Click(object sender, EventArgs e) { Response.Redirect("~/admin/events"); }

    protected void CalendarAdmin_Click(object sender, EventArgs e) { Response.Redirect("~/admin/calendar"); }

    protected void UserAdmin_Click(object sender, EventArgs e) { Response.Redirect("~/admin/users"); }

    protected void SermonAdmin_Click(object sender, EventArgs e) { Response.Redirect("~/admin/sermons"); }

    protected void StaffAdmin_Click(object sender, EventArgs e) { Response.Redirect("~/admin/staff"); }

    protected void TrainingAdmin_Click(object sender, EventArgs e) { Response.Redirect("~/training"); }
  }
}