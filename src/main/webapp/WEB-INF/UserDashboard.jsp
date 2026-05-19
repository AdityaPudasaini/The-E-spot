<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User Dashboard</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/UserDashboard.css">
    </head>

    <body>
        <% request.setAttribute("currentPage", "dashboard"); %>
        <%@ include file="/components/userSidebar.jsp" %>

        <div style="display: flex; flex-direction: column; margin-left: 250px; width: calc(100% - 250px);">

            <!-- Top Bar -->
            <div class="userTopBar">
                <p class="userDashboardHeading"><b>Dashboard</b></p>
                <div class="userAvatarCircle">
                    <span class="userAvatarInitials">${sessionScope.initials}</span>
                </div>
            </div>

            <!-- Welcome Banner -->
            <div class="userWelcome">
                <div>
                    <p class="userWelcomeTitle"><b>Welcome Back, ${sessionScope.firstName}!</b></p>
                    <p class="userWelcomeSubtitle">Manage your activity and track your marketplace presence</p>
                </div>
                <a href="${pageContext.request.contextPath}/profile" class="userButtonRectangle" style="text-decoration: none;">
                    <span class="userViewProfile">View Profile ↗</span>
                </a>
            </div>

            <!-- Profile Card -->
            <div class="userProfileCard">
                <div class="userProfileLeft">
                    <div class="userProfileAvatar">
                        <span class="userProfileInitials">${sessionScope.initials}</span>
                    </div>
                    <div class="userProfileInfo">
                        <p class="userProfileName"><b>${sessionScope.fullName}</b></p>
                        <p class="userProfileEmail">${sessionScope.email}</p>
                        <p class="userProfileMeta">Member since ${sessionScope.memberSince} &nbsp;·&nbsp; ${sessionScope.location}</p>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/editProfile" class="userEditButton" style="text-decoration: none;">
                    ✎ &nbsp;Edit Profile
                </a>
            </div>

            <!-- Stats Row -->
            <div class="userStats">
                <div class="userSmallBox">
                    <div class="userStatIcon userStatIconBlue">
                        <img src="${pageContext.request.contextPath}/Images/dollar.png" class="userStatImg" alt="Revenue" />
                    </div>
                    <p class="userSmallText">Total Revenue Generated</p>
                    <p class="userMoney"><b>$${userStats.totalRevenue}</b></p>
                </div>

                <div class="userSmallBox">
                    <div class="userStatIcon userStatIconPurple">
                        <img src="${pageContext.request.contextPath}/Images/product Sold.png" class="userStatImg" alt="Bought" />
                    </div>
                    <p class="userSmallText">Total Products Bought</p>
                    <p class="userMoney"><b>${userStats.totalBought}</b></p>
                </div>

                <div class="userSmallBox">
                    <div class="userStatIcon userStatIconGreen">
                        <img src="${pageContext.request.contextPath}/Images/Product Listed.png" class="userStatImg" alt="Sold" />
                    </div>
                    <p class="userSmallText">Total Products Sold</p>
                    <p class="userMoney"><b>${userStats.totalSold}</b></p>
                </div>

                <div class="userSmallBox">
                    <div class="userStatIcon userStatIconYellow">
                        <img src="${pageContext.request.contextPath}/Images/people visited.png" class="userStatImg" alt="Spent" />
                    </div>
                    <p class="userSmallText">Total Amount Spent</p>
                    <p class="userMoney"><b>$${userStats.totalSpent}</b></p>
                </div>
            </div>

            <!-- Bottom Section: 2 columns -->
            <div style="display: flex; gap: 20px; padding: 0 30px 30px 30px;">

                <!-- Left Column -->
                <div style="display: flex; flex-direction: column; gap: 20px; flex: 1;">

                    <!-- Cart -->
                    <div class="userLastBox">
                        <div class="userLastBoxHeader">
                            <p class="userLastBoxTitle"><b>Cart</b></p>
                            <a href="${pageContext.request.contextPath}/cart" class="userSeeMore">See More</a>
                        </div>

                        <div class="userListedItem" style="${empty cartData.item1Name ? 'display:none;' : ''}">
                            <div class="userItemThumb"></div>
                            <div class="userItemInfo">
                                <p class="userItemName">${cartData.item1Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${cartData.item1Price}</span>
                        </div>

                        <div class="userListedItem" style="${empty cartData.item2Name ? 'display:none;' : ''}">
                            <div class="userItemThumb"></div>
                            <div class="userItemInfo">
                                <p class="userItemName">${cartData.item2Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${cartData.item2Price}</span>
                        </div>

                        <div class="userListedItem" style="border: none; ${empty cartData.item3Name ? 'display:none;' : ''}">
                            <div class="userItemThumb"></div>
                            <div class="userItemInfo">
                                <p class="userItemName">${cartData.item3Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${cartData.item3Price}</span>
                        </div>
                    </div>

                    <!-- Recently Bought -->
                    <div class="userLastBox">
                        <div class="userLastBoxHeader">
                            <p class="userLastBoxTitle"><b>Recently Bought</b></p>
                            <a href="${pageContext.request.contextPath}/orders" class="userSeeMore">See More</a>
                        </div>

                        <div class="userListedItem" style="${empty recentBought.item1Name ? 'display:none;' : ''}">
                            <div class="userItemThumb"></div>
                            <div class="userItemInfo">
                                <p class="userItemName">${recentBought.item1Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${recentBought.item1Price}</span>
                        </div>

                        <div class="userListedItem" style="${empty recentBought.item2Name ? 'display:none;' : ''}">
                            <div class="userItemThumb"></div>
                            <div class="userItemInfo">
                                <p class="userItemName">${recentBought.item2Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${recentBought.item2Price}</span>
                        </div>

                        <div class="userListedItem" style="border: none; ${empty recentBought.item3Name ? 'display:none;' : ''}">
                            <div class="userItemThumb"></div>
                            <div class="userItemInfo">
                                <p class="userItemName">${recentBought.item3Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${recentBought.item3Price}</span>
                        </div>
                    </div>
                </div>

                <!-- Right Column -->
                <div style="display: flex; flex-direction: column; gap: 20px; flex: 1;">

                    <!-- Wishlist -->
                    <div class="userLastBox">
                        <div class="userLastBoxHeader">
                            <p class="userLastBoxTitle"><b>Wishlist</b></p>
                            <a href="${pageContext.request.contextPath}/wishlist" class="userSeeMore">See More</a>
                        </div>

                        <div class="userListedItem" style="${empty wishlistData.item1Name ? 'display:none;' : ''}">
                            <div class="userItemThumb"></div>
                            <div class="userItemInfo">
                                <p class="userItemName">${wishlistData.item1Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${wishlistData.item1Price}</span>
                        </div>

                        <div class="userListedItem" style="${empty wishlistData.item2Name ? 'display:none;' : ''}">
                            <div class="userItemThumb"></div>
                            <div class="userItemInfo">
                                <p class="userItemName">${wishlistData.item2Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${wishlistData.item2Price}</span>
                        </div>

                        <div class="userListedItem" style="border: none; ${empty wishlistData.item3Name ? 'display:none;' : ''}">
                            <div class="userItemThumb"></div>
                            <div class="userItemInfo">
                                <p class="userItemName">${wishlistData.item3Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${wishlistData.item3Price}</span>
                        </div>
                    </div>

                    <!-- Recently Sold -->
                    <div class="userLastBox">
                        <div class="userLastBoxHeader">
                            <p class="userLastBoxTitle"><b>Recently Sold</b></p>
                            <a href="${pageContext.request.contextPath}/listing" class="userSeeMore">See More</a>
                        </div>

                        <div class="userListedItem" style="${empty recentSold.item1Name ? 'display:none;' : ''}">
                            <div class="userItemThumb"></div>
                            <div class="userItemInfo">
                                <p class="userItemName">${recentSold.item1Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${recentSold.item1Price}</span>
                        </div>

                        <div class="userListedItem" style="${empty recentSold.item2Name ? 'display:none;' : ''}">
                            <div class="userItemThumb"></div>
                            <div class="userItemInfo">
                                <p class="userItemName">${recentSold.item2Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${recentSold.item2Price}</span>
                        </div>

                        <div class="userListedItem" style="border: none; ${empty recentSold.item3Name ? 'display:none;' : ''}">
                            <div class="userItemThumb"></div>
                            <div class="userItemInfo">
                                <p class="userItemName">${recentSold.item3Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${recentSold.item3Price}</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <%@ include file="/Component/adminFooter.jsp" %>
    </body>
</html>