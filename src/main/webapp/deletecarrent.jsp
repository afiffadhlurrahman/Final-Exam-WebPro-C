<%@ include file="include/header.jsp"%>
<title>Catch-a-Rides</title>
<%@ include file="include/header2.jsp"%>

<body>
	<h2 class="text-info">Delete Car</h2>
	<%
		String carrentId = request.getParameter("carrentid");
		try {
			Class.forName("org.postgresql.Driver");
			Connection connection = new DbConnection().getConn();
			Statement statement = connection.createStatement();
			int i = statement.executeUpdate("DELETE FROM CARRENT WHERE CARRENTID=" + carrentId);
			out.println("Data Deleted Successfully!");
			RequestDispatcher rd = request.getRequestDispatcher("car.jsp");	
			rd.forward(request, response);
		}
		catch(Exception e)
		{
			System.out.print(e);
			e.printStackTrace();
		}
	%>
</body>