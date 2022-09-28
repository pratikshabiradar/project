<%@page import="dao.AssignSeatsDao"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String scheduleDate=request.getParameter("scheduleDate");
out.print(scheduleDate);
try
{
	String res = AssignSeatsDao.addNewRoom(scheduleDate);
	if(res == "success")
		response.sendRedirect("assignSeats.jsp?msg=add");
	else if(res == "already")
		response.sendRedirect("assignSeats.jsp?msg=already");
	else if(res == "insufficientRoom")
		response.sendRedirect("assignSeats.jsp?msg=insufficientRoom");
	else if(res == "insufficientTeacher")
		response.sendRedirect("assignSeats.jsp?msg=insufficientTeacher");
	else
		response.sendRedirect("assignSeats.jsp?msg=wrong");

	}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("manageDepartments.jsp?msg=wrong");
	}
%>