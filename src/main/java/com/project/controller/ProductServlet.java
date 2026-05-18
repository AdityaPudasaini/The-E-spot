package com.project.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.project.dao.ProductDAO;
import com.project.model.ProductModel;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/product")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductDAO dao = new ProductDAO();
        
		try {
			List<ProductModel> products;
			products = dao.getAllProducts();
			request.setAttribute("products", products);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        request.getRequestDispatcher("/WEB-INF/Product.jsp").forward(request, response);
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String productName    = request.getParameter("name");
		int categoryId = Integer.parseInt(request.getParameter("category"));
		
        String condition      = request.getParameter("condition");
        String originalPrice  = request.getParameter("originalPrice");
        String sellingPrice   = request.getParameter("sellingPrice");
        String imageUrl       = request.getParameter("imageUrl");
        String description    = request.getParameter("description");

        // Get seller ID from session
        
        int sellerId = 1;

        // Build model
        ProductModel product = new ProductModel();
        product.setProductName(productName);
        product.setProductDescription(description);
        product.setProductPrice(Double.parseDouble(sellingPrice));
        product.setSellerId(sellerId);
        product.setActiveStatus("active");
        product.setCategoryId(categoryId);

        // Save to database
        ProductDAO dao = new ProductDAO();
        boolean success = dao.addProduct(product);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/product");
        } else {
            request.setAttribute("error", "Failed to add product. Please try again.");
            request.getRequestDispatcher("/WEB-INF/Product.jsp").forward(request, response);
        }
	}

}
