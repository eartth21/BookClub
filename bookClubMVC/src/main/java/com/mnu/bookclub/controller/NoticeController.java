package com.mnu.bookclub.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.service.Action;
import com.mnu.bookclub.service.notice.BookWriteProService;
import com.mnu.bookclub.service.notice.BookWriteService;
import com.mnu.bookclub.service.notice.NoticeDeleteProService;
import com.mnu.bookclub.service.notice.NoticeDeleteService;
import com.mnu.bookclub.service.notice.NoticeListService;
import com.mnu.bookclub.service.notice.NoticeModifyProService;
import com.mnu.bookclub.service.notice.NoticeModifyService;
import com.mnu.bookclub.service.notice.NoticeViewService;
import com.mnu.bookclub.service.notice.NoticeWriteProService;
import com.mnu.bookclub.service.notice.NoticeWriteService;
import com.mnu.bookclub.service.notice.WeeklyBookProService;
import com.mnu.bookclub.service.notice.WeeklyBookService;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/Notice")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		System.out.println("공지사항 요청: "+cmd);
		
		Action action = null;
		if(cmd.equals("noticeList")) {
			action = new NoticeListService();
		}else if(cmd.equals("noticeView")) {
			action = new NoticeViewService();
		}else if(cmd.equals("noticeWrite")) {
			action = new NoticeWriteService();
		}else if(cmd.equals("noticeWritePro")) {
			action = new NoticeWriteProService();
		}else if(cmd.equals("weeklybook")) {
			action = new WeeklyBookService();
		}else if(cmd.equals("weeklyBookPro")) {
			action = new WeeklyBookProService();
		}else if(cmd.equals("bookWrite")) {
			action = new BookWriteService();
		}else if(cmd.equals("bookWritePro")) {
			action = new BookWriteProService();
		}else if(cmd.equals("noticeModify")) {
			action = new NoticeModifyService();
		}else if(cmd.equals("noticeModifyPro")) {
			action = new NoticeModifyProService();
		}else if(cmd.equals("noticeDelete")) {
			action = new NoticeDeleteService();
		}else if(cmd.equals("noticeDeletePro")) {
			action = new NoticeDeleteProService();
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
