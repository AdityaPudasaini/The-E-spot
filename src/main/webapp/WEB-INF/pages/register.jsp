<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Register - The E-Spot</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
	</head>
	
	<body>
	
		<div class="registerPageContent">
		  <div class="registerCard">
		  
		    <div class="registerFormHeader">
		      <h2>Create Account</h2>
		      <p>Join us — it only takes a minute.</p>
		    </div>
		    
		    <form class="registerForm" action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data" novalidate>
		      
		      <input type="hidden" name="accountStatus" value="Active" />
		      <div>
		      
		        <c:if test="${not empty errorMessage && errorMessage == 'Fill up all the credenttials.'}">
		          <div class="registerErrorMessage">${errorMessage}</div>
		        </c:if>
		        
		        <div class="registerFieldGroup">
		          <label for="nameInput">Full Name</label>
		          <input type="text" id="nameInput" name="Name" placeholder="Enter your full name" value="${param.Name}" />
		        </div>
		        
		      </div>
		      
		      <div>
		      
		        <c:if test="${not empty errorMessage && (errorMessage == 'Invalid date of birth. You must be at least 13 years old.' || errorMessage == 'Date of birth cannot be in the future.')}">
		          <div class="registerErrorMessage">${errorMessage}</div>
		        </c:if>
		        
		        <div class="registerFieldGroup">
		          <label for="dobInput">Date of Birth</label>
		          <input type="date" id="dobInput" name="DOB" value="${param.DOB}" />
		        </div>
		        
		      </div>
		      
		      <div>
		      
		        <c:if test="${not empty errorMessage && errorMessage == 'Invalid phone number!'}">
		          <div class="registerErrorMessage">${errorMessage}</div>
		        </c:if>
		        
		        <div class="registerFieldGroup">
		          <label for="phoneInput">Phone Number</label>
		          <input type="tel" id="phoneInput" name="Phone" placeholder="98XXXXXXXX" value="${param.Phone}" />
		        </div>
		        
		      </div>
		      
		      <div>
		      
		        <c:if test="${not empty errorMessage && errorMessage == 'Username is already in use.'}">
		          <div class="registerErrorMessage">${errorMessage}</div>
		        </c:if>
		        
		        <div class="registerFieldGroup">
		          <label for="usernameInput">Username</label>
		          <input type="text" id="usernameInput" name="Username" placeholder="Choose a username" value="${param.Username}" />
		        </div>
		        
		      </div>
		      
		      <div>
		      
		        <c:if test="${not empty errorMessage && (errorMessage == 'Invalid email address!' || errorMessage == 'Email is already in use.')}">
		          <div class="registerErrorMessage">${errorMessage}</div>
		        </c:if>
		        
		        <div class="registerFieldGroup">
		          <label for="emailInput">Email</label>
		          <input type="email" id="emailInput" name="Email" placeholder="example@gmail.com" value="${param.Email}" />
		        </div>
		        
		      </div>
		      
		      <div>
		      
		        <c:if test="${not empty errorMessage && errorMessage == 'Invalid password. Needs to be at least 10 characters long!'}">
		          <div class="registerErrorMessage">${errorMessage}</div>
		        </c:if>
		        
		        <div class="registerFieldGroup">
		          <label for="passwordInput">Password</label>
		          <input type="password" id="passwordInput" name="Password" placeholder="Min. 10 characters" />
		        </div>
		        
		      </div>
		      
		      <div>
		        <div class="registerFieldGroup">
		          <label for="photoInput">Profile Photo</label>
		          <input type="file" id="photoInput" name="Photo" accept="image/*" />
		        </div>
		        
		      </div>
		      
		      <c:if test="${not empty errorMessage && errorMessage == 'Phone number is already in use.'}">
		        <div class="registerErrorMessage">${errorMessage}</div>
		      </c:if>
		      
		      <c:if test="${not empty errorMessage && errorMessage != 'Fill up all the credenttials.' && errorMessage != 'Invalid date of birth. You must be at least 13 years old.' && errorMessage != 'Date of birth cannot be in the future.'
		                    && errorMessage != 'Invalid phone number!' && errorMessage != 'Username is already in use.' && errorMessage != 'Invalid email address!'
		                    && errorMessage != 'Email is already in use.' && errorMessage != 'Invalid password. Needs to be at least 10 characters long!' && errorMessage != 'Phone number is already in use.'}">
		        <div class="registerErrorMessage">${errorMessage}</div>
		      </c:if>
		      
		      <div class="registerActions">
		      
		        <div class="registerBtnRow">
		        
		          <button type="submit" class="registerBtnPrimary">Register</button>
		          <button type="button" class="registerBtnOutline" onclick="window.location='${pageContext.request.contextPath}/login'">Have an account? Log in</button>
		        
		        </div>
		        
		      </div>
		      
		    </form>
		    
		    <div class="registerFormFooter">
		      <p>By registering you agree to our terms and that you have read our data policy.</p>
		    </div>
		  </div>
		</div>
	</body>
</html>