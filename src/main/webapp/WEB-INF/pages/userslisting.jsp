<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Listings - The E-Spot</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listing.css">
    </head>

    <body>
        <%@ include file="/Component/userSidebar.jsp" %>

        <div class="mainContent">

            <div class="userTopBar">
                <p class="userDashboardHeading"><b>Listings</b></p>
                <div class="userAvatarCircle">
                    <img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}"
                         style="width: 100%; height: 100%; border-radius: 50%;" />
                </div>
            </div>

            <div class="listingControls">
                <div class="listingControlsLeft">
                    <input type="text" class="searchInput" placeholder="Search listings..." id="searchInput" onkeyup="filterListings()" />
                    <select class="categorySelect" id="categoryFilter" onchange="filterListings()">
                        <option value="">All Categories</option>
                        <option value="Electronics">Electronics</option>
                        <option value="Clothing">Clothing</option>
                        <option value="Accessories">Accessories</option>
                        <option value="Audio">Audio</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <a href="${pageContext.request.contextPath}/addListing" class="addListingButton">+ Add Listing</a>
            </div>

            <c:if test="${not empty param.success}">
                <div class="successBanner">Listing added successfully!</div>
            </c:if>
            <c:if test="${not empty param.error}">
                <div class="errorBanner">Something went wrong. Please try again.</div>
            </c:if>

            <div class="productGrid" id="productGrid">
                <c:choose>
                    <c:when test="${empty listings}">
                        <div class="emptyState">
                            <p>No listings found.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="listing" items="${listings}">
                            <div class="productCard" data-name="${listing.productName}" data-category="${listing.categoryName}">
                                <div class="productImageBox">
                                    <img src="${pageContext.request.contextPath}/image?name=product${listing.productId}"
                                         alt="${listing.productName}"
                                         onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';"
                                         style="width: 100%; height: 100%; object-fit: cover; border-radius: 12px 12px 0 0;" />
                                    <div class="productImageFallback">
                                        <svg width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="#94a3b8" stroke-width="1.5">
                                            <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/>
                                        </svg>
                                    </div>
                                </div>
                                <div class="productInfo">
                                    <p class="productName">${listing.productName}</p>
                                    <p class="productCategory">${listing.categoryName}</p>
                                    <p class="productPrice">$${listing.productPrice}</p>
                                    <p class="productStock">Stock: ${listing.stockQuantity}</p>
                                    <a href="${pageContext.request.contextPath}/viewListing?id=${listing.productId}"
                                       class="viewButton">View</a>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>

        <%@ include file="/Component/adminFooter.jsp" %>
    </body>
</html>