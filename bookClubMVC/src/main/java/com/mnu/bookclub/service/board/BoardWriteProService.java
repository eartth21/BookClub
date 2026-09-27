package com.mnu.bookclub.service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mnu.bookclub.model.BoardDAO;
import com.mnu.bookclub.model.BoardDTO;
import com.mnu.bookclub.model.UserDTO;
import com.mnu.bookclub.service.Action;

public class BoardWriteProService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		HttpSession session = request.getSession();
		UserDTO loginUser = (UserDTO) session.getAttribute("user");

		BoardDTO bDTO = new BoardDTO();
		bDTO.setSubject(request.getParameter("subject"));
		bDTO.setContents(request.getParameter("contents"));
		bDTO.setUserid(loginUser.getUserid());
		bDTO.setName(loginUser.getName());

		BoardDAO bDAO = BoardDAO.getInstance();
		bDAO.boardWrite(bDTO);

		response.sendRedirect("/Board?cmd=boardList");

	}

}
