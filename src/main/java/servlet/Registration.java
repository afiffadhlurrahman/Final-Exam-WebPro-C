package servlet;

import servlet.DbConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Registration() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String username = request.getParameter("username");
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String confirmPassword = request.getParameter("confirmpassword");
		
			if(password.equals(confirmPassword)) {
				
				HashController enc_password = new HashController(password);
				password = enc_password.getHashPassword();
				
				String sql = "INSERT INTO USERS(username, userfirstname, userlastname, useremail, userpassword, userroles) VALUES (?,?,?,?,?,'User')";
				
				Connection conn = new DbConnection().getConn();
				PreparedStatement ps = conn.prepareStatement(sql);
				
				ps.setString(1, username);
				ps.setString(2, firstname);
				ps.setString(3, lastname);
				ps.setString(4, email);
				ps.setString(5, password);
				
				ps.executeUpdate();
				
				request.setAttribute("status", "Your Account has been created!");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");	
				rd.forward(request, response);
			}
			else {
				request.setAttribute("status", "Password didn't match!");
				RequestDispatcher rd = request.getRequestDispatcher("registration.jsp");				
				rd.forward(request, response);
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
