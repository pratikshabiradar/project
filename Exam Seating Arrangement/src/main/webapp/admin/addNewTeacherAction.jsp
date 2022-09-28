<%@page import="dao.TeacherDao"%>
<%@page import="model.Teacher"%>
<%@page import="model.Student"%>
<%@page import="dao.StudentDao"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String tname=request.getParameter("name");
String tdob = request.getParameter("dob");
String tgender = request.getParameter("gender");
String temail= request.getParameter("email");
String taddress = request.getParameter("address");
String tcontact = request.getParameter("contact");
String password = request.getParameter("password");

try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into newappuser(email,pass,role) values(?,?,'teacher')");
	ps.setString(1, temail);
	ps.setString(2, password);
	ps.executeUpdate();
	
	Teacher teacher = new Teacher();
	teacher.setTname(tname);
	teacher.setTdob(tdob);
	teacher.setTgender(tgender);
	teacher.setTemail(temail);
	teacher.setTaddress(taddress);
	teacher.setTcontact(tcontact);
	String res = TeacherDao.addNewTeacher(teacher);
	if(res == "success")
		response.sendRedirect("manageTeachers.jsp?msg=add");
	else
		response.sendRedirect("manageTeachers.jsp?msg=wrong");
	}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("manageTeachers.jsp?msg=wrong");
	}
%>