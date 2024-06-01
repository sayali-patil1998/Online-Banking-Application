<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String Username = request.getParameter("username");
String email = request.getParameter("email");
String password = request.getParameter("password");
String acc = request.getParameter("num");

try{
	Class.forName("com.mysql.cj.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/JSP","root","Autobots@008");  

	PreparedStatement stat = con.prepareStatement("insert into information(Username,Email,Password,Account_Number) values(?,?,?,?)");

	stat.setString(1, Username);
	stat.setString(2, email);
	stat.setString(3, password);
	stat.setString(4, acc);

	int i=stat.executeUpdate();  
	if(i>0) 
	{%>
		<jsp:forward page="login.html"></jsp:forward>
	<%
	}
	else {%>
		<h1 style="color:red"><%="Unable to SignUp,Please try again" %></h1>
		<%
}
}
catch(Exception e){
	out.println(e.getMessage());
}
%>
<jsp:include page="signup.html"></jsp:include>
</body>
</html>