package com.account;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

public class Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Username = request.getParameter("username");
		String acc = request.getParameter("num");
	
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/JSP","root","Autobots@008");  
			
			PreparedStatement stat = con.prepareStatement("insert into Account(Username,Account_Number) values(?,?)");

			stat.setString(1, Username);
			stat.setString(2, acc);
		

			int i=stat.executeUpdate();  

			if(i>0) 
			{
		
			}
				catch(Exception e){
					 System.out.println(e.getMessage());
					}
			}
			else {
			 System.out.println("try again");
			}
			con.close();  
			}
			catch(Exception e){
				System.out.println(e.getMessage());
			}
	}

}
