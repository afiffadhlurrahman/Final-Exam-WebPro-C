<%@ include file = "include/mysql-connect.jsp" %>
<%@ include file="include/header.jsp"%>
<title>Catch-a-Rides</title>
<%@ include file="include/header2.jsp"%>

<%
	String carid1 = request.getParameter("carId");
	if(session == null || session.getAttribute("username") == null) {
		response.sendRedirect("rent.jsp?carid=" + carid1);
	}
%>

<h2 class="text-info">Create New Rent Car</h2>

<div class="border container" style="padding: 30px;">
	<form method="post" action="CreateCarrent">
		<div class="form-group row">
			<div class="col-3">
				<label for="inputName" class="col-sm-10 col-form-label">Car Name</label>
			</div>
			<div class="col-6">
				<%
					try {
						connection = DriverManager.getConnection(connectionUrl + database, userid, password);
						statement = connection.createStatement();
						String sql = "select * from car";
						resultSet = statement.executeQuery(sql);
				%>
				<input type="hidden" id = "car" name="car" value="<%=carid1%>">
				<input type="text" readonly class="form-control" value="<%= resultSet.getString("CARNAME") %>" >
				<%
					connection.close();			
					} catch (Exception e) {
					e.printStackTrace();
					}
				%>
			</div>
		</div>
		
		<div class="form-group row">
			<div class="col-3">
				<label for="inputLicense" class="col-sm-10 col-form-label">Car License Number</label>
			</div>
			<div class="col-6">
				<input type="text" class="form-control" name="license"
					placeholder="Car License">
			</div>
		</div>
		
		<div class="form-group row">
			<div class="col-3">
				<label for="inputYear" class="col-sm-10 col-form-label">Car Year</label>
			</div>
			<div class="col-6">
				<select class="form-control" id="year" name="year">
					<%
						for(int i = 2009; i < 2021; i++)
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
			<div class="col-3">
				<label for="inputPrice" class="col-sm-10 col-form-label">Car Rent Price</label>
			</div>
			<div class="col-6">
				<select class="form-control" id="price" name="price">
					<%
						for(int j = 300000; j <= 600000; j+=50000)
						{		
					%>
							<option value="<%=j%>"><%=j%></option>
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