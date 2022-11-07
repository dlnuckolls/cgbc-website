using Cedar_Grove.objectclass;
using System;
using System.Linq;
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
      ((RadListView)sender).DataSource = SqlHelpers.GetMembers();
    }

    protected void RadImageButton1_Click(object sender, EventArgs e) {
      var id = ((RadButton)sender).CommandArgument;
      if(id != "0") {
        var member = SqlHelpers.GetMembers().FirstOrDefault(m => m.Id == id);
        FirstName.Text = member.FirstName;
        LastName.Text = member.LastName;
        Address.Text = member.PrimaryAddress.Address1;
        City.Text = member.PrimaryAddress.City;
        PostalCode.Text = member.PrimaryAddress.PostalCode;
      } else {
        var member = new ChurchMember();
        FirstName.Text = member.FirstName;
        LastName.Text = member.LastName;
        Address.Text = member.PrimaryAddress.Address1;
        City.Text = member.PrimaryAddress.City;
        PostalCode.Text = member.PrimaryAddress.PostalCode;
      }
      string script = "function f(){$find(\"" + modalPopup2.ClientID + "\").show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
      ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, true);
    }

    protected void RadButton1_Click(object sender, EventArgs e) {

    }
  }
}

