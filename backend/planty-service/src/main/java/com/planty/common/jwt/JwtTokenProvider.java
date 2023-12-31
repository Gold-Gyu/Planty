//package com.planty.common.jwt;
//
//import java.security.Key;
//import java.util.Arrays;
//import java.util.Collection;
//import java.util.Date;
//import java.util.stream.Collectors;
//
//import com.planty.api.user.response.TokenInfoResponse;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.stereotype.Component;
//
//import io.jsonwebtoken.Claims;
//import io.jsonwebtoken.ExpiredJwtException;
//import io.jsonwebtoken.Jwts;
//import io.jsonwebtoken.MalformedJwtException;
//import io.jsonwebtoken.SignatureAlgorithm;
//import io.jsonwebtoken.UnsupportedJwtException;
//import io.jsonwebtoken.io.Decoders;
//import io.jsonwebtoken.security.Keys;
//import lombok.extern.slf4j.Slf4j;
//
//@Slf4j
//@Component
//public class JwtTokenProvider {
//
//    private static final int ACCESS_TOKEN_EXPIRE_MINUTES = 30; // 분단위
//    private static final int REFRESH_TOKEN_EXPIRE_WEEKS = 1; // 주단위
//
//    private final Key key;
//
//    public JwtTokenProvider(@Value("${jwt.secret}") String secretKey) {
//        byte[] keyBytes = Decoders.BASE64.decode(secretKey);
//        this.key = Keys.hmacShaKeyFor(keyBytes);
//    }
//
//    // 유저 정보를 가지고 AccessToken, RefreshToken 을 생성하는 메서드
//    public TokenInfoResponse generateToken(Authentication authentication) {
//        // 권한 가져오기
//        String authorities = authentication.getAuthorities().stream()
//                .map(GrantedAuthority::getAuthority)
//                .collect(Collectors.joining(","));
//
//        long now = (new Date()).getTime();
//        // Access Token 생성
//        Date accessTokenExpiresIn = new Date(now + 1000 * 60 * ACCESS_TOKEN_EXPIRE_MINUTES);
//        String accessToken = Jwts.builder()
//                .setSubject(authentication.getName())
//                .claim("auth", authorities)
//                .setExpiration(accessTokenExpiresIn)
//                .signWith(key, SignatureAlgorithm.HS256)
//                .compact();
//
//        // Refresh Token 생성
//        String refreshToken = Jwts.builder()
////                .setExpiration(new Date(now + 1000 * 60 * REFRESH_TOKEN_EXPIRE_WEEKS))
//                .setExpiration(new Date(now + 1000 * 60 * 60 * 24 * 7 * REFRESH_TOKEN_EXPIRE_WEEKS))
//                .signWith(key, SignatureAlgorithm.HS256)
//                .compact();
//
//        return TokenInfoResponse.builder()
//                .grantType("Bearer")
//                .accessToken(accessToken)
//                .refreshToken(refreshToken)
//                .build();
//    }
//
//    public TokenInfoResponse refresh(Authentication authentication, String refreshToken) {
//        // 권한 가져오기
//        String authorities = authentication.getAuthorities().stream()
//                .map(GrantedAuthority::getAuthority)
//                .collect(Collectors.joining(","));
//
//        long now = (new Date()).getTime();
//        // Access Token 생성
//        Date accessTokenExpiresIn = new Date(now + 1000 * 60 * ACCESS_TOKEN_EXPIRE_MINUTES);
//        String accessToken = Jwts.builder()
//                .setSubject(authentication.getName())
//                .claim("auth", authorities)
//                .setExpiration(accessTokenExpiresIn)
//                .signWith(key, SignatureAlgorithm.HS256)
//                .compact();
//
//        return TokenInfoResponse.builder()
//                .grantType("Bearer")
//                .accessToken(accessToken)
//                .refreshToken(refreshToken)
//                .build();
//    }
//
//    // JWT 토큰을 복호화하여 토큰에 들어있는 정보를 꺼내는 메서드
//    public Authentication getAuthentication(String accessToken) {
//        // 토큰 복호화
//        Claims claims = parseClaims(accessToken);
//
//        if (claims.get("auth") == null) {
//            throw new RuntimeException("권한 정보가 없는 토큰입니다.");
//        }
//
//        // 클레임에서 권한 정보 가져오기
//        Collection<? extends GrantedAuthority> authorities =
//                Arrays.stream(claims.get("auth").toString().split(","))
//                        .map(SimpleGrantedAuthority::new)
//                        .collect(Collectors.toList());
//
//        // UserDetails 객체를 만들어서 Authentication 리턴
//        UserDetails principal = new User(claims.getSubject(), "", authorities);
//        return new UsernamePasswordAuthenticationToken(principal, "", authorities);
//    }
//
//    // 토큰 정보를 검증하는 메서드
//    public boolean validateToken(String token) {
//        try {
//            Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token);
//            return true;
//        } catch (io.jsonwebtoken.security.SecurityException e) {
//            log.info("Invalid JWT Token ::SecurityException ", e);
//        } catch (MalformedJwtException e) {
//            log.info("Invalid JWT Token ::MalformedJwtException ", e);
//        } catch (ExpiredJwtException e) {
//            log.info("Expired JWT Token", e);
//        } catch (UnsupportedJwtException e) {
//            log.info("Unsupported JWT Token", e);
//        } catch (IllegalArgumentException e) {
//            log.info("JWT claims string is empty.", e);
//        }
//        return false;
//    }
//
//    private Claims parseClaims(String accessToken) {
//        try {
//            return Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(accessToken).getBody();
//        } catch (ExpiredJwtException e) {
//            return e.getClaims();
//        }
//    }
//
//}
