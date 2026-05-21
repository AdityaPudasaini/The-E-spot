<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Flagged Item</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaggedItems.css">
		
	</head>
	<body>
		<%@ include file="/Component/adminSidebar.jsp" %>
	
		<div style="display: flex; flex-direction: column; margin-left: 250px; width: calc(100% - 250px); min-height: 800px;">
	
	        <div class="topPart">
	            <p class="dashboardHeading"><b>Flagged Items</b></p>
	            <div class="adminPhoto" style="margin-top: 0px; margin-left: 50px">
					<img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%;" />                
				</div>
	        </div>
	
	        <div class="statsRow">
	        
                <div class="smallBox">
                    <img class="smallBoxImage" src="${pageContext.request.contextPath}/Images/dollar.png" alt="">
                    <div class="smallText">Total Flagged</div>
                    <div class="moneyDollar">${totalFlagged}</div>
                </div>
                
                <div class="smallBox">
                    <img class="smallBoxImage" src="${pageContext.request.contextPath}/Images/dollar.png" alt="">
                    <div class="smallText">Under Review</div>
                    <div class="moneyDollar">${underReview}</div>
                </div>
                
                <div class="smallBox">
                    <img class="smallBoxImage" src="${pageContext.request.contextPath}/Images/dollar.png" alt="">
                    <div class="smallText">Resolved</div>
                    <div class="moneyDollar">${resolved}</div>
                </div>
                
                <div class="smallBox">
                    <img class="smallBoxImage" src="${pageContext.request.contextPath}/Images/dollar.png" alt="">
                    <div class="smallText">Dismissed</div>
                    <div class="moneyDollar">${dismissed}</div>
                </div>
                
            </div>
	
	        <form method="get" action="${pageContext.request.contextPath}/flagged">
	        
                <div class="categoriesSelect">
                
                    <input type="text" class="searchInput" placeholder="Search flagged items..." name="search" value="${selectedSearch}">
                    
                    <select class="categories" name="status" onchange="this.form.submit()">
                        <option value="" ${empty selectedStatus ? 'selected' : ''}>All Status</option>
                        <option value="Under Review" ${selectedStatus == 'Under Review' ? 'selected' : ''}>Under Review</option>
                        <option value="Resolved" ${selectedStatus == 'Resolved' ? 'selected' : ''}>Resolved</option>
                        <option value="Dismissed" ${selectedStatus == 'Dismissed' ? 'selected' : ''}>Dismissed</option>
                    </select>
                    
                </div>
                
            </form>
	
	        <div class="tableBox">
	            <div class="tableTitle">Flagged Items List</div>
	            <table class="listingTable">
	                <thead>
	                    <tr>
	                        <th class="tableHead">Item ID</th>
	                        <th class="tableHead">Product</th>
	                        <th class="tableHead">Reported By</th>
	                        <th class="tableHead">Reason</th>
	                        <th class="tableHead">Date Reported</th>
	                        <th class="tableHead">Status</th>
	                        <th class="tableHead">Actions</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:forEach var="item" items="${flaggedItems}">
                            <tr class="tableRow">
                                <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#F${item.flagId}</td>
                                <td class="tableRowListing">${item.productName}</td>
                                <td class="tableRowListing">${item.reportedBy}</td>
                                <td class="tableRowListing">${item.reason}</td>
                                <td class="tableRowListing">${item.dateReported}</td>
                                
                                <td class="tableRowListing">
                                
                                    <c:choose>
                                    
                                        <c:when test="${item.flagStatus == 'Under Review'}">
                                            <span class="everyStatus" style="background: #FEF9C3; color: #854D0E;">Under Review</span>
                                        </c:when>
                                        
                                        <c:when test="${item.flagStatus == 'Resolved'}">
                                            <span class="everyStatus" style="background: #DCFCE7; color: #166534;">Resolved</span>
                                        </c:when>
                                        
                                        <c:otherwise>
                                            <span class="everyStatus" style="background: #F1F5F9; color: #475569;">Dismissed</span>
                                        </c:otherwise>
                                        
                                    </c:choose>
                                    
                                </td>
                                
                                <td class="tableRowListing">
                                    <div class="changeButtons">
                                    
                                        <form action="${pageContext.request.contextPath}/flagged" method="post" style="display: flex; gap: 6px;">
                                        
										    <input type="hidden" name="flagId" value="${item.flagId}"/>
										    <button style="border: none; padding: 6px 14px; border-radius: 20px; font-size: 12px; font-weight: bold; cursor: pointer; color: white; background-color: #2563EB;" name="unflag" type="submit">Unflag</button>
											<button style="border: none; padding: 6px 14px; border-radius: 20px; font-size: 12px; font-weight: bold; cursor: pointer; color: white; background-color: #EF4444;" name="remove" type="submit">Remove</button>
										    
										</form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
	                </tbody>
	            </table>
	        </div>
	
	        <div class="lastPartButtons">
	        
                <c:choose>
                
                    <c:when test="${currentPageInFlagged > 1}">
                        <a href="${pageContext.request.contextPath}/flagged?page=${currentPageInFlagged - 1}&status=${selectedStatus}&search=${selectedSearch}" class="lastPartButton">Previous</a>
                    </c:when>
                    
                    <c:otherwise>
                        <a class="lastPartButton" style="opacity: 0.4; pointer-events: none;">Previous</a>
                    </c:otherwise>
                    
                </c:choose>

                <c:forEach begin="1" end="${totalPages}" var="i">
                    <a href="${pageContext.request.contextPath}/flagged?page=${i}&status=${selectedStatus}&search=${selectedSearch}" class="lastPartButton ${i == currentPageInFlagged ? 'pageActive' : ''}">${i}</a>
                </c:forEach>

                <c:choose>
                
                    <c:when test="${currentPageInFlagged < totalPages}">
                        <a href="${pageContext.request.contextPath}/flagged?page=${currentPageInFlagged + 1}&status=${selectedStatus}&search=${selectedSearch}" class="lastPartButton">Next</a>
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