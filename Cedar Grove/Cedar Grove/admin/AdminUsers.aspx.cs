using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Cedar_Grove.admin {
  public partial class AdminUsers : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.PageAdmin;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      if (!SessionInfo.IsAuthenticated) Response.Redirect("/");
      if (!SessionInfo.IsAdmin) Response.Redirect("~/admin/default.aspx");
      PageAdminHeader.Text = SessionInfo.PageContent(PageContentBlocks.PageAdminHeader);
    }

    protected void UserAccountsList_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {
      try {
        var clientId = (Guid)((GridDataItem)e.Item).GetDataKeyValue("Id");
        var editableItem = ((GridEditableItem)e.Item);
        Hashtable values = new Hashtable();
        editableItem.ExtractValues(values);
        var usrRec = new SystemUser();
        usrRec.LoadUserDetails(clientId.ToString());
        usrRec.DisplayName = values["DisplayName"].ToString();
        usrRec.UserName = values["UserName"].ToString();
        usrRec.Notes = (!values["Notes"].IsNullOrEmpty()) ? values["Notes"].ToString() : string.Empty;
        usrRec.SaveUserDetails();
        MessageDisplay.Text = "Account Updated";
        MessageDisplay.CssClass = "successMessageDisplay";
      } catch (Exception ex) {
        MessageDisplay.Text = "Account Failed to Update";
        MessageDisplay.CssClass = "errorMessageDisplay";
        SessionInfo.Settings.LogError("Admin: Update User", ex);
      }
    }

    protected void UserAccountsList_InsertCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {
      try {
        var editableItem = ((GridEditableItem)e.Item);
        Hashtable values = new Hashtable();
        editableItem.ExtractValues(values);
        var usrRec = new SystemUser();
        usrRec.DisplayName = values["DisplayName"].ToString();
        usrRec.UserName = values["UserName"].ToString();
        usrRec.Notes = (!values["Notes"].IsNullOrEmpty()) ? values["Notes"].ToString() : string.Empty;
        usrRec.SaveUserDetails();
        usrRec.ResetUserPassword(usrRec.Id);
        var tempPassword = usrRec.ResetUserPassword(usrRec.Id);
        SessionInfo.SendResetEmail(usrRec, tempPassword);
        MessageDisplay.Text = "User Account Created";
        MessageDisplay.CssClass = "successMessageDisplay";
      } catch (Exception ex) {
        MessageDisplay.Text = "User Account Not Created";
        MessageDisplay.CssClass = "errorMessageDisplay";
        SessionInfo.Settings.LogError("Admin: Create User", ex);
      }
    }

    protected void UserAccountsList_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {
      if (e.CommandName == "ResetPassword") {
        try {
          var clientId = (Guid)((GridDataItem)e.Item).GetDataKeyValue("Id");
          var usrRec = new SystemUser();
          usrRec.LoadUserDetails(clientId.ToString());
          var tempPassword = usrRec.ResetUserPassword(clientId.ToString());
          SessionInfo.SendResetEmail(usrRec, tempPassword);
          MessageDisplay.Text = "Account Password Reset Sent";
          MessageDisplay.CssClass = "successMessageDisplay";
        } catch (Exception ex) {
          MessageDisplay.Text = "Account Password Reset Failed";
          MessageDisplay.CssClass = "errorMessageDisplay";
          SessionInfo.Settings.LogError("Admin: Reset Account Password", ex);
        }
      }
    }

    protected void UserAccountsList_DeleteCommand(object sender, GridCommandEventArgs e) {
      var clientId = (Guid)((GridDataItem)e.Item).GetDataKeyValue("Id");
      _ = SqlHelpers.Update(SqlStatements.SQL_DELETE_USER.FormatWith(clientId));
    }
  }
}