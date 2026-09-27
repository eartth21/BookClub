package com.mnu.bookclub.filter;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mnu.bookclub.model.UserDTO;

@WebFilter("/*")
public class LoginCheckFilter implements Filter {
    private static final Set<String> ALLOWED_MYPAGE_CMD = new HashSet<>(Arrays.asList(
    	"mypage",
    	"mypageLogin",
        "mypageLoginPro",
        "signup",
        "signupPro",
        "idCheck",
        "smsCert",
        "logout"      // 로그아웃은 로그인/승인 여부와 무관하게 항상 통과되어야 한다.
    ));

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        req.setCharacterEncoding("utf-8"); 
    	
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        String contextPath = request.getContextPath();
        String path = request.getRequestURI().substring(contextPath.length());
        String cmd = request.getParameter("cmd");
        boolean isAllowed = path.equals("/")
                || (path.equals("/Mypage") && ALLOWED_MYPAGE_CMD.contains(cmd));
        if (isAllowed) {
            chain.doFilter(req, res);
            return;
        }

        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");

        if (user == null) {
            request.getRequestDispatcher("/inc/need_login.jsp").forward(request, response);
            return;
        }

        if (user.getApproved() == 0) {
            request.getRequestDispatcher("/Mypage/mypage_welcome.jsp").forward(request, response);
            return;
        }

        chain.doFilter(req, res);
    }

    @Override
    public void destroy() {
    }
}
