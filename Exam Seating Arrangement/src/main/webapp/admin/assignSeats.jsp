<%@page import="dao.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<link rel="stylesheet" href="../css/addNewProduct-style.css">

<%
String msg=request.getParameter("msg");
if("add".equals(msg))
{
%>
<h3 class="alert">Seats Successfully Assigned!</h3>
<%} %>
<%
if("already".equals(msg))
{
%>
<h3 class="alert">Exam already schedule for this date!</h3>
<%} %>
<%
if("insufficientRoom".equals(msg))
{
%>
<h3 class="alert">Insufficient Space for students. Please add rooms!</h3>
<%} %>
<%
if("insufficientTeacher".equals(msg))
{
%>
<h3 class="alert">Add More Teacher. To Schedule exam!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>
<div class="flex-container">
  <div class="flex-item-left">Assign Seats <i class='fas fa-chair'></i></div>
</div>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Medicines</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<form action="assignSeatsAction.jsp" method="post">
<div class="left-div">
 <h3>Enter Date</h3>
 <input class="input-style" type="date" placeholder="dd-mm-yyyy" name="scheduleDate" placeholder="Enter Name" required>
</div>
<div class="right-div">
 <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
 </div>
</form>
</body>
<br><br><br>

</body>