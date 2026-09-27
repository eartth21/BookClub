package com.mnu.bookclub.service.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mnu.bookclub.model.BookDAO;
import com.mnu.bookclub.model.UserDTO;
import com.mnu.bookclub.service.Action;

public class FinalizeTopicService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/plain; charset=utf-8");

		HttpSession session = request.getSession();
		UserDTO loginUser = (UserDTO) session.getAttribute("user");

		if(loginUser == null || !"admin".equals(loginUser.getRole())){
			response.getWriter().print("FORBIDDEN");
			return;
		}

		int k_idx = Integer.parseInt(request.getParameter("k_idx"));

		BookDAO bookDAO = BookDAO.getInstance();
		boolean finalizedNow = bookDAO.finalizeTopic(k_idx);

		if(finalizedNow){
			response.getWriter().print("OK");
		}else{
			response.getWriter().print("ALREADY");
		}
	}

}
