<%@ include file="include/header.jsp"%>
<title>Catch-a-Rides</title>
<%@ include file="include/header2.jsp"%>



<h2 class="text-info">Create New Car</h2>

<div class="border container" style="padding: 30px;">
	<form method="post" action="CreateCar">
		<div class="form-group row">
			<div class="col-3">
				<label for="inputName" class="col-sm-2 col-form-label">Name</label>
			</div>
			<div class="col-6">
				<input type="text" class="form-control" name="name"
					placeholder="Car Name">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-3">
				<label for="inputTransmition" class="col-sm-2 col-form-label">Transmition</label>
			</div>
			<div class="col-6">
				<select class="form-control" id="transmition" name="transmition">
					<option value="Manual">Manual</option>
					<option value="Matic">Matic</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-3">
				<label for="inputModel" class="col-sm-2 col-form-label">Model</label>
			</div>
			<div class="col-6">
				<input type="text" class="form-control" name="model"
					placeholder="Car Model">
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
						String sql = "select * from brand";
						ResultSet resultSet = statement.executeQuery(sql);
						while (resultSet.next()) {
					%>
					<option value="<%=resultSet.getInt("BRANDID")%>"> <%=resultSet.getString("BRANDNAME")%> </option>
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
						String sql = "select * from cartype";
						ResultSet resultSet = statement.executeQuery(sql);
						while (resultSet.next()) {
					%>
					<option value="<%=resultSet.getInt("CARTYPEID")%>"><%=resultSet.getString("CARTYPENAME")%></option>
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
				<label for="fuel" class="col-sm-5 col-form-label">Fuel Type</label>
			</div>
			<div class="col-6">
				<select class="form-control" id="fuel" name="fuel">
					<option value="Diesel">Diesel</option>
					<option value="Ethanol">Ethanol</option>
					<option value="Bio Diesel">Bio Diesel</option>
					<option value="Electric">Electric</option>
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
							<option value="<%=i%>"><%=i%></option>
					<%
						}
					%>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-3 offset-3">
				<input type="submit" value="Create"
					class="btn btn-primary form-control" />
			</div>
			<div class="col-3">
				<a href="car.jsp" class="btn btn-success form-control">Back to List</a>
			</div>
		</div>
	</form>
</div>



<%@ include file="include/footer.jsp"%>