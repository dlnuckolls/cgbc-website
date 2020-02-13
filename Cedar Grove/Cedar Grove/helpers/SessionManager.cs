using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cedar_Grove {
  public class SessionManager {
    #region Sitewide Details
    public SystemSettings Settings => SystemSettings.StaticInstance; 
    #endregion

    #region Page Management
    public PageNames CurrentPage { get; set; }
    public string DisplayCurrentPage => "<title>{0}</title>".FormatWith(CurrentPage.TextValue());
    public string PageContent(PageContentBlocks pageLocation) => SqlHelpers.SelectScalar(SqlStatements.SQL_GET_PAGE_CONTENT_FOR_DISPLAY.FormatWith(pageLocation.TextValue())).ToString();

    #endregion

    #region Current User Details
    public SystemUser CurrentUser => SystemUser.StaticInstance;
    public bool IsAuthenticated => CurrentUser.IsAuthenticated;
    public bool IsAdmin => CurrentUser.IsAdmin; 
    #endregion

  }
}