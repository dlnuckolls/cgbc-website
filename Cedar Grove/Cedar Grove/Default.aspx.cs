using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Cedar_Grove {
  public partial class Default : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.Home;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
    }

    protected void UpcomingEvents_NeedDataSource(object sender, Telerik.Web.UI.RadListViewNeedDataSourceEventArgs e) { ((RadListView)sender).DataSource = SqlHelpers.Select(SqlStatements.SQL_READ_EVENTS); }
    protected void EventsList_NeedDataSource(object sender, GridNeedDataSourceEventArgs e) { ((RadGrid)sender).DataSource = SqlHelpers.Select(SqlStatements.SQL_GET_MINISTRY_EVENTS.FormatWith((int)MinistryArea.General)); }

  }
}