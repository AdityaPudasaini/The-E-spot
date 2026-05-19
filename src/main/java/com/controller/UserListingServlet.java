package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.dao.ProductListingDAO;
import com.model.ProductListingModel;

/**
 * Servlet implementation class UserListingServlet
 */
@WebServlet("/UserListing")
public class UserListingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserListingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String search = request.getParameter("search");
        String category = request.getParameter("category");

        if (search == null) 
        { 
        	search = ""; 
        }
        
        if (category == null) 
        {
        	category = ""; 
        }

        try {
            ProductListingDAO dao = new ProductListingDAO();
            
            ArrayList<ProductListingModel> listings = dao.getAllListings(search, category);
            
            ArrayList<String> categories = dao.getAllCategories();
            
            request.setAttribute("listings", listings);
            request.setAttribute("categories", categories);
            request.setAttribute("searchVal", search);
            request.setAttribute("categoryVal", category);
        } 
        
        catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("currentPage", "listing");
        request.getRequestDispatcher("/WEB-INF/pages/listing.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
