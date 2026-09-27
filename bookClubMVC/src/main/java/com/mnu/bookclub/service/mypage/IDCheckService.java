package com.mnu.bookclub.service.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.model.MypageDAO;
import com.mnu.bookclub.service.Action;

public class IDCheckService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userid = request.getParameter("userid");
		MypageDAO mDAO = MypageDAO.getInstance();
		
		int row = mDAO.idcheck(userid);
		
		PrintWriter out = response.getWriter();
		out.print(row);

		
		
	}

}
