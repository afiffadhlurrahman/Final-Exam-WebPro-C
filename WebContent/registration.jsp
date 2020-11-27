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
		<form action="Registration" method="post">
			Username : <input type="text" name="username" required><br>
			Firstname : <input type="text" name="firstname" required><br>
			Lastname : <input type="text" name="lastname" required><br>
			Email : <input type="email" name="email" required><br>
			Password : <input type="password" name="password" required><br>
			Confirm Password : <input type="password" name="confirmpassword" required><br>	
			
			 
			<input type="submit" value="Register">
		</form>
	</div>
</body>
</html>