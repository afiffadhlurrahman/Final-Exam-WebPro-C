<%@ include file = "include/mysql-connect.jsp" %>

<!DOCTYPE html>
<html>
<body>

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
</body>
</html>