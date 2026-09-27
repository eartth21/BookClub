package com.mnu.bookclub.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.service.Action;
import com.mnu.bookclub.service.archive.ArchiveBooksService;
import com.mnu.bookclub.service.archive.ArchiveLogsService;
import com.mnu.bookclub.service.archive.BookDetailService;
import com.mnu.bookclub.service.archive.LogWriteProService;
import com.mnu.bookclub.service.archive.LogWriteService;
import com.mnu.bookclub.service.archive.ReportViewService;
import com.mnu.bookclub.service.archive.ReviewWriteProService;
import com.mnu.bookclub.service.archive.ReviewWriteService;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/Archive")
public class ArchiveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ArchiveController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		System.out.println("아카이브 요청: "+cmd);
		
		Action action = null;
		if(cmd.equals("logWrite")) {
			action = new LogWriteService();
		}else if(cmd.equals("logWritePro")) {
			action = new LogWriteProService();
		}else if(cmd.equals("archiveBooks")) {
			action = new ArchiveBooksService();
		}else if(cmd.equals("bookDetail")) {
			action = new BookDetailService();
		}else if(cmd.equals("archiveLogs")) {
			action = new ArchiveLogsService();
		}else if(cmd.equals("reportView")) {
			action = new ReportViewService();
		}else if(cmd.equals("reviewWrite")) {
			action = new ReviewWriteService();
		}else if(cmd.equals("reviewWritePro")) {
			action = new ReviewWriteProService();
		}
			action.process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
