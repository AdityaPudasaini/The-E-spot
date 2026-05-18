<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Admin Sidebar</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminSidebar.css">
	</head>

	<body>

		<div class="sidePanel">
            <p class="Logo">The E-spot</p>

            <br>
            <a href="${pageContext.request.contextPath}/dashboard" style="text-decoration: none;">
			    <span class="rectangle ${currentPage == 'dashboard' ? 'active' : ''}">
			    	<svg style="margin-right: 15px; vertical-align: middle;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512" fill="currentColor">
			    		<path d="M0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zm320 96c0-26.9-16.5-49.9-40-59.3V88c0-13.3-10.7-24-24-24s-24 10.7-24 24V292.7c-23.5 9.4-40 32.4-40 59.3c0 35.3 28.7 64 64 64s64-28.7 64-64z"/>
			    	</svg>
			    	Dashboard
			    </span>
			</a>
            <br>

			<a href="${pageContext.request.contextPath}/listing" style="text-decoration: none;">
			    <span class="rectangle ${currentPage == 'listing' ? 'active' : ''}">
			    	<svg style="margin-right: 15px; vertical-align: middle;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512" fill="currentColor">
			    		<path d="M40 48C26.7 48 16 58.7 16 72v48c0 13.3 10.7 24 24 24H88c13.3 0 24-10.7 24-24V72c0-13.3-10.7-24-24-24H40zm152 16c-17.7 0-32 14.3-32 32s14.3 32 32 32H488c17.7 0 32-14.3 32-32s-14.3-32-32-32H192zm0 160c-17.7 0-32 14.3-32 32s14.3 32 32 32H488c17.7 0 32-14.3 32-32s-14.3-32-32-32H192zm0 160c-17.7 0-32 14.3-32 32s14.3 32 32 32H488c17.7 0 32-14.3 32-32s-14.3-32-32-32H192zM16 232v48c0 13.3 10.7 24 24 24H88c13.3 0 24-10.7 24-24V232c0-13.3-10.7-24-24-24H40c-13.3 0-24 10.7-24 24zm0 160v48c0 13.3 10.7 24 24 24H88c13.3 0 24-10.7 24-24V392c0-13.3-10.7-24-24-24H40c-13.3 0-24 10.7-24 24z"/>
			    	</svg>
			    	Listings
			    </span>
			</a>
            <br>

			<a href="${pageContext.request.contextPath}/users" style="text-decoration: none;">
			    <span class="rectangle ${currentPage == 'users' ? 'active' : ''}">
			    	<svg style="margin-right: 15px; vertical-align: middle;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 640 512" fill="currentColor">
			    		<path d="M144 160A80 80 0 1 0 144 0a80 80 0 1 0 0 160zm368 0A80 80 0 1 0 512 0a80 80 0 1 0 0 160zM0 298.7C0 310.4 9.6 320 21.3 320H234.7c.2 0 .4 0 .7 0c-26.6-23.5-43.3-57.8-43.3-96c0-7.6 .7-15 1.9-22.3c-13.6-6.3-28.7-9.7-44.6-9.7H106.7C47.8 192 0 239.8 0 298.7zM320 320c24 0 45.9-8.8 62.7-23.3c2.3-5.4 4.8-10.7 7.5-15.8C402.9 262.5 416 236.6 416 208c0-12.1-2.1-23.7-6-34.5C392.6 166 369.8 160 345.6 160H294.4c-24.2 0-47 6-64.4 13.5c-3.9 10.8-6 22.4-6 34.5c0 28.6 13.1 54.5 33.8 72.8c1.6 5.1 3.4 10.1 5.5 15C280.1 311.2 302 320 320 320zm0 32c-44.2 0-84.5 16.5-115.1 43.5C191.4 407.3 185.3 422 186.7 437.3C187.9 450.3 198.7 460 211.7 460H428.3c13 0 23.8-9.7 25-22.7c1.4-15.3-4.7-30-18.2-41.8C404.5 368.5 364.2 352 320 352zm93.2-192c-1.4 8.1-2.2 16.5-2.2 25c0 29.2 8.8 56.4 23.8 79c1.4-1 2.8-2 4.3-2.9c21.1-12.9 44.4-19.1 67.9-19.1H533.3C592.2 242 640 289.8 640 348.7c0 11.8-9.6 21.3-21.3 21.3H525.4c1.1-5.2 1.7-10.6 1.7-16.2c0-19.5-6.7-37.5-17.8-51.8H618.7c-10.9-54.5-59.2-95.4-117.3-95.4H466.1c-18.5 0-36.1 4.2-51.9 11.4z"/>
			    	</svg>
			    	Users
			    </span>
			</a>
            <br>

			<a href="${pageContext.request.contextPath}/revenue" style="text-decoration: none;">
			    <span class="rectangle ${currentPage == 'revenue' ? 'active' : ''}">
			    	<svg style="margin-right: 15px; vertical-align: middle;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 320 512" fill="currentColor">
			    		<path d="M160 0c17.7 0 32 14.3 32 32V67.7c1.6 .2 3.1 .4 4.7 .7c.4 .1 .7 .1 1.1 .2l48 8.8c17.4 3.2 28.9 19.9 25.7 37.2s-19.9 28.9-37.2 25.7l-47.5-8.7c-31.3-4.6-58.9-1.5-78.3 6.2s-27.2 18.3-29 28.1c-2 10.7-.5 16.7 1.2 20.4c1.8 3.9 5.5 8.3 12.8 13.2c16.3 10.7 41.3 17.7 73.7 26.3l2.9 .8c28.6 7.6 63.6 16.8 89.6 33.8c14.2 9.3 27.6 21.9 35.9 39.5c8.5 17.9 10.3 37.9 6.4 59.2c-6.9 38-33.1 63.4-65.6 76.7c-13.7 5.6-28.6 9.2-44.4 11V480c0 17.7-14.3 32-32 32s-32-14.3-32-32V445.1c-.4-.1-.9-.1-1.3-.2l-.2 0c-24.4-3.8-64.5-14.3-91.5-26.3c-16.1-7.2-23.4-26.1-16.2-42.2s26.1-23.4 42.2-16.2c20.9 9.3 55.3 18.5 75.2 21.6c31.9 4.7 58.2 2 76-5.3c16.9-6.9 24.6-16.9 26.8-28.9c2-10.8 .5-16.8-1.3-20.6c-1.9-4-5.7-8.4-13.3-13.3c-16.6-10.8-41.5-17.9-74-26.6l-3-.8c-28.2-7.5-63.2-16.6-89-33.3c-14-9.2-27.4-21.7-35.8-39.3C57.3 312.1 55.5 292 59.5 270.8c7.1-38.3 35.6-63.3 66.1-75.4c13.5-5.4 28.1-8.8 43.4-10.6V32c0-17.7 14.3-32 32-32z"/>
			    	</svg>
			    	Revenue
			    </span>
			</a>
            <br>

			<a href="${pageContext.request.contextPath}/order" style="text-decoration: none;">
			    <span class="rectangle ${currentPage == 'orders' ? 'active' : ''}">
			    	<svg style="margin-right: 15px; vertical-align: middle;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 448 512" fill="currentColor">
			    		<path d="M50.7 58.5L0 160H208V32H93.7C75.5 32 58.9 42.3 50.7 58.5zM240 160H448L397.3 58.5C389.1 42.3 372.5 32 354.3 32H240V160zm208 32H0V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V192z"/>
			    	</svg>
			    	Orders
			    </span>
			</a>
            <br>

			<a href="${pageContext.request.contextPath}/flagged" style="text-decoration: none;">
			    <span class="rectangle ${currentPage == 'flagged' ? 'active' : ''}">
			    	<svg style="margin-right: 15px; vertical-align: middle;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 448 512" fill="currentColor">
			    		<path d="M64 32C64 14.3 49.7 0 32 0S0 14.3 0 32V64 368 480c0 17.7 14.3 32 32 32s32-14.3 32-32V352l64.3-16.1c41.1-10.3 84.6-5.5 122.5 13.4c44.2 22.1 95.5 24.8 141.7 7.4l34.7-13c12.5-4.7 20.8-16.6 20.8-30V66.1c0-23-24.2-38-44.8-27.7l-9.6 4.8c-46.3 23.2-100.8 23.2-147.1 0c-35.1-17.6-75.4-22-113.5-12.5L64 48V32z"/>
			    	</svg>
			    	Flagged Items
			    </span>
			</a>
            <br>

			<a href="${pageContext.request.contextPath}/report" style="text-decoration: none;">
			    <span class="rectangle ${currentPage == 'reports' ? 'active' : ''}">
			    	<svg style="margin-right: 15px; vertical-align: middle;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 448 512" fill="currentColor">
			    		<path d="M160 80c0-26.5 21.5-48 48-48h32c26.5 0 48 21.5 48 48V432c0 26.5-21.5 48-48 48H208c-26.5 0-48-21.5-48-48V80zM0 272c0-26.5 21.5-48 48-48H80c26.5 0 48 21.5 48 48V432c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V272zM368 96h32c26.5 0 48 21.5 48 48V432c0 26.5-21.5 48-48 48H368c-26.5 0-48-21.5-48-48V144c0-26.5 21.5-48 48-48z"/>
			    	</svg>
			    	Reports
			    </span>
			</a>
            <br>

            <div class="sideShow">
                <div class="sideInfo">
                    <a href="${pageContext.request.contextPath}/logout" style="text-decoration: none;">
			            <button class="logout">
			            	<svg style="margin-right: 15px; vertical-align: middle;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512" fill="currentColor">
			            		<path d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z"/>
			            	</svg>
			            	Logout
			            </button>
			        </a>
                </div>
            </div>
        </div>
	</body>
</html>