package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.ArrayList;

import com.utils.FileUploadUtil;

/**
 * Servlet implementation class AddListingServlet
 */
@WebServlet("/addListing")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,
	    maxFileSize = 1024 * 1024 * 10,
	    maxRequestSize = 1024 * 1024 * 50
	)

public class AddListingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddListingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
            AddListingDAO addListingDao = new AddListingDAO();
            
            ArrayList<CategoryModel> categories = addListingDao.getCategories();
            
            request.setAttribute("categories", categories);
        } 
		
		catch (Exception e) {
            e.printStackTrace();
        }
 
        request.setAttribute("currentPage", "Product");
        request.getRequestDispatcher("/WEB-INF/pages/addListing.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
            String productName = request.getParameter("productName");
            String productDescription = request.getParameter("productDescription");
            String productPrice = request.getParameter("productPrice");
            String stockQuantity = request.getParameter("stockQuantity");
            String categoryId = request.getParameter("categoryId");
            String sellerUsername = (String) request.getSession().getAttribute("username");
            
 
            if (productName == null || productName.trim().isEmpty() ||
                productDescription == null || productDescription.trim().isEmpty() ||
                productPrice == null || categoryId == null || categoryId.isEmpty()) {
                request.setAttribute("errorMessage", "Please fill in all fields.");
                doGet(request, response);
                return;
            }
            
 
            AddListingDAO addListingDao = new AddListingDAO();
            
            int productId = addListingDao.addListing(productName, productDescription, Double.parseDouble(productPrice), Integer.parseInt(stockQuantity), Integer.parseInt(categoryId), sellerUsername);
            
            Part filePart = request.getPart("Photo");
	        
	        if (filePart != null && filePart.getSize() > 0) 
	        {
	            String extension = FileUploadUtil.getFileExtension(filePart.getSubmittedFileName());
	            String fileName = "product" + productId;
	            FileUploadUtil.saveFile(filePart, UPLOAD_DIR, fileName);
	        }
 
            response.sendRedirect(request.getContextPath() + "/userDashboard");
 
        } 
		
		catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
            doGet(request, response);
        }
	}

}
