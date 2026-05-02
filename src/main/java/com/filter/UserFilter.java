package com.filter;

import jakarta.servlet.Filter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.utils.SessionUtil;

/**
 * Servlet Filter implementation class UserFilter
 */
@WebFilter(urlPatterns = {"/login", "/register", "/memberDashboard"})
public class UserFilter extends HttpFilter implements Filter {
       
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpFilter#HttpFilter()
     */
    public UserFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		boolean isLoggedIn = SessionUtil.getAttribute(httpRequest, "username") != null;
		String userType = (String) SessionUtil.getAttribute(httpRequest, "userType");
		String urlPath = httpRequest.getServletPath();

        if (isLoggedIn) 
        {
        	if ("admin".equals(userType)) 
        	{
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/dashboard");
            } 
        	
        	else 
        	{
        		if (urlPath.equals("/memberDashboard")) 
        		{
                    chain.doFilter(request, response);
                } 
        		
        		else 
        		{
                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/memberDashboard");
                }
            }
        } 
        
        else 
        {
            chain.doFilter(request, response);
        }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
