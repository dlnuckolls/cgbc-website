using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Cedar_Grove.admin {
  public partial class AdminGallery : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      // Set page name in the title section
      SessionInfo.CurrentPage = PageNames.PageAdmin;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
      if (!SessionInfo.IsAuthenticated) Response.Redirect("/");
      if (!SessionInfo.IsAdmin) Response.Redirect("~/admin/dashboard");
      PageAdminHeader.Text = SessionInfo.PageContent(PageContentBlocks.GalleryHeader);
      ((AdminMasterPage)this.Master).DataBindBreadCrumbSiteMap(new RadMenuItem() { Text = "Image Galleries Admin", NavigateUrl = "~/admin/photos" });
    }

    protected void gImageGallery_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e) {
      ((RadGrid)sender).DataSource = SqlHelpers.Select(SqlStatements.SQL_GET_PAGE_GALLERY_IMAGES);
    }

    protected void gImageGallery_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {
      try {
        Hashtable values = new Hashtable();
        var editableItem = ((GridEditableItem)e.Item);
        editableItem.ExtractValues(values);

        SessionInfo.CurrentGalleryImage.Title = values["Title"].ToString();
        SessionInfo.CurrentGalleryImage.Description = values["Description"].ToString();
        SessionInfo.CurrentGalleryImage.SetPageLocationById(values["PageLocation"].ToString());
        var fileUpload = (RadAsyncUpload)((GridEditableItem)e.Item).FindControl("AsyncUpload1");
        if (!fileUpload.IsNullOrEmpty() && fileUpload.UploadedFiles.Count == 1) {
          UploadedFile file = fileUpload.UploadedFiles[0];
          var imageName = (SessionInfo.CurrentGalleryImage.ImageUrl.IsNullOrEmpty()) ?
            "{0}{1}".FormatWith(Guid.NewGuid().ToString(), file.GetExtension()) :
            "{0}{1}".FormatWith(StripFileUrl(SessionInfo.CurrentGalleryImage.ImageUrl), file.GetExtension());
          SessionInfo.CurrentGalleryImage.ImageUrl = "/images/gallery/{0}".FormatWith(imageName);
          file.SaveAs("{0}/{1}".FormatWith(Server.MapPath("~/images/gallery"), imageName), true);
        }
        SessionInfo.CurrentGalleryImage.SaveGalleryImage();

        MessageDisplay.Text = "Gallery Image Updated";
        MessageDisplay.CssClass = "successMessageDisplay";
      } catch (Exception ex) {
        MessageDisplay.Text = "Gallery Image Failed to Update";
        MessageDisplay.CssClass = "errorMessageDisplay";
        SessionInfo.Settings.LogError("Admin: Update Gallery Image", ex);
      }
    }

    protected void gImageGallery_InsertCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {
      try {
        Hashtable values = new Hashtable();
        var editableItem = ((GridEditableItem)e.Item);
        editableItem.ExtractValues(values);
        var fileUpload = (RadAsyncUpload)((GridEditableItem)e.Item).FindControl("AsyncUpload1");
        if (!fileUpload.IsNullOrEmpty() && fileUpload.UploadedFiles.Count > 0) {
          foreach (UploadedFile file in fileUpload.UploadedFiles) {
            SessionInfo.CurrentGalleryImage.ClearGalleryImage();
            SessionInfo.CurrentGalleryImage.Title = values["Title"].ToString();
            SessionInfo.CurrentGalleryImage.Description = values["Description"].ToString();
            SessionInfo.CurrentGalleryImage.SetPageLocationById(values["PageLocation"].ToString());
            var imageName = "{0}{1}".FormatWith(Guid.NewGuid().ToString(), file.GetExtension());
            SessionInfo.CurrentGalleryImage.ImageUrl = "/images/gallery/{0}".FormatWith(imageName);
            file.SaveAs("{0}/{1}".FormatWith(Server.MapPath("~/images/gallery"), imageName), true);
            SessionInfo.CurrentGalleryImage.SaveGalleryImage();
          }
        }

        MessageDisplay.Text = "Gallery Image Added";
        MessageDisplay.CssClass = "successMessageDisplay";
      } catch (Exception ex) {
        MessageDisplay.Text = "Gallery Image Failed to Add";
        MessageDisplay.CssClass = "errorMessageDisplay";
        SessionInfo.Settings.LogError("Admin: Add Gallery Image", ex);
      }
    }

    protected void gImageGallery_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {
      try {
        _ = SqlHelpers.Update(SqlStatements.SQL_DELETE_PAGE_GALLERY_IMAGE.FormatWith(((Guid)((GridDataItem)e.Item).GetDataKeyValue("Id")).ToString()));
        ((RadGrid)sender).Rebind();
        MessageDisplay.Text = "Gallery Image Removed";
        MessageDisplay.CssClass = "successMessageDisplay";
      } catch (Exception ex) {
        MessageDisplay.Text = "Gallery Image Failed to Remove";
        MessageDisplay.CssClass = "errorMessageDisplay";
        SessionInfo.Settings.LogError("Admin: Delete Gallery Image", ex);
      }
    }

    private string StripFileUrl(string inStr) {
      var fileNameStr = inStr.Replace("/images/gallery/", "");
      return fileNameStr.Substring(0, fileNameStr.LastIndexOf("."));
    }

    //protected void AsyncUpload1_FileUploaded(object sender, FileUploadedEventArgs e) {
    //  var fileUpload = (RadAsyncUpload)sender;
    //  if (fileUpload.UploadedFiles.Count > 0) {
    //    UploadedFile file = fileUpload.UploadedFiles[0];
    //    var imageName = "{0}{1}".FormatWith(Guid.NewGuid().ToString(), file.GetExtension());
    //    SessionInfo.CurrentGalleryImage.ImageUrl = "/images/gallery/{0}".FormatWith(imageName);
    //    file.SaveAs("{0}/{1}".FormatWith(Server.MapPath("~/images/gallery"), imageName), true);
    //  }
    //}

    protected void gImageGallery_ItemDataBound(object sender, GridItemEventArgs e) {
      if (e.Item is GridEditableItem && e.Item.IsInEditMode) 
        if (e.Item is GridEditFormInsertItem || e.Item is GridDataInsertItem) {
          ((Image)((GridEditableItem)e.Item).FindControl("Image1")).Visible = false;
        } 
    }
  }
}