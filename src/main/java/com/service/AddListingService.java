package com.service;

import com.dao.AddListingDAO;

public class AddListingService {

    AddListingDAO addListingDao = new AddListingDAO();

    public String validate(String productName, String productDescription, String productPrice, String stockQuantity, String categoryId) {

        if (productName == null || productName.trim().isEmpty() || productDescription == null || productDescription.trim().isEmpty() || productPrice == null || productPrice.trim().isEmpty() || stockQuantity == null || stockQuantity.trim().isEmpty() || categoryId == null || categoryId.trim().isEmpty()) 
        {
            return "Please fill in all fields.";
        }

        if (productName.trim().length() < 10) 
        {
            return "Product name must be at least 10 characters long.";
        }

        if (Double.parseDouble(productPrice) < 5.0) 
        {
            return "Price must be at least $5.00.";
        }

        if (Integer.parseInt(stockQuantity) < 1) 
        {
            return "Stock quantity must be at least 1.";
        }

        return "Success";
    }

    public int addListing(String productName, String productDescription, double productPrice, int stockQuantity, int categoryId, String sellerUsername) throws Exception {
        return addListingDao.addListing(productName, productDescription, productPrice, stockQuantity, categoryId, sellerUsername);
    }
}