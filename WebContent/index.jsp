<%@ include file="include/mysql-connect.jsp"%>

<%@ include file="include/header.jsp"%>
<title>Catch-a-Rides</title>
<%@ include file="include/header2.jsp"%>

<% if(session != null && session.getAttribute("username") != null) { 
	%> <h1>Welcome, <%=session.getAttribute("firstname") 
			+ " " + session.getAttribute("lastname")%> </h1><br> <%
} %>

<div class="billboard">
	<img src="img/billboard.jpg" />
	<div class="overlay">
		<h1>Catch' a Rides Here, Folks</h1>
	</div>
</div>

<div class="comment">
	<h1>What Clients Says:</h1>
	<div class="box">
		<p>Car in nice condition. <br><B>-Raferto</B></p>
	</div>

	<div class="box">
		<p>great car. <br><B>-Elby</B></p>
	</div>

	<div class="box">
		<p>This is a comment :v <br><B>-Pipu</B></p>
	</div>
</div>

<%@ include file="include/footer.jsp"%>