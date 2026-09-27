package com.mnu.bookclub.service.mypage;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mnu.bookclub.model.UserDTO;
import com.mnu.bookclub.service.Action;

public class MypageService implements Action {
    @Override
    public void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");

        String forwardPage = (user != null)
                ? "/Mypage/mypage_welcome.jsp"
                : "/Mypage/mypage_login.jsp";

        RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
        rd.forward(request, response);
    }
}