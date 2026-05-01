<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Admin Sidebar</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminSidebar.css">
	</head>
	
	<body>
	
		<div class="sidePanel">
            <p class="Logo">The E-spot</p>

            <br>
            <a href="${pageContext.request.contextPath}/dashboard" style="text-decoration: none;">
			    <span class="rectangle ${currentPage == 'dashboard' ? 'active' : ''}">Dashboard</span>
			</a>
            <br>

			<a href="${pageContext.request.contextPath}/listing" style="text-decoration: none;">
			    <span class="rectangle ${currentPage == 'listing' ? 'active' : ''}">Listings</span>
			</a>
            <br>

			<a href="${pageContext.request.contextPath}/users" style="text-decoration: none;">
			    <span class="rectangle ${currentPage == 'users' ? 'active' : ''}">Users</span>
			</a>
            <br>

			<a href="${pageContext.request.contextPath}/revenue" style="text-decoration: none;">
			    <span class="rectangle ${currentPage == 'revenue' ? 'active' : ''}">Revenue</span>
			</a>
            <br>

			<a href="${pageContext.request.contextPath}/order" style="text-decoration: none;">
			    <span class="rectangle ${currentPage == 'orders' ? 'active' : ''}">Orders</span>
			</a>
            <br>

			<a href="${pageContext.request.contextPath}/flagged" style="text-decoration: none;">
			    <span class="rectangle ${currentPage == 'flagged' ? 'active' : ''}">Flagged Items</span>
			</a>
            <br>

			<a href="#" style="text-decoration: none;">
			    <span class="rectangle ${currentPage == 'reports' ? 'active' : ''}">Reports</span>
			</a>   
            <br>

            <div class="sideShow">
                <div class="sideInfo">
                    <button class="logout">Logout</button>
                </div>
            </div>
        </div>
	</body>
</html>