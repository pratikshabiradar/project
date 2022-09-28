<%@page import="dao.AssignSeatsDao"%>
<%@page import="dao.StudentDao"%>
<%@page import="model.Student"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<link rel="stylesheet" href="css/signup-style.css">
<style>
table {
	width: 100%;
}

#customers {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
	color: white;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #04AA6D;
	color: white;
}
</style>
<%
String scheduleDate = request.getParameter("scheduleDate");
String msg = request.getParameter("msg");
if ("add".equals(msg)) {
%>
<h3 class="alert">Student Successfully Added!</h3>
<%
}
%>
<%
if ("update".equals(msg)) {
%>
<h3 class="alert">Student Successfully Updated!</h3>
<%
}
%>
<%
if ("delete".equals(msg)) {
%>
<h3 class="alert">Student Successfully Deleted!</h3>
<%
}
%>
<%
if ("wrong".equals(msg)) {
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%
}
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Students</title>
<style>
h3 {
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
	<%
	String enrollmentNo = request.getParameter("enrollmentNo");
	Student student = StudentDao.getStudentById(enrollmentNo);
	%>
	<table id="customers">
		<tr>
			<td><b>Enrollment Number:</b> <%out.print(enrollmentNo);%></td>
			<td><b>Date:</b> <%out.print(scheduleDate); %></td>
		</tr>
		<tr>
			<td><b>Name:</b> <%=student.getName()%></td>
			<td><b>Email:</b> <%=student.getEmail()%></td>
		</tr>
				<tr>
			<td><b>DOB:</b> <%=student.getDob()%></td>
			<td><b>Gender:</b> <%=student.getGender()%></td>
		</tr>
			<tr>
			<td><b>Address:</b> <%=student.getAddress()%></td>
			<td><b>Contact Number:</b> <%=student.getContact()%></td>
		</tr>
	</table>

	<table>
		<tbody>
			<%
			try {
				Connection con = ConnectionProvider.getCon();
				Statement st = con.createStatement();
				ResultSet rs1 = st.executeQuery(
				"select r.roomno from room as r inner join roomstudentmapping as rsm on r.room_pk=rsm.room_fk where r.room_pk in (select rsm.room_fk from roomstudentmapping as rsm inner join student as s on rsm.student_fk=s.student_pk where rsm.date like '%"
						+ scheduleDate + "%' and s.enrollment='" + enrollmentNo + "')");
				if (rs1.next()) {
			%>
			<h3 style="color: white; text-align: center">
				Room Number:
				<%
			out.print(rs1.getString(1));
			%>
			</h3>
			<center><a href="student.jsp" style="align-items: center; color: white">Back</a></center>
			<%
			}
			%>
			<br>
			<br>
			<br>
			<%
			} catch (Exception e) {
			System.out.println(e);
			}
			%>
		
</body>