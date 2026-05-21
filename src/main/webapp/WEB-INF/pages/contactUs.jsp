<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contactUs.css">
</head>
<body>

    <%@ include file="/Component/userSidebar.jsp" %>

    <div class="mainContent">

        <div class="userTopBar">
            <p class="userDashboardHeading"><b>Contact Us</b></p>
            <div class="userAvatarCircle">
                <img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}"
                     style="width: 100%; height: 100%; border-radius: 50%;" />
            </div>
        </div>

        <div class="contactWrapper">

            <div class="aboutCard">
                <p class="sectionTitle">Send Us a Message</p>
                <form class="contactForm" action="${pageContext.request.contextPath}/ContactUs" method="post">

                    <div class="formRow">
                        <div class="formGroup">
                            <label for="firstName">Full Name <span class="req">*</span></label>
                            <input type="text" id="firstName" name="name" placeholder="Enter full name" required />
                        </div>
                    </div>

                    <div class="formRow">
                        <div class="formGroup">
                            <label for="email">Email Address <span class="req">*</span></label>
                            <input type="email" id="email" name="email" placeholder="you@example.com" required />
                        </div>
                        <div class="formGroup">
                            <label for="phone">Phone Number</label>
                            <input type="tel" id="phone" name="phone" placeholder="+977 98XXXXXXXX" />
                        </div>
                    </div>

                    <div class="formRow">
                        <div class="formGroup fullWidth">
                            <label for="subject">Subject <span class="req">*</span></label>
                            <select id="subject" name="subject" required>
                                <option value="" disabled selected>Select a topic…</option>
                                <option value="general">General Inquiry</option>
                                <option value="order">Order / Purchase Issue</option>
                                <option value="seller">Seller Support</option>
                                <option value="account">Account	 Profile</option>
                                <option value="report">Report a Listing</option>
                                <option value="partnership">Partnership / Business</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                    </div>

                    <div class="formRow">
                        <div class="formGroup fullWidth">
                            <label for="message">Message <span class="req">*</span></label>
                            <textarea id="message" name="message" rows="6" placeholder="Tell us how we can help…" required></textarea>
                        </div>
                    </div>

                    <c:if test="${not empty requestScope.successMessage}">
                        <div class="formAlert alertSuccess">${requestScope.successMessage}</div>
                    </c:if>
                    <c:if test="${not empty requestScope.errorMessage}">
                        <div class="formAlert alertError">${requestScope.errorMessage}</div>
                    </c:if>

                    <div class="formActions">
                        <button type="submit" class="submitBtn">Send Message</button>
                        <button type="reset" class="resetBtn">Clear Form</button>
                    </div>

                </form>
            </div>

        </div>
    </div>

    <%@ include file="/Component/adminFooter.jsp" %>

</body>
</html>
