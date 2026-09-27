package com.mnu.bookclub.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mnu.bookclub.service.Action;
import com.mnu.bookclub.service.mypage.FinalizeTopicService;
import com.mnu.bookclub.service.mypage.IDCheckService;
import com.mnu.bookclub.service.mypage.LogoutService;
import com.mnu.bookclub.service.mypage.MypageAdminService;
import com.mnu.bookclub.service.mypage.MypageLoginProService;
import com.mnu.bookclub.service.mypage.MypageLoginService;
import com.mnu.bookclub.service.mypage.MypageModifyProService;
import com.mnu.bookclub.service.mypage.MypageModifyService;
import com.mnu.bookclub.service.mypage.MypageService;
import com.mnu.bookclub.service.mypage.SMSCertService;
import com.mnu.bookclub.service.mypage.SignupProService;
import com.mnu.bookclub.service.mypage.SignupService;
import com.mnu.bookclub.service.mypage.UserApproveService;
import com.mnu.bookclub.service.mypage.WelcomeService;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/Mypage")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		System.out.println("사용자 요청: "+cmd);
		
		Action action = null;
		if(cmd.equals("signup")) {
			action = new SignupService();
		}else if(cmd.equals("signupPro")) {
			action = new SignupProService();
		}else if(cmd.equals("mypage")) {
			action = new MypageService();
		}else if(cmd.equals("mypageModify")) {
			action = new MypageModifyService();
		}else if(cmd.equals("mypageModifyPro")) {
			action = new MypageModifyProService();
		}else if(cmd.equals("mypageLogin")) {
			action = new MypageLoginService();
		}else if(cmd.equals("mypageLoginPro")) {
			action = new MypageLoginProService();
		}else if(cmd.equals("idCheck")) {
			action = new IDCheckService();
		}else if(cmd.equals("smsCert")) {
			action = new SMSCertService();
		}else if(cmd.equals("welcome")) {
			action = new WelcomeService();
		}else if(cmd.equals("logout")) {
			action = new LogoutService();
		}else if(cmd.equals("mypageAdmin")) {
			action = new MypageAdminService();
		}else if(cmd.equals("userApprove")) {
			action = new UserApproveService();
		}else if(cmd.equals("finalizeTopic")) {
			action = new FinalizeTopicService();
		}
		action.process(request, response);

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
