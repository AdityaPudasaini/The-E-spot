package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.dao.CartWishlistDAO;
import com.model.CartModel;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/Cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
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

            ArrayList<CartModel> cartItems = cartWishlistDao.getCartItems(memberId);
            request.setAttribute("cartItems", cartItems);

        } 
		
		catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("currentPage", "Cart");
        request.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
            CartWishlistDAO cartWishlistDao = new CartWishlistDAO();
            String cartItemIdString = request.getParameter("cartItemId");

            if (cartItemIdString != null && !cartItemIdString.isEmpty()) 
            {
                int cartItemId = Integer.parseInt(cartItemIdString);
                
                if (request.getParameter("remove") != null) 
                {
                    cartWishlistDao.removeFromCart(cartItemId);
                }
            }

        } 
		
		catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/cartPage");
	}

}
