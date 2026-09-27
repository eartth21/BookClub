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
import com.mnu.bookclub.model.ReviewDAO;
import com.mnu.bookclub.service.Action;

public class ArchiveBooksService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");

		BookDAO bookDAO = BookDAO.getInstance();
		List<BookDTO> bookList;

		if(keyword != null && !keyword.trim().isEmpty()){
			bookList = bookDAO.bookSearch(type, keyword.trim());
		}else{
			bookList = bookDAO.bookList();
		}

		// 카드 목록(제목/저자/토론일수/평균별점/한줄평수)에 쓸 값을 함께 계산해 둔다.
		TalkDAO talkDAO = TalkDAO.getInstance();
		ReviewDAO reviewDAO = ReviewDAO.getInstance();

		for(BookDTO b : bookList){
			b.setTalkCount(talkDAO.getTalkCount(b.getK_idx()));
			b.setAvgRate(reviewDAO.getAvgRate(b.getK_idx()));
			b.setReviewCount(reviewDAO.getReviewCount(b.getK_idx()));
		}

		request.setAttribute("bookList", bookList);

		RequestDispatcher rd = request.getRequestDispatcher("/Archive/archive_books.jsp");
		rd.forward(request, response);
	}

}
