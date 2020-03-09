using System;
using System.Collections.Generic;
using Telerik.Web.UI;

namespace Cedar_Grove {
  public partial class PagesMasterPage : BaseMasterPage {
    protected void Page_Load(object sender, EventArgs e) {
      RadMenuItem currentItem = mainnavigation.CurrentPageMenu.FindItemByUrl(Request.Url.PathAndQuery);
      if (currentItem != null) {
        //Select the current item and his parents
        currentItem.HighlightPath();
        //Populate the breadcrumb
        DataBindBreadCrumbSiteMap(currentItem);
      } else
        mainnavigation.CurrentPageMenu.Items[0].HighlightPath();

    }

    private void DataBindBreadCrumbSiteMap(RadMenuItem currentItem) {
      List<RadMenuItem> breadCrumbPath = new List<RadMenuItem>();
      while (currentItem != null) {
        if (!currentItem.NavigateUrl.IsNullOrEmpty())
          breadCrumbPath.Insert(0, currentItem);
        currentItem = currentItem.Owner as RadMenuItem;
      }
      breadCrumbPath.Insert(0, new RadMenuItem() { Text = "Home", NavigateUrl = "~/" });
      BreadCrumbSiteMap.DataSource = breadCrumbPath;
      BreadCrumbSiteMap.DataBind();
    }
  }
}