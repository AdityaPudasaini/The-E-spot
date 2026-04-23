<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
<link rel="stylesheet" href="css/styles.css" type="text/css">
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	background-color: #fff;
	font-family: "Inter", Arial, sans-serif;
}

.container {
	display: flex;
	align-items: stretch;
	justify-content: center;
	gap: 24px;
	background: #fff;
	border-radius: 12px;
	width: 100%;
	padding: 32px;
}

/* --- Profile Card --- */
.profile-div {
	background: #EDEDCE;
	display: flex;
	justify-content: center;
	border-radius: 12px;
}

.profile-card {
	background: #fff;
	border-radius: 12px;
	border: 0.5px solid #c5c5a8;
	padding: 32px 40px;
	width: 280px;
	text-align: center;
	border-top: 4px solid #0C2C55;
}

.avatar {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	background: #EDEDCE;
	margin: 0 auto 16px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 36px;
	font-weight: 700;
	color: #0C2C55;
	border: 2px solid #629FAD;
}

.profile-name {
	font-size: 20px;
	font-weight: 600;
	margin: 0 0 4px;
	color: #0C2C55;
}

.profile-role {
	font-size: 14px;
	color: #0C2C55;
	margin: 0 0 20px;
}

.profile-text {
	font-size: 14px;
	color: #0C2C55;
}

.contact-info {
	border-top: 0.5px solid #c5c5a8;
	padding-top: 14px;
	display: flex;
	flex-direction: column;
	gap: 12px;
}

/* --- Orders Card --- */
.Orders {
	background: #EDEDCE;
	display: flex;
	align-items: stretch;
	border-radius: 12px;
}

.listOfOrders {
	background: #fff;
	border-radius: 12px;
	border: 0.5px solid #c5c5a8;
	border-top: 4px solid #296374;
	padding: 32px 40px;
	width: 280px;
	text-align: center;
}

.listOfOrders p {
	font-size: 20px;
	font-weight: 600;
	margin-bottom: 16px;
	color: #0C2C55;
}

.listOfOrders table {
	width: 100%;
	border-collapse: collapse;
}

.listOfOrders th {
	font-size: 14px;
	color: #629FAD;
	font-weight: 600;
	text-align: left;
	padding: 8px 0;
	border-bottom: 0.5px solid #c5c5a8;
}

.listOfOrders td {
	font-size: 14px;
	color: #0C2C55;
	padding: 10px 0;
	border-bottom: 0.5px solid #e8e8d0;
	text-align: left;
}

.listOfOrders tr:last-child td {
	border-bottom: none;
}

/* --- Grid Cards --- */
.grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 16px;
	width: 580px;
}

.grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 16px;
	width: 580px;
}

.card {
	background: #fff;
	border-radius: 12px;
	padding: 24px 20px;
	border: 0.5px solid #c5c5a8;
}

.card-label {
	font-size: 14px;
	color: #777;
	margin-bottom: 12px;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

.card-value {
	font-size: 36px;
	font-weight: bold;
	color: #111;
}

.card-earned {
	border-top: 4px solid #1A6BB5;
}

.card-earned .card-value {
	color: #1A6BB5;
}

.card-spent {
	border-top: 4px solid #E87722;
}

.card-spent .card-value {
	color: #E87722;
}

.card-empty {
	border-top: 4px solid #e0e0e0;
	min-height: 100px;
}

.card-member {
	border-top: 4px solid #1D9E75;
}

.card-member .card-value {
	color: #1D9E75;
}

.card-login {
	border-top: 4px solid #7F77DD;
}

.card-login .card-value {
	color: #7F77DD;
}

.card-status {
	font-size: 14px;
	color: #777;
	margin-top: 8px;
}

/* --- Buttons --- */
.nav-btns {
	display: flex;
	justify-content: center;
	padding: 0 0 32px 32px;
}

.BTN {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.wishlist {
	background-color: #0C2C55;
	color: #fff;
	border: none;
	padding: 12px 0;
	border-radius: 8px;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
	width: 270px;
	font-family: "Inter", Arial, sans-serif;
}

.wishlist:hover {
	background-color: #0a2244;
}

.cart {
	background-color: #296374;
	color: #fff;
	border: none;
	padding: 12px 0;
	border-radius: 8px;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
	width: 270px;
	font-family: "Inter", Arial, sans-serif;
}

.cart:hover {
	background-color: #1f4d5a;
}

.welcome-banner {
  display: flex;
  align-items: center;
  justify-content: space-between;
  background-color: #0C2C55;
  color: #EDEDCE;
  padding: 24px 40px;
  margin: 24px 32px;
  border-radius: 12px;
}
</style>
</head>
<body>
	<%@ include file="../components/header.jsp"%>
	
	<div class="welcome-banner">
    <h2 style="font-size: 22px;font-weight: 700;color: #EDEDCE;margin-bottom: 6px;">Welcome back, Jasun! 👋</h2>
    
  </div>
	<div class="container">

		<div class="profile-div">
			<div class="profile-card">
				<div class="avatar">
				<img src="${pageContext.request.ContextPath}/getimage?name=$(s.username)">
				</div>
				<p class="profile-name">Jasun Maharjan</p>
				<p class="profile-role">Member</p>
				<div class="contact-info">
					<div style="display: flex; align-items: center; gap: 10px;">
						<span class="profile-text">&#9742;</span> <span
							class="profile-text">+977 980-0000000</span>
					</div>
					<div style="display: flex; align-items: center; gap: 10px;">
						<span class="profile-text">&#9993;</span> <span
							class="profile-text">jasun@email.com</span>
					</div>
				</div>
			</div>
		</div>

		<div class="Orders">
			<div class="listOfOrders">
				<p>Total Orders</p>
				<table>
					<tr>
						<th>Item</th>
						<th>Price</th>
					</tr>
					<tr>
						<td>Yellow T-shirt</td>
						<td>Rs.1500</td>
					</tr>
					<tr>
						<td>Sunglasses</td>
						<td>Rs.1200</td>
					</tr>
					<tr>
						<td>Blanket Sheets</td>
						<td>Rs.700</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="grid">
			<div class="card card-earned">
				<p class="card-label">Total Earned</p>
				<p class="card-value">Rs. 25,000</p>
			</div>
			<div class="card card-spent">
				<p class="card-label">Total Spent</p>
				<p class="card-value">Rs. 12,700</p>
			</div>
			<div class="card card-member">
				<p class="card-label">Member Since</p>
				<p class="card-value">Jan 2023</p>
				<p class="card-status">Active Member</p>
			</div>
			<div class="card card-login">
				<p class="card-label">Last Login</p>
				<p class="card-value">Apr 11, 2026</p>
				<p class="card-status">10:45 AM</p>
			</div>
		</div>

	</div>
<div class="container">
	<div class="nav-btns">
		<div class="BTN">
			<input type="button" value="Wishlist" name="wishlist"
				class="wishlist"> <input type="button" value="Cart"
				name="cart" class="cart">
		</div>
	</div>
	<div class="Orders-listed" style="height:200px;border:0.5px solid #c5c5a8;border-radius:12px;width:500px;justify-content: center;">
		<p style="padding:12px 8px;font-size:16px">Order listed</p>
		<h1 style="text-align: center;margin-top:50px;">N/A</h1>
		<p style="padding-top:5px; font-size:12px; color:#777;text-align: center;">You haven't listed anything</p>
	</div>
	</div>
	<%@include file="../components/footer.jsp"%>
</body>
</html>