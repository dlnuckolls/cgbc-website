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
      } else
        mainnavigation.CurrentPageMenu.Items[0].HighlightPath();
    }
  }
}