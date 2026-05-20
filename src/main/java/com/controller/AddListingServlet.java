package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import com.dao.AddListingDAO;
import com.model.CategoryModel;
import com.service.AddListingService;
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
	private static final String UPLOAD_DIR = System.getProperty("user.home") + File.separator + "webapp_uploads";
       
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

	        AddListingService addListingService = new AddListingService();
	        
	        String status = addListingService.validate(productName, productDescription, productPrice, stockQuantity, categoryId);

	        if (!status.equals("Success")) 
	        {
	            request.setAttribute("errorMessage", status);

	            if (status.contains("name")) 
	            {
	            	request.setAttribute("productNameError", true);
	            }
	            
	            else if (status.contains("Price") || status.contains("price")) 
	            {
	            	request.setAttribute("productPriceError", true);
	            }
	            
	            else if (status.contains("Stock") || status.contains("stock")) 
	            {
	            	request.setAttribute("stockQuantityError", true);
	            }

	            doGet(request, response);
	            
	            return;
	        }

	        int productId = addListingService.addListing(productName, productDescription, Double.parseDouble(productPrice), Integer.parseInt(stockQuantity), Integer.parseInt(categoryId), sellerUsername);

	        Part filePart = request.getPart("productImage");
	        
	        if (filePart != null && filePart.getSize() > 0) 
	        {
	            String extension = FileUploadUtil.getFileExtension(filePart.getSubmittedFileName());
	            String fileName = "product" + productId + extension;
	            FileUploadUtil.saveFile(filePart, UPLOAD_DIR, fileName);
	        }

	        response.sendRedirect(request.getContextPath() + "/UserListing");

	    } 
		
		catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("errorMessage", e.getMessage());
	        doGet(request, response);
	    }
	}

}
