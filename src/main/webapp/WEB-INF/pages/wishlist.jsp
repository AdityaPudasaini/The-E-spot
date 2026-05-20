<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Wishlist</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/wishlist.css">
    </head>
    <body>
        <%@ include file="/Component/userSidebar.jsp" %>

        <div class="mainContent">

            <div class="userTopBar">
                <p class="userDashboardHeading"><b>My Wishlist</b></p>
                <div class="userAvatarCircle">
                    <img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%;"/>
                </div>
            </div>

            <div class="wishlistWrapper">

                <div class="wishlistHeader">
                    <p class="wishlistTitle">Wishlist Items</p>
                </div>

                <div class="tableBox">
                    <table class="listingTable">
                        <thead>
                            <tr>
                                <th class="tableHead">Image</th>
                                <th class="tableHead">Product Name</th>
                                <th class="tableHead">Category</th>
                                <th class="tableHead">Price</th>
                                <th class="tableHead">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${wishlistItems}">
                                <tr class="tableRow">
                                    <td class="tableRowListing">
                                        <img src="${pageContext.request.contextPath}/image?name=product${item.productId}" class="productImage">
                                    </td>
                                    <td class="tableRowListing">${item.productName}</td>
                                    <td class="tableRowListing">${item.categoryName}</td>
                                    <td class="tableRowListing">$${item.formattedPrice}</td>
                                    <td class="tableRowListing">
                                        <form action="${pageContext.request.contextPath}/wishlistPage" method="post" style="display:inline;">
                                            <input type="hidden" name="wishlistItemId" value="${item.wishlistItemId}" />
                                            <button class="deleteButton" name="remove" type="submit">Remove</button>
                                        </form>
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