package beans;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import JWT.JwtUtil;
import jakarta.servlet.http.Cookie;

public class GetUserID {
	
	   public static Map<String, Integer> GetId(Cookie[] cookies) throws IllegalArgumentException, UnsupportedEncodingException { 
		   String token = null;
	        if (cookies != null) {
	            for (Cookie cookie : cookies) {
	                if ("jwt_token".equals(cookie.getName())) {
	                    token = cookie.getValue();
	                    break;
	                }
	            }
	        }
	        Map<String, Integer> userId = JwtUtil.validateToken(token) ;
	        return userId;
	   }
	   

}
