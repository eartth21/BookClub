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

public class BoardViewService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		BoardDAO bDAO = BoardDAO.getInstance();
		bDAO.readCount(b_idx);
		BoardDTO bDTO=bDAO.boardView(b_idx);

		request.setAttribute("bDTO", bDTO);;
		RequestDispatcher rd = request.getRequestDispatcher("Board/board_view.jsp");
		rd.forward(request, response);

	}

}
