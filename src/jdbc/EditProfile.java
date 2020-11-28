package jdbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class EditProfile
 */
@WebServlet("/EditProfile")
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
		String type = request.getParameter("type");
	    String value = request.getParameter("value");
	    System.out.println(value);
	    
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
		if(contentType != null && contentType.indexOf("multipart/form-data") >=0 ) {
			System.out.println("Hehe");
			
			try {
				String username = request.getParameter("username");
				String firstname = request.getParameter("firstname");
				String lastname = request.getParameter("lastname");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				String address = request.getParameter("address");
				
				String password = request.getParameter("password");
				String confirmPassword = request.getParameter("confirmpassword");
			
				Connection conn = new DbConnection().getConn();
				
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else {
			
			
		}
	}

}
