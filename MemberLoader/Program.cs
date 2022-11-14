namespace MemberLoader {
  internal class Program {

    private static readonly string ConnectionString = "Data Source=glorykidd.com;Initial Catalog=CGBC;User Id=cgbc_user;Password=XJ$7d{84)sa(kV4;";

    private static void Main(string[] args) {

      ReadInputfile("C:\\\\directory.csv");
    }

    private static List<string> ReadInputfile(string path) {
      var f = File.ReadAllLines(path).ToList();


      throw new NotImplementedException();
    }

    private static string RunInsertQueryScalar(string query) {
      using(var conn = new System.Data.SqlClient.SqlConnection(ConnectionString)) {
        var insertCommand = new System.Data.SqlClient.SqlCommand { Connection = conn, CommandText = query, CommandType = System.Data.CommandType.Text, };
        conn.Open();
        var id = insertCommand.ExecuteScalar();
        return id.ToString();
      }
    }

  }
}