package com.controller;

import java.io.IOException;
import com.dao.AdminDashboardDAO;

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
	        
	        request.setAttribute("revenue", adminDao.totalRevenue());
	        request.setAttribute("sold", adminDao.totalProductSOld());
	        request.setAttribute("listed", adminDao.totalProductListed());
	        request.setAttribute("flagged", adminDao.flaggedProducts());
	        request.setAttribute("recent", adminDao.recentListings());
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
