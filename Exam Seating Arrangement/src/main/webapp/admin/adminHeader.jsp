<%@page errorPage="adminError.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="../css/w3.css">
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
   <%String email=session.getAttribute("email").toString(); %>
            <center><h2>Exam Seating Arrangement</h2></center>
            <a href="manageStudents.jsp">Manage Students <i class='fas fa-user-graduate'></i></a>
            <a href="manageTeachers.jsp">Manage Teachers <i class='fas fa-chalkboard-teacher'></i></a>
            <a href="manageRooms.jsp">Manage Rooms <i class='fas fa-school'></i></a>
            <a href="assignSeats.jsp">Assign Seats <i class='fas fa-chair'></i></a>
            <a href="viewSeatingArrangement.jsp">View Seating Arrangement <i class='fa fa-align-justify'></i></a>
            <a href="../logout.jsp">Logout <i class='fas fa-share-square'></i></a>
          </div>
           <br>
           <!--table-->
