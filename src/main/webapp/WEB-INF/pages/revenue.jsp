<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Revenue</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/revenue.css">
	</head>
	
	<body>
		<%@ include file="/Component/adminSidebar.jsp" %>
		
		<div style="display: flex; flex-direction: column; margin-left: 250px; width: calc(100% - 250px); min-height: 800px;">
	
	        <div class="topPart">
	            <p class="dashboardHeading"><b>Revenue</b></p>
	            <div class="adminPhoto" style="margin-top: 0px; margin-left: 122px">
					<img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%;" />                
				</div>
	        </div>
	
	        <div class="statsRow">
	        
                <div class="smallBox">
                    <img class="smallBoxImage" src="${pageContext.request.contextPath}/Images/dollar.png" alt="">
                    <div class="smallText">Total Revenue</div>
                    <div class="moneyDollar">$${totalRevenue}</div>
                </div>
                
                <div class="smallBox">
                    <img class="smallBoxImage" src="${pageContext.request.contextPath}/Images/dollar.png" alt="">
                    <div class="smallText">Revenue This Month</div>
                    <div class="moneyDollar">$${revenueThisMonth}</div>
                </div>
                
                <div class="smallBox">
                    <img class="smallBoxImage" src="${pageContext.request.contextPath}/Images/dollar.png" alt="">
                    <div class="smallText">Revenue This Week</div>
                    <div class="moneyDollar">$${revenueThisWeek}</div>
                </div>
                
                <div class="smallBox">
                    <img class="smallBoxImage" src="${pageContext.request.contextPath}/Images/dollar.png" alt="">
                    <div class="smallText">Average Order Value</div>
                    <div class="moneyDollar">$${averageOrderValue}</div>
                </div>
                
            </div>
            
            <form method="get" action="${pageContext.request.contextPath}/revenue">
            
                <div class="categoriesSelect">
                
                    <input type="text" class="searchInput" placeholder="Search by customer or product..." name="search" value="${selectedSearch}">
                    
                    <select class="categories" name="status" onchange="this.form.submit()">
                        <option value="" ${empty selectedStatus ? 'selected' : ''}>All Status</option>
                        <option value="Completed" ${selectedStatus == 'Completed' ? 'selected' : ''}>Completed</option>
                        <option value="Pending" ${selectedStatus == 'Pending' ? 'selected' : ''}>Pending</option>
                        <option value="Refunded" ${selectedStatus == 'Refunded' ? 'selected' : ''}>Refunded</option>
                    </select>
                    
                </div>
                
            </form>
	
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
                                        
                                        <c:otherwise>
                                            <span class="everyStatus" style="background: #FEE2E2; color: #991B1B;">${order.orderStatus}</span>
                                        </c:otherwise>
                                        
                                    </c:choose>
                                </td>
                                
                            </tr>
                        </c:forEach>
	                </tbody>
	            </table>
	        </div>
	
	        <div class="lastPartButtons">
	        
                <c:choose>
                
                    <c:when test="${currentPageInRevenue > 1}">
                        <a href="${pageContext.request.contextPath}/revenue?page=${currentPageInRevenue - 1}&status=${selectedStatus}&search=${selectedSearch}" class="lastPartButton">Previous</a>
                    </c:when>
                    
                    <c:otherwise>
                        <a class="lastPartButton" style="opacity: 0.4; pointer-events: none;">Previous</a>
                    </c:otherwise>
                    
                </c:choose>

                <c:forEach begin="1" end="${totalPages}" var="i">
                    <a href="${pageContext.request.contextPath}/revenue?page=${i}&status=${selectedStatus}&search=${selectedSearch}" class="lastPartButton ${i == currentPageInRevenue ? 'pageActive' : ''}">${i}</a>
                </c:forEach>

                <c:choose>
                
                    <c:when test="${currentPageInRevenue < totalPages}">
                        <a href="${pageContext.request.contextPath}/revenue?page=${currentPageInRevenue + 1}&status=${selectedStatus}&search=${selectedSearch}" class="lastPartButton">Next</a>
                    </c:when>
                    
                    <c:otherwise>
                        <a class="lastPartButton" style="opacity: 0.4; pointer-events: none;">Next</a>
                    </c:otherwise>
                    
                </c:choose>
                
            </div>
	
	    </div>
		
		<%@ include file="/Component/adminFooter.jsp" %>
	</body>
</html>