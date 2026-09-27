package com.mnu.bookclub.service.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mnu.bookclub.model.BookDAO;
import com.mnu.bookclub.model.BookDTO;
import com.mnu.bookclub.model.MypageDAO;
import com.mnu.bookclub.model.UserDTO;
import com.mnu.bookclub.service.Action;

public class MypageAdminService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		UserDTO loginUser = (UserDTO) session.getAttribute("user");

		MypageDAO mypageDAO = MypageDAO.getInstance();
		List<UserDTO> pendingUsers = mypageDAO.getPendingUsers();

		BookDAO bookDAO = BookDAO.getInstance();
		BookDTO weeklyBook = bookDAO.weeklyBook();

		request.setAttribute("pendingUsers", pendingUsers);
		request.setAttribute("weeklyBook", weeklyBook);

		RequestDispatcher rd = request.getRequestDispatcher("/Mypage/mypage_admin.jsp");
		rd.forward(request, response);
	}

}
