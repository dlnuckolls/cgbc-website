using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cedar_Grove.admin {
  public partial class AdminDefault : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.Admin;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      if (!SessionInfo.IsAuthenticated) Response.Redirect("~/admin/Login.aspx");
      if (!SessionInfo.IsAdmin) Response.Redirect("~/");
    }

    protected void AdminResourceLinks_Click(object sender, EventArgs e) { Response.Redirect("~/admin/AdminGallery.aspx"); }

    protected void EditPageAdmin_Click(object sender, EventArgs e) { Response.Redirect("~/admin/AdminPages.aspx"); }

    protected void QuoteAdmin_Click(object sender, EventArgs e) { }
  }
}