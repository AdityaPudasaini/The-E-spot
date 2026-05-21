package com.dao;

import com.utils.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReviewDAO {

    public boolean hasAlreadyReviewed(int memberId, int productId) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode = "SELECT Review_ID FROM review WHERE Member_ID = ? AND Product_ID = ?";
        PreparedStatement pst = conn.prepareStatement(sqlCode);

        pst.setInt(1, memberId);
        pst.setInt(2, productId);

        ResultSet rs = pst.executeQuery();

        boolean exists = rs.next();

        rs.close();
        pst.close();
        conn.close();

        return exists;
    }

    public void addReview(int memberId, int productId, int rating, String comment) throws SQLException {
        Connection conn = DBConfig.getConnection();

        String sqlCode =
                "INSERT INTO review (Product_ID, Member_ID, Review_Rating, Review_Comment, Review_Date) " +
                "VALUES (?, ?, ?, ?, NOW())";

        PreparedStatement pst = conn.prepareStatement(sqlCode);

        pst.setInt(1, productId);
        pst.setInt(2, memberId);
        pst.setInt(3, rating);
        pst.setString(4, comment);

        pst.executeUpdate();

        pst.close();
        conn.close();
    }
}