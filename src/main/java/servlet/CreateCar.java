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

/**
 * Servlet implementation class CreateCar
 */
@WebServlet("/CreateCar")
public class CreateCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateCar() {
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
			String name = request.getParameter("name");
			String transmition = request.getParameter("transmition");
			String model = request.getParameter("model");
			int brandid = Integer.parseInt(request.getParameter("brand"));
			int cartypeid = Integer.parseInt(request.getParameter("type"));
			int capacity = Integer.parseInt(request.getParameter("capacity"));
			String fueltype = request.getParameter("fuel"); 
			String sql = "INSERT INTO CAR(brandid,cartypeid,carname, cartransmition, carmodeltype,carcapacity,carfueltype) VALUES (?,?,?,?,?,?,?)";
			
			Connection conn = new DbConnection().getConn();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, brandid);
			ps.setInt(2, cartypeid);
			ps.setString(3, name);
			ps.setString(4, transmition);
			ps.setString(5, model);
			ps.setInt(6, capacity);
			ps.setString(7, fueltype);
			
			ps.executeUpdate();
			
			RequestDispatcher rd = request.getRequestDispatcher("car.jsp");	
			rd.forward(request, response);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
