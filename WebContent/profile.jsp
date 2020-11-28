<%@ include file="include/mysql-connect.jsp" %>
<%@ include file="include/header.jsp"%>
	<title>MyProfile</title>
	<link rel="stylesheet" href="css/authstyle.css">
<%@ include file="include/header2.jsp"%>

<% if (session != null && session.getAttribute("username") != null) { %>


<h1>Profile</h1>

<%
	try {
		connection = DriverManager.getConnection(connectionUrl + database, userid, password);
		statement = connection.createStatement();
		String sql = "Select * From USERS Where userid=" + session.getAttribute("userid");
		resultSet = statement.executeQuery(sql);
		
		resultSet.next();
%>

<div class="bg-white shadow rounded" style="padding-bottom: 50px">
	<div class="px-4 pt-0 pb-4 bg-dark">
		<div class="media align-items-end profile-header">
			<div class="profile mr-3">
				<img src="img/<%=resultSet.getString("userpicture")%>" width="130" class="rounded mb-2 img-thumbnail">
				<a href="editprofile.jsp" class="btn btn-dark btn-sm btn-block">Edit profile</a>
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
		<table class="table">
			<tbody>
				<tr class="d-flex">
					<td class="col-3">Username</td>
					<td class="col-9"><%= resultSet.getString("username") %></td>
				</tr>
				<tr class="d-flex">
					<td class="col-3">Email</td>
					<td class="col-9"><%= resultSet.getString("useremail") %></td>
				</tr>
				<tr class="d-flex">
					<td class="col-3">Phone</td>
					<td class="col-9"><%if(resultSet.getString("userphone") == null){ %> Not Set <% } else { %> <%=resultSet.getString("userphone")%> <%}%></td>
				</tr>
				<tr class="d-flex">
					<td class="col-3">Address</td>
					<td class="col-9"><%if(resultSet.getString("useraddress") == null){ %> Not Set <% } else { %> <%=resultSet.getString("useraddress")%> <%}%></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<% 
	} catch (Exception e) {
		e.printStackTrace();
	}
} else {
	response.sendRedirect("index.jsp");
}
%>

<%@ include file="include/footer.jsp"%>