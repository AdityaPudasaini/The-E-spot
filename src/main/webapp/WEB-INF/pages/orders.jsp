<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Orders</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
	</head>
	<body>
		<%@ include file="/WEB-INF/pages/adminSidebar.jsp" %>
		
		<div style="display: flex; flex-direction: column; margin-left: 250px; width: calc(100% - 250px);">

	        <div class="topPart">
	            <p class="dashboardHeading"><b>Orders</b></p>
	            <input type="text" class="searchbar" placeholder="Search everything">
	            <div class="adminPhoto" style="margin-top: 0px; margin-left: 45px">
					<img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%;" />                
				</div>
	        </div>
	
	        <div class="statsRow">
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Total Orders</div>
	                <div class="moneyDollar">4,280</div>
	                <span class="smallStat" style="background: #DCFCE7; color: #166534;">+8% from last month</span>
	            </div>
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Completed Orders</div>
	                <div class="moneyDollar">3,541</div>
	                <span class="smallStat" style="background: #DCFCE7; color: #166534;">+5.3% from last month</span>
	            </div>
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Pending Orders</div>
	                <div class="moneyDollar">502</div>
	                <span class="smallStat" style="background: #FEE2E2; color: #991B1B;">+1.2% from last week</span>
	            </div>
	            <div class="smallBox">
	                <img class="smallBoxImage" src="https://placehold.co/50x50" alt="">
	                <div class="smallText">Refunded Orders</div>
	                <div class="moneyDollar">237</div>
	                <span class="smallStat" style="background: #FEE2E2; color: #991B1B;">-0.7% from last month</span>
	            </div>
	        </div>
	
	        <div class="categoriesSelect">
	            <input type="text" class="searchInput" placeholder="Search orders...">
	            <select class="categories">
	                <option>All Status</option>
	                <option>Completed</option>
	                <option>Pending</option>
	                <option>Refunded</option>
	                <option>Cancelled</option>
	            </select>
	        </div>
	
	        <div class="tableBox">
	            <div class="tableTitle">Order List</div>
	            <table class="listingTable">
	                <thead>
	                    <tr>
	                        <th class="tableHead">Order ID</th>
	                        <th class="tableHead">Customer</th>
	                        <th class="tableHead">Product</th>
	                        <th class="tableHead">Category</th>
	                        <th class="tableHead">Amount</th>
	                        <th class="tableHead">Date</th>
	                        <th class="tableHead">Status</th>
	                        <th class="tableHead">Actions</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#1001</td>
	                        <td class="tableRowListing">Michael Johnson</td>
	                        <td class="tableRowListing">Nike Air Max 270</td>
	                        <td class="tableRowListing">Shoes</td>
	                        <td class="tableRowListing">$129</td>
	                        <td class="tableRowListing">Apr 01, 2025</td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #DCFCE7; color: #166534;">Completed</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="editButton">View</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#1002</td>
	                        <td class="tableRowListing">Sarah Lee</td>
	                        <td class="tableRowListing">MacBook Pro M3</td>
	                        <td class="tableRowListing">Electronics</td>
	                        <td class="tableRowListing">$2,499</td>
	                        <td class="tableRowListing">Apr 03, 2025</td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #FEF9C3; color: #854D0E;">Pending</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="editButton">View</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#1003</td>
	                        <td class="tableRowListing">David Kim</td>
	                        <td class="tableRowListing">Sony WH-1000XM5</td>
	                        <td class="tableRowListing">Audio</td>
	                        <td class="tableRowListing">$349</td>
	                        <td class="tableRowListing">Apr 05, 2025</td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #DCFCE7; color: #166534;">Completed</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="editButton">View</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#1004</td>
	                        <td class="tableRowListing">Emma Brown</td>
	                        <td class="tableRowListing">Apple Watch S9</td>
	                        <td class="tableRowListing">Wearables</td>
	                        <td class="tableRowListing">$399</td>
	                        <td class="tableRowListing">Apr 08, 2025</td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #FEE2E2; color: #991B1B;">Refunded</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="editButton">View</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#1005</td>
	                        <td class="tableRowListing">James Carter</td>
	                        <td class="tableRowListing">Leather Wallet</td>
	                        <td class="tableRowListing">Accessories</td>
	                        <td class="tableRowListing">$49</td>
	                        <td class="tableRowListing">Apr 10, 2025</td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #DCFCE7; color: #166534;">Completed</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="editButton">View</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#1006</td>
	                        <td class="tableRowListing">Aisha Patel</td>
	                        <td class="tableRowListing">iPad Pro 12.9</td>
	                        <td class="tableRowListing">Electronics</td>
	                        <td class="tableRowListing">$1,099</td>
	                        <td class="tableRowListing">Apr 14, 2025</td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #F1F5F9; color: #475569;">Cancelled</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="editButton">View</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#1007</td>
	                        <td class="tableRowListing">Carlos Mendez</td>
	                        <td class="tableRowListing">Adidas Ultraboost</td>
	                        <td class="tableRowListing">Shoes</td>
	                        <td class="tableRowListing">$189</td>
	                        <td class="tableRowListing">Apr 18, 2025</td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #FEF9C3; color: #854D0E;">Pending</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="editButton">View</button></div></td>
	                    </tr>
	                    <tr class="tableRow">
	                        <td class="tableRowListing" style="font-weight: 700; color: #2563EB;">#1008</td>
	                        <td class="tableRowListing">Lena Fischer</td>
	                        <td class="tableRowListing">Ray-Ban Sunglasses</td>
	                        <td class="tableRowListing">Accessories</td>
	                        <td class="tableRowListing">$215</td>
	                        <td class="tableRowListing">Apr 22, 2025</td>
	                        <td class="tableRowListing"><span class="everyStatus" style="background: #DCFCE7; color: #166534;">Completed</span></td>
	                        <td class="tableRowListing"><div class="changeButtons"><button class="editButton">View</button></div></td>
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