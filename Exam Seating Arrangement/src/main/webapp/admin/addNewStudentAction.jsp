<%@page import="model.Student"%>
<%@page import="dao.StudentDao"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String name=request.getParameter("name");
String dob = request.getParameter("dob");
String gender = request.getParameter("gender");
String email= request.getParameter("email");
String address = request.getParameter("address");
String contact = request.getParameter("contact");
String semester = request.getParameter("semester");

try
{
	Student student = new Student();
	student.setName(name);
	student.setDob(dob);
	student.setGender(gender);
	student.setEmail(email);
	student.setAddress(address);
	student.setContact(contact);
	student.setSemester(semester);
	String res = StudentDao.addNewStudent(student);
	if(res == "success")
		response.sendRedirect("manageStudents.jsp?msg=add");
	else
		response.sendRedirect("manageStudents.jsp?msg=wrong");
	}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("manageStudents.jsp?msg=wrong");
	}
%>