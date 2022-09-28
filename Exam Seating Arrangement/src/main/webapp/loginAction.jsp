<%@page import="dao.TeacherDao"%>
<%@page import="dao.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="model.AppUser"%>
<%@page import="dao.AppUserDao"%>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
	try
	{
		AppUser appUser =  new AppUser();
		appUser.setEmail(email);
		appUser.setPassword(password);
		AppUser appUserRes = AppUserDao.login(appUser); 
		if(appUserRes == null){
			response.sendRedirect("login.jsp?msg=notexist");
		}
		else{
			 if(appUserRes != null && "teacher".equals(appUserRes.getRole())){
				String teacherId = TeacherDao.getTeacherId(email);
				System.out.print(teacherId);
				 session.setAttribute("teacherId", teacherId);
					session.setAttribute("email", email);
					response.sendRedirect("home.jsp");
				}
				else if(appUserRes != null && "admin".equals(appUserRes.getRole())){
					session.setAttribute("email", email);
					response.sendRedirect("admin/adminHome.jsp");
				}
				else{
					response.sendRedirect("login.jsp?msg=notexist");
				}
		}
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=invalid");
	}
%>