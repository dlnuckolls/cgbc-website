using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Cedar_Grove.admin {
  public partial class AdminPages : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      // Set page name in the title section
      SessionInfo.CurrentPage = PageNames.PageAdmin;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      //if(!SessionInfo.IsAuthenticated) Response.Redirect("/");
      //if(!SessionInfo.IsAdmin) Response.Redirect("~/admin/default.aspx");
      PageAdminHeader.Text = SessionInfo.PageContent(PageContentBlocks.PageAdminHeader);
    }

    protected void SavePage_Click(object sender, EventArgs e) {
      try {
        var pageTable = (SqlDatasets.GetAllPageLocations()).Select("Description = '{0}'".FormatWith(PageLocations.Text));
        SqlHelpers.Update(SqlStatements.SQL_SAVE_PAGE_CONTENTS.FormatWith(PageDescription.Content.FixSqlString(), pageTable[0][0]));
        MessageDisplay.Text = "Page Area was Updated";
        MessageDisplay.CssClass = "successMessageDisplay";
        PageLocations.Entries.Clear();
        PageDescription.Content = string.Empty;
      } catch (Exception ex) {
        MessageDisplay.Text = "Page Area failed to update";
        MessageDisplay.CssClass = "errorMessageDisplay";
        SessionInfo.Settings.LogError("Admin: Update Page Area", ex);
      }
    }

    protected void PageLocations_TextChanged(object sender, AutoCompleteTextEventArgs e) {
      var searchCriteria = e.Text;
      var pageTable = (SqlDatasets.GetAllPageLocations()).Select("Description = '{0}'".FormatWith(searchCriteria));
      if (pageTable.Length != 0)
        PageDescription.Content = SqlHelpers.SelectScalar(SqlStatements.SQL_GET_PAGE_CONTENTS.FormatWith(pageTable[0][0])).ToString();
      else
        PageDescription.Content = string.Empty;
    }
  }
}