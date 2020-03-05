using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Cedar_Grove.admin {
  public partial class AdminEvents : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.PageAdmin;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      if (!SessionInfo.IsAuthenticated) Response.Redirect("/");
      if (!SessionInfo.IsAdmin) Response.Redirect("~/admin/default.aspx");
      PageAdminHeader.Text = SessionInfo.PageContent(PageContentBlocks.PageAdminHeader);
    }

    protected void EventsList_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {
      try {
        _ = SqlHelpers.Update(SqlStatements.SQL_DELETE_EVENT.FormatWith(((Guid)((GridDataItem)e.Item).GetDataKeyValue("Id")).ToString()));
        ((RadGrid)sender).Rebind();
        MessageDisplay.Text = "Event Deleted";
        MessageDisplay.CssClass = "successMessageDisplay";
      } catch (Exception ex) {
        MessageDisplay.Text = "Event Failed to Delete";
        MessageDisplay.CssClass = "errorMessageDisplay";
        SessionInfo.Settings.LogError("Admin: Delete Event", ex);
      }
    }

    protected void EventsList_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {
      try {
        var clientId = (Guid)((GridDataItem)e.Item).GetDataKeyValue("Id");
        var editableItem = ((GridEditableItem)e.Item);
        Hashtable values = new Hashtable();
        editableItem.ExtractValues(values);

        SessionInfo.CurrentEvent.LoadEventItem(clientId.ToString());
        SessionInfo.CurrentEvent.Title = values["Title"].ToString();
        SessionInfo.CurrentEvent.Description = values["Description"].ToString();
        SessionInfo.CurrentEvent.EventDate = values["EventDate"].ToString().GetAsDate();
        SessionInfo.CurrentEvent.EventEnd = values["EventEnd"].ToString().GetAsDate();
        SessionInfo.CurrentEvent.SaveEventItem();

        MessageDisplay.Text = "Event Updated";
        MessageDisplay.CssClass = "successMessageDisplay";
      } catch (Exception ex) {
        MessageDisplay.Text = "Event Failed to Update";
        MessageDisplay.CssClass = "errorMessageDisplay";
        SessionInfo.Settings.LogError("Admin: Update Event", ex);
      }
    }

    protected void EventsList_InsertCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {
      try {
        var clientId = (Guid)((GridDataItem)e.Item).GetDataKeyValue("Id");
        var editableItem = ((GridEditableItem)e.Item);
        Hashtable values = new Hashtable();
        editableItem.ExtractValues(values);

        SessionInfo.CurrentEvent.Title = values["Title"].ToString();
        SessionInfo.CurrentEvent.Description = values["Description"].ToString();
        SessionInfo.CurrentEvent.EventDate = values["EventDate"].ToString().GetAsDate();
        SessionInfo.CurrentEvent.EventEnd = values["EventEnd"].ToString().GetAsDate();
        SessionInfo.CurrentEvent.SaveEventItem();

        MessageDisplay.Text = "Event Added";
        MessageDisplay.CssClass = "successMessageDisplay";
      } catch (Exception ex) {
        MessageDisplay.Text = "Event Failed to Add";
        MessageDisplay.CssClass = "errorMessageDisplay";
        SessionInfo.Settings.LogError("Admin: Create Event", ex);
      }
    }
  }
}