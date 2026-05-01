package com.project.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.project.utils.FileUploadUtil;
import com.project.utils.SessionUtil;

/**
 * Servlet implementation class ImageUploadServlet
 */
@WebServlet("/upload-image")
@MultipartConfig
public class ImageUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String uploadPath = System.getProperty("user.home")+ File.separator+"webapp_uploads";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/Register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SessionUtil.getAttribute(user, "");
		Part filePart = request.getPart("image");
		String fileName = (filePart !=null)? filePart.getSubmittedFileName():null;
		String extension = FileUploadUtil.getFileExtension(fileName);
		
		String imagePath;
		
		if (fileName!=null && fileName.isEmpty()) {
			imagePath = uploadPath+fileName;
			
		}
		else {
			imagePath = uploadPath +"default.png";
		}
		if(!FileUploadUtil.isImage(filePart)) {
			response.sendRedirect("/WEB-INF/register.jsp");
		}
	}

}
