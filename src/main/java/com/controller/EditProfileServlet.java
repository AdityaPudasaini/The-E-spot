package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.MemberDAO;
import com.model.MemberModel;

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
		doGet(request, response);
	}

}
