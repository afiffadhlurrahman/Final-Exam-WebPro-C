<%@ include file = "include/mysql-connect.jsp" %>

<%@ include file="include/header.jsp"%>
<title>Catch-a-Rides</title>
<%@ include file="include/header2.jsp"%>


<body>
	<div class="container row p-0 m-0">
		<div class="col-9">
	        <h2 class="text-info">Car List</h2>
	    </div>
	    <div class="col-3">
	        <a href="createcar.jsp" class="btn btn-info form-control text-white">Create New Car </a>
	    </div>
    
		<div class="col-12 border p-3 mt-3">
			<table class="table table-striped border">
				<tr class="table-secondary">
					<th>
						No
					</th>
					<th>
						Name
					</th>
					<th>
						Transmition
					</th>
					<th>
						Model
					</th>
					<th>
						Brand
		            </th>
		            <th>
						Type
		            </th>
		            <th>
						Fuel Type
		            </th>
		            <th>
						Capacity
		            </th>
					<th>
		
		            </th>
				</tr>
				<%
					try {
					connection = DriverManager.getConnection(connectionUrl + database, userid, password);
					statement = connection.createStatement();
					String sql = "select * from car,brand,cartype where car.brandid = brand.brandid and car.cartypeid = cartype.cartypeid";
					resultSet = statement.executeQuery(sql);
					while (resultSet.next()) {
				%>
				<tr>
					<td>
						<%=resultSet.getString("CARID")%>
					</td>
					<td>
						<%=resultSet.getString("CARNAME")%>
					</td>
					<td>
						<%=resultSet.getString("CARTRANSMITION")%>
					</td>
					<td>
						<%=resultSet.getString("CARMODELTYPE")%>
					</td>
					<td>
						<%=resultSet.getString("BRANDNAME")%>
					</td>
					<td>
						<%=resultSet.getString("CARTYPENAME")%>
					</td>
					<td>
						<%=resultSet.getString("CARFUELTYPE")%>
					</td>
					<td align="center">
						<%=resultSet.getString("CARCAPACITY")%>
					</td>
					<td>
						<a href="rent.jsp?carid=<%=resultSet.getString("CARID")%>" class="btn btn-primary btn m-1" role="button">Rent</a>
		            	<a href="editcar.jsp?carid=<%=resultSet.getString("CARID")%>" class="btn btn-success btn m-1" role="button">Edit</a>
		            </td>
				</tr>
				<%
					}
					connection.close();
					} catch (Exception e) {
					e.printStackTrace();
					}
				%>
			</table>
		</div>
	</div>
</body>

<%@ include file="include/footer.jsp"%>