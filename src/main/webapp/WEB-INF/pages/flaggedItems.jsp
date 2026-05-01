<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Flagged Item</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaggedItems.css">
		
	</head>
	<body>
		<%@ include file="/WEB-INF/pages/adminSidebar.jsp" %>
	
		<div style="display: flex; flex-direction: column; margin-left: 250px; width: calc(100% - 250px);">
	
	        <div class="topPart">
	            <p class="dashboardHeading"><b>Flagged Items</b></p>
	            <input type="text" class="searchbar" placeholder="Search everything">
	            <div class="adminPhoto">A</div>
	        </div>
	
	        <div class="statsRow">
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Total Flagged</div>
	                <div class="moneyDollar">318</div>
	                <span class="smallStat" style="background: #FEE2E2; color: #991B1B;">+12% from last month</span>
	            </div>
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Under Review</div>
	                <div class="moneyDollar">104</div>
	                <span class="smallStat" style="background: #FEE2E2; color: #991B1B;">+4.5% from last week</span>
	            </div>
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Resolved</div>
	                <div class="moneyDollar">189</div>
	                <span class="smallStat" style="background: #DCFCE7; color: #166534;">+6.1% from last month</span>
	            </div>
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Dismissed</div>
	                <div class="moneyDollar">25</div>
	                <span class="smallStat" style="background: #DCFCE7; color: #166534;">-2.3% from last month</span>
	            </div>
	        </div>
	
	        <div class="categoriesSelect">
	            <input type="text" class="searchInput" placeholder="Search flagged items...">
	            <select class="categories">
	                <option>All Status</option>
	                <option>Under Review</option>
	                <option>Resolved</option>
	                <option>Dismissed</option>
	            </select>
	        </div>
	
	        
	
	    </div>
	    
	    <%@ include file="/WEB-INF/pages/adminFooter.jsp" %>
	</body>
</html>