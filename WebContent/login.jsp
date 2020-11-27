<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body>
	<% String status = (String) request.getAttribute("status"); %>
	<% if (status != null) { %>
		<script> alert("<%=status%>")</script>
	<% } %>
	
	<div align="center">
		<form action="Login" method="post">
			Username or Email : <input type="text" name="useridentifier" required><br>
			Password : <input type="password" name="password" required><br>
			<input type="submit" value="Login">
		</form>
	</div>
</body>
</html>