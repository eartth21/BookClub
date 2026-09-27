package com.mnu.bookclub.service.mypage;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mnu.bookclub.model.MypageDAO;
import com.mnu.bookclub.model.UserDTO;
import com.mnu.bookclub.service.Action;

public class MypageModifyProService implements Action {
    @Override
    public void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	MypageDAO uDAO = MypageDAO.getInstance();
    	UserDTO uDTO = new UserDTO();
    	uDTO.setUserid(request.getParameter("userid"));
    	uDTO.setTel(request.getParameter("tel"));
    	uDTO.setNum(request.getParameter("num"));
    	
    	int row=uDAO.usermodify(uDTO);
    	response.sendRedirect("/Mypage?cmd=welcome");
    }
}