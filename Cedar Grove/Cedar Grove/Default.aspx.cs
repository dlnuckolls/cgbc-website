using System;
using System.Web.UI;
using Telerik.Web.UI;

namespace Cedar_Grove {
  public partial class Default : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.Home;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
    }

    protected void MemberMessages_NeedDataSource(object sender, RadListViewNeedDataSourceEventArgs e) { ((RadListView)sender).DataSource = SqlHelpers.Select(SqlStatements.SQL_READ_MEMBER_MESSAGES); }

    protected void btnReadMore_Click(object sender, EventArgs e) {
      // Populate Event Details
      var eventItemDetails = new MessageItem(((RadButton)sender).CommandArgument);
      MessageTitle.Text = eventItemDetails.Title;
      MessageDescription.Text = eventItemDetails.Description;

      // Open popup window
      string script = "function f(){$find(\"" + modalPopup.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
      ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, true);

    }

    protected void MemberList_NeedDataSource(object sender, RadListViewNeedDataSourceEventArgs e) {
      ((RadListView)sender).DataSource = SqlHelpers.Select(SqlStatements.SQL_READ_CHURCH_MEMBERS);
    }
  }
}

