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
		
		<div class="mainContent">
	
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
	                        <th class="tableHead">Format</th>
	                        <th class="tableHead">Actions</th>
	                    </tr>
	                </thead>
	                <tbody>
                        <tr class="tableRow">
                            <td class="tableRowListing">Revenue Report</td>
                            <td class="tableRowListing">Revenue</td>
                            <td class="tableRowListing">All completed payments with amounts and methods</td>
                            
                            <td class="tableRowListing">
                            	<span class="formatBadge" style="background: #DBEAFE; color: #1E40AF;">CSV</span>
                            </td>
                            
                            <td class="tableRowListing">
                            
                                <form method="post" action="${pageContext.request.contextPath}/report">
                                    <input type="hidden" name="reportType" value="Revenue" />
                                    <button type="submit" class="downloadButton">Download</button>
                                </form>
                            </td>
                        </tr>
                        
                        <tr class="tableRow">
                            <td class="tableRowListing">Orders Report</td>
                            <td class="tableRowListing">Orders</td>
                            <td class="tableRowListing">Full order history with customer names and statuses</td>
                            
                            <td class="tableRowListing">
                            	<span class="formatBadge" style="background: #DBEAFE; color: #1E40AF;">CSV</span>
                            </td>
                            
                            <td class="tableRowListing">
                            
                                <form method="post" action="${pageContext.request.contextPath}/report">
                                    <input type="hidden" name="reportType" value="Orders" />
                                    <button type="submit" class="downloadButton">Download</button>
                                </form>
                                
                            </td>
                            
                        </tr>
                        
                        <tr class="tableRow">
                            <td class="tableRowListing">Products Report</td>
                            <td class="tableRowListing">Products</td>
                            <td class="tableRowListing">All product listings with prices, stock and status</td>
                            
                            <td class="tableRowListing">
                            	<span class="formatBadge" style="background: #DBEAFE; color: #1E40AF;">CSV</span>
                            </td>
                            
                            <td class="tableRowListing">
                            
                                <form method="post" action="${pageContext.request.contextPath}/report">
                                    <input type="hidden" name="reportType" value="Products" />
                                    <button type="submit" class="downloadButton">Download</button>
                                </form>
                                
                            </td>
                            
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
	                
	                    <c:choose>
	                    
                            <c:when test="${empty exportHistory}">
                            
                                <tr>
                                    <td class="tableRowListing" colspan="6" style="text-align: center; color: #64748B;">
                                        No exports yet.
                                    </td>
                                </tr>
                                
                            </c:when>
                            
                            <c:otherwise>
                            
                                <c:forEach var="export" items="${exportHistory}">
                                
                                    <tr class="tableRow">
                                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#E${export.exportId}</td>
                                        <td class="tableRowListing">${export.reportType}</td>
                                        <td class="tableRowListing">${export.exportedBy}</td>
                                        <td class="tableRowListing">${export.exportDate}</td>
                                        <td class="tableRowListing">CSV</td>
                                        
                                        <td class="tableRowListing">
                                        
                                            <c:choose>
                                                <c:when test="${export.status == 'Success'}">
                                                    <span class="everyStatus" style="background: #DCFCE7; color: #166534;">Success</span>
                                                </c:when>
                                                
                                                <c:otherwise>
                                                    <span class="everyStatus" style="background: #FEE2E2; color: #991B1B;">Failed</span>
                                                </c:otherwise>
                                                
                                            </c:choose>
                                            
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
	                </tbody>
	            </table>
	        </div>
	    </div>
		
		<%@ include file="/Component/adminFooter.jsp" %>
	</body>
</html>