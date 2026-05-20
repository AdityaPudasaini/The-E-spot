<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Profile - The E-Spot</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/editProfile.css">
    </head>
    <body>
        <%@ include file="/Component/userSidebar.jsp" %>

        <div class="mainContent">

            <div class="userTopBar">
                <p class="userDashboardHeading"><b>Edit Profile</b></p>
                <div class="userAvatarCircle">
                    <img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%;"/>
                </div>
            </div>

            <div class="editProfileWrapper">

                <c:if test="${not empty check.success}">
                
                    <c:choose>
                    
                        <c:when test="${check.success == 'profile'}">
                            <div class="successBanner">Profile updated successfully!</div>
                        </c:when>
                        
                        <c:when test="${check.success == 'password'}">
                            <div class="successBanner">Password changed successfully!</div>
                        </c:when>
                        
                    </c:choose>
                    
                </c:if>

                <div class="editProfileCard">
                    <p class="editProfileTitle">Profile Information</p>

                    <c:if test="${not empty profileError}">
                        <div class="editProfileError">${profileError}</div>
                    </c:if>

                    <form method="post" action="${pageContext.request.contextPath}/editProfile" enctype="multipart/form-data">

                        <div class="profileImageSection">
                        
                            <div class="profileImageCircle">
                                <img src="${pageContext.request.contextPath}/image?name=${sessionScope.username}" style="width: 100%; height: 100%; border-radius: 50%; object-fit: cover;" />
                            </div>
                            
                            <div>
                                <p class="profileImageLabel">Profile Photo</p>
                                <input type="file" name="profileImage" accept="image/*" class="profileImageInput" />
                            </div>
                        </div>

                        <div class="editProfileRow" style="margin-top: 20px;">
                            <div class="editProfileField">
                            
                                <label class="editProfileLabel">Full Name</label>
                                <input class="editProfileInput" type="text" name="name" value="${member.name}" required />
                                
                            </div>
                            
                            <div class="editProfileField">
                            
                                <label class="editProfileLabel">Email</label>
                                <input class="editProfileInput" type="email" name="email" value="${member.email}" required />
                                
                            </div>
                        </div>

                        <div class="editProfileRow" style="margin-top: 20px;">
                            <div class="editProfileField">
                            
                                <label class="editProfileLabel">Phone</label>
                                <input class="editProfileInput" type="text" name="phone" value="${member.number}" required />
                                
                            </div>
                            
                            <div class="editProfileField">
                                <label class="editProfileLabel">Date of Birth</label>
                                <input class="editProfileInput" type="date" name="dob" value="${member.dob}" required />
                            </div>
                        </div>

                        <div class="editProfileButtons" style="margin-top: 20px;">
                            <button type="submit" class="editProfileBtnPrimary">Save Changes</button>
                            <a href="${pageContext.request.contextPath}/memberDashboard" class="editProfileBtnSecondary">Cancel</a>
                        </div>

                    </form>
                </div>

                <div class="editProfileCard">
                    <p class="editProfileTitle">Change Password</p>

                    <c:if test="${not empty passwordError}">
                        <div class="editProfileError">${passwordError}</div>
                    </c:if>

                    <form method="post" action="${pageContext.request.contextPath}/editProfile">
                        <input type="hidden" name="action" value="changePassword" />

                        <div class="editProfileField">
                        
                            <label class="editProfileLabel">Current Password</label>
                            <input class="editProfileInput" type="password" name="currentPassword" required />
                        </div>

                        <div class="editProfileRow" style="margin-top: 20px;">
                        
                            <div class="editProfileField">
                                <label class="editProfileLabel">New Password</label>
                                <input class="editProfileInput" type="password" name="newPassword" required />
                            </div>
                            
                            <div class="editProfileField">
                                <label class="editProfileLabel">Confirm New Password</label>
                                <input class="editProfileInput" type="password" name="confirmPassword" required />
                            </div>
                            
                        </div>

                        <div class="editProfileButtons" style="margin-top: 20px;">
                            <button type="submit" class="editProfileBtnPrimary">Change Password</button>
                        </div>

                    </form>
                </div>

            </div>
        </div>

        <%@ include file="/Component/adminFooter.jsp" %>
    </body>
</html>