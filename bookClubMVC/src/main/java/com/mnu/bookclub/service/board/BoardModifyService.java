package com.mnu.bookclub.service.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.model.BoardDAO;
import com.mnu.bookclub.model.BoardDTO;
import com.mnu.bookclub.service.Action;

public class BoardModifyService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int b_idx=Integer.parseInt(request.getParameter("b_idx"));
		BoardDAO bDAO = BoardDAO.getInstance();
		BoardDTO bDTO = bDAO.boardView(b_idx);
		
		request.setAttribute("bDTO", bDTO);
		RequestDispatcher rd = request.getRequestDispatcher("/Board/board_modify.jsp");
		rd.forward(request, response);

	}

}
