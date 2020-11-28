package jdbc;

import java.io.*;
import java.util.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.text.*;
import java.util.regex.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.*;
import org.apache.tomcat.util.http.fileupload.disk.*;
import org.apache.tomcat.util.http.fileupload.servlet.*;
import com.google.gson.Gson;

/**
 * Servlet implementation class EditProfile
 */
@WebServlet("/EditProfile")
@MultipartConfig()
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String value = request.getParameter("value");
	    
	    try {
			Connection conn = new DbConnection().getConn();
			Statement statement = conn.createStatement();
			
			String sql = "SELECT * FROM CITY WHERE stateid =" + value;
			ResultSet rs = statement.executeQuery(sql);
			Map<Integer, String> options = new HashMap<Integer, String>();
			
			while(rs.next()) {
				options.put(rs.getInt("cityid"), rs.getString("cityname"));
			}
						
			String json = new Gson().toJson(options); // Convert Java object to JSON string.
			response.setContentType("application/json"); // Inform client that you're returning JSON.
			response.setCharacterEncoding("UTF-8"); // Important if you want world domination.
			response.getWriter().write(json); // Write JSON string to response.
			
			conn.close();
		
	    } catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String contentType = request.getContentType();
		System.out.println(request.getParameter("firstname"));
		
		
		if(contentType != null && contentType.indexOf("multipart/form-data") >=0 ) {
			System.out.println("Hehe");
			
			try {
				int userid = (int) request.getSession().getAttribute("userid");
				int cityid = Integer.parseInt(request.getParameter("city"));
								
				String firstname = request.getParameter("firstname");
				String lastname = request.getParameter("lastname");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				String address = request.getParameter("address");
				
				String password = request.getParameter("password");
				String confirmPassword = request.getParameter("confirmpassword");
				
				Connection conn = new DbConnection().getConn();
				String sql = "UPDATE users SET userfirstname=?, userlastname=?, useremail=?, userphone=?, useraddress=?, cityid=?, userroles='Verified User' ";
				
				Boolean setPassword = false, trySet = false;
				if(!password.equals("") || !confirmPassword.equals("")) {
					trySet = true;
					if(password.equals(confirmPassword)) {
						HashController enc_password = new HashController(password);
						password = enc_password.getHashPassword();
						sql = sql + ", userpassword = ?";
						setPassword = true;
					}					
				}
				
				sql = sql + " WHERE userid=?";
				System.out.println(firstname + " " + lastname + " " + cityid + " ");
				
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, firstname);
				ps.setString(2, lastname);
				ps.setString(3, email);
				ps.setString(4, phone);
				ps.setString(5, address);
				ps.setInt(6, cityid);
				
				if(setPassword) {
					ps.setString(7, password);
					ps.setInt(8, userid);
				} else {
					ps.setInt(7, userid);
				}
				
				ps.executeUpdate();
				
				conn.close();
				if(trySet && !setPassword) {
					request.setAttribute("status", "Confirmation Password didn't match!");
					RequestDispatcher rd = request.getRequestDispatcher("editprofile.jsp");	
					rd.forward(request, response);
				} else {
					HttpSession session = request.getSession();
					session.setAttribute("userroles", "Verified User");
					
					request.setAttribute("status", "Your Profile has been updated!");
					RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");	
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

}