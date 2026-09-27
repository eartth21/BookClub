package com.mnu.bookclub.service.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.model.NoticeDAO;
import com.mnu.bookclub.model.NoticeDTO;
import com.mnu.bookclub.service.Action;

public class NoticeListService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeDAO nDAO = NoticeDAO.getInstance();
		List<NoticeDTO> nList=nDAO.noticeList();
		
		request.setAttribute("nList", nList);
		RequestDispatcher rd = request.getRequestDispatcher("/Notice/notice_list.jsp");
		rd.forward(request, response);
	}

}
