package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.dao.ProductDetailDAO;
import com.model.ProductListingModel;
import com.model.ReviewModel;

/**
 * Servlet implementation class ProductDetailServlet
 */
@WebServlet("/viewListing")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String productIdParam = request.getParameter("id");

        if (productIdParam == null || productIdParam.isEmpty()) 
        {
            response.sendRedirect(request.getContextPath() + "/listing");
            return;
        }

        int productId = Integer.parseInt(productIdParam);

        try {
            ProductDetailDAO dao = new ProductDetailDAO();

            ProductListingModel product = dao.getProductById(productId);

            if (product == null) 
            {
                response.sendRedirect(request.getContextPath() + "/UserListing");
                return;
            }

            ArrayList<ReviewModel> reviews = dao.getReviewsByProductId(productId);
            
            double avgRating = dao.getAverageRating(productId);
            int avgRatingRounded = (int) Math.round(avgRating);

            request.setAttribute("product", product);
            request.setAttribute("reviews", reviews);
            request.setAttribute("avgRating", avgRating);
            request.setAttribute("avgRatingRounded", avgRatingRounded);
            request.setAttribute("reviewCount", reviews.size());

        } 
        
        catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("currentPage", "MyProduct");
        request.getRequestDispatcher("/WEB-INF/pages/productDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
