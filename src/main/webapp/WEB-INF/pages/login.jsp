<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - The E-Spot</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>

<div class="loginPageContent">
  <div class="loginCard">

    <div class="loginFormHeader">
      <h2>Welcome Back!</h2>
      <p>Please log in to your account.</p>
    </div>

    <form class="loginForm" action="${pageContext.request.contextPath}/login" method="post">

      <div>
        <c:if test="${error == 'Email is required' || error == \"User doesn't exist\" || error == 'Your account has been banned'}">
            <div class="loginErrorMessage">${error}</div>
        </c:if>
        <div class="loginFieldGroup">
            <label for="email">Email</label>
            <input id="email" name="Email" type="email" placeholder="example@gmail.com" value="${typedUser}" required />
        </div>
      </div>

      <div>
        <c:if test="${error == 'Password is required' || error == 'Password is incorrect'}">
            <div class="loginErrorMessage">${error}</div>
        </c:if>
        <div class="loginFieldGroup">
            <label for="password">Password</label>
            <input id="password" name="Password" type="password" placeholder="••••••••" required />
        </div>
      </div>

      <div class="loginActions">
        <div class="loginBtnRow">
          <button type="submit" class="loginBtnPrimary">Login</button>
          <button type="button" class="loginBtnOutline" onclick="window.location='${pageContext.request.contextPath}/register'">No Account? Register</button>
        </div>
      </div>

    </form>

    <div class="loginFormFooter">
      <p>By logging in you agree to our terms and that you have read our data policy.</p>
    </div>

  </div>
</div>

</body>
</html>
