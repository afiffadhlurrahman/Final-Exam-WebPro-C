<%@ include file = "include/mysql-connect.jsp" %>

<%@ include file="include/header.jsp"%>
<title>Catch-a-Rides</title>
<%@ include file="include/header2.jsp"%>
<style>
.carousel .carousel-item {
  height: 600px;
}

.carousel-item img {
    position: absolute;
    top: 0;
    left: 0;
    min-height: 300px;
}
</style>
<body>
	<div class="carousel slide" data-ride="carousel" id="carouselExampleIndicators">
		<ol class="carousel-indicators">
			<li class="active" data-slide-to="0"
				data-target="#carouselExampleIndicators"></li>
			<li data-slide-to="1" data-target="#carouselExampleIndicators"></li>
			<li data-slide-to="2" data-target="#carouselExampleIndicators"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img alt="First slide" class="d-block w-100"
					src="img/slide1.jpg">
				<div class="carousel-caption d-none d-md-block">
					<h5>Slider One Item</h5>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Maxime, nulla, tempore. Deserunt excepturi quas vero.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img alt="Second slide" class="d-block w-100" src="img/slide2.jpg">
				<div class="carousel-caption d-none d-md-block">
					<h5>Slider One Item</h5>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Maxime, nulla, tempore. Deserunt excepturi quas vero.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img alt="Third slide" class="d-block w-100"
					src="img/slide3.jpg">
				<div class="carousel-caption d-none d-md-block">
					<h5>Slider One Item</h5>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Maxime, nulla, tempore. Deserunt excepturi quas vero.</p>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" data-slide="prev"
			href="#carouselExampleIndicators" role="button"><span
			aria-hidden="true" class="carousel-control-prev-icon"></span> <span
			class="sr-only">Previous</span></a> <a class="carousel-control-next"
			data-slide="next" href="#carouselExampleIndicators" role="button"><span
			aria-hidden="true" class="carousel-control-next-icon"></span> <span
			class="sr-only">Next</span></a>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js">
		
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
		
	</script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js">
	</script>
</body>
</br>
</br>
</br>
<%@ include file="include/footer.jsp"%>