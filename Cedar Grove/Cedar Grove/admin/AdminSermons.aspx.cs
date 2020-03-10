using Cedar_Grove.objectclass;
using System;
using System.Configuration;
using System.Web.UI;
using Telerik.Web.UI;

namespace Cedar_Grove.admin {
  public partial class AdminSermons : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.Sermons;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      if (!SessionInfo.IsAuthenticated) Response.Redirect("~/");
      if (!SessionInfo.IsAdmin) Response.Redirect("~/admin/dashboard");
      SermonAdminHeader.Text = SessionInfo.PageContent(PageContentBlocks.SermonHeader);
      ((AdminMasterPage)this.Master).DataBindBreadCrumbSiteMap(new RadMenuItem() { Text = "Sermon Admin", NavigateUrl = "~/admin/sermons" });
    }

    protected void SermonFeedList_DeleteCommand(object sender, GridCommandEventArgs e) {
      var sermonId = (Guid)((GridEditableItem)e.Item).GetDataKeyValue("Id");
      _ = SqlHelpers.Update(SqlStatements.SQL_DELETE_SERMON.FormatWith(sermonId));
    }

    protected void SermonFeedList_UpdateCommand(object sender, GridCommandEventArgs e) {
      var sermonId = (Guid)((GridEditableItem)e.Item).GetDataKeyValue("Id");
      UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);
      var currentSermon = new SermonItem(sermonId.ToString());
      currentSermon.Title = ((RadTextBox)userControl.FindControl("SermonTitle")).Text;
      currentSermon.Description = ((RadTextBox)userControl.FindControl("SermonDescription")).Text;
      currentSermon.Published = ((RadDatePicker)userControl.FindControl("SermonPublished")).SelectedDate.Value;
      currentSermon.Author = ((RadTextBox)userControl.FindControl("SermonAuthor")).Text;
      currentSermon.SourceUrl = ((RadTextBox)userControl.FindControl("SermonSource")).Text;
      if (((RadAsyncUpload)userControl.FindControl("SermonFileUpload")).UploadedFiles.Count == 1) {
        UploadedFile file = ((RadAsyncUpload)userControl.FindControl("SermonFileUpload")).UploadedFiles[0];
        var imageName = "{0}{1}".FormatWith(Guid.NewGuid().ToString(), file.GetExtension());
        currentSermon.SourceUrl = "{0}/podcast/uploads/{1}".FormatWith(ConfigurationManager.AppSettings["PodcastRootUrl"], imageName);
        file.SaveAs("{0}/{1}".FormatWith(Server.MapPath("~/podcast/uploads"), imageName), true);
      }
      currentSermon.SaveSermonItem();
    }

    protected void SermonFeedList_InsertCommand(object sender, GridCommandEventArgs e) {
      UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);
      var currentSermon = new SermonItem();
      currentSermon.Title = ((RadTextBox)userControl.FindControl("SermonTitle")).Text;
      currentSermon.Description = ((RadTextBox)userControl.FindControl("SermonDescription")).Text;
      currentSermon.Published = ((RadDatePicker)userControl.FindControl("SermonPublished")).SelectedDate.Value;
      currentSermon.Author = ((RadTextBox)userControl.FindControl("SermonAuthor")).Text;
      currentSermon.SourceUrl = ((RadTextBox)userControl.FindControl("SermonSource")).Text;
      if (((RadAsyncUpload)userControl.FindControl("SermonFileUpload")).UploadedFiles.Count == 1) {
        UploadedFile file = ((RadAsyncUpload)userControl.FindControl("SermonFileUpload")).UploadedFiles[0];
        var imageName = "{0}{1}".FormatWith(Guid.NewGuid().ToString(), file.GetExtension());
        currentSermon.SourceUrl = "{0}/podcast/uploads/{1}".FormatWith(ConfigurationManager.AppSettings["PodcastRootUrl"], imageName);
        file.SaveAs("{0}/{1}".FormatWith(Server.MapPath("~/podcast/uploads"), imageName), true);
      }
      currentSermon.SaveSermonItem();
    }
  }
}