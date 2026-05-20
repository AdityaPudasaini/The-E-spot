<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User Dashboard</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userDashboard.css">
    </head>

    <body>
        <%@ include file="/Component/userSidebar.jsp" %>

        <div style="display: flex; flex-direction: column; margin-left: 250px; width: calc(100% - 250px);">

            <div class="userTopBar">
                <p class="userDashboardHeading"><b>Dashboard</b></p>
                <div class="userAvatarCircle">
                    <img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%;"/>
                </div>
            </div>

            <div class="userWelcome">
                <div>
                    <p class="userWelcomeTitle"><b>Welcome Back, ${username}!</b></p>
                    <p class="userWelcomeSubtitle">Manage your activity and track your marketplace presence</p>
                </div>
                <a href="${pageContext.request.contextPath}/profile" class="userButtonRectangle" style="text-decoration: none;">
                    <span class="userViewProfile">View Profile</span>
                </a>
            </div>

            <div class="userProfileCard">
                <div class="userProfileLeft">
                    <div class="userProfileAvatar">
                        <img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%;" />
                    </div>
                    <div class="userProfileInfo">
                        <p class="userProfileName"><b>${fullName}</b></p>
                        <p class="userProfileEmail">${email}</p>
                        <p class="userProfileEmail">${phone}</p>
                        <p class="userProfileMeta">DOB:  ${dob}</p>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/editProfile" class="userEditButton" style="text-decoration: none;">
                    Edit Profile
                </a>
            </div>

            <div class="userStats">
			    <div class="userSmallBox">
			        <img src="${pageContext.request.contextPath}/Images/dollar.png" class="userStatImg" alt="Revenue" style="width: 66px; height: 66px;"/>
			        <p class="userSmallText">Total Revenue Generated</p>
			        <p class="userMoney"><b>$${userStats.totalRevenue}</b></p>
			    </div>
			
			    <div class="userSmallBox">
			        <img src="${pageContext.request.contextPath}/Images/product Sold.png" class="userStatImg" alt="Bought" style="width: 66px; height: 66px;"/>
			        <p class="userSmallText">Total Products Bought</p>
			        <p class="userMoney"><b>${userStats.totalBought}</b></p>
			    </div>
			
			    <div class="userSmallBox">
			        <img src="${pageContext.request.contextPath}/Images/Product Listed.png" class="userStatImg" alt="Sold" style="width: 66px; height: 66px;"/>
			        <p class="userSmallText">Total Products Sold</p>
			        <p class="userMoney"><b>${userStats.totalSold}</b></p>
			    </div>
			
			    <div class="userSmallBox">
			        <img src="${pageContext.request.contextPath}/Images/people visited.png" class="userStatImg" alt="Spent" style="width: 66px; height: 66px;"/>
			        <p class="userSmallText">Total Amount Spent</p>
			        <p class="userMoney"><b>$${userStats.totalSpent}</b></p>
			    </div>
			</div>

            <div style="display: flex; gap: 20px; padding: 0 30px 30px 30px;">

                <div style="display: flex; flex-direction: column; gap: 20px; flex: 1;">

                    <div class="userLastBox" style="margin-top: 20px">
                        <div class="userLastBoxHeader">
                            <p class="userLastBoxTitle"><b>Cart</b></p>
                            <a href="${pageContext.request.contextPath}/cart" class="userSeeMore">See More</a>
                        </div>

                        <div class="userListedItem" style="${empty cartData.item1Name ? 'display:none;' : ''}">
						    <div class="userItemThumb">
						        <img src="${pageContext.request.contextPath}/image?name=product${cartData.item1Id}" style="width: 100%; height: 100%; border-radius: 8px; object-fit: cover;" />
						    </div>
						    <div class="userItemInfo">
						        <p class="userItemName">${cartData.item1Name}</p>
						        <p class="userItemSub">Marketplace item</p>
						    </div>
						    <span class="userItemPrice">$${cartData.item1Price}</span>
						</div>

                        <div class="userListedItem" style="${empty cartData.item2Name ? 'display:none;' : ''}">
						    <div class="userItemThumb">
						        <img src="${pageContext.request.contextPath}/image?name=product${cartData.item2Id}" style="width: 100%; height: 100%; border-radius: 8px; object-fit: cover;" />
						    </div>
						    <div class="userItemInfo">
						        <p class="userItemName">${cartData.item2Name}</p>
						        <p class="userItemSub">Marketplace item</p>
						    </div>
						    <span class="userItemPrice">$${cartData.item2Price}</span>
						</div>

                        <div class="userListedItem" style="${empty cartData.item3Name ? 'display:none;' : ''}">
						    <div class="userItemThumb">
						        <img src="${pageContext.request.contextPath}/image?name=product${cartData.item3Id}" style="width: 100%; height: 100%; border-radius: 8px; object-fit: cover;" />
						    </div>
						    <div class="userItemInfo">
						        <p class="userItemName">${cartData.item3Name}</p>
						        <p class="userItemSub">Marketplace item</p>
						    </div>
						    <span class="userItemPrice">$${cartData.item3Price}</span>
						</div>
                    </div>

                    <div class="userLastBox">
                        <div class="userLastBoxHeader">
                            <p class="userLastBoxTitle"><b>Recently Bought</b></p>
                            <a href="${pageContext.request.contextPath}/orders" class="userSeeMore">See More</a>
                        </div>

                        <div class="userListedItem" style="${empty recentBought.item1Name ? 'display:none;' : ''}">
                            <div class="userItemThumb">
						        <img src="${pageContext.request.contextPath}/image?name=product${recentBought.item1Id}" style="width: 100%; height: 100%; border-radius: 8px; object-fit: cover;" />
						    </div>
                            <div class="userItemInfo">
                                <p class="userItemName">${recentBought.item1Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${recentBought.item1Price}</span>
                        </div>

                        <div class="userListedItem" style="${empty recentBought.item2Name ? 'display:none;' : ''}">
                            <div class="userItemThumb">
						        <img src="${pageContext.request.contextPath}/image?name=product${recentBought.item2Id}" style="width: 100%; height: 100%; border-radius: 8px; object-fit: cover;" />
						    </div>
                            <div class="userItemInfo">
                                <p class="userItemName">${recentBought.item2Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${recentBought.item2Price}</span>
                        </div>

                        <div class="userListedItem" style="border: none; ${empty recentBought.item3Name ? 'display:none;' : ''}">
                            <div class="userItemThumb">
						        <img src="${pageContext.request.contextPath}/image?name=product${recentBought.item3Id}" style="width: 100%; height: 100%; border-radius: 8px; object-fit: cover;" />
						    </div>
                            <div class="userItemInfo">
                                <p class="userItemName">${recentBought.item3Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${recentBought.item3Price}</span>
                        </div>
                    </div>
                </div>

                <div style="display: flex; flex-direction: column; gap: 20px; flex: 1;">

                    <div class="userLastBox" style="margin-top: 20px">
                        <div class="userLastBoxHeader">
                            <p class="userLastBoxTitle"><b>Wishlist</b></p>
                            <a href="${pageContext.request.contextPath}/wishlist" class="userSeeMore">See More</a>
                        </div>

                        <div class="userListedItem" style="${empty wishlistData.item1Name ? 'display:none;' : ''}">
                            <div class="userItemThumb">
						        <img src="${pageContext.request.contextPath}/image?name=product${wishlistData.item1Id}" style="width: 100%; height: 100%; border-radius: 8px; object-fit: cover;" />
						    </div>
                            <div class="userItemInfo">
                                <p class="userItemName">${wishlistData.item1Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${wishlistData.item1Price}</span>
                        </div>

                        <div class="userListedItem" style="${empty wishlistData.item2Name ? 'display:none;' : ''}">
                            <div class="userItemThumb">
						        <img src="${pageContext.request.contextPath}/image?name=product${wishlistData.item2Id}" style="width: 100%; height: 100%; border-radius: 8px; object-fit: cover;" />
						    </div>
                            <div class="userItemInfo">
                                <p class="userItemName">${wishlistData.item2Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${wishlistData.item2Price}</span>
                        </div>

                        <div class="userListedItem" style="border: none; ${empty wishlistData.item3Name ? 'display:none;' : ''}">
                            <div class="userItemThumb">
						        <img src="${pageContext.request.contextPath}/image?name=product${wishlistData.item3Id}" style="width: 100%; height: 100%; border-radius: 8px; object-fit: cover;" />
						    </div>
                            <div class="userItemInfo">
                                <p class="userItemName">${wishlistData.item3Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${wishlistData.item3Price}</span>
                        </div>
                    </div>

                    <div class="userLastBox">
                        <div class="userLastBoxHeader">
                            <p class="userLastBoxTitle"><b>Recently Sold</b></p>
                            <a href="${pageContext.request.contextPath}/listing" class="userSeeMore">See More</a>
                        </div>

                        <div class="userListedItem" style="${empty recentSold.item1Name ? 'display:none;' : ''}">
                            <div class="userItemThumb">
						        <img src="${pageContext.request.contextPath}/image?name=product${recentSold.item1Id}" style="width: 100%; height: 100%; border-radius: 8px; object-fit: cover;" />
						    </div>
                            <div class="userItemInfo">
                                <p class="userItemName">${recentSold.item1Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${recentSold.item1Price}</span>
                        </div>

                        <div class="userListedItem" style="${empty recentSold.item2Name ? 'display:none;' : ''}">
                            <div class="userItemThumb">
						        <img src="${pageContext.request.contextPath}/image?name=product${recentSold.item2Id}" style="width: 100%; height: 100%; border-radius: 8px; object-fit: cover;" />
						    </div>
                            <div class="userItemInfo">
                                <p class="userItemName">${recentSold.item2Name}</p>
                                <p class="userItemSub">Marketplace item</p>
                            </div>
                            <span class="userItemPrice">$${recentSold.item2Price}</span>
                        </div>

                        <div class="userListedItem" style="border: none; ${empty recentSold.item3Name ? 'display:none;' : ''}">
                            <div class="userItemThumb">
						        <img src="${pageContext.request.contextPath}/image?name=product${recentSold.item3Id}" style="width: 100%; height: 100%; border-radius: 8px; object-fit: cover;" />
						    </div>
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
