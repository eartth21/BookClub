package com.mnu.bookclub.service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.model.BoardDAO;
import com.mnu.bookclub.model.BoardDTO;
import com.mnu.bookclub.service.Action;

public class BoardModifyProService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		BoardDAO bDAO = BoardDAO.getInstance();
		BoardDTO bDTO = new BoardDTO();
		bDTO.setB_idx(b_idx);
		bDTO.setSubject(request.getParameter("subject"));
		bDTO.setContents(request.getParameter("contents"));
	
		int row = bDAO.boardModify(bDTO);
		response.sendRedirect("/Board?cmd=boardList");

	}

}
