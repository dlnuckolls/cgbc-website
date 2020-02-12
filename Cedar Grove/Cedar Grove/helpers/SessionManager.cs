using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cedar_Grove {
  public class SessionManager {
    #region Page Management
    public PageNames CurrentPage { get; set; }
    public string DisplayCurrentPage => "<title>{0}</title>".FormatWith(CurrentPage.TextValue());

    #endregion

    public string UserId;
    public bool IsAuthenticated;
    public bool IsAdmin;

  }
}