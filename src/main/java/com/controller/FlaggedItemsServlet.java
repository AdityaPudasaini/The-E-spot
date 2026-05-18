package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.dao.AdminFlaggedDAO;
import com.model.AdminFlaggedModel;

/**
 * Servlet implementation class FlaggedItemsServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/flagged" })
public class FlaggedItemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FlaggedItemsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
            AdminFlaggedDAO adminFlaggedDao = new AdminFlaggedDAO();

            String selectedStatus = request.getParameter("status");
            String selectedSearch = request.getParameter("search");

            if (selectedStatus == null) {
            	selectedStatus = "";
            }
            
            if (selectedSearch == null) {
            	selectedSearch = "";
            }

            int pageSize = 10;
            int page = 1;

            String pageString = request.getParameter("page");
            
            if (pageString != null && !pageString.isEmpty()) 
            {
                page = Integer.parseInt(pageString);
            }

            ArrayList<AdminFlaggedModel> allItems = adminFlaggedDao.allFlaggedItems(selectedStatus, selectedSearch);

            int totalCount = allItems.size();
            int totalPages = (totalCount + pageSize - 1) / pageSize;

            int startFrom = (page - 1) * pageSize;
            int endWith;

            if (startFrom + pageSize > totalCount) 
            {
                endWith = totalCount;
            } 
            
            else 
            {
                endWith = startFrom + pageSize;
            }

            ArrayList<AdminFlaggedModel> pagedItems = new ArrayList<>(allItems.subList(startFrom, endWith));

            request.setAttribute("flaggedItems", pagedItems);
            request.setAttribute("currentPageInFlagged", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("selectedStatus", selectedStatus);
            request.setAttribute("selectedSearch", selectedSearch);
            request.setAttribute("totalFlagged", adminFlaggedDao.totalFlagged());
            request.setAttribute("underReview", adminFlaggedDao.underReview());
            request.setAttribute("resolved", adminFlaggedDao.resolved());
            request.setAttribute("dismissed", adminFlaggedDao.dismissed());

        } 
		
		catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("currentPage", "flagged");
        request.getRequestDispatcher("/WEB-INF/pages/flaggedItems.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		AdminFlaggedDAO adminFlaggedDao = new AdminFlaggedDAO();

	    String flagIdString = request.getParameter("flagId");

	    if (flagIdString != null && !flagIdString.isEmpty()) 
	    {
	        int flagId = Integer.parseInt(flagIdString);

	        try {
	        	
	            if (request.getParameter("remove") != null) 
	            {
	                adminFlaggedDao.removeItem(flagId);
	            } 
	            
	            else if (request.getParameter("unflag") != null) 
	            {
	                adminFlaggedDao.unflagItem(flagId);
	            }
	            
	        } 
	        
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    response.sendRedirect(request.getContextPath() + "/flagged");
	}

}
