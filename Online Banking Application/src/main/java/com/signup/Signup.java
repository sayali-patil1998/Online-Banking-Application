package com.signup;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import java.sql.*;

import org.apache.tomcat.util.descriptor.web.LoginConfig;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			{
				response.setContentType("text/html");
				System.out.println("<h3>Click on <a href="/login.jsp">Login</a> check account balance</h3>");
			
			}
			else {
			 System.out.println("Unable to insert");
			}
			con.close();  
			}
			catch(Exception e){
			 
			}
	}

}
