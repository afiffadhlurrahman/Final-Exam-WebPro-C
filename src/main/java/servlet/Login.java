package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Connection conn = new DbConnection().getConn();
			String useridentifier = request.getParameter("useridentifier");
			String password = request.getParameter("password");

			HashController enc_password = new HashController(password);
			password = enc_password.getHashPassword();

			String sql = "SELECT * FROM USERS WHERE username = ? or useremail = ?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, useridentifier);
			ps.setString(2, useridentifier);

			ResultSet rs = ps.executeQuery();

			int dbuserid = 0;
			String dbuserpassword = null;

			if (rs.next()) {
				dbuserid = rs.getInt("userid");
				dbuserpassword = rs.getString("userpassword");
			}

			if (password.equals(dbuserpassword)) {
				HttpSession session = request.getSession();

				session.setAttribute("userid", dbuserid);
				session.setAttribute("username", rs.getString("username"));
				session.setAttribute("email", rs.getString("useremail"));
				session.setAttribute("firstname", rs.getString("userfirstname"));
				session.setAttribute("lastname", rs.getString("userlastname"));
				session.setAttribute("userroles", rs.getString("userroles"));

				request.setAttribute("status", "Login Success!");
				// response.sendRedirect("index.jsp");
				
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);

			} else {
				request.setAttribute("status", "Username/Password didn't match!");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			// TODO Auto-generated catch block
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
