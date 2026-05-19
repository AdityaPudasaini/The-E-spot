<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - The E-Spot</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" type="text/css">
</head>
<body>

<div class="page-content">
  <div class="login-card">

    <div class="form-container">
      <div class="form-inner">
      
        <div class="form-header">
          <h2>Welcome Back!</h2>
          <p>Please log in to your account.</p>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">${error}</div>
        <% } %>

        <form action="${pageContext.request.contextPath}/login" method="post">
        
          <div class="field-group">
            <label for="email">Email</label>
            <input id="email" name="Email" type="email" placeholder="example@gmail.com" value="${typedUser}" required />
          </div>

          <div class="field-group">
            <label for="password">Password</label>
            <input id="password" name="Password" type="password" placeholder="••••••••" required />
          </div>

          <div class="actions">
            <div class="btn-row">
              <button type="submit" class="btn-primary">Login</button>
              <button type="button" class="btn-outline" onclick="window.location='${pageContext.request.contextPath}/register'">No Account? Register</button>
            </div>
            
          </div>
          
        </form>

        <div class="form-footer">
          <p>By logging in you agree to our terms and that you have read our data policy.</p>
        </div>
        
      </div>
    </div>

    <div class="image-panel">
      <img src="${pageContext.request.contextPath}/Images/smile.jpg" alt="Happy group of diverse friends celebrating" />
    </div>

  </div>
</div>

</body>
</html>
