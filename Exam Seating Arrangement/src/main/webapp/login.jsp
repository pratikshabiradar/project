<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='login-form'>
     <form action="loginAction.jsp" method="post">
     <input type="email" name="email" placeholder="Enter Email" required>
     <input type="password" name="password" placeholder="Enter Password" required>
     <input type="submit" value="login">
     </form>
      <h2><a href="student.jsp">Student</a></h2>
  </div>
  <div class='login-text'>
  <%
  String msg=request.getParameter("msg");
  if("notexist".equals(msg))
  {
  %>
  <h1>Incorrect Username or Password</h1>
<%} %>
<%if("invalid".equals(msg)) 
{%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
    <h2>Exam Seating Arrangement</h2>
    <p>Exam Seating Arrangement hall allotment and seating arrangement for the student, an application for automatic seating arrangement is developed. hall allotment and seating arrangement for the student, an application for automatic seating arrangement is developed.</p>
  </div>
</div>

</body>
</html>