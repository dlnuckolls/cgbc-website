using Cedar_Grove.objectclass;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Cedar_Grove.admin {
  public partial class AdminStaff : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.PageAdmin;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      if (!SessionInfo.IsAuthenticated) Response.Redirect("/");
      if (!SessionInfo.IsAdmin) Response.Redirect("~/admin/default.aspx");
      PageAdminHeader.Text = SessionInfo.PageContent(PageContentBlocks.PageAdminHeader);
    }

    protected void StaffList_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {
      try {
        _ = SqlHelpers.Update(SqlStatements.SQL_DELETE_STAFF_MEMBERS.FormatWith(((Guid)((GridDataItem)e.Item).GetDataKeyValue("Id")).ToString()));
        ((RadGrid)sender).Rebind();
        MessageDisplay.Text = "Staff Deleted";
        MessageDisplay.CssClass = "successMessageDisplay";
      } catch (Exception ex) {
        MessageDisplay.Text = "Staff Failed to Delete";
        MessageDisplay.CssClass = "errorMessageDisplay";
        SessionInfo.Settings.LogError("Admin: Delete Staff", ex);
      }
    }

    protected void StaffList_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {
      try {
        var staffId = (Guid)((GridDataItem)e.Item).GetDataKeyValue("Id");
        var editableItem = ((GridEditableItem)e.Item);
        Hashtable values = new Hashtable();
        editableItem.ExtractValues(values);

        var staff = new StaffMember(staffId.ToString());
        staff.Name = values["Name"].ToString();
        staff.Title = values["Title"].ToString();
        staff.Bio = values["Bio"].ToString();
        staff.EmailAddress = values["EmailAddress"].ToString();
        staff.DisplayOrder = values["DisplayOrder"].ToString().GetInt32();

        staff.SaveStaffMember();

        MessageDisplay.Text = "Staff Updated";
        MessageDisplay.CssClass = "successMessageDisplay";
      } catch (Exception ex) {
        MessageDisplay.Text = "Staff Failed to Update";
        MessageDisplay.CssClass = "errorMessageDisplay";
        SessionInfo.Settings.LogError("Admin: Update Staff", ex);
      }
    }

    protected void StaffList_InsertCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {
      try {
        var editableItem = ((GridEditableItem)e.Item);
        Hashtable values = new Hashtable();
        editableItem.ExtractValues(values);

        var staff = new StaffMember();
        staff.Name = values["Name"].ToString();
        staff.Title = values["Title"].ToString();
        staff.Bio = values["Bio"].ToString();
        staff.EmailAddress = values["EmailAddress"].ToString();
        staff.DisplayOrder = values["DisplayOrder"].ToString().GetInt32();

        staff.SaveStaffMember();

        MessageDisplay.Text = "Staff Added";
        MessageDisplay.CssClass = "successMessageDisplay";
      } catch (Exception ex) {
        MessageDisplay.Text = "Staff Failed to Add";
        MessageDisplay.CssClass = "errorMessageDisplay";
        SessionInfo.Settings.LogError("Admin: Create Staff", ex);
      }
    }
  }
}