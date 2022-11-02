using Cedar_Grove.objectclass;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Cedar_Grove {
  public static class SqlHelpers {

    private static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["CedarGrove"].ToString();

    public static List<ChurchMember> GetMembers() {
      var rtn = new List<ChurchMember>();
      var members = GetDataReader(SqlStatements.SQL_READ_CHURCH_MEMBERS);
      while(members.Read()) {
        rtn.Add(new ChurchMember() {
          Id = SafeGet<string>(members, "id"),
          FirstName = SafeGet<string>(members, "FirstName"),
          LastName = SafeGet<string>(members, "LastName"),
          DisplayName = SafeGet<string>(members, "DisplayName"),
          Title = SafeGet<string>(members, "Title"),
          Bio = SafeGet<string>(members, "Bio"),
          ImageUrl = SafeGet<string>(members, "ImageUrl") ?? "https://via.placeholder.com/250",
          Addresses = GetMemberAddresses(SafeGet<string>(members, "Id")),
          EmailAddresses = GetMemberEmailAddresses(SafeGet<string>(members, "Id")),
          Phones = GetMemberPhones(SafeGet<string>(members, "Id")),
        });
      }
      members.Close();
      return rtn;
    }
    private static List<Address> GetMemberAddresses(string id) {
      var rtn = new List<Address>();
      var addresses = GetDataReader(SqlStatements.SQL_READ_CHURCH_MEMBER_ADDRESSES.FormatWith(id));
      while(addresses.Read()) {
        rtn.Add(new Address() {
          Id = SafeGet<string>(addresses, "id"),
          Address1 = SafeGet<string>(addresses, "Address1"),
          Address2 = SafeGet<string>(addresses, "Address2"),
          City = SafeGet<string>(addresses, "City"),
          PostalCode = SafeGet<string>(addresses, "PostalCode"),
          PostalExtension = SafeGet<string>(addresses, "PostalExt"),
          StateId = SafeGet<int>(addresses, "StateId"),
          State = SafeGet<string>(addresses, "State"),
          StateAbbreviation = SafeGet<string>(addresses, "Abbreviation"),
          Primary = SafeGet<bool>(addresses, "Primary")
        });
      }
      addresses.Close();
      return rtn;
    }
    private static List<EmailAddress> GetMemberEmailAddresses(string id) {
      var rtn = new List<EmailAddress>();
      var addresses = GetDataReader(SqlStatements.SQL_READ_CHURCH_MEMBER_EMAILS.FormatWith(id));
      while(addresses.Read()) {
        rtn.Add(new EmailAddress() {
          Id = SafeGet<string>(addresses, "id"),
          Email = SafeGet<string>(addresses, "Email"),
          Display=SafeGet<string>(addresses, "Display"),
          Primary = SafeGet<bool>(addresses, "Primary")
        });
      }
      addresses.Close();
      return rtn;
    }
    private static List<Phone> GetMemberPhones(string id) {
      var rtn = new List<Phone>();
      var addresses = GetDataReader(SqlStatements.SQL_READ_CHURCH_MEMBER_PHONES.FormatWith(id));
      while(addresses.Read()) {
        rtn.Add(new Phone() {
          Id = SafeGet<string>(addresses, "id"),
          PhoneNumber = SafeGet<string>(addresses, "Phone").DisplayPhone(),
          Primary = SafeGet<bool>(addresses, "Primary")
        });
      }
      addresses.Close();
      return rtn;
    }

    #region SELECT
    /// <summary>
    /// Simple select statement that creates a DataTable based on the query.  
    /// </summary>
    /// <param name="query"></param>
    /// <param name="whereClause"></param>
    /// <returns>Query matching DataTable</returns>
    public static DataTable Select(string query, string whereClause = "") {
      string testQuery = "{0} {1};".FormatWith(query, whereClause);
      return GetDataTable(testQuery);
    }

    /// <summary>
    /// Create DataTable from provided tablename that contains columns from column array. Filtered by optional where clause. 
    /// </summary>
    /// <param name="tablename"></param>
    /// <param name="columns"></param>
    /// <param name="whereClause"></param>
    /// <returns></returns>
    public static DataTable SelectByColumns(string tablename, string[] columns, string whereClause = "") {
      string query = "SELECT {0} FROM {1} {2};".FormatWith(columns.JoinWith(","), tablename, whereClause);
      return GetDataTable(query);
    }

    /// <summary>
    /// Executes the SQL query and returns the first value
    /// </summary>
    /// <param name="query">The CMD text.</param>
    /// <returns>Object containing value returned from query.</returns>
    public static object SelectScalar(string query) {
      using(var conn = new SqlConnection(ConnectionString)) {
        var command = new SqlCommand { Connection = conn, CommandText = query, CommandType = CommandType.Text, };
        conn.Open();
        return command.ExecuteScalar();
      }
    }

    #endregion SELECT

    #region UPDATE

    public static bool Update(string query) {
      using(var conn = new SqlConnection(ConnectionString)) {
        var command = new SqlCommand { Connection = conn, CommandText = query, CommandType = CommandType.Text, };
        conn.Open();
        return command.ExecuteNonQuery() > 0;
      }
    }


    public static bool UpdateAll(IEnumerable<string> queries) {
      using(var conn = new SqlConnection(ConnectionString)) {
        conn.Open();
        using(var trans = conn.BeginTransaction()) {
          foreach(var query in queries) {
            try {
              var command = new SqlCommand { Connection = conn, CommandText = query, CommandType = CommandType.Text, Transaction = trans };
              if(!(command.ExecuteNonQuery() > 0)) { throw new ApplicationException(); }
            } catch { trans.Rollback(); return false; }
          }
          // all successfull
          trans.Commit();
          return true;
        }
      }
    }

    #endregion UPDATE

    #region INSERT

    public static bool Insert(string query) {
      return RunInsertQuery(query) > 0;
    }

    public static string InsertScalar(string query) {
      //query = query + ";SELECT SCOPE_IDENTITY();";
      return RunInsertQueryScalar(query);
    }

    private static int RunInsertQuery(string query) {
      using(var conn = new SqlConnection(ConnectionString)) {
        var insertCommand = new SqlCommand { Connection = conn, CommandText = query, CommandType = CommandType.Text, };
        conn.Open();
        return insertCommand.ExecuteNonQuery();
      }
    }

    private static string RunInsertQueryScalar(string query) {
      using(var conn = new SqlConnection(ConnectionString)) {
        var insertCommand = new SqlCommand { Connection = conn, CommandText = query, CommandType = CommandType.Text, };
        conn.Open();
        var id = insertCommand.ExecuteScalar();
        return id.ToString();
      }
    }

    #endregion INSERT

    #region DELETE

    #endregion DELETE

    #region Get Data
    /// <summary>
    /// Retrieve data table from current environment database. 
    /// </summary>
    /// <param name="query"></param>
    /// <returns>DataTable</returns>
    private static DataTable GetDataTable(string query) {
      DataTable result = new DataTable();
      using(var conn = new SqlConnection(ConnectionString)) {
        var selectCommand = new SqlCommand { Connection = conn, CommandText = query, CommandType = CommandType.Text, };
        conn.Open();
        using(var reader = selectCommand.ExecuteReader()) { result.Load(reader); }
        conn.Close();
      }

      return result;
    }

    private static SqlDataReader GetDataReader(string query) {
      SqlDataReader rtn;
      var conn = new SqlConnection(ConnectionString);
      var selectCommand = new SqlCommand { Connection = conn, CommandText = query, CommandType = CommandType.Text, };
      conn.Open();
      rtn = selectCommand.ExecuteReader(CommandBehavior.CloseConnection);

      return rtn;
    }

    private static T SafeGet<T>(this SqlDataReader reader, string nameOfColumn) {
      var indexOfColumn = reader.GetOrdinal(nameOfColumn);
      return reader.IsDBNull(indexOfColumn) ? default(T) : reader.GetFieldValue<T>(indexOfColumn);
    }

    #endregion 
  }
}