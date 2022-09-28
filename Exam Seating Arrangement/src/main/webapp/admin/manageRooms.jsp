<%@page import="dao.RoomDao"%>
<%@page import="model.Room"%>
<%@page import="dao.StudentDao"%>
<%@page import="model.Student"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>

<%
String msg=request.getParameter("msg");
if("add".equals(msg))
{
%>
<h3 class="alert">Room Successfully Added!</h3>
<%} %>
<%
if("update".equals(msg))
{
%>
<h3 class="alert">Room Successfully Updated!</h3>
<%} %>
<%
if("delete".equals(msg))
{
%>
<h3 class="alert">Room Successfully Deleted!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>
<div class="flex-container">
  <div class="flex-item-left">Manage Rooms <i class='fas fa-school'></i></div>
  <div class="flex-item-right"><span style="float: right !important"><a class="button-new" href="addNewRooms.jsp">Add New Room <i class='fas fa-plus-square'></i></a></span></div>
</div>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rooms</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<table>
        <thead>
          <tr>
          <th>Room Number</th>
          </tr>
        </thead>
        <tbody>
       <%
       ArrayList<Room> list = RoomDao.getAllRooms();
       Iterator<Room> itr = list.iterator();
       while (itr.hasNext()) {
    	   Room room = itr.next();
       %>
          <tr>
          <td><%= room.getRoomno() %></td>
        
          </tr>
          <%} %>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>