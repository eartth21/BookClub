package com.mnu.bookclub.service.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.model.MypageDAO;
import com.mnu.bookclub.model.UserDTO;
import com.mnu.bookclub.service.Action;

public class WelcomeService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("/Mypage/mypage_welcome.jsp");
		rd.forward(request, response);

	}

}
