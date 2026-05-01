<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Dashboard</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminDashboard.css">
    </head>

	<body>
		<%@ include file="/WEB-INF/pages/adminSidebar.jsp" %>
        
        <div style="display: flex; flex-direction: column; margin-left: 250px; width: calc(100% - 250px);">
            <div class="topPart">
                <p class="dashboardHeading"><b>Dashboard</b></p>

                <input type="text" class="searchbar" placeholder="Search everything">

                <div class="adminPhoto" style="margin-top: 0px; margin-left: 45px">A</div>
            </div>

            <div class="adminWelcome">
                <div>
                    <p style="color: white; margin-left: 50px; margin-top: 50px; margin-bottom: 0px; font-size: 30px;"><b>Welcome Back Admin!</b></p>
                    <p style="color:white; margin-left: 50px">Let us continue to check and moniter the website</p>
                </div> 

                <a href="#" class="buttonRectangle" style="text-decoration: none;">
                    <span class="report">View Report</span>
                </a>
            </div>

            <div class="stats">
                <div class="smallBox">
                    <img src="${pageContext.request.contextPath}/Images/dollar.png" class="dollarImage">
                    <p class="smallText"> Total Revenue Generated</p>
                    <p class="money"><b>$10,000,000</b></p>
                    <div class="smallStat">   🠉  +5% from last year</div>
                </div>
                
                <div class="smallBox">
                    <img src="${pageContext.request.contextPath}/Images/product Sold.png" class="dollarImage">
                    <p class="smallText"> Total Product Sold</p>
                    <p class="money"><b>10,000</b></p>
                    <div class="smallStat">   🠉  +1% from last year</div>
                </div>

                <div class="smallBox">
                    <img src="${pageContext.request.contextPath}/Images/Product Listed.png" class="dollarImage">
                    <p class="smallText"> Total Product Listed</p>
                    <p class="money"><b>19,000</b></p>
                    <div class="smallStat">   🠉  +0.5% from last year</div>
                </div>

                <div class="smallBox">
                    <img src="${pageContext.request.contextPath}/Images/people visited.png" class="dollarImage">
                    <p class="smallText"> Total Website Visitors</p>
                    <p class="money"><b>15,000,000</b></p>
                    <div class="smallStat" style="background: #FEE2E2; color: #991B1B; width: 170px;">   🠋  +0.09% from last year</div>
                </div>
            </div>

            <div style="display: flex;">
                <div class="lastBox">
                    <div style="display: flex;">
                        <p class="invalidListingText"><b>Invalid Listings</b></p>

                        <a href="#" class="sideText">See More </a>
                    </div>

                    <div class="invalidItem">
                        <p class="invalidItemName">MacBook Pro M3 — possibly counterfeit</p>
                        <p class="invalidItemDesc">Reported by 2 users · Listed 3h ago</p>

                        <div class="buttionsHere">
                            <button class="removebutton">Remove</button>
                            <button class="keepButton">Keep</button>
                        </div>
                    </div>

                    <div class="invalidItem" style="border: none;">
                        <p class="invalidItemName">Air Jordan — Too damaged</p>
                        <p class="invalidItemDesc">Reported by 1 user · Listed 20h ago</p>

                        <div class="buttionsHere">
                            <button class="removebutton">Remove</button>
                            <button class="keepButton">Keep</button>
                        </div>
                    </div>
                </div>

                <div class="lastBox">
                    <div style="display: flex;">
                        <p class="recentListingText">Recent Listings</p>

                        <a href="#" class="sideText" style="padding-left: 295px;">See More </a>
                    </div>

                    <div class="listedItem">
                        <div class="listedItemInfo">
                            <p class="listedItemName">Nike Air Max 270</p>
                            <p class="listedItemSellerName">by Michael</p>
                        </div>
                        <span class="listedItemPrice">$129</span>
                    </div>

                    <div class="listedItem">
                        <div class="listedItemInfo">
                            <p class="listedItemName">60% Mechanic Keyboard</p>
                            <p class="listedItemSellerName">by Sam</p>
                        </div>
                        <span class="listedItemPrice">$99.99</span>
                    </div>

                    <div class="listedItem" style="border: none;">
                        <div class="listedItemInfo">
                            <p class="listedItemName">Omega Seamaster,</p>
                            <p class="listedItemSellerName">by Andrew</p>
                        </div>
                        <span class="listedItemPrice">$5000</span>
                    </div>
                </div>
            </div>
        </div>
        
        <%@ include file="/WEB-INF/pages/adminFooter.jsp" %>
    </body>
</html>
