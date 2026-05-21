<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
		<title>The E-spot</title>

		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
	</head>
	
	<body>
		<nav> 
			<div class="Logo" style="font-size: 22px;color: white;"><b>The E-sopt</b></div>

			<div class="linksToNavigate">
				<a href="${pageContext.request.contextPath}/UserListing">Browse</a> 
				<a href="${pageContext.request.contextPath}/memberDashboard">Dashboard</a> 
				<a href="${pageContext.request.contextPath}/AboutUs"> About</a>
			</div> 

            <div style="display: flex;">
                <form action="<%=request.getContextPath()%>/register" method="get">
                    <button type="submit" class="signUpButtoned" style="margin-right: 50px;  background: white;color: rgb(92, 104, 175);padding: 9px 22px;border-radius: 8px;font-size: 14px;cursor: pointer;border: none;">Sign Up</button>
                </form>

                <form action="<%=request.getContextPath()%>/login" method="get">
                    <button type="submit" class="loginButton" style="background: transparent; border: 1.5px solid rgba(255,255,255,0.4); color: white">Login</button>
                </form>
            </div>
		</nav>

        <div class="firstShow">
            <img class="backgroundImage" src="${pageContext.request.contextPath}/Images/background.jpg">

            <div class="putOver"></div>
            <div class="insideContent">
                <h1 class="slogan">Buy, sell and <em class="discover" style="color: rgb(79, 231, 255);">discover</em> something new</h1>
                 <p class="underText">Thousands of listings updated daily. Find great deals or reach buyers across the country all in one place.</p>

                <div class="someButtons">
	                <form action="<%=request.getContextPath()%>/UserListing" method="get">
						<button class="sellingButton">Browse Listings</button>	                
					</form>
					
					<form action="<%=request.getContextPath()%>/userOwn" method="get">
						<button class="seeListingButton">Your Listings</button>	                
					</form>
                </div>
            </div>
		</div> 

        <div class="reviewPart">
		    <div class="reviewLeft">
		        <h2>Trusted by thousands of buyers and sellers</h2>
		        <p>Join a growing community of people who buy, sell, and discover great deals on The E-spot every single day.</p>
		    </div>
		    <div class="reviewsContainer">
		        <div class="reviewCard">
		            <div class="reviewStars">5/5</div>
		            <p class="reviewText">Sold my laptop within a day of listing. The process was smooth and the buyer was genuine. Highly recommend.</p>
		            <div class="reviewPerson">
		                <div class="reviewLogo">R</div>
		                <div>
		                    <p class="reviewName">Ramesh A.</p>
		                    <p class="reviewRole">Seller, Kathmandu</p>
		                </div>
		            </div>
		        </div>
		        <div class="reviewCard">
		            <div class="reviewStars">4/5</div>
		            <p class="reviewText">Found a great deal on a camera I'd been looking for months. Fast communication, easy checkout.</p>
		            <div class="reviewPerson">
		                <div class="reviewLogo">S</div>
		                <div>
		                    <p class="reviewName">Suresh T.</p>
		                    <p class="reviewRole">Buyer, Pokhara</p>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	</body>
</html>