<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userSidebar.css">

<div class="userSidebar">
    <p class="sidebarBrand">The E-spot</p>

    <nav class="sidebarNav">
        <a href="${pageContext.request.contextPath}/userDashboard"
           class="sidebarItem ${currentPage == 'dashboard' ? 'active' : ''}">
            
            <span>Dashboard</span>
        </a>

        <a href="${pageContext.request.contextPath}/listing"
           class="sidebarItem ${currentPage == 'listings' ? 'active' : ''}">
            <span>Listings</span>
        </a>

        <a href="${pageContext.request.contextPath}/orders"
           class="sidebarItem ${currentPage == 'orders' ? 'active' : ''}">
            <span>Orders</span>
        </a>

        <a href="${pageContext.request.contextPath}/wishlist"
           class="sidebarItem ${currentPage == 'wishlist' ? 'active' : ''}">
            <span>Wishlist</span>
        </a>

        <a href="${pageContext.request.contextPath}/cart"
           class="sidebarItem ${currentPage == 'cart' ? 'active' : ''}">
            <span>Cart</span>
        </a>
    </nav>

    <a href="${pageContext.request.contextPath}/logout" class="sidebarLogout">
        <span>Logout</span>
    </a>
</div>