package JWT;

import java.io.IOException;
import java.util.Map;

import beans.GetUserID;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Cookie;


public class JwtFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

    	HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        Cookie[] cookies = req.getCookies();
        Map<String, Integer> userT = GetUserID.GetId(cookies);
        if (userT == null) {
            res.sendRedirect("login");
            return;
        }
   	 	
   	 Integer role = userT.get("role");
   	String path = req.getRequestURI();

   	if (path.startsWith("/admin") && (role!=1)) {
   	 request.getRequestDispatcher("WEB-INF/403.jsp").forward(request, response);
   	    return;
   	}
   	
        System.out.println("FILTER:"+ path);
        chain.doFilter(request, response);
    }


    @Override
    public void destroy() {}
}

