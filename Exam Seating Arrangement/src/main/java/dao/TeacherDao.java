package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Student;
import model.Teacher;

public class TeacherDao {
	
	public static String addNewTeacher(Teacher teacher) {
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("insert into teacher (tname,tdob,tgender,temail,taddress,tcontact,teacherid) values(?,?,?,?,?,?,?)");
			ps.setString(1, teacher.getTname());
			ps.setString(2, teacher.getTdob());
			ps.setString(3, teacher.getTgender());
			ps.setString(4, teacher.getTemail());
			ps.setString(5, teacher.getTaddress());
			ps.setString(6, teacher.getTcontact());
			ps.setString(7, "TID-"+System.nanoTime());
			ps.executeUpdate();
			ps.close();
			con.close();
			return "success";
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public static ArrayList<Teacher> getAllTeacher() {
		ArrayList<Teacher> arrayList = new ArrayList<Teacher>();
		try {
	    	   Connection con=ConnectionProvider.getCon();
	    	   Statement st=con.createStatement();
	    	   ResultSet rs=st.executeQuery("select *from teacher");
	            while (rs.next()) {
	            	Teacher teacher = new Teacher();
	            	teacher.setTeacher_pk((rs.getInt("teacher_pk")));;
	            	teacher.setTname(rs.getString("tname"));
	            	teacher.setTdob(rs.getString("tdob"));
	            	teacher.setTgender(rs.getString("tgender"));
	            	teacher.setTemail(rs.getString("temail"));
	            	teacher.setTaddress(rs.getString("taddress"));
	            	teacher.setTcontact(rs.getString("tcontact"));
	            	teacher.setTeacherid(rs.getString("teacherid"));
	                arrayList.add(teacher);
	            }
				rs.close();
				st.close();
				con.close();
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return arrayList;
	}
	
	public static String getTeacherId(String email) {
		try {
			String name = null;
	    	   Connection con=ConnectionProvider.getCon();
	    	   Statement st=con.createStatement();
	    	   ResultSet rs=st.executeQuery("select teacherid from teacher where temail='"+email+"'");
	            while (rs.next()) {
	            	name =  rs.getString(1);
	            }
				st.close();
				rs.close();
				con.close();
	            return name;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public static Teacher getTeacherBypk(String teacher_pk) {
		Teacher teacher = new Teacher();
		try {
	    	   Connection con=ConnectionProvider.getCon();
	    	   Statement st=con.createStatement();
	    	   ResultSet rs=st.executeQuery("select *from teacher where teacher_pk='"+teacher_pk+"'");
	            while (rs.next()) {
	            	teacher.setTeacher_pk((rs.getInt("teacher_pk")));;
	            	teacher.setTname(rs.getString("tname"));
	            	teacher.setTdob(rs.getString("tdob"));
	            	teacher.setTgender(rs.getString("tgender"));
	            	teacher.setTemail(rs.getString("temail"));
	            	teacher.setTaddress(rs.getString("taddress"));
	            	teacher.setTcontact(rs.getString("tcontact"));
	            	teacher.setTeacherid(rs.getString("teacherid"));
	            }
				st.close();
				rs.close();
				con.close();
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return teacher;
	}
	
	public static String updateTeacher(Teacher teacher) {
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("update teacher set tname=?,taddress=?,temail=?,tcontact=? where teacher_pk=?");
			ps.setString(1, teacher.getTname());
			ps.setString(2, teacher.getTaddress());
			ps.setString(3, teacher.getTemail());
			ps.setString(4, teacher.getTcontact());
			ps.setInt(5, teacher.getTeacher_pk());
			ps.executeUpdate();
			ps.close();
			con.close();
			return "success";
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

}
