using System;

namespace Cedar_Grove {
  public class GalleryImage {
    private static GalleryImage _instance;
    public string Id;
    public PageContentBlocks PageLocation;
    public string Title;
    public string Description;
    public string ImageUrl;
    public DateTime Created;
    public bool Active;
    public static GalleryImage StaticInstance => _instance.IsNullOrEmpty() ? _instance = new GalleryImage() : _instance;

    public GalleryImage() { }
    public GalleryImage(string id) {
      var dataRow = SqlHelpers.Select(SqlStatements.SQL_GET_PAGE_GALLERY_BY_ID.FormatWith(id)).Rows[0];
      Id = dataRow["Id"].ToString();
      SetPageLocationById(dataRow["PageLocation"].ToString());
      Title = dataRow["Title"].ToString();
      Description = dataRow["Description"].ToString();
      ImageUrl = dataRow["ImageUrl"].ToString();
      Created = dataRow["Created"].ToString().GetAsDate();
      Active = dataRow["Active"].ToString().GetAsBool();
    }

    public void ClearGalleryImage() => _instance = new GalleryImage();

    public void LoadGalleryImage(string id) { _instance = new GalleryImage(id); }

    public void SaveGalleryImage() {
      if (Id.IsNullOrEmpty()) {
        _ = SqlHelpers.Insert(SqlStatements.SQL_INSERT_PAGE_GALLERY_IMAGE.FormatWith(PageLocation.TextValue(), ImageUrl.FixSqlString(),
          Description.FixSqlString(), Title.FixSqlString()));
      } else {
        _ = SqlHelpers.Update(SqlStatements.SQL_UPDATE_PAGE_GALLERY_IMAGE.FormatWith(PageLocation.TextValue(), ImageUrl.FixSqlString(),
          Description.FixSqlString(), Title.FixSqlString(), Id));
      }
    }

    public void SetPageLocationById(string id) {
      try {
        foreach (var pl in Enum.GetValues(typeof(PageContentBlocks))) {
          if (id.ToUpper() == ((PageContentBlocks)pl).TextValue().ToUpper())
            PageLocation = (PageContentBlocks)pl;
        }
      } catch { }
    }
  }
}