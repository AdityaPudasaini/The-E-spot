package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.dao.AdminUserDAO;
import com.model.AdminUserModel;

/**
 * Servlet implementation class users
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/users" })
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
            AdminUserDAO adminUserDao = new AdminUserDAO();



            ArrayList<AdminUserModel> pagedUsers = new ArrayList<>(allUsers.subList(startFrom, endWith));

            request.setAttribute("users", pagedUsers);
            request.setAttribute("currentPageInUsers", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("selectedStatus", selectedStatus);
            request.setAttribute("selectedSearch", selectedSearch);

        } 
		
		catch (Exception e) {
            e.printStackTrace();
        }
		
		request.setAttribute("currentPage", "users");
		request.getRequestDispatcher("/WEB-INF/pages/users.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
