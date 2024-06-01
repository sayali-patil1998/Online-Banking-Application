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
String num = request.getParameter("num");

  try {
	  Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/JSP","root","Autobots@008");  

		 PreparedStatement stat = con.prepareStatement("SELECT * FROM information WHERE Account_Number=?");
		    stat.setString(1, num);
		    
		    ResultSet rs = stat.executeQuery();
		     
		      if(rs.next()){

%>
		      <div class="container">
        <h1>Your Account Balance is:</h1>
        
       <h1 style="color:green"><%="Rs."+ rs.getInt(5)+ " /- Only"%></h1>
       <%
      
		      }
		      else{%>
		      <h1 style="color:red"><%="Insert Valid Account Number" %></h1>
		      <jsp:include page="account.html"></jsp:include>
<%
		  	}
        }
        catch(Exception e){
    		out.println(e.getMessage());
    	
}
%>

</body>
</html>