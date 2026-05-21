package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.service.ContactService;

/**
 * Servlet implementation class ContactUsServlet
 */
@WebServlet("/ContactUs")
public class ContactUsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactUsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("currentPage", "Contact");
		request.getRequestDispatcher("/WEB-INF/pages/contactUs.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        int memberId = (int) request.getSession().getAttribute("memberId");

        ContactService service = new ContactService();

        try {
            String validationError = service.validateContact(memberId, name, email, phone, subject, message);

            if (validationError != null) 
            {
                request.setAttribute("errorMessage", validationError);
				request.setAttribute("currentPage", "Contact");
                request.getRequestDispatcher("/WEB-INF/pages/contactUs.jsp").forward(request, response);
                return;
            }

            service.submitContact(name, email, phone, subject, message);
            request.setAttribute("successMessage", "Thank you! Your message has been sent. We'll get back to you within 24 hours.");
            request.setAttribute("currentPage", "Contact");
            request.getRequestDispatcher("/WEB-INF/pages/contactUs.jsp").forward(request, response);
        }

        catch (Exception e) 
        {
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
            request.setAttribute("currentPage", "Contact");
            request.getRequestDispatcher("/WEB-INF/pages/contactUs.jsp").forward(request, response);
        }
	}

}
