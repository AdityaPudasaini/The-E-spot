<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Listing</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/usersListing.css">
    </head>

    <body>
        <%@ include file="/Component/userSidebar.jsp" %>

        <div class="mainContent" style="min-height: 900px;">

            <div class="userTopBar">
                <p class="userDashboardHeading"><b>Listings</b></p>
                <div class="userAvatarCircle">
                    <img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%;"/>
                </div>
            </div>

			<div class="listingControls">
	            <form method="post" action="${pageContext.request.contextPath}/UserListing">
				    <div class="categoriesSelect">
				
				        <input type="text" class="searchInput" placeholder="Search listings" name="search" value="${selectedSearch}" />
				
				        <select class="categories" name="category" onchange="this.form.submit()">
				        
				            <option value="">All Categories</option>
				            
				            <c:forEach var="cat" items="${categories}">
				            
				                <option value="${cat}" <c:if test="${cat == selectedCategory}">selected</c:if> >${cat}</option>
				            </c:forEach>
				        </select>
				
				        <button type="submit" style="display: none;"></button>
				    </div>
				</form>
			
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
                                    <img src="${pageContext.request.contextPath}/image?name=product${listing.productId}" style="width: 100%; height: 100%; object-fit: contain; border-radius: 12px 12px 0 0;" />
                                    
                                    <div class="productImageFallback">
                                       
                                    </div>
                                </div>
                                
                                <div class="productInfo">
                                    <p class="productName">${listing.productName}</p>
                                    <p class="productCategory">${listing.categoryName}</p>
                                    <p class="productPrice">$${listing.productPrice}</p>
                                    <p class="productStock">Stock: ${listing.stockQuantity}</p>
                                    <a href="${pageContext.request.contextPath}/viewListing?id=${listing.productId}" class="viewButton">View</a>
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