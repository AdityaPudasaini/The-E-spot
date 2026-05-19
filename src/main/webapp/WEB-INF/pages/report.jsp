<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Report</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/report.css">
	</head>
	
	<body>
		<%@ include file="/Component/adminSidebar.jsp" %>
		
		<div style="display: flex; flex-direction: column; margin-left: 250px; width: calc(100% - 250px);">
	
	        <div class="topPart">
	            <p class="dashboardHeading"><b>Reports</b></p>
	            <div class="adminPhoto" style="margin-top: 0px; margin-left: 130px">
					<img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%;" />                
				</div>
	        </div>
	        
	        <c:if test="${not empty checkError.error}">
                <div class="errorBanner">
                    <c:choose>
                        <c:when test="${checkError.error == 'nodata'}">No data found to export.</c:when>
                        <c:when test="${checkError.error == 'export'}">Something went wrong during export.</c:when>
                        <c:otherwise>An unexpected error occurred.</c:otherwise>
                    </c:choose>
                </div>
            </c:if>
	
	        <div class="statsRow">
	        
                <div class="smallBox">
                    <div class="smallText">Total Exports</div>
                    <div class="moneyDollar">${totalExports}</div>
                    <span class="smallStat" style="background: #DBEAFE; color: #1E40AF;">All time</span>
                </div>
                
                <div class="smallBox">
                    <div class="smallText">Last Export</div>
                    <div class="moneyDollar" style="font-size: 18px;">${lastExportDate}</div>
                    <span class="smallStat" style="background: #DCFCE7; color: #166534;">Most recent</span>
                </div>
                
                <div class="smallBox">
                    <div class="smallText">Available Reports</div>
                    <div class="moneyDollar">3</div>
                    <span class="smallStat" style="background: #DCFCE7; color: #166534;">Active</span>
                </div>
                
                <div class="smallBox">
                    <div class="smallText">Export Format</div>
                    <div class="moneyDollar" style="font-size: 18px;">CSV</div>
                    <span class="smallStat" style="background: #DBEAFE; color: #1E40AF;">Supported</span>
                </div>
                
            </div>
	
	        <div class="tableBox">
	            <div class="tableTitle">Available Reports</div>
	            <table class="listingTable">
	                <thead>
	                    <tr>
	                        <th class="tableHead">Report Name</th>
	                        <th class="tableHead">Category</th>
	                        <th class="tableHead">Description</th>
	                        <th class="tableHead">Last Generated</th>
	                        <th class="tableHead">Format</th>
	                        <th class="tableHead">Actions</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr class="tableRow">
	                        <td class="tableRowListing">Monthly Revenue Summary</td>
	                        <td class="tableRowListing">Revenue</td>
	                        <td class="tableRowListing">Total revenue breakdown by month</td>
	                        <td class="tableRowListing">Apr 30, 2025</td>
	                        <td class="tableRowListing"><span class="formatBadge" style="background: #DBEAFE; color: #1E40AF;">CSV</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="downloadButton">Download</button><button class="scheduleButton">Schedule</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing">Order Analytics Report</td>
	                        <td class="tableRowListing">Orders</td>
	                        <td class="tableRowListing">Full order history with statuses</td>
	                        <td class="tableRowListing">Apr 28, 2025</td>
	                        <td class="tableRowListing"><span class="formatBadge" style="background: #DBEAFE; color: #1E40AF;">CSV</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="downloadButton">Download</button><button class="scheduleButton">Schedule</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing">User Growth Report</td>
	                        <td class="tableRowListing">Users</td>
	                        <td class="tableRowListing">New signups and active users</td>
	                        <td class="tableRowListing">Apr 25, 2025</td>
	                        <td class="tableRowListing"><span class="formatBadge" style="background: #EDE9FE; color: #5B21B6;">PDF</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="downloadButton">Download</button><button class="scheduleButton">Schedule</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing">Flagged Items Report</td>
	                        <td class="tableRowListing">Flagged Items</td>
	                        <td class="tableRowListing">All flagged listings and resolutions</td>
	                        <td class="tableRowListing">Apr 22, 2025</td>
	                        <td class="tableRowListing"><span class="formatBadge" style="background: #DBEAFE; color: #1E40AF;">CSV</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="downloadButton">Download</button><button class="scheduleButton">Schedule</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing">Top Selling Products</td>
	                        <td class="tableRowListing">Listings</td>
	                        <td class="tableRowListing">Best performing products by sales</td>
	                        <td class="tableRowListing">Apr 20, 2025</td>
	                        <td class="tableRowListing"><span class="formatBadge" style="background: #EDE9FE; color: #5B21B6;">PDF</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="downloadButton">Download</button><button class="scheduleButton">Schedule</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing">Refund and Returns Report</td>
	                        <td class="tableRowListing">Orders</td>
	                        <td class="tableRowListing">Refunded and returned orders detail</td>
	                        <td class="tableRowListing">Apr 18, 2025</td>
	                        <td class="tableRowListing"><span class="formatBadge" style="background: #DBEAFE; color: #1E40AF;">CSV</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="downloadButton">Download</button><button class="scheduleButton">Schedule</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing">Category Performance</td>
	                        <td class="tableRowListing">Listings</td>
	                        <td class="tableRowListing">Revenue and orders grouped by category</td>
	                        <td class="tableRowListing">Apr 15, 2025</td>
	                        <td class="tableRowListing"><span class="formatBadge" style="background: #EDE9FE; color: #5B21B6;">PDF</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="downloadButton">Download</button><button class="scheduleButton">Schedule</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing">Weekly Traffic Summary</td>
	                        <td class="tableRowListing">Dashboard</td>
	                        <td class="tableRowListing">Visits, sessions and bounce rates</td>
	                        <td class="tableRowListing">Apr 30, 2025</td>
	                        <td class="tableRowListing"><span class="formatBadge" style="background: #EDE9FE; color: #5B21B6;">PDF</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="downloadButton">Download</button><button class="scheduleButton">Schedule</button></div></td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	
	        <div class="tableBox">
	            <div class="tableTitle">Export History</div>
	            <table class="listingTable">
	                <thead>
	                    <tr>
	                        <th class="tableHead">Export ID</th>
	                        <th class="tableHead">Report Name</th>
	                        <th class="tableHead">Exported By</th>
	                        <th class="tableHead">Date and Time</th>
	                        <th class="tableHead">Format</th>
	                        <th class="tableHead">Status</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#E001</td>
	                        <td class="tableRowListing">Monthly Revenue Summary</td>
	                        <td class="tableRowListing">Admin A</td>
	                        <td class="tableRowListing">Apr 30, 2025 – 09:14 AM</td>
	                        <td class="tableRowListing"><span class="formatBadge" style="background: #DBEAFE; color: #1E40AF;">CSV</span></td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #DCFCE7; color: #166534;">Success</span></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#E002</td>
	                        <td class="tableRowListing">User Growth Report</td>
	                        <td class="tableRowListing">Admin A</td>
	                        <td class="tableRowListing">Apr 28, 2025 – 02:30 PM</td>
	                        <td class="tableRowListing"><span class="formatBadge" style="background: #EDE9FE; color: #5B21B6;">PDF</span></td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #DCFCE7; color: #166534;">Success</span></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#E003</td>
	                        <td class="tableRowListing">Flagged Items Report</td>
	                        <td class="tableRowListing">Admin A</td>
	                        <td class="tableRowListing">Apr 25, 2025 – 11:05 AM</td>
	                        <td class="tableRowListing"><span class="formatBadge" style="background: #DBEAFE; color: #1E40AF;">CSV</span></td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #FEE2E2; color: #991B1B;">Failed</span></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#E004</td>
	                        <td class="tableRowListing">Order Analytics Report</td>
	                        <td class="tableRowListing">Admin A</td>
	                        <td class="tableRowListing">Apr 22, 2025 – 04:50 PM</td>
	                        <td class="tableRowListing"><span class="formatBadge" style="background: #DBEAFE; color: #1E40AF;">CSV</span></td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #DCFCE7; color: #166534;">Success</span></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#E005</td>
	                        <td class="tableRowListing">Top Selling Products</td>
	                        <td class="tableRowListing">Admin A</td>
	                        <td class="tableRowListing">Apr 20, 2025 – 10:20 AM</td>
	                        <td class="tableRowListing"><span class="formatBadge" style="background: #EDE9FE; color: #5B21B6;">PDF</span></td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #DCFCE7; color: #166534;">Success</span></td>
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