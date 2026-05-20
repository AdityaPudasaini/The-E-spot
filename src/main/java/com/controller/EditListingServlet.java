package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.dao.EditListingDAO;
import com.model.CategoryModel;
import com.model.ProductListingModel;

/**
 * Servlet implementation class EditListingServlet
 */
@WebServlet("/editListing")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,
	    maxFileSize = 1024 * 1024 * 10,
	    maxRequestSize = 1024 * 1024 * 50
	)
public class EditListingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = System.getProperty("user.home") + File.separator + "webapp_uploads";

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditListingServlet() {
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
            response.sendRedirect(request.getContextPath() + "/userOwn");
            return;
        }

        int productId = Integer.parseInt(productIdParam);

        try {
            EditListingDAO editListingDao = new EditListingDAO();
            ProductListingModel product = editListingDao.getProductById(productId);

            if (product == null) 
            {
                response.sendRedirect(request.getContextPath() + "/userOwn");
                return;
            }

            ArrayList<CategoryModel> categories = editListingDao.getCategories();
            
            request.setAttribute("product", product);
            request.setAttribute("categories", categories);
        } 
        
        catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("currentPage", "Product");
        request.getRequestDispatcher("/WEB-INF/pages/editListing.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
