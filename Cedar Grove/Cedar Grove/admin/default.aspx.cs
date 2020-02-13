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
    }

    protected void AdminResourceLinks_Click(object sender, EventArgs e) {

    }

    protected void EditPageAdmin_Click(object sender, EventArgs e) {

    }

    protected void QuoteAdmin_Click(object sender, EventArgs e) {

    }
  }
}