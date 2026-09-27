package com.mnu.bookclub.service.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.model.BoardDAO;
import com.mnu.bookclub.model.BoardDTO;
import com.mnu.bookclub.service.Action;

public class BoardListService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO bDAO = BoardDAO.getInstance();
		List<BoardDTO> bList = bDAO.boardList();
		
		request.setAttribute("bList", bList);
		RequestDispatcher rd = request.getRequestDispatcher("Board/board_list.jsp");
		rd.forward(request, response);

	}

}
