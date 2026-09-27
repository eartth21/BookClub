package com.mnu.bookclub.service.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mnu.bookclub.model.NoticeDAO;
import com.mnu.bookclub.model.NoticeDTO;
import com.mnu.bookclub.model.UserDTO;
import com.mnu.bookclub.service.Action;

public class NoticeWriteProService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		UserDTO loginUser = (UserDTO) session.getAttribute("user");

		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setSubject(request.getParameter("subject"));
		nDTO.setContents(request.getParameter("contents"));
		nDTO.setUserid(loginUser.getUserid());
		nDTO.setName(loginUser.getName());

		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.noticeWrite(nDTO);

		response.sendRedirect("/Notice?cmd=noticeList");
	}

}
