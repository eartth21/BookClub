package com.mnu.bookclub.service.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mnu.bookclub.model.BookDAO;
import com.mnu.bookclub.model.BookDTO;
import com.mnu.bookclub.model.UserDTO;
import com.mnu.bookclub.service.Action;

public class BookWriteProService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		UserDTO loginUser = (UserDTO) session.getAttribute("user");

	
		BookDAO kDAO = BookDAO.getInstance();
		BookDTO kDTO = new BookDTO();
		
	
		kDTO.setBook(request.getParameter("book"));
		kDTO.setAuthor(request.getParameter("author"));
		kDTO.setSynopsis(request.getParameter("synopsis"));
		kDTO.setTopic1(request.getParameter("topic1"));
		kDTO.setTopic2(request.getParameter("topic2"));
		kDTO.setTopic3(request.getParameter("topic3"));
			
		
		int row = kDAO.bookWrite(kDTO);
		
		response.sendRedirect("/Notice?cmd=weeklybook");

	}

}
