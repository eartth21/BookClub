package com.mnu.bookclub.service.archive;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mnu.bookclub.model.ReviewDAO;
import com.mnu.bookclub.model.UserDTO;
import com.mnu.bookclub.service.Action;

public class ReviewWriteProService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		UserDTO loginUser = (UserDTO) session.getAttribute("user");

		int k_idx = Integer.parseInt(request.getParameter("k_idx"));
		int rate = Integer.parseInt(request.getParameter("rate"));
		String reviewText = request.getParameter("review");

		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		response.setContentType("text/html; charset=utf-8");


		reviewDAO.reviewWrite(k_idx, loginUser.getUserid(), loginUser.getName(), rate, reviewText);

		response.sendRedirect("/Archive?cmd=bookDetail&k_idx=" + k_idx);
	}

}
