package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.dao.CartWishlistDAO;
import com.model.WishlistModel;

/**
 * Servlet implementation class WishlistPageServlet
 */
@WebServlet("/Wishlist")
public class WishlistPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishlistPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
            CartWishlistDAO cartWishlistDao = new CartWishlistDAO();
            
            int memberId = (int) request.getSession().getAttribute("memberId");

            ArrayList<WishlistModel> wishlistItems = cartWishlistDao.getWishlistItems(memberId);
            request.setAttribute("wishlistItems", wishlistItems);

        } 
		
		catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("currentPage", "wishlist");
        request.getRequestDispatcher("/WEB-INF/pages/wishlist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
