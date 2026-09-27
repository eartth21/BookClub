package com.mnu.bookclub.service.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mnu.bookclub.model.UserDTO;
import com.mnu.bookclub.service.Action;

public class BookWriteService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		UserDTO loginUser = (UserDTO) session.getAttribute("user");

		if(!"admin".equals(loginUser.getRole())){
			response.sendError(HttpServletResponse.SC_FORBIDDEN, "관리자만 접근할 수 있습니다.");
			return;
		}

		RequestDispatcher rd = request.getRequestDispatcher("Notice/book_write.jsp");
		rd.forward(request, response);
	
	}

}
