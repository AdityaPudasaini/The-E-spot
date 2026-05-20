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

            <div class="heroBanner">
                <h1>We'd Love to Hear From You</h1>
                <p>Have a question, feedback, or just want to say hello? Our team is here for you — reach out through any of the channels below.</p>
            </div>

            <div class="aboutCard">
                <p class="sectionTitle">Get In Touch</p>
                <div class="channelGrid">
                    <div class="channelCard">
                        <span class="channelIcon"></span>
                        <h4>Email Us</h4>
                        <p class="channelDetail">support@espot.com.np</p>
                        <p class="channelNote">We typically respond within 24 hours on business days.</p>
                    </div>
                    <div class="channelCard">
                        <span class="channelIcon"></span>
                        <h4>Call Us</h4>
                        <p class="channelDetail">+977 01-4567890</p>
                        <p class="channelNote">Sunday – Friday, 9:00 AM – 6:00 PM NPT.</p>
                    </div>
                    <div class="channelCard">
                        <span class="channelIcon"></span>
                        <h4>Visit Us</h4>
                        <p class="channelDetail">Thamel, Kathmandu, Nepal</p>
                        <p class="channelNote">Walk-ins welcome during office hours.</p>
                    </div>
                </div>
            </div>

            <div class="aboutCard">
                <p class="sectionTitle">Send Us a Message</p>
                <form class="contactForm" action="${pageContext.request.contextPath}/ContactUs" method="post">

                    <div class="formRow">
                        <div class="formGroup">
                            <label for="firstName">Full Name <span class="req">*</span></label>
                            <input type="text" id="firstName" name="firstName" placeholder="Enter full name" required />
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

            <div class="aboutCard">
                <p class="sectionTitle">Frequently Asked Questions</p>
                <div class="faqGrid">

                    <div class="faqItem">
                        <h4>How do I list an item for sale?</h4>
                        <p>Go to your member dashboard and click "Add Listing." Fill in the product details, upload photos, and set your price — it only takes a few minutes.</p>
                    </div>

                    <div class="faqItem">
                        <h4>Is The E-Spot free to use?</h4>
                        <p>Creating an account and browsing listings is completely free. A small commission applies only when a sale is successfully completed.</p>
                    </div>

                    <div class="faqItem">
                        <h4>How are payments handled?</h4>
                        <p>We support eSewa, Khalti, and bank transfer. Payments are held securely and released to the seller once the buyer confirms receipt.</p>
                    </div>

                    <div class="faqItem">
                        <h4>What if I receive a wrong or damaged item?</h4>
                        <p>Contact us within 48 hours of delivery with photos. Our support team will mediate and arrange a resolution or refund.</p>
                    </div>

                    <div class="faqItem">
                        <h4>Can I negotiate the price with a seller?</h4>
                        <p>Yes! Use the in-platform chat to discuss pricing directly with the seller before placing your order.</p>
                    </div>

                    <div class="faqItem">
                        <h4>How do I report a suspicious listing?</h4>
                        <p>Tap the "Report" button on any listing page, or email us at support@espot.com.np with the listing link and details.</p>
                    </div>

                </div>
            </div>

            <div class="ctaStrip">
                <h2>Still Need Help?</h2>
                <p>Our support team is always happy to assist. Drop us a message above or reach out directly — we'll get back to you as soon as possible.</p>
                <div class="ctaBtnGroup">
                    <a href="${pageContext.request.contextPath}/UserListing" class="ctaBtn ctaBtnPrimary">Browse Listings</a>
                    <a href="${pageContext.request.contextPath}/aboutUs" class="ctaBtn ctaBtnSecondary">About The E-Spot</a>
                </div>
            </div>

        </div>
    </div>

    <%@ include file="/Component/adminFooter.jsp" %>

</body>
</html>
