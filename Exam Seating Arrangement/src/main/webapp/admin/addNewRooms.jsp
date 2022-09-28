<%@page import="dao.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Room</title>
</head>
<body>
<div class="flex-container">
  <div class="flex-item-left"><a href="manageRooms.jsp">Manage Rooms</a> <i class="fas fa-angle-right"></i> Add New Room</div>
</div>
<form action="addNewRoomAction.jsp" method="post">

<div class="left-div">
 <h3>Enter Room Number</h3>
 <input class="input-style" type="text" name="roomNo" placeholder="Enter Name" required>
</div>

 <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>