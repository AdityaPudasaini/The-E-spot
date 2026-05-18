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

            

            ArrayList<AdminFlaggedModel> pagedItems = new ArrayList<>(allItems.subList(startFrom, endWith));

            request.setAttribute("flaggedItems", pagedItems);
            request.setAttribute("currentPageInFlagged", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("selectedSearch", selectedSearch);
            request.setAttribute("totalFlagged", adminFlaggedDao.totalFlagged());

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
		
		doGet(request, response);
	}

}
