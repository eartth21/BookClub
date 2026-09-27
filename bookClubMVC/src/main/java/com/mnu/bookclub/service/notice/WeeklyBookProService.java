package com.mnu.bookclub.service.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.model.BookDAO;
import com.mnu.bookclub.service.Action;

public class WeeklyBookProService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDAO kDAO=BookDAO.getInstance();
		int k_idx=Integer.parseInt(request.getParameter("k_idx"));
		String choice = request.getParameter("choice");
		
		 Cookie[] cookies = request.getCookies();
	        boolean alreadyVoted = false;
	        String cookieName = "voted_" + k_idx;

	        if(cookies != null){
	            for(Cookie c : cookies){
	                if(c.getName().equals(cookieName)){
	                    alreadyVoted = true;
	                    break;
	                }
	            }
	        }
	        if(alreadyVoted){
	            response.getWriter().print("ALREADY");
	            return;
	        }

	        if(!choice.equals("1") && !choice.equals("2") && !choice.equals("3")){
	            response.getWriter().print("INVALID");
	            return;
	        }
	        BookDAO bookDAO = BookDAO.getInstance();
	        bookDAO.vote(k_idx, choice);

	        // 4. 쿠키 발급 (7일)
	        Cookie voteCookie = new Cookie(cookieName, "true");
	        voteCookie.setMaxAge(60 * 60 * 24 * 7);
	        voteCookie.setPath("/");
	        response.addCookie(voteCookie);

	        response.getWriter().print("OK");
	    }		
		
		
	
	}


