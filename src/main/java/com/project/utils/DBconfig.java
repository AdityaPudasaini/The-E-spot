package com.project.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconfig {
	private static final String URL = "jdbc:mysql://localhost:3306/the_e_spot";
	private static final String USER = "root";
    private static final String PASSWORD = "";
    
<<<<<<< HEAD
    
=======
>>>>>>> a438b32c1e5392544b324168b7c11f9b11fdb41d
    public static Connection getConnection() {

        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(URL, USER, PASSWORD);

            System.out.println("✅ Connected to DB");

        } catch (Exception e) {
            System.out.println("❌ DB Connection Failed");
            e.printStackTrace();
        }

        return conn;
    }
}
