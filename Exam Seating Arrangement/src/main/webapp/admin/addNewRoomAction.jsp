<%@page import="dao.RoomDao"%>
<%@page import="model.Room"%>
<%@page import="model.Student"%>
<%@page import="dao.StudentDao"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String roomNo=request.getParameter("roomNo");

try
{
	Room room = new Room();
	room.setRoomno(roomNo);
	String res = RoomDao.addNewRoom(room);
	if(res == "success")
		response.sendRedirect("manageRooms.jsp?msg=add");
	else
		response.sendRedirect("manageRooms.jsp?msg=wrong");
	}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("manageRooms.jsp?msg=wrong");
	}
%>