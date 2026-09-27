package com.mnu.bookclub.service.mypage;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mnu.bookclub.model.UserDTO;
import com.mnu.bookclub.service.Action;

public class MypageModifyService implements Action {
    @Override
    public void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	HttpSession session = request.getSession();
    	UserDTO loginUser = (UserDTO) session.getAttribute("user");

    	request.setAttribute("uDTO", loginUser);

    	RequestDispatcher rd = request.getRequestDispatcher("/Mypage/mypage_modify.jsp");
    	rd.forward(request, response);
      }
}
