<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Users</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/users.css">
	</head>
	
	<body>
	
		<%@ include file="/WEB-INF/pages/adminSidebar.jsp" %>
		
		<div style="display: flex; flex-direction: column;margin-left: 250px; width: calc(100% - 250px);">

	        <div class="topPart">
                <p class="dashboardHeading"><b>Users</b></p>

                <input type="text" class="searchbar" placeholder="Search everything">

                <div class="adminPhoto" style="margin-top: 0px; margin-left: 45px">A</div>
            </div>
	
	        <div class="categoriesSelect">
	            <input type="text" class="searchInput" placeholder="Search users...">
	            <select class="categories">
	                <option>All Status</option>
	                <option>Active</option>
	                <option>Banned</option>
	                <option>Suspended</option>
	            </select>
	        </div>
	
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
	                    <tr class="tableRow">
	                        <td class="tableRowListing"><div class="userAvatar" style="background:#2563EB">M</div></td>
	                        <td class="tableRowListing">Michael Johnson</td>
	                        <td class="tableRowListing">michael@gmail.com</td>
	                        <td class="tableRowListing">12</td>
	                        <td class="tableRowListing"><span class="actived">Active</span></td>
	                        <td class="tableRowListing">Jan 03, 2025</td>
	                        <td class="tableRowListing">
	                            <div class="changeButtons">
	                                <button class="editButton">View</button>
	                                <button class="deleteButton">Ban</button>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing"><div class="userAvatar" style="background:#7C3AED">S</div></td>
	                        <td class="tableRowListing">Sarah Lee</td>
	                        <td class="tableRowListing">sarah.lee@gmail.com</td>
	                        <td class="tableRowListing">5</td>
	                        <td class="tableRowListing"><span class="suspended">Suspended</span></td>
	                        <td class="tableRowListing">Jan 18, 2025</td>
	                        <td class="tableRowListing">
	                            <div class="changeButtons">
	                                <button class="editButton">View</button>
	                                <button class="deleteButton">Ban</button>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing"><div class="userAvatar" style="background:#16A34A">D</div></td>
	                        <td class="tableRowListing">David Kim</td>
	                        <td class="tableRowListing">david.kim@gmail.com</td>
	                        <td class="tableRowListing">34</td>
	                        <td class="tableRowListing"><span class="actived">Active</span></td>
	                        <td class="tableRowListing">Feb 02, 2025</td>
	                        <td class="tableRowListing">
	                            <div class="changeButtons">
	                                <button class="editButton">View</button>
	                                <button class="deleteButton">Ban</button>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing"><div class="userAvatar" style="background:#DB2777">E</div></td>
	                        <td class="tableRowListing">Emma Brown</td>
	                        <td class="tableRowListing">emma.brown@gmail.com</td>
	                        <td class="tableRowListing">0</td>
	                        <td class="tableRowListing"><span class="banned">Banned</span></td>
	                        <td class="tableRowListing">Feb 14, 2025</td>
	                        <td class="tableRowListing">
	                            <div class="changeButtons">
	                                <button class="editButton">View</button>
	                                <button class="deleteButton">Ban</button>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing"><div class="userAvatar" style="background:#F59E0B">J</div></td>
	                        <td class="tableRowListing">James Carter</td>
	                        <td class="tableRowListing">james.c@gmail.com</td>
	                        <td class="tableRowListing">8</td>
	                        <td class="tableRowListing"><span class="actived">Active</span></td>
	                        <td class="tableRowListing">Mar 01, 2025</td>
	                        <td class="tableRowListing">
	                            <div class="changeButtons">
	                                <button class="editButton">View</button>
	                                <button class="deleteButton">Ban</button>
	                            </div>
	                        </td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing"><div class="userAvatar" style="background:#0EA5E9">A</div></td>
	                        <td class="tableRowListing">Aisha Patel</td>
	                        <td class="tableRowListing">aisha.patel@gmail.com</td>
	                        <td class="tableRowListing">21</td>
	                        <td class="tableRowListing"><span class="actived">Active</span></td>
	                        <td class="tableRowListing">Mar 22, 2025</td>
	                        <td class="tableRowListing">
	                            <div class="changeButtons">
	                                <button class="editButton">View</button>
	                                <button class="deleteButton">Ban</button>
	                            </div>
	                        </td>
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
		
		<%@ include file="/WEB-INF/pages/adminFooter.jsp" %>
	</body>
</html>