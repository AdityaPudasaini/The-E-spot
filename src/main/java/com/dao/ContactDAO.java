// ContactDAO.java
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Types;
import com.utils.DBConfig;

public class ContactDAO {

    public void insertContact(String name, String email, String phone, String subject, String message) throws Exception {

        Connection con = DBConfig.getConnection();

        String sql = "INSERT INTO contacted (Name, Email, Phone, Subject, Message) VALUES (?, ?, ?, ?, ?)";

        PreparedStatement pst = con.prepareStatement(sql);
        
        pst.setString(1, name);
        pst.setString(2, email);

        if (phone == null || phone.isBlank()) 
        {
            pst.setNull(3, Types.VARCHAR);
        } 
        
        else {
            pst.setString(3, phone.trim());
        }

        pst.setString(4, subject);
        pst.setString(5, message);

        pst.executeUpdate();
        pst.close();
        con.close();
    }
}