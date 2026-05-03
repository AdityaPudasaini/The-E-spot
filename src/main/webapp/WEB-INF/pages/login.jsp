<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"> 
		<title>Login</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
	</head>
	
	<body>
		<div class="form-card">
		    <h2>Login</h2>
		    
		    <div style="color:red; margin-bottom:10px; ${empty error ? 'display:none;' : ''}">${error}</div>
		
			<form action="<%=request.getContextPath()%>/login" method="post">
			    <div class="field">
			      <label>Email address</label>
			      <input type="email" id="email" name="Email" placeholder="Enter your email" />
			    </div>
			
			    <div class="field">
			      <label>Password</label>
			      <input type="password" id="password" name="Password" placeholder="Enter your password" />
			    </div>
			
			    <button class="button" type="submit">Login</button>
			</form>
	  </div>
	</body>
</html>
