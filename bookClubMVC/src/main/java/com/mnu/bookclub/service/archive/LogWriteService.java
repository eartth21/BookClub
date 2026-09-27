package com.mnu.bookclub.service.archive;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.model.BookDAO;
import com.mnu.bookclub.model.BookDTO;
import com.mnu.bookclub.service.Action;

public class LogWriteService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BookDAO bookDAO = BookDAO.getInstance();
		BookDTO weeklyBook = bookDAO.weeklyBook();

		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

		request.setAttribute("weeklyBook", weeklyBook);
		request.setAttribute("today", today);

		RequestDispatcher rd = request.getRequestDispatcher("/Archive/archive_log_write.jsp");
		rd.forward(request, response);
	}

}
