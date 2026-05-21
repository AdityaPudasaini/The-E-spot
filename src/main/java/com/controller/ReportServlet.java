package com.controller;

import jakarta.servlet.ServletException;
import com.dao.AdminReportDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 * Servlet implementation class ReportServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/report" })
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			AdminReportDAO adminReportDao = new AdminReportDAO();
            request.setAttribute("totalExports", adminReportDao.totalExports());
            request.setAttribute("lastExportDate", adminReportDao.lastExportDate());
            request.setAttribute("exportHistory", adminReportDao.allExports());
        } 
		
		catch (Exception e) {
            e.printStackTrace();
        }
		
        request.setAttribute("currentPage", "reports");
        request.getRequestDispatcher("/WEB-INF/pages/report.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String reportType = request.getParameter("reportType");
        String exportedBy = (String) request.getSession().getAttribute("username");

        if (reportType == null) {
        	reportType = "Revenue";
        }
        
        if (exportedBy == null) {
        	exportedBy = "Admin";
        }

        try {
            AdminReportDAO adminReportDao = new AdminReportDAO();
            
            ArrayList<String[]> rows = null;

            if (reportType.equals("Revenue")) 
            {
                rows = adminReportDao.revenueReport();
            } 
            
            else if (reportType.equals("Orders")) 
            {
                rows = adminReportDao.ordersReport();
            } 
            
            else if (reportType.equals("Products")) 
            {
                rows = adminReportDao.productsReport();
            }

            if (rows == null || rows.size() <= 1) 
            {
                response.sendRedirect(request.getContextPath() + "/report?error=nodata");
                return;
            }

            adminReportDao.storeExport(reportType, exportedBy, rows.size() - 1, "Success");

            String fileName = reportType + "_report.csv";
            
            response.setContentType("text/csv");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

            PrintWriter writer = response.getWriter();
            
            for (String[] row : rows) 
            {
                StringBuilder line = new StringBuilder();
                
                for (int i = 0; i < row.length; i++) 
                {
                	
                	if (i > 0) 
                	{
                	    line.append(",");
                	}

                	String cell;
                	
                	if (row[i] == null) 
                	{
                	    cell = "";
                	} 
                	
                	else 
                	{
                	    cell = row[i].replace("\"", "\"\"");
                	}

                	line.append("\"").append(cell).append("\"");
                }
                
                writer.println(line.toString());
            }
            
            writer.flush();

        } 
        
        catch (Exception e) 
        {
            e.printStackTrace();
            
            try {
                AdminReportDAO adminReportDao2 = new AdminReportDAO();
                adminReportDao2.storeExport(reportType, exportedBy, 0, "Failed");
            } 
            
            catch (Exception ex) {
                ex.printStackTrace();
            }
            response.sendRedirect(request.getContextPath() + "/report?error=export");
        }
	}

}
