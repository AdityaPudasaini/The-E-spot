package com.project.utils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class SessionUtil {


	    /**
	     * Adds an attribute and sets a custom session timeout.
	     * @param seconds Time before session expires due to inactivity.
	     */
		// set session attribute
<<<<<<< HEAD
	    public static void setAttribute(HttpServletRequest request, String name, 
	    		Object value, int seconds) {
=======
	    public static void setAttribute(HttpServletRequest request, String name, Object value, int seconds) {
>>>>>>> a438b32c1e5392544b324168b7c11f9b11fdb41d
	        HttpSession session = request.getSession(true);
	        session.setAttribute(name, value);
	        session.setMaxInactiveInterval(seconds);
	    }
	    
	    // read session attribute
<<<<<<< HEAD
	    public static Object getAttribute(HttpServletRequest request,
	    		String name) {
=======
	    public static Object getAttribute(HttpServletRequest request, String name) {
>>>>>>> a438b32c1e5392544b324168b7c11f9b11fdb41d
	        HttpSession session = request.getSession(false);
	        return (session != null) ? session.getAttribute(name) : null;
	    }

	    // remove session specific attribute
<<<<<<< HEAD
	    public static void removeAttribute(HttpServletRequest request,
	    		String name) {
=======
	    public static void removeAttribute(HttpServletRequest request, String name) {
>>>>>>> a438b32c1e5392544b324168b7c11f9b11fdb41d
	        HttpSession session = request.getSession(false);
	        if (session != null) {
	            session.removeAttribute(name);
	        }
	    }

	    // remove all session at all
	    public static void invalidateSession(HttpServletRequest request) {
	        HttpSession session = request.getSession(false);
	        if (session != null) {
	            session.invalidate();
	        }
	    
	}
<<<<<<< HEAD
}
=======
>>>>>>> a438b32c1e5392544b324168b7c11f9b11fdb41d

