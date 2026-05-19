package com.controller;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import com.dao.UserDashboardDAO;
import com.model.UserStatsModel;

/**
 * Servlet implementation class MemberDashboard
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/memberDashboard" })
public class MemberDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		int memberId = (int) session.getAttribute("memberId");
 
		try {
			UserDashboardDAO userDao = new UserDashboardDAO();
 
			UserStatsModel userStats = new UserStatsModel();
			
			userStats.setTotalRevenue(userDao.totalRevenue(memberId).getTotalRevenue());
			userStats.setTotalBought(userDao.totalBought(memberId).getTotalBought());
			userStats.setTotalSold(userDao.totalSold(memberId).getTotalSold());
			userStats.setTotalSpent(userDao.totalSpent(memberId).getTotalSpent());
 
			request.setAttribute("userStats", userStats);
			request.setAttribute("cartData",     userDao.cartItems(memberId));
			request.setAttribute("recentBought", userDao.recentBought(memberId));
			request.setAttribute("wishlistData", userDao.wishlistItems(memberId));
			request.setAttribute("recentSold",   userDao.recentSold(memberId));
 
		} 
		
		catch (Exception e) {
			e.printStackTrace();
		}
 
		request.setAttribute("currentPage", "dashboard");
		request.getRequestDispatcher("/WEB-INF/pages/userDashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
