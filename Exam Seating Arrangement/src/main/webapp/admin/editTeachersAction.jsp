<%@page import="dao.TeacherDao"%>
<%@page import="model.Teacher"%>
<%@page import="dao.StudentDao"%>
<%@page import="model.Student"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
int teacher_pk=Integer.parseInt(request.getParameter("teacher_pk"));
String name=request.getParameter("name");
String contact=request.getParameter("contact");
String email=request.getParameter("email");
String address=request.getParameter("address");

try{
	Teacher teacher = new Teacher();
	teacher.setTeacher_pk(teacher_pk);
	teacher.setTname(name);
	teacher.setTemail(email);
	teacher.setTaddress(address);
	teacher.setTcontact(contact);
	
	String res = TeacherDao.updateTeacher(teacher);
	if(res == "success")
		response.sendRedirect("manageTeachers.jsp?msg=update");
	else
		response.sendRedirect("manageTeachers.jsp?msg=wrong");
}
catch(Exception e)
{
	response.sendRedirect("manageTeachers.jsp?msg=wrong");
	}
%>