package com.planty.api.user.controller;

import com.planty.api.user.response.UserInfoDetailResponse;
import com.planty.api.user.response.UserLoginResponse;
import com.planty.api.user.service.UserInfoServiceImpl;
import com.planty.common.util.RestExceptionUtil;
import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

//import javax.validation.Valid;

import java.util.Date;
import java.util.Map;
import java.util.UUID;

@Slf4j
@RestController
//@RequestMapping(value = "/api/users")
@RequestMapping(value = "/")
@RequiredArgsConstructor
@Api
//@CrossOrigin("http://localhost:3000")
public class UserInfoController {

    private final UserInfoServiceImpl userService;

    @PostMapping("/oauth/jwt/google")
    public ResponseEntity<UserLoginResponse> jwtCreate(@RequestBody Map<String, Object> data) {
        UserLoginResponse token = userService.jwtCreate(data);

        return ResponseEntity.status(200).body(token);
    }


//    @GetMapping("/login")
//    @ResponseBody
//    public String oauthLoginInfo(Authentication authentication, @AuthenticationPrincipal OAuth2User oAuth2UserPrincipal){
//        OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();
//        Map<String, Object> attributes = oAuth2User.getAttributes();
//        log.info("GOOGLE LOGIN :: {}", attributes);
//
//        Map<String, Object> attributes1 = oAuth2UserPrincipal.getAttributes();
//        // attributes == attributes1
//
//        return attributes.toString();     //세션에 담긴 user가져올 수 있음음
//    }
//
//    @GetMapping("/loginInfo")
//    @ResponseBody
//    public String loginInfo(Authentication authentication, @AuthenticationPrincipal PrincipalDetails principalDetails){
//        String result = "";
//
//        PrincipalDetails principal = (PrincipalDetails) authentication.getPrincipal();
//        if(principal.getUser().getUserType() == null) {
//            result = result + "Form 로그인 : " + principal;
//        }else{
//            result = result + "OAuth2 로그인 : " + principal;
//        }
//        return result;
//    }



//    @PostMapping("/social-login")
//    public ResponseEntity<LoginResponse> doSocialLogin(@RequestBody @Valid SocialLoginRequest request) {
//
//        System.out.println("userinfo controller :: doSocialLogin");
//
//        return ResponseEntity.created(URI.create("/social-login"))
//                .body(userService.doSocialLogin(request));
//    }

//    @GetMapping("/tmp/{id}/{name}/{email}")
//    public ResponseEntity<?> regUser(@PathVariable("id") String id, @PathVariable("name") String name, @PathVariable("email") String email) {
//        log.info("UserInfoController::regUser() ->");
//        UserJoinRequest userJoinRequest = UserJoinRequest.builder()
//                .userId(id)
//                .username(name)
//                .userEmail(email)
//                .build();
//        UserJoinResponse userJoinResponse = userService.joinUser(userJoinRequest);
//        if (userJoinResponse != null) {
//            return ResponseEntity.ok(userJoinResponse);
//        } else {
//            return RestExceptionUtil.messageHandling("회원 가입 중 에러 발생", HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }
//
//    @PostMapping("/tmp/login/{email}")
//    public ResponseEntity<?> login(@PathVariable("email") String email) {
//        log.info("login email: {}", email);
//
//        try {
//            TokenInfoResponse tokenInfo = userService.loginUser(email);
//            if (tokenInfo != null) {
//                // 토큰 정보 전달
//                return new ResponseEntity<TokenInfoResponse>(tokenInfo, HttpStatus.OK);
//            } else {
//                return RestExceptionUtil.messageHandling("아이디 또는 비밀번호가 틀렸습니다. - 1", HttpStatus.INTERNAL_SERVER_ERROR);
//            }
//        } catch (Exception e) {
//            return RestExceptionUtil.messageHandling("아이디 또는 비밀번호가 틀렸습니다. - 2", HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }

