<%@page import="model.Teacher"%>
<%@page import="dao.TeacherDao"%>
<%@page import="dao.StudentDao"%>
<%@page import="model.Student"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Edit Teacher</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
<div class="flex-container">
  <div class="flex-item-left"><a href="manageStudents.jsp">Manage Students</a> <i class="fas fa-angle-right"></i> Edit Student</div>
</div>
<%
String id=request.getParameter("id");
Teacher teacher = TeacherDao.getTeacherBypk(id);
%>
<form action="editTeachersAction.jsp" method="post">
<input type="hidden" name="teacher_pk" value="<%out.print(id);%>">
<div class="left-div">
 <h3>Enter Name</h3>
<input class="input-style" type="text" name="name" placeholder="Enter Name" value="<%=teacher.getTname() %>" required>

</div>

<div class="right-div">
<h3>Address</h3>
 <input class="input-style" type="text" name="address" placeholder="Enter Address" value="<%=teacher.getTaddress() %>" required>
</div>

<div class="left-div">
<h3>Email</h3>
 <input class="input-style" type="email" name="email" placeholder="Enter Email" value="<%=teacher.getTemail() %>" required>
</div>

<div class="right-div">
<h3>Contact Number</h3>
 <input class="input-style" type="text" name="contact" placeholder="Enter Contact Number" value="<%=teacher.getTcontact() %>" required>
</div>


 <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>