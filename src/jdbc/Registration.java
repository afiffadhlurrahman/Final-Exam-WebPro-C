package jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
			String email = request.getParameter("password");
			String password = request.getParameter("password");
			String confirmPassword = request.getParameter("confirmpassword");
		
			if(password.equals(confirmPassword)) {
				String sql = "INSERT INTO USER(`username`, `userfirstname`, `userlastname`, `useremail`, `userpassword`, `userroles`) VALUES (?,?,?,?,?,'User')";
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/catcharide?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
				PreparedStatement ps = conn.prepareStatement(sql);
				
				ps.setString(1, username);
				ps.setString(2, firstname);
				ps.setString(3, lastname);
				ps.setString(4, email);
				ps.setString(5, password);
				
				ps.executeUpdate();
				
				PrintWriter out = response.getWriter();
				out.println("You have successfully registered");
			}
			else {
				PrintWriter out = response.getWriter();
				out.println("Your confirmation password didn't match");
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
