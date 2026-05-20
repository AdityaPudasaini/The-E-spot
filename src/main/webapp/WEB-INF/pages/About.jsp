<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us - The E-Spot</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutUs.css">
</head>
<body>

    <%@ include file="/Component/userSidebar.jsp" %>

    <div class="mainContent">

        <div class="userTopBar">
            <p class="userDashboardHeading"><b>About Us</b></p>
            <div class="userAvatarCircle">
                <img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}"
                     style="width: 100%; height: 100%; border-radius: 50%;" />
            </div>
        </div>

        <div class="aboutWrapper">

            <div class="downloadRow">
                <button class="downloadBtn" onclick="downloadAboutPDF()">
                    &#8595; Download as PDF
                </button>
            </div>

            <div class="heroBanner" id="aboutPDFContent">
                <h1>Welcome to The E-Spot</h1>
                <p>Nepal's trusted reselling marketplace — where quality products find new homes and communities thrive through sustainable commerce.</p>
                <div class="statRow">
                    <span class="statPill">10,000+ Members</span>
                    <span class="statPill">500+ Products</span>
                    <span class="statPill">Since 2022</span>
                </div>
            </div>

            <div class="aboutCard">
                <p class="sectionTitle">Our Mission &amp; Vision</p>
                <div class="grid2">
                    <div class="missionCard">
                        <h3>&#127919; Our Mission</h3>
                        <p>To revolutionize the reselling market in Nepal by creating a trusted, accessible platform where quality products find new homes. We believe in giving every item a second life and empowering sellers and buyers with fair prices and transparent transactions.</p>
                    </div>
                    <div class="missionCard vision">
                        <h3>&#128218; Our Vision</h3>
                        <p>To become Nepal's most trusted reselling platform, fostering a circular economy that benefits individuals, businesses, and the environment. We envision a community where buying and selling secondhand items is the norm, not the exception.</p>
                    </div>
                </div>
            </div>

            <div class="aboutCard">
                <p class="sectionTitle">Our Story</p>
                <div class="storyText">
                    <p>The E-Spot was born from a simple observation: many quality products in Nepal end up discarded or unused, while people search endlessly for affordable alternatives. We saw an opportunity to bridge this gap and create something meaningful.</p>
                    <p>What started as a conversation between friends passionate about sustainability and commerce has evolved into a vibrant marketplace connecting thousands of buyers and sellers across Nepal. We're committed to making reselling accessible, trustworthy, and rewarding for everyone.</p>
                    <p>Today, The E-Spot stands as a testament to Nepali entrepreneurship and innovation — proving that business with purpose can drive real change in our communities.</p>
                </div>
            </div>

            <div class="aboutCard">
                <p class="sectionTitle">Why Choose The E-Spot?</p>
                <div class="featureGrid">
                    <div class="featureItem">
                        <span class="featureIcon">&#9994;</span>
                        <div>
                            <h4>Sustainable Shopping</h4>
                            <p>Give products a second life while reducing environmental impact. Every purchase contributes to a more sustainable future for Nepal.</p>
                        </div>
                    </div>
                    <div class="featureItem">
                        <span class="featureIcon">&#128176;</span>
                        <div>
                            <h4>Best Value Deals</h4>
                            <p>Find quality items at unbeatable prices. Our platform connects you with verified sellers offering genuine products at discounted rates.</p>
                        </div>
                    </div>
                    <div class="featureItem">
                        <span class="featureIcon">&#128101;</span>
                        <div>
                            <h4>Trusted Community</h4>
                            <p>Join thousands of Nepali buyers and sellers who trust The E-Spot for safe transactions and peace of mind.</p>
                        </div>
                    </div>
                    <div class="featureItem">
                        <span class="featureIcon">&#127757;</span>
                        <div>
                            <h4>Local First</h4>
                            <p>Built for Nepal, by Nepali entrepreneurs. We understand local needs and actively support the growth of our community's economy.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="aboutCard">
                <p class="sectionTitle">Our Core Values</p>
                <div class="valuesGrid">
                    <div class="valueCard">
                        <span class="valueEmoji">&#128737;</span>
                        <h4>Integrity</h4>
                        <p>We operate with transparency and honesty in every transaction, building trust with our community one interaction at a time.</p>
                    </div>
                    <div class="valueCard">
                        <span class="valueEmoji">&#127758;</span>
                        <h4>Sustainability</h4>
                        <p>Every resale is a step toward a more sustainable Nepal. We are dedicated to reducing waste and promoting circular commerce.</p>
                    </div>
                    <div class="valueCard">
                        <span class="valueEmoji">&#129309;</span>
                        <h4>Community</h4>
                        <p>We believe in the power of community and are committed to supporting local sellers and empowering buyers across Nepal.</p>
                    </div>
                </div>
            </div>

            <div class="aboutCard">
                <p class="sectionTitle">Meet Our Team</p>
                <div class="teamGrid">

                    <div class="teamCard">
                        <div class="teamAvatar">
                            <img src="${pageContext.request.contextPath}/image?name=team_ceo"
                                 onerror="this.style.display='none'; this.parentNode.innerText='RK'" />
                        </div>
                        <h4>Rajesh Karki</h4>
                        <p class="teamRole">Founder &amp; CEO</p>
                    </div>

                    <div class="teamCard">
                        <div class="teamAvatar">
                            <img src="${pageContext.request.contextPath}/image?name=team_dev"
                                 onerror="this.style.display='none'; this.parentNode.innerText='SA'" />
                        </div>
                        <h4>Sita Adhikari</h4>
                        <p class="teamRole">Lead Developer</p>
                    </div>

                    <div class="teamCard">
                        <div class="teamAvatar">
                            <img src="${pageContext.request.contextPath}/image?name=team_support"
                                 onerror="this.style.display='none'; this.parentNode.innerText='BP'" />
                        </div>
                        <h4>Bikash Poudel</h4>
                        <p class="teamRole">Head of Support</p>
                    </div>

                </div>
            </div>

            <div class="aboutCard">
                <p class="sectionTitle">Get In Touch</p>
                <div class="contactGrid">
                    <div class="contactItem">
                        <span class="contactIcon">&#128231;</span>
                        <div>
                            <h4>Email</h4>
                            <p>support@espot.com.np</p>
                        </div>
                    </div>
                    <div class="contactItem">
                        <span class="contactIcon">&#128222;</span>
                        <div>
                            <h4>Phone</h4>
                            <p>+977 01-4567890</p>
                        </div>
                    </div>
                    <div class="contactItem">
                        <span class="contactIcon">&#128205;</span>
                        <div>
                            <h4>Address</h4>
                            <p>Thamel, Kathmandu, Nepal</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="ctaStrip">
                <h2>Join The E-Spot Community</h2>
                <p>Whether you're looking for great deals or want to declutter by selling, The E-Spot is your trusted marketplace.</p>
                <div class="ctaBtnGroup">
                    <a href="${pageContext.request.contextPath}/product" class="ctaBtn ctaBtnPrimary">Start Shopping</a>
                    <a href="${pageContext.request.contextPath}/register" class="ctaBtn ctaBtnSecondary">Become a Seller</a>
                </div>
            </div>

        </div>
    </div>

    <%@ include file="/Component/adminFooter.jsp" %>

</body>
</html>
