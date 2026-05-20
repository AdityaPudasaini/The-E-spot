package com.service;

import com.dao.EditListingDAO;

public class EditListingService {

    EditListingDAO editListingDao = new EditListingDAO();

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

        if (Integer.parseInt(stockQuantity) < 0) 
        {
            return "Stock quantity cannot be negative.";
        }

        return "Success";
    }

    public void updateListing(int productId, String productName, String productDescription, double productPrice, int stockQuantity, int categoryId) throws Exception {
        editListingDao.updateListing(productId, productName, productDescription, productPrice, stockQuantity, categoryId);
    }
}