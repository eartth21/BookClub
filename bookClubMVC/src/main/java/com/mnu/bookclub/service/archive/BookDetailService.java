package com.mnu.bookclub.service.archive;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.model.BookDAO;
import com.mnu.bookclub.model.BookDTO;
import com.mnu.bookclub.model.ReviewDAO;
import com.mnu.bookclub.model.ReviewDTO;
import com.mnu.bookclub.service.Action;

public class BookDetailService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int k_idx = Integer.parseInt(request.getParameter("k_idx"));

		BookDAO bookDAO = BookDAO.getInstance();
		BookDTO kDTO = bookDAO.bookDetail(k_idx);

		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		double avgRate = reviewDAO.getAvgRate(k_idx);
		List<ReviewDTO> reviewList = reviewDAO.getReviewList(k_idx);

		request.setAttribute("kDTO", kDTO);
		request.setAttribute("avgRate", avgRate);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("reviewCount", reviewList.size());

		RequestDispatcher rd = request.getRequestDispatcher("/Archive/archive_book_detail.jsp");
		rd.forward(request, response);
	}

}
