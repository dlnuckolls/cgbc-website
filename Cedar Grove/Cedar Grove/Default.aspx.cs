using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Cedar_Grove {
  public partial class Default : BasePage {
    protected void Page_Load(object sender, EventArgs e) {
      SessionInfo.CurrentPage = PageNames.Home;
      TitleTag.Text = SessionInfo.DisplayCurrentPage;
    }

    protected void UpcomingEvents_NeedDataSource(object sender, Telerik.Web.UI.RadListViewNeedDataSourceEventArgs e) { ((RadListView)sender).DataSource = SqlHelpers.Select(SqlStatements.SQL_READ_EVENTS); }
    protected void EventsList_NeedDataSource(object sender, GridNeedDataSourceEventArgs e) { ((RadGrid)sender).DataSource = SqlHelpers.Select(SqlStatements.SQL_GET_ALL_MINISTRY_EVENTS); }

    protected void EventsList_ItemDataBound(object sender, GridItemEventArgs e) {
      if (e.Item is GridDataItem) {
        if (e.Item.ItemType.Equals(GridItemType.Item) || e.Item.ItemType.Equals(GridItemType.AlternatingItem)) {
          GridDataItem item = (GridDataItem)e.Item;
          switch (((DataRowView)e.Item.DataItem)["MinistryId"].ToString().GetInt32()) {
            case 1:
              item.Style.Add(HtmlTextWriterStyle.BackgroundColor, "lightblue !important");
              item.Style.Add(HtmlTextWriterStyle.Color, " blue !important");
              item.Style.Add("border-radius", "5px");
              break;
            case 2:
              item.Style.Add(HtmlTextWriterStyle.BackgroundColor, "lightcoral !important");
              item.Style.Add(HtmlTextWriterStyle.Color, "brown !important");
              item.Style.Add("border-radius", "5px");
              break;
            case 3:
              item.Style.Add(HtmlTextWriterStyle.BackgroundColor, "burlywood !important");
              item.Style.Add(HtmlTextWriterStyle.Color, "darkgreen !important");
              item.Style.Add("border-radius", "5px");
              break;
            case 4:
              item.Style.Add(HtmlTextWriterStyle.BackgroundColor, "khaki !important");
              item.Style.Add(HtmlTextWriterStyle.Color, "darkslateblue !important");
              item.Style.Add("border-radius", "5px");
              break;
            case 5:
              item.Style.Add(HtmlTextWriterStyle.BackgroundColor, "lightcyan !important");
              item.Style.Add(HtmlTextWriterStyle.Color, "orangered !important");
              item.Style.Add("border-radius", "5px");
              break;
            case 6:
              item.Style.Add(HtmlTextWriterStyle.BackgroundColor, "lightslategray !important");
              item.Style.Add(HtmlTextWriterStyle.Color, "black !important");
              item.Style.Add("border-radius", "5px");
              break;
            default:
              break;
          }
        }
      }

    }

        protected void btnReadMore_Click(object sender, EventArgs e) {

        }
    }
}

