package JWT;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTVerificationException;

import java.io.UnsupportedEncodingException;
import java.util.Date;

public class JwtUtil {
    private static final String SECRET = "YourSuperSecretKey"; 
    private static final long EXPIRATION_TIME = 1000 * 60 * 60 * 24; 

    public static String generateToken(int userId) throws IllegalArgumentException, JWTCreationException, UnsupportedEncodingException {
        return JWT.create()
                .withSubject(String.valueOf(userId))
                .withExpiresAt(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
                .sign(Algorithm.HMAC256(SECRET));
    }

    public static Integer validateToken(String token) throws IllegalArgumentException, UnsupportedEncodingException {
        try {
            DecodedJWT jwt = JWT.require(Algorithm.HMAC256(SECRET))
                    .build()
                    .verify(token);
            return Integer.parseInt(jwt.getSubject());
        } catch (JWTVerificationException e) {
            return null; 
        }
    }
}
