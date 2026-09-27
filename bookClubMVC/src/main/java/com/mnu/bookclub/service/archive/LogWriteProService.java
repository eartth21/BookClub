package com.mnu.bookclub.service.archive;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mnu.bookclub.model.BookDAO;
import com.mnu.bookclub.model.BookDTO;
import com.mnu.bookclub.model.TalkDAO;
import com.mnu.bookclub.model.UserDTO;
import com.mnu.bookclub.service.Action;

public class LogWriteProService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		UserDTO loginUser = (UserDTO) session.getAttribute("user");

		response.setContentType("text/html; charset=utf-8");

		String opinion = request.getParameter("opinion");
		String thought = request.getParameter("thought");

		BookDAO bookDAO = BookDAO.getInstance();
		BookDTO weeklyBook = bookDAO.weeklyBook();

		TalkDAO talkDAO = TalkDAO.getInstance();
		int row = talkDAO.talkWrite(opinion, thought, loginUser.getName(), loginUser.getNum());

		if(row > 0){
			// 토론일지 작성이 끝나면 바로 그 책에 대한 리뷰(별점+한줄평) 작성 화면으로 이동
			response.sendRedirect("/Archive?cmd=reviewWrite&k_idx=" + weeklyBook.getK_idx());
		}else{
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록 중 오류가 발생했습니다. 등록된 책이 없는지 확인해주세요.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}

}
