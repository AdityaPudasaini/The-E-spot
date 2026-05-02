package com.controller;

import java.io.IOException;


import com.service.LoginService;
import com.utils.CookieUtil;
import com.utils.SessionUtil;
import com.dao.AdminDAO;
import com.dao.MemberDAO;
import com.model.AdminModel;
import com.model.MemberModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;	
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("Email");
		String password = request.getParameter("Password");
		
		LoginService service= new LoginService();
        String status = service.authenticate(email, password);


        if ("Success".equals(status)) {
        	
        	MemberDAO memberDAO = new MemberDAO();
            MemberModel model;
            
			try {
				model = memberDAO.getMemberRecordByEmail(email);
				
				SessionUtil.setAttribute(request, "username", model.getUserName(), 60 * 30);
				
				CookieUtil.addCookie(response, "username", model.getUserName(), 60 * 60 * 24 * 30);
	            
	            response.sendRedirect(request.getContextPath() + "/memberDashboard");
			} 
			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        
        else if ("Admin".equals(status)) {

        	AdminDAO adminDAO = new AdminDAO();
            AdminModel admin;
            
			try 
			{
				admin = adminDAO.getAdminRecord();
				
				SessionUtil.setAttribute(request, "username", admin.getUserName(), 60 * 30);
				
				CookieUtil.addCookie(response, "username", admin.getUserName(), 60 * 60 * 24 * 30);
	            
	            response.sendRedirect(request.getContextPath() + "/dashboard");
				
			} 
			
			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
        }
        
        else {
            // Set error and forward it to login page
        	request.setAttribute("error", status);
            request.setAttribute("typedUser", email); // To keep the username in the box
            request.setAttribute("errorMessage", "Invalid login credentials.");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            

        }
        
	}

}