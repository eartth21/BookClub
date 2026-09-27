package com.mnu.bookclub.service.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.model.NoticeDAO;
import com.mnu.bookclub.model.NoticeDTO;
import com.mnu.bookclub.service.Action;

public class NoticeModifyService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int n_idx=Integer.parseInt(request.getParameter("n_idx"));
		NoticeDAO nDAO = NoticeDAO.getInstance();
		NoticeDTO nDTO = nDAO.noticeView(n_idx);
		
		request.setAttribute("nDTO", nDTO);
		RequestDispatcher rd = request.getRequestDispatcher("/Notice/notice_modify.jsp");
		rd.forward(request, response);
	}

}
