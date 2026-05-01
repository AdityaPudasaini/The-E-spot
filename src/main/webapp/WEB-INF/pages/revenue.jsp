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
	
	        
	
	    </div>
		
		<%@ include file="/WEB-INF/pages/adminFooter.jsp" %>
	</body>
</html>