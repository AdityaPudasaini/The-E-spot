<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Server problem</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/error404.css">
    </head>
    <body>
        <div class="errorWrapper">
            <div class="errorCard">
                <p class="errorCode">500</p>
                <p class="errorTitle">Server encountered an unexpected issue</p>
                <p class="errorMessage">The page you are looking for doesn't exist or has been moved.</p>
                <a href="${pageContext.request.contextPath}/login" class="errorButton">Go Back Home</a>
            </div>
        </div>
    </body>
</html>
