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

<div class="bg-white shadow rounded">
	<div class="px-4 pt-0 pb-4 bg-dark">
		<div class="media align-items-end profile-header">
			<div class="profile mr-3">
				<img src="img/<%=resultSet.getString("userpicture")%>" width="130" class="rounded mb-2 img-thumbnail">
				<a href="#" class="btn btn-dark btn-sm btn-block">Edit profile</a>
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
							Statement statementCity = connection.createStatement();
							String sqlCity = "SELECT * FROM city LEFT JOIN state ON state.STATEID = city.STATEID WHERE cityid=" 
									+ String.valueOf(city_id);
							ResultSet resultSetCity = statement.executeQuery(sqlCity);
							
							resultSetCity.next();
							%> <%=resultSetCity.getString("cityname") + ", " + resultSetCity.getString("statename") %> <% 
						}
					%>
				</p>
			</div>
		</div>
	</div>
</div>

<%
		} catch (Exception e) {
			e.printStackTrace();
		}

	} else {

//response.sendRedirect("index.jsp");
}
%>

<%@ include file="include/footer.jsp"%>



<%@ include file="include/footer.jsp"%>