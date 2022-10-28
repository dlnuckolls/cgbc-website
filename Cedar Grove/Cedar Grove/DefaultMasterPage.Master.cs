using System;
using System.Collections.Generic;
using Telerik.Web.UI;

namespace Cedar_Grove {
  public partial class DefaultMasterPage : BaseMasterPage {
    protected void Page_Load(object sender, EventArgs e) {
      RadMenuItem currentItem = mainnavigation.CurrentPageMenu.FindItemByUrl(Request.Url.PathAndQuery);
      if(currentItem != null) {
        //Select the current item and his parents
        currentItem.HighlightPath();
        //Populate the breadcrumb
        DataBindBreadCrumbSiteMap(currentItem);
      } else
        mainnavigation.CurrentPageMenu.Items[0].HighlightPath();
    }
    public void DataBindBreadCrumbSiteMap(RadMenuItem currentItem) {
      List<RadMenuItem> breadCrumbPath = new List<RadMenuItem>();
      while(currentItem != null) {
        if(!currentItem.NavigateUrl.IsNullOrEmpty())
          breadCrumbPath.Insert(0, currentItem);
        currentItem = currentItem.Owner as RadMenuItem;
      }
      breadCrumbPath.Insert(0, new RadMenuItem() { Text = "Dashboard", NavigateUrl = "~/dashboard" });
      BreadCrumbSiteMap.DataSource = breadCrumbPath;
      BreadCrumbSiteMap.DataBind();
    }
  }
}