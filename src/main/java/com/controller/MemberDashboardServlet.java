package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;

import com.dao.MemberDAO;
import com.model.MemberModel;

/**
 * Servlet implementation class MemberDashboard
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/memberDashboard" })
public class MemberDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username = (String) request.getSession().getAttribute("username");

        try {
            MemberDAO memberDao = new MemberDAO();
            MemberModel member = memberDao.getMemberRecordByUsername(username);

            String joinDate = "";
            
            if (member.getCreatedDate() != null) {
                joinDate = new SimpleDateFormat("MMMM yyyy").format(member.getCreatedDate());
            }

            String dobFormatted = "";
            
            if (member.getDob() != null) {
                dobFormatted = new SimpleDateFormat("dd MMM yyyy").format(member.getDob());
            }

            request.setAttribute("memberInfo", member);
            request.setAttribute("joinDate", joinDate);
            request.setAttribute("dobFormatted", dobFormatted);

        } catch (Exception e) {
            e.printStackTrace();
        }
		
		request.getRequestDispatcher("/WEB-INF/pages/dashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
