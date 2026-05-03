package com.project.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import com.java_web_app.model.*;
import java.io.File;
import java.io.IOException;

import com.jav.utils.FileUploadUtil;
import com.project.utils.SessionUtil;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/ProfileServlet")
@MultipartConfig
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR =
        System.getProperty("user.home") + File.separator + "webapp_uploads";

    public ProfileServlet() { super(); }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        StudentModel user = (StudentModel) SessionUtil.getAttribute(request, "user");

        Part filePart = request.getPart("profileImage");

        if (filePart == null || filePart.getSize() == 0) {
            SessionUtil.setAttribute(request, "error", "Please select an image file to upload.", 1800);
            response.sendRedirect(request.getContextPath() + "/profile");
            return;
        }

        if (!FileUploadUtil.isImage(filePart)) {
            SessionUtil.setAttribute(request, "error", "Only image files (JPEG, PNG, GIF, etc.) are allowed.", 1800);
            response.sendRedirect(request.getContextPath() + "/profile");
            return;
        }

        String originalFileName = filePart.getSubmittedFileName();
        String extension        = FileUploadUtil.getFileExtension(originalFileName);
        String userName         = user.getUserName();
        String newFileName      = userName + extension;

        FileUploadUtil.saveFile(filePart, UPLOAD_DIR, newFileName);

        SessionUtil.setAttribute(request, "message", "Profile picture updated successfully!", 1800);
        response.sendRedirect(request.getContextPath() + "/profile");
    }

}