    @GetMapping("/logout")
//    public ResponseEntity<?> logout(HttpServletResponse response) {
    public ResponseEntity<?> logout() {
        try {
            userService.logout();
            // Refresh Token 제거
//            UserDto userInfo = userService.getUser(email);
//            userInfo.setToken(null);
//            userService.modifyUser(userInfo);

            return RestExceptionUtil.messageHandling("로그아웃 되었습니다.", HttpStatus.OK);
        } catch (Exception e) {
            return RestExceptionUtil.messageHandling("로그아웃 중 에러가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    ////////////////////////////////////////
    ////////////////////////////////////////    실제 코드 시작
    ////////////////////////////////////////

//    @PostMapping("/refresh")
////    public ResponseEntity<?> refresh(@RequestBody TokenRefreshRequest userInfo, HttpServletRequest request) {
//    public ResponseEntity<?> refresh(HttpServletRequest request) {
////        log.info("refresh :: {}", userInfo);
////        TokenRefreshRequest userInfo = new TokenRefreshRequest();
////        userInfo.setUid(uid);
//        String refreshToken = request.getHeader("refreshToken");
//        String accessToken = request.getHeader("accessToken");
//        log.info("header {}", refreshToken);
////        String accessToken = request.getHeader("accessToken");
////        userInfo.setRefreshToken(refreshToken);
////        userInfo.setAccessToken(accessToken);
////        log.debug("refresh user: {}", userInfo);
//        try {
//            TokenInfoResponse tokenInfo = userService.refreshUser(accessToken, refreshToken);
//            if (tokenInfo != null) {
//                // 토큰 정보 전달
//                return new ResponseEntity<TokenInfoResponse>(tokenInfo, HttpStatus.OK);
//            } else {
//                return RestExceptionUtil.messageHandling("만료된 토큰입니다.", HttpStatus.UNAUTHORIZED);
//            }
//        } catch (Exception e) {
//            return RestExceptionUtil.messageHandling("만료된 토큰입니다.", HttpStatus.UNAUTHORIZED);
//        }
//    }

    @GetMapping("/{uid}")
    public ResponseEntity<UserInfoDetailResponse> findUserInfoDetail(@PathVariable Long uid) {
        return new ResponseEntity<UserInfoDetailResponse>(userService.findUserInfoDetail(uid), HttpStatus.OK);
    }


    ////////////////////////////////////////
    ////////////////////////////////////////    실제 코드 끝
    ////////////////////////////////////////

//    @GetMapping("/{id}")
//    public ResponseEntity<UserResponse> getUser(@PathVariable("id") Long id) {
//        return ResponseEntity.ok(
//                userService.getUser(id)
//        );
//    }

//    @Autowired
//    UserInfoRepository userInfoRepository;

//    @Autowired
//    CustomOAuth2UserService customOAuth2UserService;

//    private final JwtProvider jwtProvider;
//
//    public UserInfoController(JwtProvider jwtProvider) {
//        this.jwtProvider = jwtProvider;
//    }

//    @PostMapping("/oauth2/callback")
//    public ResponseEntity<LoginResponse> googleLogIn(@RequestBody String code) {
//        OAuth2UserRequest oAuth2UserRequest = new OAuth2UserRequest();
//        OAuth2User oAuth2User = null;
//
//        return null;
////        return ResponseEntity.created(URI.create("/social-login"))
////                .body(customOAuth2UserService.processOAuth2User(oAuth2UserRequest, oAuth2User));
//    }

//    @GetMapping("/auth/check")
//    public Long check() {
//        return UserInfoJwtContextHolder.getMemberJwtToken().getUserInfoId();
//    }
//
//    @GetMapping("/token")
//    public String generateToken() throws Exception {
//        return jwtProvider.generateAccessToken(Collections.singletonMap("member_id", "1"), Duration.ofMinutes(5));
//    }


//    @GetMapping("/{nickname}/{auth}")
//    public ResponseEntity<?> signUp(@PathVariable("nickname") String nickname, @PathVariable("auth") String auth) {
//        UserInfo userInfo = new UserInfo();
//        userInfo.setAuth(auth);
//        userInfo.setNickname(nickname);
//        userInfo.setPhoto("phooto");
//        userInfo.setShippingAddress("주소");
//        userInfo.setEmail("dummy Email");
//        System.out.println("user 들어옴");
//        System.out.println("userVo.getNickname(): " + userInfo.getNickname() + " / userVo.getAuth(): " + userInfo.getAuth());
//        userInfoRepository.save(userInfo);
//
//        return new ResponseEntity<UserInfo>(userInfo, HttpStatus.OK);
//    }
//
//    @GetMapping("/{uid}")
//    public ResponseEntity<?> userInfo(@PathVariable("uid") int uid) {
//        Optional<UserInfo> userInfo = userInfoRepository.findById((long) uid);
//
//        if(userInfo.isPresent()){
//            return new ResponseEntity<UserInfo>(userInfo.get(), HttpStatus.OK);
//        }
//        else{
//            return new ResponseEntity<UserInfo>(HttpStatus.NOT_FOUND);
//        }
//    }

}
