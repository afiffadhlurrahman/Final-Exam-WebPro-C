<%@ include file = "include/mysql-connect.jsp" %>

<%@ include file="include/header.jsp"%>
<title>Catch-a-Rides</title>
<%@ include file="include/navbar.jsp"%>

<div class="container">
	<main role="main" class="pb-3">
		<h1>Retrieve data from database in jsp</h1>
		<table border="1">
			<tr>
				<td>ID</td>
				<td>Name</td>
				<td>Desc</td>
				<td>Logo</td>
			</tr>
			<%
				try {
				connection = DriverManager.getConnection(connectionUrl + database, userid, password);
				statement = connection.createStatement();
				String sql = "select * from brand";
				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
			%>
			<tr>
				<td><%=resultSet.getString("BRANDID")%></td>
				<td><%=resultSet.getString("BRANDNAME")%></td>
				<td><%=resultSet.getString("BRANDDESC")%></td>
				<td><%=resultSet.getString("BRANDLOGO")%></td>
			</tr>
			<%
				}
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</table>
	</main>
</div>

<%@ include file="include/footer.jsp"%>