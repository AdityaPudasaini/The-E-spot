<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userDashboard.css">
</head>
<body>

    <div class="pageWrapper">

        <div class="userWelcome">
            <p class="welcomeHeading"><b>Welcome Back, ${sessionScope.username}!</b></p>
            <p class="welcomeSub">Here's a look at your activity on The E-spot</p>
        </div>

        <div class="mainRow">
            <div class="profileCard">
                <div class="profilePhotoWrap">
                    <img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" class="profilePhoto" />
                </div>
                <p class="profileName"><b>${sessionScope.username}</b></p>
                <p class="profileEmail">${sessionScope.email}</p>
                <p class="profileJoined">Member since ${userStats.joinDate}</p>
                <div class="profileActions">
                    <a href="${pageContext.request.contextPath}/editProfile" class="btnSecondary">Edit Profile</a>
                </div>
            </div>

            <div class="statsGrid">
                <div class="smallBox">
                    <img src="${pageContext.request.contextPath}/Images/dollar.png" class="dollarImage">
                    <p class="smallText">Total Money Spent</p>
                    <p class="money"><b>$${userStats.totalSpent}</b></p>
                </div>
                <div class="smallBox">
                    <img src="${pageContext.request.contextPath}/Images/earned.png" class="dollarImage">
                    <p class="smallText">Total Money Earned</p>
                    <p class="money"><b>$${userStats.totalEarned}</b></p>
                </div>
                <div class="smallBox">
                    <img src="${pageContext.request.contextPath}/Images/product Sold.png" class="dollarImage">
                    <p class="smallText">Total Products Bought</p>
                    <p class="money"><b>${userStats.totalBought}</b></p>
                </div>
                <div class="smallBox">
                    <img src="${pageContext.request.contextPath}/Images/Product Listed.png" class="dollarImage">
                    <p class="smallText">Total Products Sold</p>
                    <p class="money"><b>${userStats.totalSold}</b></p>
                </div>
            </div>
        </div>

        <div class="mainRow">
            <div class="listCard">
                <div class="listCardHeader">
                    <p class="listCardTitle"><b>Wishlist</b></p>
                    <a href="${pageContext.request.contextPath}/wishlist" class="seeMore">See More</a>
                </div>
                <div class="listItem" style="${empty wishlist.productName1 ? 'display:none;' : ''}">
                    <div class="listItemInfo">
                        <p class="listItemName">${wishlist.productName1}</p>
                        <p class="listItemSub">by ${wishlist.sellerName1}</p>
                    </div>
                    <span class="listItemPrice">$${wishlist.price1}</span>
                </div>
                <div class="listItem" style="${empty wishlist.productName2 ? 'display:none;' : ''}">
                    <div class="listItemInfo">
                        <p class="listItemName">${wishlist.productName2}</p>
                        <p class="listItemSub">by ${wishlist.sellerName2}</p>
                    </div>
                    <span class="listItemPrice">$${wishlist.price2}</span>
                </div>
                <div class="listItem" style="border:none; ${empty wishlist.productName3 ? 'display:none;' : ''}">
                    <div class="listItemInfo">
                        <p class="listItemName">${wishlist.productName3}</p>
                        <p class="listItemSub">by ${wishlist.sellerName3}</p>
                    </div>
                    <span class="listItemPrice">$${wishlist.price3}</span>
                </div>
            </div>

            <div class="listCard">
                <div class="listCardHeader">
                    <p class="listCardTitle"><b>Cart</b></p>
                    <a href="${pageContext.request.contextPath}/cart" class="seeMore">See More</a>
                </div>
                <div class="listItem" style="${empty cart.productName1 ? 'display:none;' : ''}">
                    <div class="listItemInfo">
                        <p class="listItemName">${cart.productName1}</p>
                        <p class="listItemSub">Qty: ${cart.qty1}</p>
                    </div>
                    <span class="listItemPrice">$${cart.price1}</span>
                </div>
                <div class="listItem" style="${empty cart.productName2 ? 'display:none;' : ''}">
                    <div class="listItemInfo">
                        <p class="listItemName">${cart.productName2}</p>
                        <p class="listItemSub">Qty: ${cart.qty2}</p>
                    </div>
                    <span class="listItemPrice">$${cart.price2}</span>
                </div>
                <div class="listItem" style="border:none; ${empty cart.productName3 ? 'display:none;' : ''}">
                    <div class="listItemInfo">
                        <p class="listItemName">${cart.productName3}</p>
                        <p class="listItemSub">Qty: ${cart.qty3}</p>
                    </div>
                    <span class="listItemPrice">$${cart.price3}</span>
                </div>
                <div class="cartTotal">
                    <span class="cartTotalLabel">Subtotal</span>
                    <span class="cartTotalValue">$${cart.subtotal}</span>
                </div>
                <a href="${pageContext.request.contextPath}/checkout" class="btnCheckout">Proceed to Checkout</a>
            </div>
        </div>

        <div class="mainRow">
            <div class="listCard">
                <div class="listCardHeader">
                    <p class="listCardTitle"><b>Items Bought</b></p>
                    <a href="${pageContext.request.contextPath}/orders" class="seeMore">See More</a>
                </div>
                <div class="listItem" style="${empty bought.productName1 ? 'display:none;' : ''}">
                    <div class="listItemInfo">
                        <p class="listItemName">${bought.productName1}</p>
                        <p class="listItemSub">Ordered on ${bought.orderDate1}</p>
                    </div>
                    <span class="statusBadge ${bought.status1 == 'Delivered' ? 'badgeGreen' : 'badgeBlue'}">${bought.status1}</span>
                </div>
                <div class="listItem" style="${empty bought.productName2 ? 'display:none;' : ''}">
                    <div class="listItemInfo">
                        <p class="listItemName">${bought.productName2}</p>
                        <p class="listItemSub">Ordered on ${bought.orderDate2}</p>
                    </div>
                    <span class="statusBadge ${bought.status2 == 'Delivered' ? 'badgeGreen' : 'badgeBlue'}">${bought.status2}</span>
                </div>
                <div class="listItem" style="border:none; ${empty bought.productName3 ? 'display:none;' : ''}">
                    <div class="listItemInfo">
                        <p class="listItemName">${bought.productName3}</p>
                        <p class="listItemSub">Ordered on ${bought.orderDate3}</p>
                    </div>
                    <span class="statusBadge ${bought.status3 == 'Delivered' ? 'badgeGreen' : 'badgeBlue'}">${bought.status3}</span>
                </div>
            </div>

            <div class="listCard">
                <div class="listCardHeader">
                    <p class="listCardTitle"><b>Items Sold</b></p>
                    <a href="${pageContext.request.contextPath}/sold" class="seeMore">See More</a>
                </div>
                <div class="listItem" style="${empty sold.productName1 ? 'display:none;' : ''}">
                    <div class="listItemInfo">
                        <p class="listItemName">${sold.productName1}</p>
                        <p class="listItemSub">Sold to ${sold.buyerName1} · ${sold.saleDate1}</p>
                    </div>
                    <span class="listItemPrice">$${sold.salePrice1}</span>
                </div>
                <div class="listItem" style="${empty sold.productName2 ? 'display:none;' : ''}">
                    <div class="listItemInfo">
                        <p class="listItemName">${sold.productName2}</p>
                        <p class="listItemSub">Sold to ${sold.buyerName2} · ${sold.saleDate2}</p>
                    </div>
                    <span class="listItemPrice">$${sold.salePrice2}</span>
                </div>
                <div class="listItem" style="border:none; ${empty sold.productName3 ? 'display:none;' : ''}">
                    <div class="listItemInfo">
                        <p class="listItemName">${sold.productName3}</p>
                        <p class="listItemSub">Sold to ${sold.buyerName3} · ${sold.saleDate3}</p>
                    </div>
                    <span class="listItemPrice">$${sold.salePrice3}</span>
                </div>
            </div>
        </div>

    </div>

</body>
</html>