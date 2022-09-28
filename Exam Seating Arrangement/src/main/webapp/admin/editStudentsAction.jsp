<%@page import="dao.StudentDao"%>
<%@page import="model.Student"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
int student_pk=Integer.parseInt(request.getParameter("student_pk"));
String name=request.getParameter("name");
String contact=request.getParameter("contact");
String email=request.getParameter("email");
String address=request.getParameter("address");

try{
	Student student = new Student();
	student.setStudent_pk(student_pk);
	student.setName(name);
	student.setEmail(email);
	student.setAddress(address);
	student.setContact(contact);
	
	String res = StudentDao.updateStudent(student);
	if(res == "success")
		response.sendRedirect("manageStudents.jsp?msg=update");
	else
		response.sendRedirect("manageStudents.jsp?msg=wrong");
}
catch(Exception e)
{
	response.sendRedirect("manageStudents.jsp?msg=wrong");
	}
%>