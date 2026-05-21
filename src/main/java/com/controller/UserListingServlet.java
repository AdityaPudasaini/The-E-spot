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
		try {
			
			String selectedCategory = "";
			String searched = "";
			
            ProductListingDAO dao = new ProductListingDAO();
            
            ArrayList<ProductListingModel> listings = dao.getAllListings(searched, selectedCategory);
            
            ArrayList<String> categories = dao.getAllCategories();
            
            request.setAttribute("listings", listings);
            request.setAttribute("categories", categories);
            request.setAttribute("searchVal", searched);
            request.setAttribute("categoryVal", selectedCategory);
        } 
        
        catch (Exception e) {
            e.printStackTrace();
        }
		
        request.setAttribute("currentPage", "Product");
        request.getRequestDispatcher("/WEB-INF/pages/userslisting.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String selectedCategory = request.getParameter("category");
		String searched = request.getParameter("search");

		if (selectedCategory == null) 
		{ 
			selectedCategory = ""; 
		}
		
		if (searched == null) 
		{ 
			searched = ""; 
		}

		request.setAttribute("selectedCategory", selectedCategory);
		request.setAttribute("selectedSearch", searched);

        try {
            ProductListingDAO dao = new ProductListingDAO();
            
            ArrayList<ProductListingModel> listings = dao.getAllListings(searched, selectedCategory);
            
            ArrayList<String> categories = dao.getAllCategories();
            
            request.setAttribute("listings", listings);
            request.setAttribute("categories", categories);
            request.setAttribute("searchVal", searched);
            request.setAttribute("categoryVal", selectedCategory);
        } 
        
        catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("currentPage", "Product");
        request.getRequestDispatcher("/WEB-INF/pages/userslisting.jsp").forward(request, response);
	}

}
