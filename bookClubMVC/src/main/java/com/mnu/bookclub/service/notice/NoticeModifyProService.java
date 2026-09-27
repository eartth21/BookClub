package com.mnu.bookclub.service.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.model.NoticeDAO;
import com.mnu.bookclub.model.NoticeDTO;
import com.mnu.bookclub.service.Action;

public class NoticeModifyProService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int n_idx = Integer.parseInt(request.getParameter("n_idx"));
		NoticeDAO nDAO = NoticeDAO.getInstance();
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setN_idx(n_idx);
		nDTO.setSubject(request.getParameter("subject"));
		nDTO.setContents(request.getParameter("contents"));
	
		int row = nDAO.noticeModify(nDTO);
		response.sendRedirect("/Notice?cmd=noticeList");


		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/Notice/notice_write.jsp");
		rd.forward(request, response);
	}

}
