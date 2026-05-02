package com.controller;

import java.io.IOException;
import java.time.LocalDate;

import com.service.RegisterService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;	
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public RegisterServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
            // Fetch Form data
            String name = request.getParameter("Name");
            String username = request.getParameter("Username");
            String dob = request.getParameter("DOB");
            String email = request.getParameter("Email");
            String number = request.getParameter("Phone");
            String password = request.getParameter("Password");
            LocalDate createdDate = LocalDate.now();
            java.sql.Date currentDate = java.sql.Date.valueOf(createdDate);
            String accountStatus = request.getParameter("accountStatus");
            
            
            if( ( name != null ) && ( dob != null ) && ( username != null )) {
	            
            	if(email.endsWith("@gmail.com")) {
            		
	            	if( (number.startsWith("98")) && (number.length() == 10) ) {
	            		
	            		if( password.length() >=10 ) {
	            			
	            			RegisterService service = new RegisterService();
	                        service.addStudent(name, username, dob, email, number, password, currentDate, accountStatus);
	            			response.sendRedirect(request.getContextPath() + "/dashboard");
	            		}
	            		
	            		else {
	            			request.setAttribute("errorMessage", "Invalid password. Needs to be at least 10 characters long!");
	            			request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	            			return;
	            		}
	            	}
	            	
	            	else {
	            		request.setAttribute("errorMessage", "Invalid phone number!");
	            		request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	                    return;
	            	}
	            }
	            
	            else {
	            	request.setAttribute("errorMessage", "Invalid email address!");
	            	request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	                return;
	            }
            }
            
            else {
            	request.setAttribute("errorMessage", "Fill up all the credenttials.");
            	request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
                return;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
	}
}
