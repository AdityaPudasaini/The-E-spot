<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Listings</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/listing.css">
	</head>
	
	<body>
		<%@ include file="/WEB-INF/pages/adminSidebar.jsp" %>
		
		<div style="display: flex; flex-direction: column; margin-left: 250px; width: calc(100% - 250px);">

            <div class="topPart">
                <p class="dashboardHeading"><b>Listings</b></p>

                <div class="searchbar">
                    <p class="searchText">Search everything here</p>
                </div>

                <div class="adminPhoto" style="margin-top: 0px; margin-left: 45px">A</div>
            </div>

            <div class="categoriesSelect">
                <input type="text" class="searchInput" placeholder="Search listings">
                <select class="categories">
                    <option>All Categories</option>
                    <option>Shoes</option>
                    <option>Electronics</option>
                    <option>Audio</option>
                    <option>Accessories</option>
                    <option>Wearables</option>
                </select>
                <select class="categories">
                    <option>All Status</option>
                    <option>listed</option>
                    <option>sold</option>
                    <option>Flagged</option>
                </select>
            </div>
            
			<div class="lastPartButtons">
                <a href="#" class="lastPartButton">Previous</a>
                <a href="#" class="lastPartButton pageActive">1</a>
                <a href="#" class="lastPartButton">2</a>
                <a href="#" class="lastPartButton">3</a>
                <a href="#" class="lastPartButton">Next</a>
            </div>

        </div>
		
		
		
		<%@ include file="/WEB-INF/pages/adminFooter.jsp" %>
	</body>
</html>