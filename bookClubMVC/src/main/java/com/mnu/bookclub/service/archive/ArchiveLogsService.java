package com.mnu.bookclub.service.archive;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.model.BookDAO;
import com.mnu.bookclub.model.BookDTO;
import com.mnu.bookclub.model.TalkDAO;
import com.mnu.bookclub.service.Action;

public class ArchiveLogsService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		BookDAO bookDAO = BookDAO.getInstance();
		TalkDAO talkDAO = TalkDAO.getInstance();

		List<BookDTO> allBooks = bookDAO.bookList();

		List<BookDTO> bookList = new java.util.ArrayList<>();
		for(BookDTO b : allBooks){
			int count = talkDAO.getTalkCount(b.getK_idx());
			if(count > 0){
				b.setTalkCount(count);
				bookList.add(b);
			}
		}

		request.setAttribute("bookList", bookList);

		RequestDispatcher rd = request.getRequestDispatcher("/Archive/archive_logs.jsp");
		rd.forward(request, response);
	}

}
