<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html> 

<html>
	<head>
		<meta charset="UTF-8">
		<title>Listings</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/listing.css">
	</head>
	
	<body>
		<%@ include file="/Component/adminSidebar.jsp" %>
		
		<div style="display: flex; flex-direction: column; margin-left: 250px; width: calc(100% - 250px); min-height: 700px;">

            <div class="topPart">
                <p class="dashboardHeading" style="margin-right: 920px;"><b>Listings</b></p>

                <div class="adminPhoto" style="margin-top: 0px; margin-left: 130px; flex-shrink: 0;">
					<img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%;" />                
				</div>
            </div>

			<form method="get" action="${pageContext.request.contextPath}/listing">
	            <div class="categoriesSelect">
				    <input type="text" class="searchInput" placeholder="Search listings" name="search" value="${selectedSearch}">
				    
				    <select class="categories" onchange="this.form.submit()" name="category">
				    
					    <option value="" ${empty selectedCategory ? 'selected' : ''}>All Categories</option>
					    
					    <c:forEach var="category" items="${categories}">
					        <option value="${category}" ${category == selectedCategory ? 'selected' : ''}>${category}</option>
					    </c:forEach>
					    
					</select>
					
					<select class="categories" onchange="this.form.submit()" name="status">
					    <option value="" ${empty selectedStatus ? 'selected' : ''}>All Status</option>
					    <option value="Active" ${selectedStatus == 'Active' ? 'selected' : ''}>Active</option>
					    <option value="Sold" ${selectedStatus == 'Sold' ? 'selected' : ''}>Sold</option>
					    <option value="Flagged" ${selectedStatus == 'Flagged' ? 'selected' : ''}>Flagged</option>
					</select>
				</div>
			</form>
            
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
								<td class="tableRowListing"><img src="${pageContext.request.contextPath}/image?name=product${listing.productId}" class="productImage"></td>						        <td class="tableRowListing">${listing.productName}</td>
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
								        <c:choose>
								            <c:when test="${listing.isFlagged}">
								            
								                <form action="${pageContext.request.contextPath}/listing" method="post">
								                    <input type="hidden" name="productId" value="${listing.productId}"/>
								                    <button class="editButton" name="keep" type="submit">Keep</button>
								                </form>
								                
								            </c:when>
								            
								            <c:otherwise>
								            
								                <form action="${pageContext.request.contextPath}/listing" method="post">
								                    <input type="hidden" name="productId" value="${listing.productId}"/>
								                    <button class="deleteButton" name="flag" type="submit">Flag</button>
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
			
			    <c:choose>
			    
			        <c:when test="${currentPageInListing > 1}">
			            <a href="${pageContext.request.contextPath}/listing?page=${currentPageInListing - 1}" class="lastPartButton">Previous</a>
			        </c:when>
			        
			        <c:otherwise>
			            <a class="lastPartButton" style="opacity: 0.4; pointer-events: none;">Previous</a>
			        </c:otherwise>
			        
			    </c:choose>
			
			    <c:forEach begin="1" end="${totalPages}" var="i">
			        <a href="${pageContext.request.contextPath}/listing?page=${i}" class="lastPartButton ${i == currentPageInListing ? 'pageActive' : ''}">${i}</a>
			    </c:forEach>
			
			    <c:choose>
			    
			        <c:when test="${currentPageInListing < totalPages}">
			            <a href="${pageContext.request.contextPath}/listing?page=${currentPageInListing + 1}" class="las">Next</a>
			        </c:when>
			        
			        <c:otherwise>
			            <a class="lastPartButton" style="opacity: 0.4; pointer-events: none;">Next</a>
			        </c:otherwise>
			        
			    </c:choose>
			</div>
        </div>
        
		<%@ include file="/Component/adminFooter.jsp" %>
	</body>
</html>