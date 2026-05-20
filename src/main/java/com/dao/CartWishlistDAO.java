package com.dao;

import com.model.CartModel;
import com.model.WishlistModel;
import com.utils.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CartWishlistDAO {

    private int getCartId(int memberId) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT Cart_ID FROM cart WHERE Member_ID = ?";
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        pst.setInt(1, memberId);

        ResultSet rs = pst.executeQuery();

        int cartId = -1;

        if (rs.next()) {
            cartId = rs.getInt("Cart_ID");
        }

        rs.close();
        pst.close();
        conn.close();

        return cartId;
    }

    private int createCart(int memberId) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "INSERT INTO cart (Member_ID, Created_At) VALUES (?, NOW())";
        PreparedStatement pst = conn.prepareStatement(
                sqlCode,
                PreparedStatement.RETURN_GENERATED_KEYS
        );

        pst.setInt(1, memberId);
        pst.executeUpdate();

        ResultSet keys = pst.getGeneratedKeys();

        int cartId = 0;

        if (keys.next()) {
            cartId = keys.getInt(1);
        }

        keys.close();
        pst.close();
        conn.close();

        return cartId;
    }

    private int getCartItemId(int cartId, int productId) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT Cart_Items_ID FROM cart_items WHERE Cart_ID = ? AND Product_ID = ?";
        PreparedStatement pst = conn.prepareStatement(sqlCode);

        pst.setInt(1, cartId);
        pst.setInt(2, productId);

        ResultSet rs = pst.executeQuery();

        int itemId = -1;

        if (rs.next()) {
            itemId = rs.getInt("Cart_Items_ID");
        }

        rs.close();
        pst.close();
        conn.close();

        return itemId;
    }

    private int getCartItemQuantity(int cartItemId) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT Cart_Quantity FROM cart_items WHERE Cart_Items_ID = ?";
        PreparedStatement pst = conn.prepareStatement(sqlCode);

        pst.setInt(1, cartItemId);

        ResultSet rs = pst.executeQuery();

        int qty = 0;

        if (rs.next()) {
            qty = rs.getInt("Cart_Quantity");
        }

        rs.close();
        pst.close();
        conn.close();

        return qty;
    }

    private void updateCartItemQuantity(int cartItemId, int newQuantity) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "UPDATE cart_items SET Cart_Quantity = ? WHERE Cart_Items_ID = ?";
        PreparedStatement pst = conn.prepareStatement(sqlCode);

        pst.setInt(1, newQuantity);
        pst.setInt(2, cartItemId);

        pst.executeUpdate();

        pst.close();
        conn.close();
    }

    private void insertCartItem(int cartId, int productId, int quantity) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "INSERT INTO cart_items (Product_ID, Cart_ID, Cart_Quantity) VALUES (?, ?, ?)";
        PreparedStatement pst = conn.prepareStatement(sqlCode);

        pst.setInt(1, productId);
        pst.setInt(2, cartId);
        pst.setInt(3, quantity);

        pst.executeUpdate();

        pst.close();
        conn.close();
    }

    public void addToCart(int memberId, int productId, int quantity) throws SQLException {
        int cartId = getCartId(memberId);

        if (cartId == -1) {
            cartId = createCart(memberId);
        }

        int cartItemId = getCartItemId(cartId, productId);

        if (cartItemId == -1) {
            insertCartItem(cartId, productId, quantity);
        } else {
            int existingQty = getCartItemQuantity(cartItemId);
            updateCartItemQuantity(cartItemId, existingQty + quantity);
        }
    }

    private int getWishlistId(int memberId) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT Wishlist_ID FROM wishlist WHERE Member_ID = ?";
        PreparedStatement pst = conn.prepareStatement(sqlCode);

        pst.setInt(1, memberId);

        ResultSet rs = pst.executeQuery();

        int wishlistId = -1;

        if (rs.next()) {
            wishlistId = rs.getInt("Wishlist_ID");
        }

        rs.close();
        pst.close();
        conn.close();

        return wishlistId;
    }

    private int createWishlist(int memberId) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "INSERT INTO wishlist (Member_ID, Created_At) VALUES (?, NOW())";
        PreparedStatement pst = conn.prepareStatement(
                sqlCode,
                PreparedStatement.RETURN_GENERATED_KEYS
        );

        pst.setInt(1, memberId);
        pst.executeUpdate();

        ResultSet keys = pst.getGeneratedKeys();

        int wishlistId = 0;

        if (keys.next()) {
            wishlistId = keys.getInt(1);
        }

        keys.close();
        pst.close();
        conn.close();

        return wishlistId;
    }

    private boolean wishlistItemExists(int wishlistId, int productId) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT Wishlist_Item_ID FROM wishlist_item WHERE Wishlist_ID = ? AND Product_ID = ?";
        PreparedStatement pst = conn.prepareStatement(sqlCode);

        pst.setInt(1, wishlistId);
        pst.setInt(2, productId);

        ResultSet rs = pst.executeQuery();

        boolean exists = rs.next();

        rs.close();
        pst.close();
        conn.close();

        return exists;
    }

    private void insertWishlistItem(int wishlistId, int productId) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "INSERT INTO wishlist_item (Wishlist_ID, Product_ID, Added_Date) VALUES (?, ?, NOW())";
        PreparedStatement pst = conn.prepareStatement(sqlCode);

        pst.setInt(1, wishlistId);
        pst.setInt(2, productId);

        pst.executeUpdate();

        pst.close();
        conn.close();
    }

    public void addToWishlist(int memberId, int productId) throws SQLException {
        int wishlistId = getWishlistId(memberId);

        if (wishlistId == -1) {
            wishlistId = createWishlist(memberId);
        }

        if (!wishlistItemExists(wishlistId, productId)) {
            insertWishlistItem(wishlistId, productId);
        }
    }

    private double getProductPrice(int productId) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT Product_Price FROM product WHERE Product_ID = ?";
        PreparedStatement pst = conn.prepareStatement(sqlCode);

        pst.setInt(1, productId);

        ResultSet rs = pst.executeQuery();

        double price = 0;

        if (rs.next()) {
            price = rs.getDouble("Product_Price");
        }

        rs.close();
        pst.close();
        conn.close();

        return price;
    }

    private int getProductStock(int productId) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT Stock_Quantity FROM product WHERE Product_ID = ?";
        PreparedStatement pst = conn.prepareStatement(sqlCode);

        pst.setInt(1, productId);

        ResultSet rs = pst.executeQuery();

        int stock = 0;

        if (rs.next()) {
            stock = rs.getInt("Stock_Quantity");
        }

        rs.close();
        pst.close();
        conn.close();

        return stock;
    }

    private int createOrder(int memberId) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "INSERT INTO `order` (Member_ID, Order_Date, Order_Status) VALUES (?, NOW(), 'Pending')";
        PreparedStatement pst = conn.prepareStatement(
                sqlCode,
                PreparedStatement.RETURN_GENERATED_KEYS
        );

        pst.setInt(1, memberId);
        pst.executeUpdate();

        ResultSet keys = pst.getGeneratedKeys();

        int orderId = 0;

        if (keys.next()) {
            orderId = keys.getInt(1);
        }

        keys.close();
        pst.close();
        conn.close();

        return orderId;
    }

    private void insertOrderItem(int orderId, int productId, int quantity, double price) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "INSERT INTO order_item (Order_ID, Product_ID, Item_Quantity, Item_Price) VALUES (?, ?, ?, ?)";
        PreparedStatement pst = conn.prepareStatement(sqlCode);

        pst.setInt(1, orderId);
        pst.setInt(2, productId);
        pst.setInt(3, quantity);
        pst.setDouble(4, price);

        pst.executeUpdate();

        pst.close();
        conn.close();
    }

    private void reduceStock(int productId, int quantity) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "UPDATE product SET Stock_Quantity = Stock_Quantity - ? WHERE Product_ID = ?";
        PreparedStatement pst = conn.prepareStatement(sqlCode);

        pst.setInt(1, quantity);
        pst.setInt(2, productId);

        pst.executeUpdate();

        pst.close();
        conn.close();
    }

    public int buyNow(int memberId, int productId, int quantity) throws SQLException {
        int stock = getProductStock(productId);

        if (stock < quantity) {
            return -1;
        }

        double price = getProductPrice(productId);

        int orderId = createOrder(memberId);

        insertOrderItem(orderId, productId, quantity, price);

        reduceStock(productId, quantity);

        return orderId;
    }
    
    public ArrayList<CartModel> getCartItems(int memberId) throws SQLException {
    	
        ArrayList<CartModel> items = new ArrayList<>();

        int cartId = getCartId(memberId);

        if (cartId == -1) 
        {
            return items;
        }

        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "SELECT ci.Cart_Items_ID, ci.Cart_Quantity, p.Product_ID, p.Product_Name, p.Product_Price, c.Category_Name FROM cart_items ci JOIN product p ON ci.Product_ID = p.Product_ID JOIN category c ON p.Category_ID = c.Category_ID WHERE ci.Cart_ID = ? ORDER BY ci.Cart_Items_ID DESC";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        
        pst.setInt(1, cartId);
        
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            CartModel item = new CartModel();
            item.setCartItemId(rs.getInt("Cart_Items_ID"));
            item.setProductId(rs.getInt("Product_ID"));
            item.setProductName(rs.getString("Product_Name"));
            item.setCategoryName(rs.getString("Category_Name"));
            item.setProductPrice(rs.getDouble("Product_Price"));
            item.setQuantity(rs.getInt("Cart_Quantity"));
            item.setTotalPrice(rs.getDouble("Product_Price") * rs.getInt("Cart_Quantity"));
            items.add(item);
        }

        rs.close();
        pst.close();
        conn.close();
        
        return items;
    }

    public void removeFromCart(int cartItemId) throws SQLException {
    	
        Connection conn = DBConfig.getConnection();
        
        String sqlCode = "DELETE FROM cart_items WHERE Cart_Items_ID = ?";
        
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        
        pst.setInt(1, cartItemId);
        pst.executeUpdate();
        
        pst.close();
        conn.close();
    }
    
    public ArrayList<WishlistModel> getWishlistItems(int memberId) throws SQLException {
        ArrayList<WishlistModel> items = new ArrayList<>();

        int wishlistId = getWishlistId(memberId);

        if (wishlistId == -1) {
            return items;
        }

        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT wi.Wishlist_Item_ID, p.Product_ID, p.Product_Name, p.Product_Price, c.Category_Name FROM wishlist_item wi JOIN product p ON wi.Product_ID = p.Product_ID JOIN category c ON p.Category_ID = c.Category_ID WHERE wi.Wishlist_ID = ? ORDER BY wi.Wishlist_Item_ID DESC";

        PreparedStatement pst = conn.prepareStatement(sqlCode);
        pst.setInt(1, wishlistId);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            WishlistModel item = new WishlistModel();
            item.setWishlistItemId(rs.getInt("Wishlist_Item_ID"));
            item.setProductId(rs.getInt("Product_ID"));
            item.setProductName(rs.getString("Product_Name"));
            item.setCategoryName(rs.getString("Category_Name"));
            item.setProductPrice(rs.getDouble("Product_Price"));
            items.add(item);
        }

        rs.close();
        pst.close();
        conn.close();

        return items;
    }

    public void removeFromWishlist(int wishlistItemId) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "DELETE FROM wishlist_item WHERE Wishlist_Item_ID = ?";
        PreparedStatement pst = conn.prepareStatement(sqlCode);
        pst.setInt(1, wishlistItemId);
        pst.executeUpdate();

        pst.close();
        conn.close();
    }
}