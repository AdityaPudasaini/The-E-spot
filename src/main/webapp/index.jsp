<html>
	<head>
		<title>The E-spot</title>
	</head>
	
	<body>
		<nav>
			<div class="Logo">The E-sopt</div>

			<div class="linksToNavigate">
				<a href="#">Browse</a>
				<a href="#">Sell</a>
				<a href="#"> About</a>
			</div>

			<form action="<%=request.getContextPath()%>/register" method="get">
				<button type="submit">Go to Registration</button>
			</form>

			<form action="<%=request.getContextPath()%>/login" method="get">
				<button type="submit">Go to Login</button>
			</form>
		</nav>

	
		<form action="<%=request.getContextPath()%>/register" method="get">
			<button type="submit">Go to Dashboard</button>
		</form>
	</body>
</html>
