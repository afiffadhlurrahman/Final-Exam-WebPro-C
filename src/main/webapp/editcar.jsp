<%@ include file="include/header.jsp"%>
<title>Catch-a-Rides</title>
<%@ include file="include/header2.jsp"%>

<body>
	<h2 class="text-info">Edit Car</h2>
	<%
		try {
		String carId1 = request.getParameter("carid");
		Connection connection = new DbConnection().getConn();
		Statement statement = connection.createStatement();
		String sql = "select * from car,brand,cartype where car.brandid = brand.brandid and car.cartypeid = cartype.cartypeid and  carid = "+ carId1;
		ResultSet resultSet = statement.executeQuery(sql);
		resultSet.next();
	%>
	
	<div class="border container" style="padding:30px;">
		<form method="post" action="EditCar">
			<div class="form-group row">
			 	<div class="col-3">
					<label for="inputName" class="col-sm-2 col-form-label">Name</label>
				</div>
			 	<div class="col-6">
			    	<input type="text" value="<%=resultSet.getString("CARNAME")%>" class="form-control" name="name" id="inputName" placeholder="Car Name">
			    </div>
			</div>
			<div class="form-group row">
				<div class="col-3">
					<label for="inputTransmition" class="col-sm-2 col-form-label">Transmition</label>
				</div>
				<div class="col-6">
					<select class="form-control" id="transmition" name="transmition">
						<option <%if(resultSet.getString("CARTRANSMITION").equals("Manual")){ %> <%="selected"%> <%}%> value="Manual">Manual</option>
  						<option <%if(resultSet.getString("CARTRANSMITION").equals("Matic")){ %> <%="selected"%> <%}%> value="Matic">Matic</option>		
					</select>				      
				</div>
			</div>
			<div class="form-group row">
				<div class="col-3">
					<label for="inputModel" class="col-sm-2 col-form-label">Model</label>
				</div>
				<div class="col-6">
				      <input type="text" value="<%=resultSet.getString("CARMODELTYPE")%>" class="form-control" id="inputModel" name="model" placeholder="Car Model">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-3">
					<label for="inputBrand" class="col-sm-2 col-form-label">Brand</label>
				</div>
				<div class="col-6">
				     	<select class="form-control" id="brand" name="brand">
						<%
							try {
							Connection connection = new DbConnection().getConn();
							Statement statement = connection.createStatement();
							String sqlBrand = "select * from brand";
							ResultSet resultBrand = statement.executeQuery(sqlBrand);
							while (resultBrand.next()) {
						%>
							<option <%if(resultSet.getInt("BRANDID") == resultBrand.getInt("BRANDID")){ %> <%="selected"%> <%}%> value="<%=resultBrand.getInt("BRANDID")%>"><%=resultBrand.getString("BRANDNAME")%></option>
						<%
							}
							connection.close();
							} catch (Exception e) {
							e.printStackTrace();
							}
						%>	
					</select>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-3">
					<label for="inputType" class="col-sm-2 col-form-label">Type</label>
				</div>
				<div class="col-6">
				      <select class="form-control" id="type" name="type">
						<%
							try {
							Connection connection = new DbConnection().getConn();
							Statement statement = connection.createStatement();
							String sqlType = "select * from cartype";
							ResultSet resultType = statement.executeQuery(sqlType);
							while (resultType.next()) {
						%>
							<option <%if(resultSet.getInt("CARTYPEID") == resultType.getInt("CARTYPEID")){ %> <%="selected"%> <%}%> value="<%=resultType.getInt("CARTYPEID")%>"><%=resultType.getString("CARTYPENAME")%></option>
						<%
							}
							connection.close();
							} catch (Exception e) {
							e.printStackTrace();
							}
						%>	
					</select>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-3">
					<label for="inputFuel" class="col-sm-5 col-form-label">Fuel Type</label>
				</div>
				<div class="col-6">
				    <select class="form-control" id="fuel" name="fuel">
						<option <%if(resultSet.getString("CARFUELTYPE").equals("Diesel")){ %> <%="selected"%> <%}%> value="Diesel">Diesel</option>
						<option <%if(resultSet.getString("CARFUELTYPE").equals("Ethanol")){ %> <%="selected"%> <%}%> value="Ethanol">Ethanol</option>
						<option <%if(resultSet.getString("CARFUELTYPE").equals("Bio Diesel")){ %> <%="selected"%> <%}%> value="Bio Diesel">Bio Diesel</option>
						<option <%if(resultSet.getString("CARFUELTYPE").equals("Electric")){ %> <%="selected"%> <%}%> value="Electric">Electric</option>
					</select>
				</div>
			</div>
	        <div class="form-group row">
				<div class="col-3">
			        <label for="capacity" class="col-sm-5 col-form-label">Capacity</label>
			    </div>
			    <div class="col-6">
			       <select class="form-control" id="capacity" name="capacity">
						<%
							for(int i = 2; i < 13; i++)
							{		
						%>
							<option <%if(resultSet.getInt("CARCAPACITY") == i){ %> <%="selected"%> <%}%> value="<%=i%>"><%=i%></option>
						<%
							}
						%>	
					</select>
			    </div>
			</div>
			<div class="form-group row">
			 	<div class="col-6">
			    	<input readonly type="hidden" value="<%=resultSet.getInt("CARID")%>" name="carid" class="form-control" id="ID" placeholder="Car ID">
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


