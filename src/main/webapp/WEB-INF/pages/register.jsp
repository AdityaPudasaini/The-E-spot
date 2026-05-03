<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
		<title>Registration Page</title>
	</head>

	<body>

		<p style="color: red; font-size: 10px; justify-content: center; ${empty errorMessage ? 'display:none;' : ''}">${errorMessage}</p>

		<div class="formCard">
		z    <h2>Member registration</h2>

		    <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data">

		        <input type="hidden" name="createdDate" value="${java.time.LocalDate.now()}" />
		        <input type="hidden" name="accountStatus" value="Active" />

			    <div class="formField">
			        <label>Full Name</label>
			        <input type="text" id="nameInput" name="Name" placeholder="Enter your full name" />
			    </div>

			    <div class="formField">
			        <label>Date of birth</label>
			        <input type="date" id="dobInput" name="DOB" />
			    </div>

			    <div class="formField">
			        <label>Phone number</label>
			        <input type="tel" id="phoneInput" name="Phone" placeholder="Enter your phone number" />
			    </div>

			    <div class="formField">
			        <label>User name</label>
			        <input type="text" id="usernameInput" name="Username" placeholder="Enter your username" />
			    </div>

			    <div class="formField">
			        <label>Email</label>
			        <input type="email" id="emailInput" name="Email" placeholder="Enter your email" />
			    </div>

			    <div class="formField">
			        <label>Password</label>
			        <input type="password" id="passwordInput" name="Password" placeholder="Create a password" />
			    </div>

			    <div class="formField">
			        <label>Profile Photo</label>
			        <input type="file" id="photoInput" name="Photo" accept="image/*" />
			    </div>

			    <button type="submit" class="submitButton">Register</button>

			</form>
		</div>
	</body>
</html>