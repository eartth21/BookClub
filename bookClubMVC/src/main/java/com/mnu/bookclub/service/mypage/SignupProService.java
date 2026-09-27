package com.mnu.bookclub.service.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.model.MypageDAO;
import com.mnu.bookclub.model.UserDTO;
import com.mnu.bookclub.service.Action;
import com.mnu.bookclub.util.UserSHA256;

public class SignupProService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		MypageDAO mDAO = MypageDAO.getInstance();
		UserDTO uDTO = new UserDTO();
		
		uDTO.setUserid(request.getParameter("userid"));
		uDTO.setName(request.getParameter("name"));
		uDTO.setPass(UserSHA256.getSHA256(request.getParameter("pass")));
		uDTO.setNum(request.getParameter("num"));
		uDTO.setTel(request.getParameter("tel"));
		
		int row = mDAO.userSignup(uDTO);
		
		response.sendRedirect("/Mypage?cmd=mypageLogin");
		

	}

}
