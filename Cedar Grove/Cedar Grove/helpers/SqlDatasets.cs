using System.Data;

namespace Cedar_Grove {
  public static class SqlDatasets {
    //Pages
    public static DataTable GetAllPageLocations(bool isSuperAdmin) {
      if (isSuperAdmin)
        return SqlHelpers.Select(SqlStatements.SQL_GET_ALL_PAGE_LOCATIONS);
      else
        return SqlHelpers.Select(SqlStatements.SQL_GET_PAGE_LOCATIONS);
    }
    public static DataTable GetPageLocationsForImages() => SqlHelpers.Select(SqlStatements.SQL_GET_PAGE_LOCATION_FOR_IMAGES);
  }
}