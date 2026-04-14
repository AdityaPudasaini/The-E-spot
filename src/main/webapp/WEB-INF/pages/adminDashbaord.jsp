<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Dashboard</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminDashboard.css">
    </head>

    <body>
        <div class="sidePanel">
            <p class="Logo">The E-spot</p>

            <br>
            <a href="#" class="dashboardLink">
                <div class="rectangle active">Dashboard</div>
            </a>
            <br>

            <a href="#" class="listingLink">
                <div class="rectangle">Listings</div>
            </a>
            <br>

            <a href="#" class="userLink">
                <div class="rectangle">Users</div>
            </a>
            <br>

            <a href="#" class="revenueLink">
                <div class="rectangle">Revenue</div>
            </a>
            <br>

            <a href="#" class="orderLink">
                <div class="rectangle">Orders</div>
            </a>
            <br>

            <a href="#" class="flaggedItemsLink">
                <div class="rectangle">Flagged Items</div>
            </a>
            <br>

            <a href="#" class="reportLink">
                <div class="rectangle">Reports</div>
            </a>    
            <br>

            <p class="line"></p>

            <a href="#" class="settingsLink">
                <div class="rectangle">Settings</div>
            </a>

            <div class="adminShow">
                <div class="adminInfo">
                    <div class="adminPhoto">A</div>
                    <div>
                        <p class="adminName">Admin</p>
                        <p class="adminRole">Administrator</p>
                    </div>
                </div>
            </div>
        </div>

        <div style="display: flex; flex-direction: column; margin-left: 250px; width: calc(100% - 250px);">
            <div class="topPart">
                <p class="dashboardHeading"><b>Dashboard</b></p>

                <div class="searchbar">
                    <p class="searchText">Search everything here</p>
                </div>

                <div class="adminPhoto" style="margin-top: 0px; margin-left: 45px">A</div>
            </div>

            <div class="adminWelcome">
                <div>
                    <p style="font-size: 30; color: white; margin-left: 50px; margin-top: 50px; margin-bottom: 0px"><b>Welcome Back Admin!</b></p>
                    <p style="color:white; margin-left: 50px">Let us continue to check and monitor the website</p>
                </div>

                <div class="buttonRectangle">
                    <a href="#" class="report">View Report</a>
                </div>
            </div>

            <div style="display: flex;">
                <div class="smallRectangle">
                    <img src="${pageContext.request.contextPath}/Images/Revenue.png" class="revenueIcon">
                    <p class="revenueText"><b>Total Revenue Generated</b></p>
                    <p class="numbers"><b>$10,000,000</b></p>
                    <p class="underText">5% up from last year</p>
                </div>

                <div class="smallRectangle">
                    <img src="${pageContext.request.contextPath}/Images/product_Sold.png" class="productSoldIcon">
                    <p class="productSoldText"><b>Total Product Sold/Day</b></p>
                    <p class="numbers"><b>10,000</b></p>
                    <p class="underText">0.2% up from last year</p>
                </div>

                <div class="smallRectangle">
                    <img src="${pageContext.request.contextPath}/Images/product_Listed.png" class="productListedIcon">
                    <p class="productListedText"><b>Total Product Listed/Day</b></p>
                    <p class="numbers"><b>15,219</b></p>
                    <p class="underText">0.3% up from last year</p>
                </div>

                <div class="smallRectangle">
                    <img src="${pageContext.request.contextPath}/Images/people_visited.jpg" class="peopleVisitedIcon">
                    <p class="peopleVisitedText" style="padding-left: 20px;"><b>Website visitors/Day</b></p>
                    <p class="numbers"><b>84,328</b></p>
                    <p class="underText">0.04% up from last year</p>
                </div>
            </div>

            <div style="display: flex;">
                <div class="lastBox">
                    <p class="invalidListingText"><b>Invalid Listings ></b></p>

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

                    <div class="moreListing">
                        <button class="moreListingButton">More Listing</button>
                    </div>
                </div>

                <div class="lastBox">
                    <p class="recentListingText">Recent Listings &gt;</p>

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
                            <p class="listedItemName">Omega seamaster,</p>
                            <p class="listedItemSellerName">by Andrew</p>
                        </div>
                        <span class="listedItemPrice">$5000</span>
                    </div>

                    <div class="recentListing">
                        <button class="recentListingButton" style="width: 120px;">Recent Listing</button>
                    </div>

                </div>

            </div>
        </div>

        <div class="footer">
            The E-spot © 2026
      </div>
    </body>
</html>
