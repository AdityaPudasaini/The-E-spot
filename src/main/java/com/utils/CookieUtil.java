package com.utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieUtil {
	public static void addCookie(HttpServletResponse response, String name, String value, int min) {
        Cookie cookie = new Cookie(name, value);
        cookie.setPath("/");
        cookie.setMaxAge(min);
        cookie.setHttpOnly(true); // Prevents XSS access to the cookie
        response.addCookie(cookie);
    }
	public static void deleteCookie(HttpServletResponse response,String name) {
		Cookie cookie = new Cookie(name,"");
		cookie.setPath("/");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}
	public static String getCookieValue(HttpServletRequest request, String name) {
		Cookie[] cookies = request.getCookies();
		if (cookies!=null) {
			for(Cookie cookie:cookies) {
				if(name.equals(cookie.getName())) {
					return cookie.getValue();
				}
			}
		}
		return null;
	}
}