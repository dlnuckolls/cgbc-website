﻿using System;
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
      //if (!SessionInfo.IsAuthenticated) Response.Redirect("/");
      //if (!SessionInfo.IsAdmin) Response.Redirect("~/admin/default.aspx");
      PageAdminHeader.Text = SessionInfo.PageContent(PageContentBlocks.PageAdminHeader);
    }

    protected void gImageGallery_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e) {
      ((RadGrid)sender).DataSource = SqlHelpers.Select(SqlStatements.SQL_GET_PAGE_GALLERY_IMAGES);
    }

    protected void gImageGallery_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {    }

    protected void gImageGallery_InsertCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {    }

    protected void gImageGallery_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) {    }

    protected void AsyncUpload1_FileUploaded(object sender, FileUploadedEventArgs e) {
      var fileUpload = (RadAsyncUpload)sender;
      if (fileUpload.UploadedFiles.Count > 0) {
        UploadedFile file = fileUpload.UploadedFiles[0];
        //SessionInfo.CurrentResourceLink.ThumbNail = "/images/thumbnails/{0}".FormatWith(file.GetName());
        file.SaveAs("{0}/{1}".FormatWith(Server.MapPath("~/images/gallery"), file.GetName()), true);
      }
    }

    protected void gImageGallery_ItemDataBound(object sender, GridItemEventArgs e) {
      if (e.Item.IsInEditMode) {

      } else {
        GridDataItem item = e.Item as GridDataItem;
        if (item != null) {
          ((RadLabel)item.FindControl("RadLabel3")).Text = "";
          //int categoryID = (int)item.GetDataKeyValue("CategoryID");

        }
      }
    }
  }
}