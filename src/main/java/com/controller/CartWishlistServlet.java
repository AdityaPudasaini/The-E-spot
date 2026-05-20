package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import com.dao.CartWishlistDAO;
import com.model.CartModel;

/**
 * Servlet implementation class CartWishlistServlet
 */
@WebServlet({ "/cart", "/wishlist"})
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
		String path = request.getServletPath();

        if (path.equals("/cart")) 
        {
        	
            HttpSession session = request.getSession();
            int memberId = (int) session.getAttribute("memberId");

            try {
                CartWishlistDAO dao = new CartWishlistDAO();
                ArrayList<CartModel> cartItems = dao.getCartItems(memberId);

                double grandTotal = 0;
                
                for (CartModel item : cartItems) 
                {
                    grandTotal += item.getTotalPrice();
                }

                request.setAttribute("cartItems", cartItems);
                request.setAttribute("grandTotal", String.format("%.2f", grandTotal));
            } 
            
            catch (Exception e) {
                e.printStackTrace();
            }

            request.setAttribute("currentPage", "cart");
            request.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(request, response);
            
            return;
        }
        
        response.sendRedirect(request.getContextPath() + "/memberDashboard");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
        int memberId = (int) session.getAttribute("memberId");
        String path = request.getServletPath();

        try {
            CartWishlistDAO dao = new CartWishlistDAO();

            if (path.equals("/wishlist")) 
            {
                int productId = Integer.parseInt(request.getParameter("productId"));
                
                dao.addToWishlist(memberId, productId);
                response.sendRedirect(request.getContextPath() + "/viewListing?id=" + productId + "&success=wishlist");
                
                return;
            }

            if (path.equals("/cart")) 
            {
                int productId = Integer.parseInt(request.getParameter("productId"));
                
                String action = request.getParameter("action");
                
                String quantityParam = request.getParameter("quantity");
                
                int quantity = 1;

                if (quantityParam != null && !quantityParam.isEmpty()) 
                {
                    quantity = Integer.parseInt(quantityParam);
                }

                if (action != null && action.equals("buyNow")) 
                {
                    int orderId = dao.buyNow(memberId, productId, quantity);
                    
                    if (orderId == -1) 
                    {
                        response.sendRedirect(request.getContextPath() + "/viewListing?id=" + productId + "&error=stock");
                        return;
                    }
                    
                    response.sendRedirect(request.getContextPath() + "/viewListing?id=" + productId + "&success=bought");
                    return;
                }

                if (action != null && action.equals("remove")) 
                {
                    int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
                    
                    dao.removeFromCart(cartItemId);
                    
                    response.sendRedirect(request.getContextPath() + "/cart?success=removed")
                    ;
                    return;
                }

                dao.addToCart(memberId, productId, quantity);
                
                response.sendRedirect(request.getContextPath() + "/viewListing?id=" + productId + "&success=cart");
                return;
            }

            if (path.equals("/Cart")) 
            {
                if (request.getParameter("buy") != null) 
                {
                    int productId = Integer.parseInt(request.getParameter("productId"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));

                    int orderId = dao.buyNow(memberId, productId, quantity);
                    
                    if (orderId == -1) 
                    {
                        response.sendRedirect(request.getContextPath() + "/cart?error=stock");
                        return;
                    }

                    dao.removeFromCart(cartItemId);
                    response.sendRedirect(request.getContextPath() + "/cart?success=bought");
                    return;
                }

                if (request.getParameter("remove") != null) 
                {
                    int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
                    dao.removeFromCart(cartItemId);
                    response.sendRedirect(request.getContextPath() + "/cart?success=removed");
                    return;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/cart?error=general");
        }
	}

}
