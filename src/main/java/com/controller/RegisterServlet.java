package com.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;

import com.dao.MemberDAO;
import com.model.MemberModel;
import com.service.RegisterService;
import com.utils.CookieUtil;
import com.utils.FileUploadUtil;
import com.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;	
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,
	    maxFileSize = 1024 * 1024 * 10,
	    maxRequestSize = 1024 * 1024 * 50
	)

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = System.getProperty("user.home") + File.separator + "webapp_uploads";

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
		String name = request.getParameter("Name");
	    String username = request.getParameter("Username");
	    String dob = request.getParameter("DOB");
	    String email = request.getParameter("Email");
	    String number = request.getParameter("Phone");
	    String password = request.getParameter("Password");
	    String accountStatus = request.getParameter("accountStatus");
	    java.sql.Date currentDate = java.sql.Date.valueOf(LocalDate.now());
	    
	    RegisterService service = new RegisterService();
	    
	    String validationError = service.validateMember(name, username, dob, email, number, password);
	    
	    if (validationError != null) 
	    {
	        request.setAttribute("errorMessage", validationError);
	        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	        return;
	    }
	    
	    try {
	        service.addStudent(name, username, dob, email, number, password, currentDate, accountStatus);
	        
	        Part filePart = request.getPart("Photo");
	        
	        if (filePart != null && filePart.getSize() > 0) 
	        {
	            String extension = FileUploadUtil.getFileExtension(filePart.getSubmittedFileName());
	            String fileName = username + extension;
	            FileUploadUtil.saveFile(filePart, UPLOAD_DIR, fileName);
	        }
	        
	        MemberDAO memberDAO = new MemberDAO();
	        MemberModel newMember = memberDAO.getMemberRecordByUsername(username);

	        SessionUtil.setAttribute(request, "memberId", newMember.getMemberId(), 60 * 30);
	        SessionUtil.setAttribute(request, "username", username, 60 * 30);
	        SessionUtil.setAttribute(request, "firstName", newMember.getName().split(" ")[0], 60 * 30);
	        CookieUtil.addCookie(response, "username", username, 60 * 60 * 24 * 30);

	        response.sendRedirect(request.getContextPath() + "/memberDashboard");
	    } 
	    
	    catch (Exception e) 
	    {
	        e.printStackTrace();
	        request.setAttribute("errorMessage", e.getMessage());
	        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	    }
	}
}
