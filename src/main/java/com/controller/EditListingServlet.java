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

import com.dao.EditListingDAO;
import com.model.CategoryModel;
import com.model.ProductListingModel;
import com.service.EditListingService;
import com.utils.FileUploadUtil;

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
		    productIdParam = request.getParameter("productId");
		}

		if (productIdParam == null || productIdParam.isEmpty()) 
		{
		    response.sendRedirect(request.getContextPath() + "/myProducts");
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

        request.setAttribute("currentPage", "MyProduct");
        request.getRequestDispatcher("/WEB-INF/pages/editListing.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String productIdParam = request.getParameter("productId");

        if (productIdParam == null || productIdParam.isEmpty()) 
        {
            response.sendRedirect(request.getContextPath() + "/userOwn");
            return;
        }

        int productId = Integer.parseInt(productIdParam);

        try {
        	
            String productName = request.getParameter("productName");
            String productDescription = request.getParameter("productDescription");
            String productPrice = request.getParameter("productPrice");
            String stockQuantity = request.getParameter("stockQuantity");
            String categoryId = request.getParameter("categoryId");

            EditListingService editListingService = new EditListingService();
            String status = editListingService.validate(productName, productDescription, productPrice, stockQuantity, categoryId);

            if (!status.equals("Success")) 
            {
                request.setAttribute("errorMessage", status);
                doGet(request, response);
                return;
            }

            editListingService.updateListing(productId, productName, productDescription, Double.parseDouble(productPrice), Integer.parseInt(stockQuantity), Integer.parseInt(categoryId));

            Part filePart = request.getPart("productImage");

            if (filePart != null && filePart.getSize() > 0) 
            {
                String extension = FileUploadUtil.getFileExtension(filePart.getSubmittedFileName());
                String fileName = "product" + productId + extension;
                FileUploadUtil.saveFile(filePart, UPLOAD_DIR, fileName);
            }

            response.sendRedirect(request.getContextPath() + "/userOwn?success=edited");

        } 
        
        catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
            doGet(request, response);
        }
	}

}
