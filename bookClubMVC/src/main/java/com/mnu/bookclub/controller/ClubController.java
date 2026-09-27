package com.mnu.bookclub.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.service.Action;
import com.mnu.bookclub.service.club.ClubHistoryService;
import com.mnu.bookclub.service.club.ClubIntroService;
import com.mnu.bookclub.service.club.ClubJoinService;
import com.mnu.bookclub.service.club.ClubMemberService;

/**
 * Servlet implementation class ClubController
 */
@WebServlet("/Club")
public class ClubController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClubController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		System.out.println("동아리 요청: "+cmd);
		
		Action action = null;
		if(cmd.equals("clubIntro")) {
			action = new ClubIntroService();
		}else if(cmd.equals("clubMember")) {
			action = new ClubMemberService();
		}else if(cmd.equals("clubJoin")) {
			action = new ClubJoinService();
		}else if(cmd.equals("clubHistory")) {
			action = new ClubHistoryService();
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
