<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>My Listings - The E-Spot</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userOwnListing.css">
    </head>
    <body>
        <%@ include file="/Component/userSidebar.jsp" %>

        <div class="mainContent">

            <div class="userTopBar">
                <p class="userDashboardHeading"><b>My Listings</b></p>
                <div class="userAvatarCircle">
                    <img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%;"/>
                </div>
            </div>

            <div class="userListingWrapper">

                <div class="tableBox">
                    <table class="listingTable">
                        <thead>
                            <tr>
                                <th class="tableHead">Image</th>
                                <th class="tableHead">Product Name</th>
                                <th class="tableHead">Category</th>
                                <th class="tableHead">Price</th>
                                <th class="tableHead">Stock</th>
                                <th class="tableHead">Status</th>
                                <th class="tableHead">Date Added</th>
                                <th class="tableHead">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="listing" items="${listings}">
                                <tr class="tableRow">
                                    <td class="tableRowListing"><img src="${pageContext.request.contextPath}/image?name=product${listing.productId}" class="productImage"></td>
                                    <td class="tableRowListing">${listing.productName}</td>
                                    <td class="tableRowListing">${listing.categoryName}</td>
                                    <td class="tableRowListing">$${listing.productPrice}</td>
                                    <td class="tableRowListing">${listing.stockQuantity}</td>
                                    <td class="tableRowListing">
                                        <c:choose>
                                            <c:when test="${listing.isFlagged}">
                                                <span class="everyStatus flagged">Flagged</span>
                                            </c:when>
                                            <c:when test="${listing.activeStatus == 'Active'}">
                                                <span class="everyStatus listed">Listed</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="everyStatus sold">${listing.activeStatus}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="tableRowListing">${listing.listedDate}</td>
                                    <td class="tableRowListing">
                                        <div class="changeButtons">
											<a href="${pageContext.request.contextPath}/editListing?id=${listing.productId}" class="editButton">Edit</a>                                            <form action="${pageContext.request.contextPath}/userOwn" method="post" style="display:inline;">
                                                <input type="hidden" name="productId" value="${listing.productId}" />
                                                <button class="deleteButton" name="delete" type="submit">Delete</button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="userListingHeader" style="margin-top: 32px;">
                    <p class="userListingTitle">Purchase History</p>
                </div>

                <div class="tableBox">
                    <table class="listingTable">
                        <thead>
                            <tr>
                                <th class="tableHead">Order ID</th>
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
                                    <td class="tableRowListing" style="font-weight: 700; color: #4f5bd5;">#${order.orderId}</td>
                                    <td class="tableRowListing">${order.productName}</td>
                                    <td class="tableRowListing">${order.categoryName}</td>
                                    <td class="tableRowListing">$${order.amount}</td>
                                    <td class="tableRowListing">${order.orderDate}</td>
                                    <td class="tableRowListing">
                                        <c:choose>
                                            <c:when test="${order.orderStatus == 'Completed'}">
                                                <span class="everyStatus listed">Completed</span>
                                            </c:when>
                                            <c:when test="${order.orderStatus == 'Pending'}">
                                                <span class="everyStatus" style="background:#FEF9C3; color:#854D0E;">Pending</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="everyStatus sold">${order.orderStatus}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>

        <%@ include file="/Component/adminFooter.jsp" %>
    </body>
</html>