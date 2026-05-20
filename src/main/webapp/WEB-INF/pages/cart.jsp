<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cart - The E-Spot</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
    </head>
    <body>
        <%@ include file="/Component/userSidebar.jsp" %>

        <div class="mainContent">

            <div class="userTopBar">
                <p class="userDashboardHeading"><b>My Cart</b></p>
                <div class="userAvatarCircle">
                    <img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%;"/>
                </div>
            </div>

            <div class="cartWrapper">

                <div class="cartHeader">
                    <p class="cartTitle">Cart Items</p>
                </div>

                <div class="tableBox">
                    <table class="listingTable">
                        <thead>
                            <tr>
                                <th class="tableHead">Image</th>
                                <th class="tableHead">Product Name</th>
                                <th class="tableHead">Category</th>
                                <th class="tableHead">Price</th>
                                <th class="tableHead">Quantity</th>
                                <th class="tableHead">Total</th>
                                <th class="tableHead">Actions</th>
                            </tr>
                        </thead>
                        
                        <tbody>
						    <c:forEach var="item" items="${cartItems}">
						        <tr class="tableRow">
						            <td class="tableRowListing">
						                <img src="${pageContext.request.contextPath}/image?name=product${item.productId}" class="productImage">
						            </td>
						            <td class="tableRowListing">${item.productName}</td>
						            <td class="tableRowListing">${item.categoryName}</td>
						            <td class="tableRowListing">$${item.formattedPrice}</td>
						            <td class="tableRowListing">${item.quantity}</td>
						            <td class="tableRowListing">$${item.total}</td>
						            <td class="tableRowListing">
						                <div style="display: flex; gap: 6px;">
						                    <c:choose>
						                        <c:when test="${item.stockQuantity == 0}">
						                            <span style="color: #EF4444; font-size: 12px; font-weight: bold;">Out of Stock</span>
						                        </c:when>
						                        <c:otherwise>
						                            <form action="${pageContext.request.contextPath}/Cart" method="post" style="display:inline;">
						                                <input type="hidden" name="cartItemId" value="${item.cartItemId}" />
						                                <input type="hidden" name="productId" value="${item.productId}" />
						                                <input type="hidden" name="quantity" value="${item.quantity}" />
						                                <button class="editButton" name="buy" type="submit"  style="border: none; padding: 6px 14px; border-radius: 20px; font-size: 12px; font-weight: bold; cursor: pointer; color: white; background-color: #2563EB; mrgin-right: 20px">Buy</button>
						                            </form>
						                        </c:otherwise>
						                    </c:choose>
						                    <form action="${pageContext.request.contextPath}/Cart" method="post" style="display:inline;">
						                        <input type="hidden" name="cartItemId" value="${item.cartItemId}" />
						                        <button class="deleteButton" name="remove" type="submit">Remove</button>
						                    </form>
						                </div>
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