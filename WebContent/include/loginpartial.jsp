<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<ul class="navbar-nav">
	<%if(session != null && session.getAttribute("username") != null) { %>
    <li class="nav-item">
        <a class="nav-link text-dark" href="#">Hello <%=session.getAttribute("email") %></a>
    </li>
    <li class="nav-item">
    	<a class="nav-link text-dark" href="#">Logout</a>
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
