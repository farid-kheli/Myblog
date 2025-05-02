package JWT;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTVerificationException;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class JwtUtil {
    private static final String SECRET = "YourSuperSecretKey"; 
    private static final long EXPIRATION_TIME = 1000 * 60 * 60 * 24; 

    public static String generateToken(int userId, int role) throws IllegalArgumentException, JWTCreationException, UnsupportedEncodingException {

    	return JWT.create()
                .withClaim("user_id",userId)
                .withClaim("role", role)
                .withExpiresAt(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
                .sign(Algorithm.HMAC256(SECRET));
    }

    public static Map<String, Integer> validateToken(String token) throws IllegalArgumentException, UnsupportedEncodingException {
        try {
            DecodedJWT jwt = JWT.require(Algorithm.HMAC256(SECRET))
                    .build()
                    .verify(token);
            Map<String, Integer> userData = new HashMap<>();
            userData.put("user_id", jwt.getClaim("user_id").asInt());
            userData.put("role", jwt.getClaim("role").asInt());

            return userData;
        } catch (JWTVerificationException e) {
            return null; 
        }
    }
}
