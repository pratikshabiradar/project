<%@page import="dao.AssignSeatsDao"%>
<%@page import="dao.StudentDao"%>
<%@page import="model.Student"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@include file="header.jsp" %>
<%@include file="../footer.jsp" %>
<%
String scheduleDate=request.getParameter("scheduleDate");
String msg=request.getParameter("msg");
if("add".equals(msg))
{
%>
<h3 class="alert">Student Successfully Added!</h3>
<%} %>
<%
if("update".equals(msg))
{
%>
<h3 class="alert">Student Successfully Updated!</h3>
<%} %>
<%
if("delete".equals(msg))
{
%>
<h3 class="alert">Student Successfully Deleted!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>
<div class="flex-container">
  <div class="flex-item-left"><a href="tviewSeatingArrangement.jsp">View Seating Arrangement</a> <i class="fas fa-angle-right"></i> All Students</div>
</div>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Students</title>
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
          <th>Enrollment No</th>
            <th scope="col">Name</th>
            <th>DOB</th>
            <th>Gender</th>
            <th>Email</th>
            <th>Address</th>
            <th>Contact</th>
            <th>Semester</th>
          </tr>
        </thead>
        <tbody>
       <%
       String teacherId=session.getAttribute("teacherId").toString();
       AssignSeatsDao.getAllStudentForViewAdmin(teacherId, scheduleDate);
       try
       {
       	Connection con=ConnectionProvider.getCon();
       	Statement st=con.createStatement();
       	ResultSet rs1=st.executeQuery("select r.roomno from room as r inner join roomteachermapping as rtm on r.room_pk=rtm.troom_fk where r.room_pk in (select rtm.troom_fk from roomteachermapping as rtm inner join teacher as t on t.teacher_pk=rtm.teacher_fk where rtm.date like '%"+scheduleDate+"%' and t.teacherid='"+teacherId+"');");
       	while(rs1.next())
       	{%>
       		<h3 style="color:white;text-align: center">Room Number: <%out.print(rs1.getString(1));%></h3>
       	<%}
       	ResultSet rs=st.executeQuery("select s.* from student as s inner join roomstudentmapping as rm on s.student_pk=rm.student_fk where rm.date like '%"+scheduleDate+"%' and rm.room_fk in (select troom_fk from roomteachermapping as rmt inner join teacher as t on rmt.teacher_fk=t.teacher_pk where rmt.date like '%"+scheduleDate+"%' and t.teacherid='"+teacherId+"')");
       	while(rs.next())
        {
       %>
          <tr>
          <td><%= rs.getString(8) %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("dob") %></td>
            <td><%= rs.getString("gender") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("contact") %></td>
            <td><%= rs.getString("semester") %></td>
       
          </tr>
          <%} %>
        </tbody>
      </table>
      <br>
      <br>
      <br>
      <%
}
catch(Exception e)
{
	System.out.println(e);
	}%>

</body>