package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import model.AppUser;

public class AppUserDao {
	
	public static String signup(AppUser appUser) {
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("insert into appusers (name,contactNumber,email,password,securityQuestion,answer,role) values(?,?,?,?,?,?,?)");
			ps.setString(1, appUser.getName());
			ps.setString(2, appUser.getContactNumber());
			ps.setString(3, appUser.getEmail());
			ps.setString(4, appUser.getPassword());
			ps.setString(5, appUser.getSecurityQuestion());
			ps.setString(6, appUser.getAnswer());
			ps.setString(7, appUser.getRole());
			ps.executeUpdate();
			ps.close();
			con.close();
			return "success";
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public static AppUser login(AppUser appUser) {
		AppUser appUserRes = null;
		try {
			Connection con=ConnectionProvider.getCon();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select *from newappuser where email='"+appUser.getEmail()+"' and pass='"+appUser.getPassword()+"'");
			while(rs.next()) {
				appUserRes = new AppUser();
				appUserRes.setRole(rs.getString("role"));
			}
			st.close();
			rs.close();
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return appUserRes;
	}
	
	public static String forgotPassword(AppUser appUser) {
		int check=0;
		try {
			Connection con=ConnectionProvider.getCon();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select *from appusers where email='"+appUser.getEmail()+"' and contactNumber='"+appUser.getContactNumber()+"' and securityQuestion='"+appUser.getSecurityQuestion()+"' and answer='"+appUser.getAnswer()+"'");
			while(rs.next()) {
				check=1;
				st.executeUpdate("update appusers set password='"+appUser.getPassword()+"' where email='"+appUser.getEmail()+"'");
				return "success";
			}
			if(check==0)
			{
				return "notFound";
			}
			rs.close();
			st.close();
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
