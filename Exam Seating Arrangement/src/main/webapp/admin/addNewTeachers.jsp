<%@page import="dao.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Teacher</title>
</head>
<body>
<div class="flex-container">
  <div class="flex-item-left"><a href="manageTeachers.jsp">Manage Teachers</a> <i class="fas fa-chalkboard-teacher"></i> Add New Teacher</div>
</div>
<form action="addNewTeacherAction.jsp" method="post">

<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" placeholder="Enter Name" required>
</div>

<div class="right-div">
<h3>Date Of Birth (DOB)</h3>
 <input class="input-style" type="date" name="dob" placeholder="Enter Date Of Birth(DOB)" required>
</div>

<div class="left-div">
 <h3>Enter Gender</h3>
     <select name="gender" class="input-style" required>
    <option value="Male">Male</option>
    <option value="Female">Female</option>
    <option value="Others">Others</option>
    </select>
</div>

<div class="right-div">
<h3>Email</h3>
 <input class="input-style" type="email" name="email" placeholder="Enter Email" required>
</div>

<div class="left-div">
 <h3>Enter Address</h3>
 <input class="input-style" type="text" name="address" placeholder="Enter Address" required>
</div>

<div class="right-div">
<h3>Contact Number</h3>
 <input class="input-style" type="text" name="contact" placeholder="Enter Contact Number" required>
</div>

<div class="left-div">
 <h3>Enter Password</h3>
 <input class="input-style" type="text" name="password" placeholder="Enter Password" required>
</div>

 <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>