<%@page import="dao.StudentDao"%>
<%@page import="model.Student"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Edit Student</title>
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
Student student = StudentDao.getStudentBypk(id);
%>
<form action="editStudentsAction.jsp" method="post">
<input type="hidden" name="student_pk" value="<%out.print(id);%>">
<div class="left-div">
 <h3>Enter Name</h3>
<input class="input-style" type="text" name="name" placeholder="Enter Name" value="<%=student.getName() %>" required>

</div>

<div class="right-div">
<h3>Address</h3>
 <input class="input-style" type="text" name="address" placeholder="Enter Address" value="<%=student.getAddress() %>" required>
</div>

<div class="left-div">
<h3>Email</h3>
 <input class="input-style" type="email" name="email" placeholder="Enter Email" value="<%=student.getEmail() %>" required>
</div>

<div class="right-div">
<h3>Contact Number</h3>
 <input class="input-style" type="text" name="contact" placeholder="Enter Contact Number" value="<%=student.getContact() %>" required>
</div>


 <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>