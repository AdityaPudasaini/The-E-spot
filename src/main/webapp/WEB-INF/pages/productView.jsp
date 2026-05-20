<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>${product.productName}</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productDetail.css">
    </head>

    <body>
        <%@ include file="/Component/userSidebar.jsp" %>

        <div class="mainContent">

            <div class="userTopBar">
            
                <p class="userDashboardHeading"><b>Product Detail</b></p>
                
                <div class="userAvatarCircle">
                    <img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%;" />
                </div>
            </div>

            <div class="productDetailWrapper">

                <div class="productLeft">
                    <div class="mainImageBox">
                        <img src="${pageContext.request.contextPath}/image?name=product${product.productId}" style="width: 100%; height: 100%; object-fit: contain; border-radius: 14px;" />
                        
                        <div class="imageFallback">
                            
                        </div>
                    </div>
                </div>

                <div class="productRight">

                    <p class="productDetailName">${product.productName}</p>

                    <span class="categoryBadge">${product.categoryName}</span>

                    <div class="starRow">
                    
                        <c:forEach begin="1" end="5" var="star">
                        
                            <c:choose>
                            
                                <c:when test="${star <= avgRatingRounded}">
                                    <span class="starFilled">★</span>
                                </c:when>
                                
                                <c:otherwise>
                                    <span class="starEmpty">★</span>
                                </c:otherwise>
                                
                            </c:choose>
                            
                        </c:forEach>
                        
                        <span class="ratingCount">(${reviewCount} reviews)</span>
                    </div>

                    <p class="productDetailPrice">$${product.productPrice}</p>

                    <c:choose>
                    
                        <c:when test="${product.stockQuantity > 0}">
                            <p class="stockIn">In Stock — ${product.stockQuantity} left</p>
                        </c:when>
                        
                        <c:otherwise>
                            <p class="stockOut">Out of Stock</p>
                        </c:otherwise>
                        
                    </c:choose>

                    <p class="productDetailDesc">${product.productDescription}</p>

                    <c:choose>
                    
					    <c:when test="${product.stockQuantity > 0}">
					    
					        <form method="post" action="${pageContext.request.contextPath}/cart">
					            <input type="hidden" name="productId" value="${product.productId}" />
					            
					            <div class="quantityRow">
					                <input type="number" name="quantity" value="1" min="1" max="${product.stockQuantity}" class="quantityInput" />
					            </div>
					            
					            <div class="actionButtons">
					                <button type="submit" name="action" value="addToCart" class="addToCartBtn">Add to Cart</button>
					                <button type="submit" name="action" value="buyNow" class="buyNowBtn">Buy Now</button>
					            </div>
					        </form>
					    </c:when>
					    <c:otherwise>
					        <form method="post" action="${pageContext.request.contextPath}/wishlist">
					            <input type="hidden" name="productId" value="${product.productId}" />
					            <div class="actionButtons">
					                <button type="submit" class="wishlistBtn">Add to Wishlist</button>
					            </div>
					        </form>
					    </c:otherwise>
					</c:choose>

                    <div class="sellerInfo">
                        <div class="sellerAvatar">
                            <img src="${pageContext.request.contextPath}/image?name=${product.sellerUsername}" style="width: 100%; height: 100%; border-radius: 50%;" />
                        </div>
                        
                        <div>
                            <p class="sellerUsername">${product.sellerUsername}</p>
                            <p class="sellerLabel">Seller</p>
                        </div>
                    </div>

                </div>
            </div>

            <div class="productDetailsCard">
                <p class="sectionTitle">Product Details</p>
                <table class="detailsTable">
                    <tr>
                        <td class="detailLabel">Category</td>
                        <td class="detailValue">${product.categoryName}</td>
                    </tr>
                    <tr>
                        <td class="detailLabel">Listed Date</td>
                        <td class="detailValue">${product.listedDate}</td>
                    </tr>
                    <tr>
                        <td class="detailLabel">Stock</td>
                        <td class="detailValue">${product.stockQuantity} units</td>
                    </tr>
                    <tr>
                        <td class="detailLabel">Status</td>
                        <td class="detailValue">${product.activeStatus}</td>
                    </tr>
                </table>
            </div>

            <div class="reviewsCard">
                <p class="sectionTitle">Reviews (${reviewCount})</p>

                <c:choose>
                
                    <c:when test="${empty reviews}">
                        <p class="noReviews">No reviews yet for this product.</p>
                    </c:when>
                    
                    <c:otherwise>
                    
                        <c:forEach var="review" items="${reviews}">
                        
                            <div class="reviewItem">
                                <div class="reviewHeader">
                                    <div class="reviewerAvatar">
                                        <img src="${pageContext.request.contextPath}/image?name=${review.memberUsername}" style="width: 100%; height: 100%; border-radius: 50%;"/>
                                    </div>
                                    
                                    <div class="reviewerInfo">
                                        <p class="reviewerName">${review.memberUsername}</p>
                                        <p class="reviewDate">${review.reviewDate}</p>
                                    </div>
                                    
                                    <div class="reviewStars">
                                    
                                        <c:forEach begin="1" end="5" var="star">
                                        
                                            <c:choose>
                                            
                                                <c:when test="${star <= review.reviewRating}">
                                                    <span class="starFilled">★</span>
                                                </c:when>
                                                
                                                <c:otherwise>
                                                    <span class="starEmpty">★</span>
                                                </c:otherwise>
                                                
                                            </c:choose>
                                            
                                        </c:forEach>
                                        
                                    </div>
                                </div>
                                <p class="reviewComment">${review.reviewComment}</p>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>

        <%@ include file="/Component/adminFooter.jsp" %>
    </body>
</html>