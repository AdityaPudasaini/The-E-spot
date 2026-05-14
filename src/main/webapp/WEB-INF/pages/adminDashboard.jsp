<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Dashboard</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminDashboard.css">
    </head>

	<body>
		<%@ include file="/Component/adminSidebar.jsp" %>
        
        <div style="display: flex; flex-direction: column; margin-left: 250px; width: calc(100% - 250px);">
            <div class="topPart">
                <p class="dashboardHeading"><b>Dashboard</b></p>

                <div class="adminPhoto" style="margin-top: 0px; margin-left: 45px">
					<img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%;" />                
				</div>
            </div>

            <div class="adminWelcome">
                <div>
                    <p style="color: white; margin-left: 50px; margin-top: 50px; margin-bottom: 0px; font-size: 30px;"><b>Welcome Back Admin!</b></p>
                    <p style="color:white; margin-left: 50px">Let us continue to check and moniter the website</p>
                </div> 

                <a href="${pageContext.request.contextPath}/report" class="buttonRectangle" style="text-decoration: none;">
                    <span class="report">View Report</span>
                </a>
            </div>

            <div class="stats">
                <div class="smallBox">
                    <img src="${pageContext.request.contextPath}/Images/dollar.png" class="dollarImage">
                    <p class="smallText"> Total Revenue Generated</p>
                    <p class="money"><b>$${revenue.totalRevenue}</b></p>
                </div>
                
                <div class="smallBox">
                    <img src="${pageContext.request.contextPath}/Images/product Sold.png" class="dollarImage">
                    <p class="smallText"> Total Product Sold</p>
                    <p class="money"><b>${sold.totalSold}</b></p>
                </div>

                <div class="smallBox">
                    <img src="${pageContext.request.contextPath}/Images/Product Listed.png" class="dollarImage">
                    <p class="smallText"> Total Product Listed</p>
                    <p class="money"><b>${listed.totalListed}</b></p>
                </div>

                <div class="smallBox">
                    <img src="${pageContext.request.contextPath}/Images/people visited.png" class="dollarImage">
                    <p class="smallText"> Total Website Visitors</p>
                    <p class="money"><b>${visitors.totalVisitors}</b></p>
                </div>
            </div>

            <div style="display: flex;">
                <div class="lastBox">
                    <div style="display: flex;">
                        <p class="invalidListingText"><b>Invalid Listings</b></p>
                        <a href="${pageContext.request.contextPath}/flagged }" class="sideText">See More</a>
                    </div>

                    <div class="invalidItem" style="${empty flagged.flaggedProductName ? 'display:none;' : ''}">
                        <p class="invalidItemName">${flagged.flaggedProductName}</p>
						<p class="invalidItemDesc" style="${empty flagged.flaggedProductName ? 'display:none;' : ''}">Listed on ${flagged.flaggedProductDate}</p>
						<div class="buttionsHere" style="${empty flagged.flaggedProductName ? 'display:none;' : ''}">
						    <div class="buttonPart">
						    	<form action="${pageContext.request.contextPath}/dashboard" method="post">
								    <input type="hidden" name="flaggedProductId" value="${flagged.flaggedProductId}" />
								    <button class="removebutton" name="remove" type="submit">Remove</button>
								    <button class="keepButton" name="keep" type="submit">Keep</button>
								</form>
							</div>
						</div>
                    </div>

                    <div class="invalidItem" style="border: none; ${empty flagged.flaggedProductName2 ? 'display:none;' : ''}">
						<p class="invalidItemName">${flagged.flaggedProductName2}</p>
						<p class="invalidItemDesc" style="${empty flagged.flaggedProductName2 ? 'display:none;' : ''}">Listed on ${flagged.flaggedProductDate2}</p>
						<div class="buttionsHere" style="${empty flagged.flaggedProductName2 ? 'display:none;' : ''}">
						    <div class="buttonPart">
							    <form action="${pageContext.request.contextPath}/dashboard" method="post">
								    <input type="hidden" name="flaggedProductId" value="${flagged.flaggedProductId2}" />
								    <button class="removebutton" name="remove" type="submit">Remove</button>
								    <button class="keepButton" name="keep" type="submit">Keep</button>
								</form>
							</div>
						</div>
                    </div>
                </div>

                <div class="lastBox">
                    <div style="display: flex;">
                        <p class="recentListingText">Recent Listings</p>
                        <a href="${pageContext.request.contextPath}/listing" class="sideText" style="padding-left: 295px;">See More</a>
                    </div>

                    <div class="listedItem" style="${empty dashboardData.recentProduct1 ? 'display:none;' : ''}">
                        <div class="listedItemInfo">
                            <p class="listedItemName">${dashboardData.recentProduct1}</p>
                            <p class="listedItemSellerName">by ${dashboardData.recentSeller1}</p>
                        </div>
                        <span class="listedItemPrice">$${dashboardData.recentPrice1}</span>
                    </div>

                    <div class="listedItem" style="${empty dashboardData.recentProduct2 ? 'display:none;' : ''}">
                        <div class="listedItemInfo">
                            <p class="listedItemName">${dashboardData.recentProduct2}</p>
                            <p class="listedItemSellerName">by ${dashboardData.recentSeller2}</p>
                        </div>
                        <span class="listedItemPrice">$${dashboardData.recentPrice2}</span>
                    </div>

                    <div class="listedItem" style="border: none; ${empty dashboardData.recentProduct3 ? 'display:none;' : ''}">
                        <div class="listedItemInfo">
                            <p class="listedItemName">${dashboardData.recentProduct3}</p>
                            <p class="listedItemSellerName">by ${dashboardData.recentSeller3}</p>
                        </div>
                        <span class="listedItemPrice">$${dashboardData.recentPrice3}</span>
                    </div>
                </div>
            </div>
        </div>
        
        <%@ include file="/Component/adminFooter.jsp" %>
    </body>
</html>
