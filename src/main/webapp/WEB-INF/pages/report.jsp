<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Report</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/report.css">
	</head>
	
	<body>
		<%@ include file="/WEB-INF/pages/adminSidebar.jsp" %>
		
		<div style="display: flex; flex-direction: column; margin-left: 250px; width: calc(100% - 250px);">
	
	        <div class="topPart">
	            <p class="dashboardHeading"><b>Reports</b></p>
	            <input type="text" class="searchbar" placeholder="Search everything">
	            <div class="adminPhoto">A</div>
	        </div>
	
	        <div class="statsRow">
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Reports Generated</div>
	                <div class="moneyDollar">128</div>
	                <span class="smallStat" style="background: #DCFCE7; color: #166534;">+14% from last month</span>
	            </div>
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Last Export</div>
	                <div class="moneyDollar">Today</div>
	                <span class="smallStat" style="background: #DCFCE7; color: #166534;">Up to date</span>
	            </div>
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Scheduled Reports</div>
	                <div class="moneyDollar">6</div>
	                <span class="smallStat" style="background: #DCFCE7; color: #166534;">Active</span>
	            </div>
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Failed Exports</div>
	                <div class="moneyDollar">2</div>
	                <span class="smallStat" style="background: #FEE2E2; color: #991B1B;">Needs attention</span>
	            </div>
	        </div>
	
	        
	
	    </div>
		
		<%@ include file="/WEB-INF/pages/adminFooter.jsp" %>
	</body>
</html>