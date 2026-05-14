package com.controller;

import java.io.IOException;
import com.dao.AdminDashboardDAO;
import com.model.AdminDashboardModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;	
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class dashboardServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/dashboard" })
public class AdminDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AdminDashboardServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
	        AdminDashboardDAO adminDao = new AdminDashboardDAO();
	        
	        AdminDashboardModel dashboardData = new AdminDashboardModel();
	        dashboardData.setTotalRevenue(adminDao.totalRevenue().getTotalRevenue());
	        dashboardData.setTotalSold(adminDao.totalProductSOld().getTotalSold());
	        dashboardData.setTotalListed(adminDao.totalProductListed().getTotalListed());
	        
	        AdminDashboardModel recentData = adminDao.recentListings();
	        dashboardData.setRecentProduct1(recentData.getRecentProduct1());
	        dashboardData.setRecentSeller1(recentData.getRecentSeller1());
	        dashboardData.setRecentPrice1(recentData.getRecentPrice1());
	        dashboardData.setRecentProduct2(recentData.getRecentProduct2());
	        dashboardData.setRecentSeller2(recentData.getRecentSeller2());
	        dashboardData.setRecentPrice2(recentData.getRecentPrice2());
	        dashboardData.setRecentProduct3(recentData.getRecentProduct3());
	        dashboardData.setRecentSeller3(recentData.getRecentSeller3());
	        dashboardData.setRecentPrice3(recentData.getRecentPrice3());
	        
	        request.setAttribute("dashboardData", dashboardData);
	        request.setAttribute("flagged", adminDao.flaggedProducts());
	        request.setAttribute("visitors", adminDao.totalVisitors());
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
        
		request.setAttribute("currentPage", "dashboard");
		request.getRequestDispatcher("/WEB-INF/pages/adminDashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

}
