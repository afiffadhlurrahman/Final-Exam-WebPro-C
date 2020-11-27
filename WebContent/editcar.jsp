<%@ include file = "include/mysql-connect.jsp" %>

<%@ include file="include/header.jsp"%>
<title>Catch-a-Rides</title>
<%@ include file="include/header2.jsp"%>

<body>
	<h2 class="text-info">Edit Car</h2>
	
	<div class="border container" style="padding:30px;">
		<form>
			<div class="form-group row">
			 	<div class="col-3">
					<label for="inputName" class="col-sm-2 col-form-label">Name</label>
				</div>
			 	<div class="col-6">
			    	<input type="name" class="form-control" id="inputName" placeholder="Car Name">
			    </div>
			</div>
			<div class="form-group row">
				<div class="col-3">
					<label for="inputTransmission" class="col-sm-2 col-form-label">Transmission</label>
				</div>
				<div class="col-6">
				      <input type="transmission" class="form-control" id="inputTransmission" placeholder="Car Transmission">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-3">
					<label for="inputModel" class="col-sm-2 col-form-label">Model</label>
				</div>
				<div class="col-6">
				      <input type="model" class="form-control" id="inputModel" placeholder="Car Model">
				</div>
			</div>
			<div class="form-group row">
	            <div class="col-3 offset-3">
	                <input type="submit" value="Edit" class="btn btn-primary form-control" />
	            </div>
	            <div class="col-3">
	                <a href="car.jsp" class="btn btn-success form-control" >Back to List</a>
	            </div>
	        </div>
	 	</form>
	</div>
</body>

<%@ include file="include/footer.jsp"%>


