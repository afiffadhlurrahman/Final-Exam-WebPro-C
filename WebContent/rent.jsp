<%@ include file = "include/mysql-connect.jsp" %>

<%@ include file="include/header.jsp"%>
<title>Catch-a-Rides</title>
<%@ include file="include/header2.jsp"%>
<div class="container row p-0 m-0">
	<div class="col-9">
	        <h2 class="text-info">Car Rent</h2>
	</div>
		    
	<div class="col-3">
	        <a href="createcarrent.jsp" class="btn btn-info form-control text-white">Create New Rent Car </a>
	</div>
</div>
<br>

<div>
<%
		try {
		String carId1 = request.getParameter("carid");
		connection = DriverManager.getConnection(connectionUrl + database, userid, password);
		statement = connection.createStatement();
		String sql = "select * from car,cartype,user,carrent where car.cartypeid = cartype.cartypeid and user.userid = carrent.userid and carrent.carid=car.carid and car.carid = "+ carId1;
		resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
%>	    
	<div class="border container"
		style="padding: 30px; display: inline-block;">
		<form method="post" action="EditCar">
			<div class="form-group row">
				<div class="col-3">
					<label for="inputName" class="col-sm-6 col-form-label">Car
						Name</label>
				</div>
				<div class="col-6">
					<label for="inputName" class="col-sm-10 col-form-label"><%=resultSet.getString("CARNAME")%></label>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-3">
					<label for="inputTransmition" class="col-sm-8 col-form-label">Tenant
						Name</label>
				</div>
				<div class="col-6">
					<label for="inputName" class="col-sm-10 col-form-label"><%=resultSet.getString("USERFIRSTNAME") + " " + resultSet.getString("USERLASTNAME")%></label>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-3">
					<label for="inputModel" class="col-sm-10 col-form-label">Car
						Licence Number</label>
				</div>
				<div class="col-6">
					<label for="inputName" class="col-sm-10 col-form-label"><%=resultSet.getString("CARLICENCENUMBER")%></label>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-3">
					<label for="inputModel" class="col-sm-10 col-form-label">Car
						Rent Price</label>
				</div>
				<div class="col-6">
					<label for="inputName" class="col-sm-10 col-form-label"><%=resultSet.getString("CARRENTPRICE")%></label>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-3">
					<label for="inputModel" class="col-sm-10 col-form-label">Car
						Year</label>
				</div>
				<div class="col-6">
					<label for="inputName" class="col-sm-10 col-form-label"><%=resultSet.getString("CARRENTYEAR")%></label>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-3">
					<label for="inputBrand" class="col-sm-10 col-form-label">Car
						Rent Status</label>
				</div>
				<div class="col-6">
					<%
						String statusCar;
					if (resultSet.getInt("CARRENTSTATUS") == 1) {
						statusCar = "Available";
					} else {
						statusCar = "Not Available";
					}
					%>
					<label for="inputName" class="col-sm-10 col-form-label"><%=statusCar%></label>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-6">
					<input readonly type="hidden" value="<%=resultSet.getInt("CARID")%>"
						name="carid" class="form-control" id="ID" placeholder="Car ID">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-2 offset-3">
					<a href="editcarrent.jsp?carrentid=<%=resultSet.getString("CARRENTID")%>" class="btn btn-primary form-control" role="button"> Edit </a>
				</div>
				<div class="col-2">
					<a href="car.jsp" class="btn btn-success form-control">Back to
						List</a>
				</div>	
				<div class="col-2">
					<a href="deletecarrent.jsp?carrentid=<%=resultSet.getString("CARRENTID")%>" class="btn btn-danger form-control" role="button"> Delete </a>
				</div>	
			</div>
		</form>
	</div>
<%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
%>
</div>


<%@ include file="include/footer.jsp"%>