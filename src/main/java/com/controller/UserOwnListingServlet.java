package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.dao.UserListingDAO;
import com.model.AdminListingModel;
import com.model.AdminOrderModel;

/**
 * Servlet implementation class UserOwnListingServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/userOwn" })
public class UserOwnListingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserOwnListingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
            UserListingDAO userListingDao = new UserListingDAO();
            String username = (String) request.getSession().getAttribute("username");

            ArrayList<AdminListingModel> listings = userListingDao.getUserListings(username);
            ArrayList<AdminOrderModel> orders = userListingDao.getUserOrders(username);

            request.setAttribute("listings", listings);
            request.setAttribute("orders", orders);

        } 
		
		catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("currentPage", "listings");
        request.getRequestDispatcher("/WEB-INF/pages/userListing.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
