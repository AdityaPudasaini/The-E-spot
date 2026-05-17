package com.controller;

import jakarta.servlet.ServletException;
import com.model.AdminListingModel;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.dao.AdminListingDAO;

/**
 * Servlet implementation class ListingServlet
 */
@WebServlet("/listing")
public class ListingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 try {
			 AdminListingDAO adminListingDao = new AdminListingDAO();
		        
		     int pageSize = 10;
		     int page = 1;
		     
		     String pageString= request.getParameter("page");
		     
		     if (pageString != null && !pageString.isEmpty()) {
		    	 page = Integer.parseInt(pageString);
		     }
		     
		     ArrayList<AdminListingModel> allListings = adminListingDao.allListings();
		     
		     int totalCount = allListings.size();
		     int totalPages = (totalCount + pageSize - 1) / pageSize;
		     
		     int startFrom = (page - 1) * pageSize;
		     int endWith;
		     
		     if (startFrom + pageSize > totalCount) {
		    	 endWith = totalCount;
		     } 
		        
		     else {
		    	 endWith = startFrom + pageSize;
		     }
		        
		     ArrayList<AdminListingModel> pagedListings = new ArrayList<>(allListings.subList(startFrom, endWith));
		        
		     request.setAttribute("listings", pagedListings);
		     request.setAttribute("categories", adminListingDao.categories());
		     request.setAttribute("currentPageInListing", page);
		     request.setAttribute("totalPages", totalPages);    
		 } 
		 
		 catch (Exception e) {
			 e.printStackTrace();
		 }
		    
		 request.setAttribute("currentPage", "listing");
		 request.getRequestDispatcher("/WEB-INF/pages/listings.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AdminListingDAO adminListingDao = new AdminListingDAO();
	    
	    String productIdString = request.getParameter("productId");
	    
	    
	    if (productIdString != null && !productIdString.isEmpty()) {
	    	
	        int productId = Integer.parseInt(productIdString);
	        
	        try {
	        	
	            if (request.getParameter("flag") != null) {
	                adminListingDao.flagProduct(productId);
	            } 
	            
	            else if (request.getParameter("keep") != null) {
	                adminListingDao.keepProduct(productId);
	            }
	            
	        } 
	        
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    response.sendRedirect(request.getContextPath() + "/listing");
	}

}
