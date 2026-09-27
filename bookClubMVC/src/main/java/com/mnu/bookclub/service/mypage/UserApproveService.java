package com.mnu.bookclub.service.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mnu.bookclub.model.MypageDAO;
import com.mnu.bookclub.model.UserDTO;
import com.mnu.bookclub.service.Action;

public class UserApproveService implements Action {

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

		String userid = request.getParameter("userid");

		MypageDAO mypageDAO = MypageDAO.getInstance();
		int row = mypageDAO.approve(userid);

		if(row > 0){
			response.getWriter().print("OK");
		}else{
			response.getWriter().print("FAIL");
		}
	}

}
