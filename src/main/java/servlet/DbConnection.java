package servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
	private Connection conn;
	private final String connection = "jdbc:postgresql://ec2-75-101-232-85.compute-1.amazonaws.com:5432/";
	private final String databaseName = "dfalbvt4sto55c";
	private final String dbUser = "xhlibjubjbeusm";
	private final String dbPass = "7d1ee716048008edaafe8966d85bad4f872e19898947418a9c5e70cef25c8f8c";


	public DbConnection() throws SQLException, ClassNotFoundException  {
		super();
		try {
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection(this.connection + this.databaseName, this.dbUser, this.dbPass);
			if (conn != null) {
				System.out.println("Connected");
			}else {
				System.out.println("NO");
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConn() {
		return conn;
	}
	
}
