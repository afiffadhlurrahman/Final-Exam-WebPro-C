<%@ include file="include/mysql-connect.jsp" %>
<%@ include file="include/header.jsp"%>
	<title>MyProfile</title>
	<link rel="stylesheet" href="css/authstyle.css">
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script>
		$(document).ready(function() {
			$('#state').ready(function() {  fillOptions('city'); });
			$('#state').change(function() { fillOptions('city'); });
		});
		function fillOptions(dropdownId) {
			var dropdown = $('#' + dropdownId);
 			$.getJSON('EditProfile?type=' + dropdownId + '&value=' + $("#state").val(),
			function(opts) {
				$('>option', dropdown).remove();
				if (opts) {
					$.each(opts, function(key, value) {
						dropdown.append($('<option/>').val(key).text(value));
					});
				} else {
					dropdown.append($('<option/>').text('Please Huhu ' + dropdownId));
				}
			});
		}
	</script>
<%@ include file="include/header2.jsp"%>

<% if (session != null && session.getAttribute("username") != null) { %>

	<% String status = (String) request.getAttribute("status"); %>
	<% if (status != null) { %>
		<script> alert("<%=status%>")</script>
	<% request.setAttribute("status", null); 
	} %>

<h1 id="content-title">Edit Profile</h1>


<%
	try {
		connection = DriverManager.getConnection(connectionUrl + database, userid, password);
		statement = connection.createStatement();
		String sql = "Select * From USERS LEFT JOIN CITY on users.cityid = city.cityid LEFT JOIN STATE on state.stateid = city.stateid WHERE userid=" + session.getAttribute("userid");
		resultSet = statement.executeQuery(sql);
		
		resultSet.next();
%>

<div class="bg-white shadow rounded" style="padding-bottom: 50px">
	<div class="px-4 pt-0 pb-4 bg-dark">
		<div class="media align-items-end profile-header">
			<div class="profile mr-3">
				<img src="img/<%=resultSet.getString("userpicture")%>" width="130" class="rounded mb-2 img-thumbnail">
				<a href="profile.jsp" class="btn btn-dark btn-sm btn-block">View Profile</a>
			</div>
			
			<div class="media-body mb-5 text-white">
				<h4 class="mt-0 mb-0"><%= resultSet.getString("userfirstname") + " " + resultSet.getString("userlastname") %></h4>
				<p class="small mb-4">
					<i class="fa fa-map-marker mr-2"></i>
					<% 
						int city_id = resultSet.getInt("cityid");
						if(resultSet.wasNull()){
							%>Not Set<%
						}
						else{
							try{
								Statement statementCity = connection.createStatement();
								String sqlCity = "SELECT * FROM city LEFT JOIN state ON state.STATEID = city.STATEID WHERE cityid=" 
										+ String.valueOf(city_id);
								ResultSet resultSetCity = statementCity.executeQuery(sqlCity);
								
								resultSetCity.next();
								%> <%=resultSetCity.getString("cityname") + ", " + resultSetCity.getString("statename") %> <% 
							} catch(Exception e){
								e.printStackTrace();
							}
						}
					%>
				</p>
			</div>
		</div>
	</div>
	
	<div style="margin-top: 100px;">
		<form method="post" action="EditProfile" enctype = "multipart/form-data">

			<div class="form-group row">
				<div class="col-3">
					<label for="" class="col-sm-2 col-form-label">Name</label>
				</div>
				<div class="col-3">
					<input type="text" class="form-control" name="firstname" placeholder="Firstname" value="<%=resultSet.getString("userfirstname") %>" required>
				</div>
				<div class="col-3">
					<input type="text" class="form-control" name="lastname" placeholder="Lastname" value="<%=resultSet.getString("userlastname") %>" required>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-3">
					<label for="" class="col-sm-2 col-form-label">Email</label>
				</div>
				<div class="col-6">
					<input type="email" class="form-control" name="email" placeholder="Email" value="<%=resultSet.getString("useremail") %>" required>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-3">
					<label for="" class="col-sm-2 col-form-label">Phone</label>
				</div>
				<div class="col-6">
					<input type="tel" pattern="[0-9]{10-14}" class="form-control" name="phone" placeholder="Phone" value="<%if(resultSet.getString("userphone") != null) { %> <%=resultSet.getString("userphone")%> <%}%>" required>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-3">
					<label for="" class="col-sm-2 col-form-label">Address</label>
				</div>
				<div class="col-6">
					<textarea class="form-control" name="address" placeholder="Address" required><%if(resultSet.getString("useraddress") != null) { %> <%=resultSet.getString("useraddress")%> <%}%></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-3">
				</div>
				<div class="col-3">
					<select class="form-control" id="state" name="state">
						<option value="">Select State</option>
						<%
							try {
							Statement statementState = connection.createStatement();
							String sqlState = "Select * from State";
							ResultSet resultState = statementState.executeQuery(sqlState);

							while (resultState.next()) {
						%>
						<option <%if(resultSet.getInt("stateid") == resultState.getInt("stateid")){ %> <%="selected"%> <%}%> value="<%=resultState.getInt("stateid")%>" required><%=resultState.getString("statename")%></option>
						<%
							}
							connection.close();
							} catch (Exception e) {
							e.printStackTrace();
							}
						%>
					</select>					
				</div>
				<div class="col-3">
					<select class="form-control" id="city" name="city">
						<option>Please select state</option>
					</select>					
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-3">
					<label for="" class="col-sm-8 col-form-label">Change Password</label>
				</div>
				<div class="col-6">
					<input type="password" class="form-control" name="password" placeholder="Your New Password" value="">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-3">
				</div>
				<div class="col-6">
					<input type="password" class="form-control" name="confirmpassword" placeholder="Confirmation New Password" value="">
				</div>
			</div>

			<div class="form-group row">
				<div class="col-3">
					<label for="" class="col-sm-8 col-form-label">Change Picture</label>
				</div>
				<div class="col-6">
					<input type="file" name="picture" accept="image/gif, image/jpeg, image/png">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-3 offset-3">
					<input type="submit" value="Save Edit"
						class="btn btn-primary form-control" />
				</div>
				<div class="col-3">
					<a href="profile.jsp" class="btn btn-success form-control">Back to Profile</a>
				</div>
			</div>

		</form>
	</div>
</div>

<% 
	connection.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
} else {
	response.sendRedirect("index.jsp");
}
%>

<%@ include file="include/footer.jsp"%>