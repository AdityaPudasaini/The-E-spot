package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.dao.EditProfileDAO;
import com.dao.MemberDAO;
import com.model.MemberModel;
import com.utils.FileUploadUtil;

/**
 * Servlet implementation class EditProfileServlet
 */
@WebServlet("/editProfile")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,
	    maxFileSize = 1024 * 1024 * 10,
	    maxRequestSize = 1024 * 1024 * 50
	)
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final String UPLOAD_DIR = System.getProperty("user.home") + File.separator + "webapp_uploads";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
        int memberId = (int) session.getAttribute("memberId");

        try {
        	
            MemberDAO memberDAO = new MemberDAO();
            MemberModel member = memberDAO.getMemberRecordById(memberId);
            request.setAttribute("member", member);
            
        } 
        
        catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("currentPage", "editProfile");
        request.getRequestDispatcher("/WEB-INF/pages/editProfile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
        int memberId = (int) session.getAttribute("memberId");

        String action = request.getParameter("action");

        try {
            EditProfileDAO editProfileDAO = new EditProfileDAO();

            if (action != null && action.equals("changePassword")) 
            {
                String currentPassword = request.getParameter("currentPassword");
                String newPassword = request.getParameter("newPassword");
                String confirmPassword = request.getParameter("confirmPassword");

                if (!newPassword.equals(confirmPassword)) 
                {
                    request.setAttribute("passwordError", "New passwords do not match.");
                    doGet(request, response);
                    return;
                }

                if (newPassword.length() < 8) 
                {
                    request.setAttribute("passwordError", "Password must be at least 8 characters.");
                    doGet(request, response);
                    return;
                }

                if (!editProfileDAO.checkCurrentPassword(memberId, currentPassword)) 
                {
                    request.setAttribute("passwordError", "Current password is incorrect.");
                    doGet(request, response);
                    return;
                }

                editProfileDAO.updatePassword(memberId, newPassword);
                
                response.sendRedirect(request.getContextPath() + "/editProfile?success=password");
                return;
            }

            
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String dob = request.getParameter("dob");

            if (name == null || name.trim().isEmpty() || email == null || email.trim().isEmpty() || phone == null || phone.trim().isEmpty() || dob == null || dob.trim().isEmpty()) 
            {
                request.setAttribute("profileError", "Please fill in all fields.");
                doGet(request, response);
                return;
            }

            if (editProfileDAO.isEmailTaken(memberId, email)) 
            {
                request.setAttribute("profileError", "Email is already in use by another account.");
                doGet(request, response);
                return;
            }

            if (editProfileDAO.isPhoneTaken(memberId, phone)) 
            {
                request.setAttribute("profileError", "Phone number is already in use by another account.");
                doGet(request, response);
                return;
            }

            editProfileDAO.updateProfile(memberId, name, email, phone, dob);

            Part filePart = request.getPart("profileImage");
            
            if (filePart != null && filePart.getSize() > 0) 
            {
                String extension = FileUploadUtil.getFileExtension(filePart.getSubmittedFileName());
                String fileName = (String) session.getAttribute("username") + extension;
                FileUploadUtil.saveFile(filePart, UPLOAD_DIR, fileName);
            }

            session.setAttribute("firstName", name.split(" ")[0]);

            response.sendRedirect(request.getContextPath() + "/editProfile?success=profile");

        } 
        
        catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("profileError", "Something went wrong. Please try again.");
            doGet(request, response);
        }
	}

}
