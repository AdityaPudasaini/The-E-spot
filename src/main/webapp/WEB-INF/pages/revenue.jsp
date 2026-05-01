<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Revenue</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/revenue.css">
	</head>
	
	<body>
		<%@ include file="/WEB-INF/pages/adminSidebar.jsp" %>
		
		<div style="display: flex; flex-direction: column; margin-left: 250px; width: calc(100% - 250px);">
	
	        <div class="topPart">
	            <p class="dashboardHeading"><b>Revenue</b></p>
	            <input type="text" class="searchbar" placeholder="Search everything">
	            <div class="adminPhoto" style="margin-top: 0px; margin-left: 45px">A</div>
	        </div>
	
	        <div class="statsRow">
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Total Revenue</div>
	                <div class="moneyDollar">$10,000,000</div>
	                <span class="smallStat" style="background: #DCFCE7; color: #166534;">+5% from last year</span>
	            </div>
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Revenue This Month</div>
	                <div class="moneyDollar">$320,000</div>
	                <span class="smallStat" style="background: #DCFCE7; color: #166534;">+2.1% from last month</span>
	            </div>
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Revenue This Week</div>
	                <div class="moneyDollar">$74,500</div>
	                <span class="smallStat" style="background: #DCFCE7; color: #166534;">+0.8% from last week</span>
	            </div>
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Average Order Value</div>
	                <div class="moneyDollar">$148</div>
	                <span class="smallStat" style="background: #FEE2E2; color: #991B1B;">-0.3% from last month</span>
	            </div>
	        </div>
	
	        <div class="tableBox">
	            <div class="tableTitle">Revenue Breakdown</div>
	            <table class="listingTable">
	                <thead>
	                    <tr>
	                        <th class="tableHead">Order ID</th>
	                        <th class="tableHead">Customer</th>
	                        <th class="tableHead">Product</th>
	                        <th class="tableHead">Category</th>
	                        <th class="tableHead">Amount</th>
	                        <th class="tableHead">Date</th>
	                        <th class="tableHead">Status</th>
	                    </tr>
	                </thead>
	                
	            </table>
	        </div>
	
	
	    </div>
		
		<%@ include file="/WEB-INF/pages/adminFooter.jsp" %>
	</body>
</html>