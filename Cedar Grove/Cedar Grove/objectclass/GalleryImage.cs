using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
      foreach (var pl in Enum.GetValues(typeof(PageContentBlocks))) {
        if (dataRow["PageLocation"].ToString().ToUpper() == ((PageContentBlocks)pl).TextValue()) 
          PageLocation = (PageContentBlocks)pl;
      }
      Title = dataRow["Title"].ToString();
      Description = dataRow["Description"].ToString();
      ImageUrl = dataRow["ImageUrl"].ToString();
      Created = dataRow["Created"].ToString().GetAsDate();
      Active = dataRow["Active"].ToString().GetAsBool();
    }

    public void LoadGalleryImage(string id) { _instance = new GalleryImage(id); }

    public void SaveResourceLink() {
      if (Id.IsNullOrEmpty()) {
        //SqlHelpers.Insert(SqlStatements.SQL_CREATE_RESOURCE_LINK.FormatWith(
        //  Title.FixSqlString(), URL.FixSqlString(), (Active) ? "1" : "0", ThumbNail.FixSqlNull(), Description.FixSqlString()));
      } else {
        //SqlHelpers.Update(SqlStatements.SQL_UPDATE_RESOURCE_LINK_BY_ID.FormatWith(
        //  Title.FixSqlString(), URL.FixSqlString(), (Active) ? "1" : "0", ThumbNail.FixSqlNull(), Description.FixSqlString(), Id));
      }
    }
  }
}