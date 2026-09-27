package com.mnu.bookclub.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.service.Action;
import com.mnu.bookclub.service.board.BoardDeleteService;
import com.mnu.bookclub.service.board.BoardListService;
import com.mnu.bookclub.service.board.BoardModifyProService;
import com.mnu.bookclub.service.board.BoardModifyService;
import com.mnu.bookclub.service.board.BoardViewService;
import com.mnu.bookclub.service.board.BoardWriteProService;
import com.mnu.bookclub.service.board.BoardWriteService;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/Board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		System.out.println("게시판 요청: "+cmd);
		
		Action action = null;
		if(cmd.equals("boardWrite")) {
			action = new BoardWriteService();
		}else if(cmd.equals("boardWritePro")) {
			action = new BoardWriteProService();
		}else if(cmd.equals("boardList")) {
			action = new BoardListService();
		}else if(cmd.equals("boardView")) {
			action = new BoardViewService();
		}else if(cmd.equals("boardModify")) {
			action = new BoardModifyService();
		}else if(cmd.equals("boardModifyPro")) {
			action = new BoardModifyProService();
		}else if(cmd.equals("boardDelete")) {
			action = new BoardDeleteService();
		}
			action.process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
