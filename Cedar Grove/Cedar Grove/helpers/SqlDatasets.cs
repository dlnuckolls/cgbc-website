using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Cedar_Grove {
  public static class SqlDatasets {
    //Admin
    //public static DataTable GetRegistrationList() => SqlHelpers.Select(SqlStatements.SQL_GET_REGISTRATION_LIST);
    //public static DataTable GetClientList() => SqlHelpers.Select(SqlStatements.SQL_GET_CLIENT_LIST);
    //public static DataTable GetAdminList() => SqlHelpers.Select(SqlStatements.SQL_GET_ADMIN_LIST);
    //Pages
    //public static DataTable GetAllSentimentalSayings() => SqlHelpers.Select(SqlStatements.SQL_SELECT_ALL_SAYINGS);
    public static DataTable GetAllPageLocations() => SqlHelpers.Select(SqlStatements.SQL_GET_PAGE_LOCATIONS);
    public static DataTable GetPageLocationsForImages() => SqlHelpers.Select(SqlStatements.SQL_GET_PAGE_LOCATION_FOR_IMAGES);
    //public static DataTable GetAllResourceLinks() => SqlHelpers.Select(SqlStatements.SQL_GET_RESOURCE_LINKS);
    //public static DataTable GetAdminResourceLinks() => SqlHelpers.Select(SqlStatements.SQL_GET_ALL_RESOURCE_LINKS);
  }
}