package com.mnu.bookclub.service.archive;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.model.BookDAO;
import com.mnu.bookclub.model.BookDTO;
import com.mnu.bookclub.service.Action;

public class ReviewWriteService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int k_idx = Integer.parseInt(request.getParameter("k_idx"));

		BookDAO bookDAO = BookDAO.getInstance();
		BookDTO kDTO = bookDAO.bookDetail(k_idx);

		request.setAttribute("kDTO", kDTO);

		RequestDispatcher rd = request.getRequestDispatcher("/Archive/archive_review.jsp");
		rd.forward(request, response);
	}

}
