package com.mnu.bookclub.service.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mnu.bookclub.model.MypageDAO;
import com.mnu.bookclub.model.UserDTO;
import com.mnu.bookclub.service.Action;
import com.mnu.bookclub.util.UserSHA256;

public class MypageLoginProService implements Action {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MypageDAO uDAO = MypageDAO.getInstance();

		String userid = request.getParameter("userid");
		String pass = request.getParameter("pass");
		//	String pass = UserSHA256.getSHA256(request.getParameter("pass"));
		String forwardPage;
		UserDTO user = uDAO.login(userid, pass);
		
		if(user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			session.setMaxInactiveInterval(60*60*2);
			forwardPage="/Mypage/mypage_welcome.jsp";
		}else {
			forwardPage="/Mypage/login_alert.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
		rd.forward(request, response);

	}

}
