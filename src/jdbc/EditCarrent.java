package jdbc;

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
 * Servlet implementation class EditCarrent
 */
@WebServlet("/EditCarrent")
public class EditCarrent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCarrent() {
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
			int carId = Integer.parseInt(request.getParameter("carid"));
			int carrentId = Integer.parseInt(request.getParameter("carrentid"));
			String license = request.getParameter("license");
			int price = Integer.parseInt(request.getParameter("price"));
			int status = Integer.parseInt(request.getParameter("status"));
			 
			String sql = "UPDATE CARRENT SET CARLICENCENUMBER=?,CARRENTPRICE=?,CARRENTSTATUS=? WHERE CARRENTID=?";
			Connection conn = new DbConnection().getConn();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, license);
			ps.setInt(2, price);
			ps.setInt(3, status);
			ps.setInt(4, carrentId);
			
			ps.executeUpdate();
			String req = "rent.jsp?carid=" + carId;
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
