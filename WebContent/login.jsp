<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="include/header.jsp"%>

	<title>Login</title>
	<link rel="stylesheet" href="css/authstyle.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

	<% String status = (String) request.getAttribute("status"); %>
	<% if (status != null) { %>
		<script> alert("<%=status%>")</script>
	<% request.setAttribute("status", null); 
	} %>

	<div class="split left text-center">
		<div class='box'>
			<form action="Login" method="post">
				<div class="form-group">
					<h1 class="h3 mb-3 font-weight-normal">Login</h1>
				
					<div class="form-group">
						<label for="useridentifier" class="sr-only">Username or Email</label> 
						<input type="text" class="form-control" name="useridentifier" placeholder="Username or email" required><br>
						
						<label for="password" class="sr-only">Password</label>
						<input type="password" class="form-control" name="password" placeholder="Password" required><br>
					</div>

					<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
				</div>
				
				<a href='registration.jsp'>Don't have an account? Create one here!</a>
			</form>
		</div>
	</div>
	<div class="split right"></div>
</body>
</html>