package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.CartWishlistDAO;

/**
 * Servlet implementation class CartWishlistServlet
 */
@WebServlet({ "/cart", "/wishlist" })
public class CartWishlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartWishlistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
        int memberId = (int) session.getAttribute("memberId");

        String productIdParam = request.getParameter("productId");
        String quantityParam = request.getParameter("quantity");
        String action = request.getParameter("action");

        if (productIdParam == null) 
        {
            response.sendRedirect(request.getContextPath() + "/UserListing");
            return;
        }

        int productId = Integer.parseInt(productIdParam);
        int quantity = 1;

        if (quantityParam != null && !quantityParam.isEmpty()) 
        {
            quantity = Integer.parseInt(quantityParam);
        }

        String path = request.getServletPath();

        try {
            CartWishlistDAO dao = new CartWishlistDAO();

            if (path.equals("/wishlist")) 
            {
                dao.addToWishlist(memberId, productId);
                response.sendRedirect(request.getContextPath() + "/viewListing?id=" + productId + "&success=wishlist");
                return;
            }

            if (path.equals("/cart")) 
            {
                if (action != null && action.equals("buyNow")) 
                {
                    int orderId = dao.buyNow(memberId, productId, quantity);
                    
                    if (orderId == -1) 
                    {
                        response.sendRedirect(request.getContextPath() + "/viewListing?id=" + productId + "&error=stock");
                        return;
                    }
                    
                    response.sendRedirect(request.getContextPath() + "/viewListing?id=" + productId + "&success=bought&orderId=" + orderId);
                    return;
                }

                dao.addToCart(memberId, productId, quantity);
                response.sendRedirect(request.getContextPath() + "/viewListing?id=" + productId + "&success=cart");
                return;
            }

        } 
        
        catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/viewListing?id=" + productId + "&error=general");
        }
	}

}
