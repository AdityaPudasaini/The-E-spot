<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Listing - The E-Spot</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addListing.css">
    </head>

    <body>
        <%@ include file="/Component/userSidebar.jsp" %>

        <div class="mainContent">

            <div class="userTopBar">
                <p class="userDashboardHeading"><b>Edit Listing</b></p>
                <div class="userAvatarCircle">
                    <img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%;"/>
                </div>
            </div>

            <div class="addListingWrapper">

                <form class="addListingForm" action="${pageContext.request.contextPath}/editListing" method="post" enctype="multipart/form-data">

                    <input type="hidden" name="productId" value="${product.productId}" />

                    <c:if test="${not empty errorMessage}">
                        <div class="addListingError">${errorMessage}</div>
                    </c:if>

                    <div class="addListingField">
                        <label class="addListingLabel">Product Name</label>
                        <input class="addListingInput" type="text" name="productName" value="${product.productName}" placeholder="Enter product name" required />
                    </div>

                    <div class="addListingField">
                        <label class="addListingLabel">Product Description</label>
                        <textarea class="addListingTextarea" name="productDescription" placeholder="Enter product description" rows="4" required>${product.productDescription}</textarea>
                    </div>

                    <div class="addListingRow">
                        <div class="addListingField">
                            <label class="addListingLabel">Price ($)</label>
                            <input class="addListingInput" type="number" name="productPrice" value="${product.productPrice}" placeholder="0.00" step="0.01" min="0" required />
                        </div>
                        
                        <div class="addListingField">
                            <label class="addListingLabel">Stock Quantity</label>
                            <input class="addListingInput" type="number" name="stockQuantity" value="${product.stockQuantity}" placeholder="0" min="0" required />
                        </div>
                    </div>

                    <div class="addListingField">
                    
                        <label class="addListingLabel">Category</label>
                        
                        <select class="addListingSelect" name="categoryId" required>
                            <option value="">Select a category</option>
                            
                            <c:forEach var="category" items="${categories}">
                            
                                <option value="${category.categoryId}" <c:if test="${category.categoryId == product.categoryId}">selected</c:if> >${category.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="addListingField">
                    
                        <label class="addListingLabel">Product Image</label>
                        
                        <div class="currentImageBox">
                            <img src="${pageContext.request.contextPath}/image?name=product${product.productId}" class="currentImagePreview" />
                            <p class="currentImageNote">Current image — upload a new one to replace it</p>
                        </div>
                        
                        <input class="addListingFileInput" type="file" name="productImage" accept="image/*"/>
                    </div>

                    <div class="addListingButtons">
                        <button type="submit" class="addListingBtnPrimary">Save Changes</button>
						<a href="${pageContext.request.contextPath}/userOwn" class="addListingBtnSecondary" style="text-decoration: none; text-align: center">Cancel</a>                    
					</div>

                </form>
            </div>

        </div>

        <%@ include file="/Component/adminFooter.jsp" %>
    </body>
</html>