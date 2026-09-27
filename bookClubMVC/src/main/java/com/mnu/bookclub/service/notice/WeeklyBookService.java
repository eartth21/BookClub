package com.mnu.bookclub.service.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.model.BookDAO;
import com.mnu.bookclub.model.BookDTO;
import com.mnu.bookclub.service.Action;

public class WeeklyBookService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDAO kDAO=BookDAO.getInstance();
		BookDTO kDTO = kDAO.weeklyBook();
		
		request.setAttribute("kDTO", kDTO);
		
		RequestDispatcher rd = request.getRequestDispatcher("Notice/notice_weekly.jsp");
		rd.forward(request, response);
	
	}

}
