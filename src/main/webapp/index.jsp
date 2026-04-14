<html>
	<head>
		<title>The E-spot</title>

		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
	</head>
	
	<body>
		<nav> 
			<div class="Logo"><b>The E-sopt</b></div>

			<div class="linksToNavigate">
				<a href="#">Browse</a>
				<a href="#">Sell</a>
				<a href="#"> About</a>
			</div>

            <div style="display: flex;">
                <form action="<%=request.getContextPath()%>/register" method="get">
                    <button type="submit" class="signUpButton" style="margin-right: 50px;">Sign Up</button>
                </form>

                <form action="<%=request.getContextPath()%>/login" method="get">
                    <button type="submit" class="loginButton" style="background: transparent; border: 1.5px solid rgba(255,255,255,0.4); color: white">Login</button>
                </form>
            </div>
		</nav>

        <div class="firstShow">
            <img class="backgroundImage" src="background.jpg">

            <div class="putOver"></div>
            <div class="insideContent">
                <h1 class="slogan">Buy, sell and <em class="discover" style="color: rgb(79, 231, 255);">discover</em> something new</h1>
                <p class="underText">Thousands of listings updated daily. Find great deals or reach buyers across the country — all in one place.</p>
                <div class="someButtons">
                    <button class="sellingButton">Start Selling</button>
                    <button class="seeListingButton">Browse Listings</button>
                </div>
            </div>
        </div>

        <div class="statsBar">
            <div class="statItem">
                <div class="statNumber"><b>12,400+</b></div>
                <div class="statName">Active listings</div>
            </div>
            <div class="statItem">
                <div class="statNumber"><b>8,200+</b></div>
                <div class="statName">Registered users</div>
            </div>
            <div class="statItem">
                <div class="statNumber"><b>3,100+</b></div>
                <div class="statName">Items sold</div>
            </div>
            <div class="statItem">
                <div class="statNumber"><b>98%</b></div>
                <div class="statName">Satisfied buyers</div>
            </div>
        </div>

        <div class="reviewPart">
            <div class="reviewLeft">
                <h2>Trusted by thousands of buyers and sellers</h2>
                <p>Join a growing community of people who buy, sell, and discover great deals on The E-spot every single day.</p>
            </div>
            <div class="reviewsContainer">
                <div class="reviewCard">
                    <div class="reviewStars">★★★★★</div>
                    <p class="reviewText">Sold my laptop within a day of listing. The process was smooth and the buyer was genuine. Highly recommend.</p>
                    <div class="reviewPerson">
                        <div class="reviewLogo">P</div>
                        <div>
                            <p class="reviewName">Priya S.</p>
                            <p class="reviewRole">Seller · Kathmandu</p>
                        </div>
                    </div>
                </div>
                <div class="reviewCard">
                    <div class="reviewStars">★★★★★</div>
                    <p class="reviewText">Found a great deal on a camera I'd been looking for months. Fast communication, easy checkout.</p>
                    <div class="reviewPerson">
                        <div class="reviewLogo">R</div>
                        <div>
                            <p class="reviewName">Rajan T.</p>
                            <p class="reviewRole">Buyer · Pokhara</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footerSection">
            <div class="footerTop">
                <div class="footerBrand">
                    <div class="footerLogo">The E-spot</div>
                    <p class="footerLine">Nepal's trusted marketplace for buying and selling everything, from electronics to everyday essentials.</p>
                </div>

                <div class="footerLinks">
                    <h4>Marketplace</h4>
                    <a href="#">Browse listings</a>
                    <a href="#">Sell an item</a>
                </div>

                <div class="footerLinks">
                    <h4>Account</h4>
                    <a href="#">Sign up</a>
                    <a href="#">Log in</a>
                    <a href="#">My listings</a>
                    <a href="#">Cart</a>
                </div>

                <div class="footerLinks">
                    <h4>About</h4>
                    <a href="#">About Us</a>
                    <a href="#">Contact Us</a>
                </div>
                
            </div>
            <div class="footerBottom">
                <span class="footerText">The E-spot ©; 2026 · All rights reserved</span>
            </div>
        </footer>
	</body>
</html>