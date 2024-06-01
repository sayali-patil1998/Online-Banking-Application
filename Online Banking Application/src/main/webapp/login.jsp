<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Style.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/JSP", "root", "Autobots@008");
	

	PreparedStatement stat = con.prepareStatement(" select * from information where Username=? and Password=?");
	stat.setString(1, request.getParameter("username"));
	stat.setString(2, request.getParameter("password"));
	ResultSet rs = stat.executeQuery();
	if (rs.next()){%>
		<jsp:forward page="account.html"></jsp:forward>
        <% 
	}
	else{%>
		<h1 style="color:red"><%="Unable to Login,Please try again" %></h1>
		<%
	}
}
	catch(Exception e){
		out.println(e.getMessage());
	}
%>
<jsp:include page="login.html"></jsp:include>
</body>
</html>