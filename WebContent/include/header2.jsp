</head>

<body>
    <header>
        <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-light border-bottom box-shadow mb-3">
            <div class="container">
                <a class="navbar-brand">Catch' A Rides</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-collapse" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-collapse collapse d-sm-inline-flex flex-sm-row-reverse">
                    <ul class="navbar-nav flex-grow-1">
                        <li class="nav-item">
                            <a href='index.jsp' class="nav-link text-dark">Home</a>
                        </li>
                        <li class="nav-item">
							<a href='car.jsp' class="nav-link text-dark">Car</a>
						</li>
                    </ul>
                </div>
                <div class="navbar-collapse collapse d-sm-inline-flex flex-sm-row-reverse"> 
                    <%@ include file="loginpartial.jsp" %>
                </div>
            </div>
        </nav>
    </header>
    
<div class="container">
	<main class="pb-3">
		<div class="article">
