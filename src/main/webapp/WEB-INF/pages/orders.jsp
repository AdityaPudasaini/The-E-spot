<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Orders</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
	</head>
	<body>
		<%@ include file="/WEB-INF/pages/adminSidebar.jsp" %>
		
		<div style="display: flex; flex-direction: column; margin-left: 250px; width: calc(100% - 250px);">

	        <div class="topPart">
	            <p class="dashboardHeading"><b>Orders</b></p>
	            <input type="text" class="searchbar" placeholder="Search everything">
	            <div class="adminPhoto" style="margin-top: 0px; margin-left: 45px">A</div>
	        </div>
	
	        <div class="statsRow">
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Total Orders</div>
	                <div class="moneyDollar">4,280</div>
	                <span class="smallStat" style="background: #DCFCE7; color: #166534;">+8% from last month</span>
	            </div>
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Completed Orders</div>
	                <div class="moneyDollar">3,541</div>
	                <span class="smallStat" style="background: #DCFCE7; color: #166534;">+5.3% from last month</span>
	            </div>
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Pending Orders</div>
	                <div class="moneyDollar">502</div>
	                <span class="smallStat" style="background: #FEE2E2; color: #991B1B;">+1.2% from last week</span>
	            </div>
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Refunded Orders</div>
	                <div class="moneyDollar">237</div>
	                <span class="smallStat" style="background: #FEE2E2; color: #991B1B;">-0.7% from last month</span>
	            </div>
	        </div>
	
	        <div class="categoriesSelect">
	            <input type="text" class="searchInput" placeholder="Search orders...">
	            <select class="categories">
	                <option>All Status</option>
	                <option>Completed</option>
	                <option>Pending</option>
	                <option>Refunded</option>
	                <option>Cancelled</option>
	            </select>
	        </div>
	
	        <div class="tableBox">
	            <div class="tableTitle">Order List</div>
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
	                        <th class="tableHead">Actions</th>
	                    </tr>
	                </thead>
	                
	            </table>
	        </div>

	
	    </div>
		
	
		<%@ include file="/WEB-INF/pages/adminFooter.jsp" %>
	</body>
</html>