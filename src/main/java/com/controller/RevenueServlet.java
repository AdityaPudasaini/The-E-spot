package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.dao.AdminRevenueDAO;
import com.model.AdminRevenueModel;

/**
 * Servlet implementation class RevenueServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/revenue" })
public class RevenueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RevenueServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
            AdminRevenueDAO adminRevenueDao = new AdminRevenueDAO();

            

            ArrayList<AdminRevenueModel> pagedOrders = new ArrayList<>(allOrders.subList(startFrom, endWith));

            request.setAttribute("orders", pagedOrders);
            request.setAttribute("currentPageInRevenue", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("selectedStatus", selectedStatus);
            request.setAttribute("selectedSearch", selectedSearch);
            request.setAttribute("totalRevenue", adminRevenueDao.totalRevenue());
            request.setAttribute("revenueThisMonth", adminRevenueDao.revenueThisMonth());
            request.setAttribute("revenueThisWeek", adminRevenueDao.revenueThisWeek());
            request.setAttribute("averageOrderValue", adminRevenueDao.averageOrderValue());

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("currentPage", "revenue");
        request.getRequestDispatcher("/WEB-INF/pages/revenue.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
