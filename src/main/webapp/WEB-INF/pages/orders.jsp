<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Orders</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
	</head>
	<body>
		<%@ include file="/Component/adminSidebar.jsp" %>
		
		<div style="display: flex; flex-direction: column; margin-left: 250px; width: calc(100% - 250px);">

	        <div class="topPart">
	            <p class="dashboardHeading"><b>Orders</b></p>
	            <div class="adminPhoto" style="margin-top: 0px; margin-left: 140px">
					<img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%;" />                
				</div>
	        </div>
	
	        <div class="statsRow">
	        
                <div class="smallBox">
                    <img class="smallBoxImage" src="${pageContext.request.contextPath}/Images/dollar.png" alt="">
                    <div class="smallText">Total Orders</div>
                    <div class="moneyDollar">${totalOrders}</div>
                </div>
                
                <div class="smallBox">
                    <img class="smallBoxImage" src="${pageContext.request.contextPath}/Images/dollar.png" alt="">
                    <div class="smallText">Completed Orders</div>
                    <div class="moneyDollar">${completedOrders}</div>
                </div>
                
                <div class="smallBox">
                    <img class="smallBoxImage" src="${pageContext.request.contextPath}/Images/dollar.png" alt="">
                    <div class="smallText">Pending Orders</div>
                    <div class="moneyDollar">${pendingOrders}</div>
                </div>
                
                <div class="smallBox">
                    <img class="smallBoxImage" src="${pageContext.request.contextPath}/Images/dollar.png" alt="">
                    <div class="smallText">Refunded Orders</div>
                    <div class="moneyDollar">${refundedOrders}</div>
                </div>
                
            </div>
	
	        <form method="get" action="${pageContext.request.contextPath}/order">
	        
                <div class="categoriesSelect">
                
                    <input type="text" class="searchInput" placeholder="Search orders..." name="search" value="${selectedSearch}">
                    
                    <select class="categories" name="status" onchange="this.form.submit()">
                        <option value="" ${empty selectedStatus ? 'selected' : ''}>All Status</option>
                        <option value="Completed" ${selectedStatus == 'Completed' ? 'selected' : ''}>Completed</option>
                        <option value="Pending" ${selectedStatus == 'Pending' ? 'selected' : ''}>Pending</option>
                        <option value="Refunded" ${selectedStatus == 'Refunded' ? 'selected' : ''}>Refunded</option>
                        <option value="Cancelled" ${selectedStatus == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                    </select>
                    
                </div>
                
            </form>
	
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
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:forEach var="order" items="${orders}">
                            <tr class="tableRow">
                                <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#${order.orderId}</td>
                                <td class="tableRowListing">${order.customerName}</td>
                                <td class="tableRowListing">${order.productName}</td>
                                <td class="tableRowListing">${order.categoryName}</td>
                                <td class="tableRowListing">$${order.amount}</td>
                                <td class="tableRowListing">${order.orderDate}</td>
                                <td class="tableRowListing">
                                
                                    <c:choose>
                                    
                                        <c:when test="${order.orderStatus == 'Completed'}">
                                            <span class="everyStatus" style="background: #DCFCE7; color: #166534;">Completed</span>
                                        </c:when>
                                        
                                        <c:when test="${order.orderStatus == 'Pending'}">
                                            <span class="everyStatus" style="background: #FEF9C3; color: #854D0E;">Pending</span>
                                        </c:when>
                                        
                                        <c:when test="${order.orderStatus == 'Refunded'}">
                                            <span class="everyStatus" style="background: #FEE2E2; color: #991B1B;">Refunded</span>
                                        </c:when>
                                        
                                        <c:otherwise>
                                            <span class="everyStatus" style="background: #F1F5F9; color: #475569;">${order.orderStatus}</span>
                                        </c:otherwise>
                                        
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
	                </tbody>
	            </table>
	        </div>
	
	        <div class="lastPartButtons">
	            <a href="#" class="lastPartButton">Previous</a>
	            <a href="#" class="lastPartButton pageActive">1</a>
	            <a href="#" class="lastPartButton">2</a>
	            <a href="#" class="lastPartButton">3</a>
	            <a href="#" class="lastPartButton">Next</a>
	        </div>
	
	    </div>
		
	
		<%@ include file="/Component/adminFooter.jsp" %>
	</body>
</html>