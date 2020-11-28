<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<ul class="navbar-nav">
	<%if(session != null && session.getAttribute("username") != null) { %>
    <li class="nav-item">
        <a class="nav-link text-dark" href="profile.jsp">Hello <%=session.getAttribute("email") %></a>
    </li>
    <li class="nav-item">
    	<form action="Logout" method="post">
    		<button class="nav-link btn btn-link text-dark" type="submit">Logout</button>
    	</form>
    </li>
    <%} else {%>
	    <li class="nav-item">
	        <a class="nav-link text-dark" href="registration.jsp">Register</a>
	    </li>
	    <li class="nav-item">
	        <a class="nav-link text-dark" href="login.jsp">Login</a>
	    </li>
    <%} %>
</ul>
