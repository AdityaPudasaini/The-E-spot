<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Users</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/users.css">
	</head>
	
	<body>
	
		<%@ include file="/Component/adminSidebar.jsp" %>
		
		<div style="display: flex; flex-direction: column;margin-left: 250px; width: calc(100% - 250px); min-height: 700px;"">

	        <div class="topPart">
                <p class="dashboardHeading"><b>Users</b></p>

                <div class="adminPhoto" style="margin-top: 0px; margin-left: 50px">
					<img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%;" />                
				</div>
            </div>
	
	        <form method="get" action="${pageContext.request.contextPath}/users">
	        
                <div class="categoriesSelect">
                
                    <input type="text" class="searchInput" placeholder="Search users..." name="search" value="${selectedSearch}">
                    <select class="categories" name="status" onchange="this.form.submit()">
                        <option value="" ${empty selectedStatus ? 'selected' : ''}>All Status</option>
                        <option value="Active" ${selectedStatus == 'Active' ? 'selected' : ''}>Active</option>
                        <option value="Banned" ${selectedStatus == 'Banned' ? 'selected' : ''}>Banned</option>
                        <option value="Suspended" ${selectedStatus == 'Suspended' ? 'selected' : ''}>Suspended</option>
                    </select>
                </div>
                
            </form>
	
	        <div class="tableBox">
	            <table class="listingTable">
	                <thead>
	                    <tr>
	                        <th class="tableHead">Avatar</th>
	                        <th class="tableHead">Full Name</th>
	                        <th class="tableHead">Email</th>
	                        <th class="tableHead">Total Orders</th>
	                        <th class="tableHead">Status</th>
	                        <th class="tableHead">Date Joined</th>
	                        <th class="tableHead">Actions</th>
	                    </tr>
	                </thead>
	                <tbody>
	                
	                    <c:forEach var="user" items="${users}">
	                    
                            <tr class="tableRow">
                            
                                <td class="tableRowListing">
                                    <div class="userAvatar">${user.firstLetter}</div>
                                </td>
                                
                                <td class="tableRowListing">${user.memberName}</td>
                                <td class="tableRowListing">${user.memberEmail}</td>
                                <td class="tableRowListing">${user.totalOrders}</td>
                                
                                <td class="tableRowListing">
                                
                                    <c:choose>
                                    
                                        <c:when test="${user.accountStatus == 'Active'}">
                                            <span class="actived">Active</span>
                                        </c:when>
                                        
                                        <c:when test="${user.accountStatus == 'Banned'}">
                                            <span class="banned">Banned</span>
                                        </c:when>
                                        
                                        <c:otherwise>
                                            <span class="suspended">${user.accountStatus}</span>
                                        </c:otherwise>
                                        
                                    </c:choose>
                                </td>
                                
                                <td class="tableRowListing">${user.createdAt}</td>
                                
                                <td class="tableRowListing">
                                    <div class="changeButtons">
                                    
                                        <c:choose>
                                        
                                            <c:when test="${user.accountStatus == 'Banned'}">
                                            
                                                <form action="${pageContext.request.contextPath}/users" method="post">
                                                    <input type="hidden" name="memberId" value="${user.memberId}" />
                                                    <button class="editButton" name="unban" type="submit">Unban</button>
                                                </form>
                                            </c:when>
                                            
                                            <c:otherwise>
                                            
                                                <form action="${pageContext.request.contextPath}/users" method="post">
                                                    <input type="hidden" name="memberId" value="${user.memberId}" />
                                                    <button class="deleteButton" name="ban" type="submit">Ban</button>
                                                </form>
                                                
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
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