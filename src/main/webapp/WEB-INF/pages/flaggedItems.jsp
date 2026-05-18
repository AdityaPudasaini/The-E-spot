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
	
		<div style="display: flex; flex-direction: column; margin-left: 250px; width: calc(100% - 250px);">
	
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
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#F001</td>
	                        <td class="tableRowListing">Nike Air Max 270</td>
	                        <td class="tableRowListing">Michael Johnson</td>
	                        <td class="tableRowListing">Counterfeit Product</td>
	                        <td class="tableRowListing">Apr 01, 2025</td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #FEF9C3; color: #854D0E;">Under Review</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="viewButton">View</button><button class="resolveButton">Resolve</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#F002</td>
	                        <td class="tableRowListing">iPhone 15 Pro Case</td>
	                        <td class="tableRowListing">Sarah Lee</td>
	                        <td class="tableRowListing">Wrong Description</td>
	                        <td class="tableRowListing">Apr 03, 2025</td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #DCFCE7; color: #166534;">Resolved</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="viewButton">View</button><button class="resolveButton">Resolve</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#F003</td>
	                        <td class="tableRowListing">Vintage Watch</td>
	                        <td class="tableRowListing">David Kim</td>
	                        <td class="tableRowListing">Prohibited Item</td>
	                        <td class="tableRowListing">Apr 05, 2025</td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #FEF9C3; color: #854D0E;">Under Review</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="viewButton">View</button><button class="resolveButton">Resolve</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#F004</td>
	                        <td class="tableRowListing">Wireless Earbuds</td>
	                        <td class="tableRowListing">Emma Brown</td>
	                        <td class="tableRowListing">Fake Reviews</td>
	                        <td class="tableRowListing">Apr 08, 2025</td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #F1F5F9; color: #475569;">Dismissed</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="viewButton">View</button><button class="resolveButton">Resolve</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#F005</td>
	                        <td class="tableRowListing">Leather Handbag</td>
	                        <td class="tableRowListing">James Carter</td>
	                        <td class="tableRowListing">Counterfeit Product</td>
	                        <td class="tableRowListing">Apr 10, 2025</td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #FEF9C3; color: #854D0E;">Under Review</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="viewButton">View</button><button class="resolveButton">Resolve</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#F006</td>
	                        <td class="tableRowListing">Gaming Chair</td>
	                        <td class="tableRowListing">Aisha Patel</td>
	                        <td class="tableRowListing">Wrong Description</td>
	                        <td class="tableRowListing">Apr 14, 2025</td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #DCFCE7; color: #166534;">Resolved</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="viewButton">View</button><button class="resolveButton">Resolve</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#F007</td>
	                        <td class="tableRowListing">Adidas Ultraboost</td>
	                        <td class="tableRowListing">Carlos Mendez</td>
	                        <td class="tableRowListing">Prohibited Item</td>
	                        <td class="tableRowListing">Apr 18, 2025</td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #F1F5F9; color: #475569;">Dismissed</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="viewButton">View</button><button class="resolveButton">Resolve</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#F008</td>
	                        <td class="tableRowListing">Ray-Ban Sunglasses</td>
	                        <td class="tableRowListing">Lena Fischer</td>
	                        <td class="tableRowListing">Counterfeit Product</td>
	                        <td class="tableRowListing">Apr 22, 2025</td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #FEF9C3; color: #854D0E;">Under Review</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="viewButton">View</button><button class="resolveButton">Resolve</button></div></td>
	                    </tr>
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