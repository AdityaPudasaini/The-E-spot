<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Listings</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/listing.css">
	</head>
	
	<body>
		<%@ include file="/Component/adminSidebar.jsp" %>
		
		<div style="display: flex; flex-direction: column; margin-left: 250px; width: calc(100% - 250px);">

            <div class="topPart">
                <p class="dashboardHeading"><b>Listings</b></p>

                <input type="text" class="searchbar" placeholder="Search everything">

                <div class="adminPhoto" style="margin-top: 0px; margin-left: 45px">
					<img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%;" />                
				</div>
            </div>

            <div class="categoriesSelect">
                <input type="text" class="searchInput" placeholder="Search listings">
                <select class="categories">
                    <option>All Categories</option>
                    <option>Shoes</option>
                    <option>Electronics</option>
                    <option>Audio</option>
                    <option>Accessories</option>
                    <option>Wearables</option>
                </select>
                <select class="categories">
                    <option>All Status</option>
                    <option>listed</option>
                    <option>sold</option>
                    <option>Flagged</option>
                </select>
            </div>
            
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
                        <tr class="tableRow">
                            <td class="tableRowListing"><img src="${pageContext.request.contextPath}/Images/placeholderForNow.png" class="productImage" alt=""></td>
                            <td class="tableRowListing">Nike Air Max 270</td>
                            <td class="tableRowListing">Shoes</td>
                            <td class="tableRowListing">$129</td>
                            <td class="tableRowListing">34</td>
                            <td class="tableRowListing"><span class="everyStatus listed">Listed</span></td>
                            <td class="tableRowListing">Apr 12, 2025</td>
                            <td class="tableRowListing">
                                <div class="changeButtons">
                                    <button class="editButton">Edit</button>
                                    <button class="deleteButton">Delete</button>
                                </div>
                            </td>
                        </tr>
                        <tr class="tableRow">
                            <td class="tableRowListing"><img src="${pageContext.request.contextPath}/Images/placeholderForNow.png" class="productImage" alt=""></td>
                            <td class="tableRowListing">MacBook Pro M3</td>
                            <td class="tableRowListing">Electronics</td>
                            <td class="tableRowListing">$2,499</td>
                            <td class="tableRowListing">5</td>
                            <td class="tableRowListing"><span class="everyStatus flagged">Flagged</span></td>
                            <td class="tableRowListing">Apr 10, 2025</td>
                            <td class="tableRowListing">
                                <div class="changeButtons">
                                    <button class="editButton">Edit</button>
                                    <button class="deleteButton">Delete</button>
                                </div>
                            </td>
                        </tr>
                        <tr class="tableRow">
                            <td class="tableRowListing"><img src="${pageContext.request.contextPath}/Images/placeholderForNow.png" class="productImage" alt=""></td>
                            <td class="tableRowListing">Sony WH-1000XM5</td>
                            <td class="tableRowListing">Audio</td>
                            <td class="tableRowListing">$349</td>
                            <td class="tableRowListing">120</td>
                            <td class="tableRowListing"><span class="everyStatus listed">Listed</span></td>
                            <td class="tableRowListing">Apr 08, 2025</td>
                            <td class="tableRowListing">
                                <div class="changeButtons">
                                    <button class="editButton">Edit</button>
                                    <button class="deleteButton">Delete</button>
                                </div>
                            </td>
                        </tr>
                        <tr class="tableRow">
                            <td class="tableRowListing"><img src="${pageContext.request.contextPath}/Images/placeholderForNow.png" class="productImage" alt=""></td>
                            <td class="tableRowListing">Apple Watch Series 9</td>
                            <td class="tableRowListing">Wearables</td>
                            <td class="tableRowListing">$399</td>
                            <td class="tableRowListing">52</td>
                            <td class="tableRowListing"><span class="everyStatus sold">sold</span></td>
                            <td class="tableRowListing">Apr 05, 2025</td>
                            <td class="tableRowListing">
                                <div class="changeButtons">
                                    <button class="editButton">Edit</button>
                                    <button class="deleteButton">Delete</button>
                                </div>
                            </td>
                        </tr>
                        <tr class="tableRow">
                            <td class="tableRowListing"><img src="${pageContext.request.contextPath}/Images/placeholderForNow.png" class="productImage" alt=""></td>
                            <td class="tableRowListing">Logitech MX Master 3S</td>
                            <td class="tableRowListing">Accessories</td>
                            <td class="tableRowListing">$99</td>
                            <td class="tableRowListing">200</td>
                            <td class="tableRowListing"><span class="everyStatus listed">listed</span></td>
                            <td class="tableRowListing">Apr 02, 2025</td>
                            <td class="tableRowListing">
                                <div class="changeButtons">
                                    <button class="editButton">Edit</button>
                                    <button class="deleteButton">Delete</button>
                                </div>
                            </td>
                        </tr>
                        <tr class="tableRow">
                            <td class="tableRowListing"><img src="${pageContext.request.contextPath}/Images/placeholderForNow.png" class="productImage" alt=""></td>
                            <td class="tableRowListing">Samsung Galaxy S24 Ultra</td>
                            <td class="tableRowListing">Electronics</td>
                            <td class="tableRowListing">$1,199</td>
                            <td class="tableRowListing">18</td>
                            <td class="tableRowListing"><span class="everyStatus flagged">Flagged</span></td>
                            <td class="tableRowListing">Mar 28, 2025</td>
                            <td class="tableRowListing">
                                <div class="changeButtons">
                                    <button class="editButton">Edit</button>
                                    <button class="deleteButton">Delete</button>
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
		
		
		
		<%@ include file="/Component/adminFooter.jsp" %>
	</body>
</html>