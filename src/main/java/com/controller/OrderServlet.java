package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.dao.AdminOrderDAO;
import com.model.AdminOrderModel;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/order" })
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
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
            AdminOrderDAO adminOrderDao = new AdminOrderDAO();

            String selectedStatus = request.getParameter("status");
            String selectedSearch = request.getParameter("search");

            if (selectedStatus == null) selectedStatus = "";
            if (selectedSearch == null) selectedSearch = "";

            int pageSize = 10;
            int page = 1;

            String pageString = request.getParameter("page");
            if (pageString != null && !pageString.isEmpty()) {
                page = Integer.parseInt(pageString);
            }

            ArrayList<AdminOrderModel> allOrders = adminOrderDao.allOrders(selectedStatus, selectedSearch);

            int totalCount = allOrders.size();
            int totalPages = (totalCount + pageSize - 1) / pageSize;

            int startFrom = (page - 1) * pageSize;
            int endWith;

            if (startFrom + pageSize > totalCount) {
                endWith = totalCount;
            } else {
                endWith = startFrom + pageSize;
            }

            ArrayList<AdminOrderModel> pagedOrders = new ArrayList<>(allOrders.subList(startFrom, endWith));

            request.setAttribute("orders", pagedOrders);
            request.setAttribute("currentPageInOrder", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("selectedStatus", selectedStatus);
            request.setAttribute("selectedSearch", selectedSearch);
            request.setAttribute("totalOrders", adminOrderDao.totalOrders());
            request.setAttribute("completedOrders", adminOrderDao.completedOrders());
            request.setAttribute("pendingOrders", adminOrderDao.pendingOrders());
            request.setAttribute("refundedOrders", adminOrderDao.refundedOrders());

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("currentPage", "orders");
        request.getRequestDispatcher("/WEB-INF/pages/orders.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
