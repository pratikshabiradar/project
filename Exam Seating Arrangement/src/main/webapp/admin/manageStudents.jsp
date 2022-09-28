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
  <div class="flex-item-left">Manage Students <i class='fas fa-user-graduate'></i></div>
  <div class="flex-item-right"><span style="float: right !important"><a class="button-new" href="addNewStudents.jsp">Add New Student <i class='fas fa-plus-square'></i></a></span></div>
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
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
       <%
       ArrayList<Student> list = StudentDao.getAllStudents();
       Iterator<Student> itr = list.iterator();
       while (itr.hasNext()) {
    	   Student student = itr.next();
       %>
          <tr>
          <td><%= student.getEnrollment() %></td>
            <td><%= student.getName() %></td>
            <td><%= student.getDob() %></td>
            <td><%= student.getGender() %></td>
            <td><%= student.getEmail() %></td>
            <td><%= student.getAddress() %></td>
            <td><%= student.getContact() %></td>
            <td><%= student.getSemester() %></td>
       <td><span class="tooltip"><a href="editStudents.jsp?id=<%=student.getStudent_pk() %>"><i class='fas fa-pen-fancy'></i></a><span class="tooltiptext">Edit<br>Student</span></span></td>
          </tr>
          <%} %>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>