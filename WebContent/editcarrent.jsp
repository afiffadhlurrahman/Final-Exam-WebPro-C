<%@ include file = "include/mysql-connect.jsp" %>

<%@ include file="include/header.jsp"%>
<title>Catch-a-Rides</title>
<%@ include file="include/header2.jsp"%>

<body>
	<h2 class="text-info">Edit Car</h2>
	<%
		try {
		String carId1 = request.getParameter("carrentid");
		connection = DriverManager.getConnection(connectionUrl + database, userid, password);
		statement = connection.createStatement();
		String sql = "select * from car,cartype,user,carrent where car.cartypeid = cartype.cartypeid and user.userid = carrent.userid and carrent.carid=car.carid and car.carid = "+ carId1;
		resultSet = statement.executeQuery(sql);
		resultSet.next();
	%>
	
	<div class="border container" style="padding:30px;">
		<form method="post" action="EditCarrent">
			<div class="form-group row">
			 	<div class="col-3">
					<label for="inputName" class="col-sm-10 col-form-label">Name</label>
				</div>
			 	<div class="col-6">
			    	<input readonly type="text" value="<%=resultSet.getString("CARNAME")%>" class="form-control" name="name" id="inputName" placeholder="Car Name">
			    </div>
			</div>
			<div class="form-group row">
				<div class="col-3">
					<label for="inputNameUser" class="col-sm-10 col-form-label">Tenant Name</label>
				</div>
				<div class="col-6">
					<input readonly type="text" value="<%=resultSet.getString("USERFIRSTNAME") + " " + resultSet.getString("USERLASTNAME")%>" class="form-control" name="nameUser" id="inputNameUser" placeholder="Name User">		      
				</div>
			</div>
			<div class="form-group row">
				<div class="col-3">
					<label for="inputLicense" class="col-sm-10 col-form-label">Car License Number</label>
				</div>
				<div class="col-6">
					<input type="text" value="<%=resultSet.getString("CARLICENCENUMBER")%>" class="form-control" name="license" id="inputLicense" placeholder="Car License Number">			      
				</div>
			</div>
			<div class="form-group row">
				<div class="col-3">
					<label for="inputPrice" class="col-sm-10 col-form-label">Car Rent Price</label>
				</div>
				<div class="col-6">
				      <input type="text" value="<%=resultSet.getInt("CARRENTPRICE")%>" class="form-control" id="inputPrice" name="price" placeholder="Car Rent Price">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-3">
					<label for="inputYear" class="col-sm-10 col-form-label">Car Year</label>
				</div>
				<div class="col-6">
				      <input readonly type="text" value="<%=resultSet.getInt("CARRENTYEAR")%>" class="form-control" id="inputYear" name="year" placeholder="Car Year">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-3">
					<label for="inputBrand" class="col-sm-10 col-form-label">Car Rent Status</label>
				</div>
				<div class="col-6">
				     <select class="form-control" id="status" name="status">
						<option <%if(resultSet.getInt("CARRENTSTATUS") == 1){ %> <%="selected"%> <%}%> value="1">Not Available</option>
  						<option <%if(resultSet.getInt("CARRENTSTATUS") == 0){ %> <%="selected"%> <%}%> value="0">Available</option>		
					</select>	
				</div>
			</div>
			<div class="form-group row">
			 	<div class="col-6">
			    	<input readonly type="hidden" value="<%=resultSet.getInt("CARID")%>" name="carid" class="form-control" id="IDcar">
			    </div>
			</div>
			<div class="form-group row">
			 	<div class="col-6">
			    	<input readonly type="hidden" value="<%=resultSet.getInt("CARRENTID")%>" name="carrentid" class="form-control" id="ID">
			    </div>
			</div>
			<div class="form-group row">
	            <div class="col-3 offset-3">
	                <input type="submit" value="Edit" class="btn btn-primary form-control" />
	            </div>
	            <div class="col-3">
	                <a href="car.jsp" class="btn btn-success form-control" >Back to List</a>
	            </div>
	        </div>
	 	</form>
	</div>
	<%
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
	%>
</body>

<%@ include file="include/footer.jsp"%>