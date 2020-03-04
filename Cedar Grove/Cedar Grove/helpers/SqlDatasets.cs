using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Cedar_Grove {
  public static class SqlDatasets {
    //Pages
    public static DataTable GetAllPageLocations() => SqlHelpers.Select(SqlStatements.SQL_GET_PAGE_LOCATIONS);
    public static DataTable GetPageLocationsForImages() => SqlHelpers.Select(SqlStatements.SQL_GET_PAGE_LOCATION_FOR_IMAGES);
  }
}