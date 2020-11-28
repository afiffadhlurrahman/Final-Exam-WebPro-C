package jdbc;

import jdbc.DbConnection;
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

/**
 * Servlet implementation class CreateCarrent
 */
@WebServlet("/CreateCarrent")
public class CreateCarrent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateCarrent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Integer carId = (Integer) Integer.parseInt(request.getParameter("car"));
			int tenant = Integer.parseInt(request.getParameter("tenant"));
			String license = request.getParameter("license");
			int year = Integer.parseInt(request.getParameter("year"));
			int price = Integer.parseInt(request.getParameter("price"));
			String sql = "INSERT INTO CARRENT(carid,userid,carlicencenumber, carrentprice, carrentyear,carrentstatus) VALUES (?,?,?,?,?,TRUE)";
			
			Connection conn = new DbConnection().getConn();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, carId);
			ps.setInt(2, tenant);
			ps.setString(3, license);
			ps.setInt(4, year);
			ps.setInt(5, price);
			
			ps.executeUpdate();
			
			String req = "rent.jsp?carid=" +carId;
			RequestDispatcher rd = request.getRequestDispatcher(req);	
			rd.forward(request, response);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
