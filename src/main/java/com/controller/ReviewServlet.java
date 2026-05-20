package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.ReviewDAO;

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet("/review")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewServlet() {
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
        
        String ratingParam = request.getParameter("rating");
        
        String comment = request.getParameter("comment");

        if (productIdParam == null || ratingParam == null || comment == null || comment.trim().isEmpty()) 
        {
            response.sendRedirect(request.getContextPath() + "/UserListing");
            return;
        }

        int productId = Integer.parseInt(productIdParam);
        int rating = Integer.parseInt(ratingParam);

        if (comment.length() > 300) {
            comment = comment.substring(0, 300);
        }

        try {
            ReviewDAO dao = new ReviewDAO();

            if (dao.hasAlreadyReviewed(memberId, productId)) 
            {
                response.sendRedirect(request.getContextPath() + "/viewListing?id=" + productId + "&error=reviewed");
                return;
            }

            dao.addReview(memberId, productId, rating, comment.trim());
            response.sendRedirect(request.getContextPath() + "/viewListing?id=" + productId + "&success=review");

        } 
        
        catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/viewListing?id=" + productId + "&error=general");
        }
	}

}
