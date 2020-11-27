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
	<% } %>
		
	<div class="split left text-center">
		<div class='box'>
			<form action="Login" method="post">
				<div class="form-group">
					<h1 class="h3 mb-3 font-weight-normal">Register</h1>

					<div class"form-group"">
						<div class="row">
		                	<div class="col-md-6">
								<label for="firstname" class="sr-only">Username or Email</label> 
								<input type="text" class="form-control" name="firstname" placeholder="Firstname" required><br>
							</div>
							
							<div class="col-md-6">
								<label for="lastname" class="sr-only">Username or Email</label> 
								<input type="text" class="form-control" name="lastname" placeholder="Lastname" required><br>
							</div>
						</div>
						
						<label for="username" class="sr-only">Username</label> 
						<input type="text" class="form-control" name="username" placeholder="Username" required><br>
						
						<label for="email" class="sr-only">Username or Email</label> 
						<input type="email" class="form-control" name="email" placeholder="Email" required><br>
						
						<label for="password" class="sr-only">Username or Email</label> 
						<input type="password" class="form-control" name="password" placeholder="Password" required><br>
						
						<label for="confirmpassword" class="sr-only">Username or Email</label> 
						<input type="password" class="form-control" name="confirmpassword" placeholder="Confirm Password" required><br>
					</div>
							
					<button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
				</div>
				<a href='login.jsp'>Have an account? Login here!</a>
				
			</form>
		</div>
	</div>
	<div class="split right"></div>
</body>
</html>