package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Student;

public class StudentDao {
	
	public static String addNewStudent(Student student) {
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("insert into student (name,dob,gender,email,address,contact,enrollment,semester) values(?,?,?,?,?,?,?,?)");
			ps.setString(1, student.getName());
			ps.setString(2, student.getDob());
			ps.setString(3, student.getGender());
			ps.setString(4, student.getEmail());
			ps.setString(5, student.getAddress());
			ps.setString(6, student.getContact());
			ps.setString(7, "ENR-"+System.nanoTime());
			ps.setString(8, student.getSemester());
			ps.executeUpdate();
			ps.close();
			con.close();
			return "success";
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public static ArrayList<Student> getAllStudents() {
		ArrayList<Student> arrayList = new ArrayList<Student>();
		try {
	    	   Connection con=ConnectionProvider.getCon();
	    	   Statement st=con.createStatement();
	    	   ResultSet rs=st.executeQuery("select *from student");
	            while (rs.next()) {
	            	Student student = new Student();
	            	student.setStudent_pk((rs.getInt("student_pk")));;
	            	student.setName(rs.getString("name"));
	            	student.setDob(rs.getString("dob"));
	            	student.setGender(rs.getString("gender"));
	            	student.setEmail(rs.getString("email"));
	            	student.setAddress(rs.getString("address"));
	            	student.setContact(rs.getString("contact"));
	            	student.setEnrollment(rs.getString("enrollment"));
	            	student.setSemester(rs.getString("semester"));
	                arrayList.add(student);
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
	
	public static Student getStudentById(String enrollment) {
		Student student = new Student();
		try {
	    	   Connection con=ConnectionProvider.getCon();
	    	   Statement st=con.createStatement();
	    	   ResultSet rs=st.executeQuery("select *from student where enrollment='"+enrollment+"'");
	            while (rs.next()) {
	            	student.setStudent_pk((rs.getInt("student_pk")));;
	            	student.setName(rs.getString("name"));
	            	student.setDob(rs.getString("dob"));
	            	student.setGender(rs.getString("gender"));
	            	student.setEmail(rs.getString("email"));
	            	student.setAddress(rs.getString("address"));
	            	student.setContact(rs.getString("contact"));
	            	student.setSemester(rs.getString("semester"));
	            }
				st.close();
				rs.close();
				con.close();
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return student;
	}
	
	public static Student getStudentBypk(String student_pk) {
		Student student = new Student();
		try {
	    	   Connection con=ConnectionProvider.getCon();
	    	   Statement st=con.createStatement();
	    	   ResultSet rs=st.executeQuery("select *from student where student_pk='"+student_pk+"'");
	            while (rs.next()) {
	            	student.setName(rs.getString("name"));
	            	student.setDob(rs.getString("dob"));
	            	student.setGender(rs.getString("gender"));
	            	student.setEmail(rs.getString("email"));
	            	student.setAddress(rs.getString("address"));
	            	student.setContact(rs.getString("contact"));
	            	student.setEnrollment(rs.getString("enrollment"));
	            	student.setSemester(rs.getString("semester"));
	            }
				st.close();
				rs.close();
				con.close();
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return student;
	}
	
	public static String updateStudent(Student student) {
		try {
			System.out.print(student.getStudent_pk());
			Connection con = ConnectionProvider.getCon();
			PreparedStatement ps = con.prepareStatement("update student set name=?,address=?,email=?,contact=? where student_pk=?");
			ps.setString(1, student.getName());
			ps.setString(2, student.getAddress());
			ps.setString(3, student.getEmail());
			ps.setString(4, student.getContact());
			ps.setInt(5, student.getStudent_pk());
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
