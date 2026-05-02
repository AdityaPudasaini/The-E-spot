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

		<div class="form-card">
		    <h2>Member registration</h2>
		
		    <form action="${pageContext.request.contextPath}/register" method="post">
		
		        <input type="hidden" name="createdDate" value="${java.time.LocalDate.now()}" />
		        <input type="hidden" name="accountStatus" value="Active" />
    
			    <div class="field">
			      <label>Full Name</label>
			      <input type="text" id="name" name="Name" placeholder="Enter your full name" />
			    </div>
			
			    <div class="field">
			      <label>Date of birth</label>
			      <input type="date" id="dob" name="DOB" />
			    </div>
			
			    <div class="field">
			      <label>Phone number</label>
			      <input type="tel" id="phone" name="Phone" placeholder="Enter your phone number" />
			    </div>
				
				<div class="field">
			      <label>User name</label>
			      <input type="text" id="username" name="Username" placeholder="Enter your username" />
			    </div>
			    
			    <div class="field">
			      <label>Email</label>
			      <input type="email" id="email" name="Email" placeholder="Enter your email" />
			    </div>
			
			    <div class="field">
			      <label>Password</label>
			      <input type="password" id="password" name="Password" placeholder="Create a password" />
			    </div>
			    
			    <button type="submit" class="button">Register</button>
			</form>
		</div>
	</body>
