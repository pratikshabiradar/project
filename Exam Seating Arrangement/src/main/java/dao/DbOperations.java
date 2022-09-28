package dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class DbOperations {
	public static String setDataOrDelete(String Query, String msg) {
		try {
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			st.executeUpdate(Query);
			return "success";
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public static ResultSet getData(String query) {
		try {
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			return rs;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
