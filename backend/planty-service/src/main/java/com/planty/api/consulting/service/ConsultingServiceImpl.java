package com.planty.api.consulting.service;

import com.planty.api.consulting.response.UserConsultingResponse;
import com.planty.common.exception.handler.ExceptionHandler;
import com.planty.common.util.SecurityUtil;
import com.planty.db.entity.*;
import com.planty.db.repository.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static com.planty.common.util.LogCurrent.*;
import static com.planty.common.util.LogCurrent.START;

@Slf4j
@Service
@RequiredArgsConstructor
public class ConsultingServiceImpl implements ConsultingService {
    private final ViewUserConsultingRepository viewUserConsultingRepository;
    private final UserInfoRepository userInfoRepository;
    private final TimeTableRepository timeTableRepository;
    private final UserSubscribeRepository userSubscribeRepository;
    private final ConsultingBookingRepository consultingBookingRepository;
    private final GmInfoRepository gmInfoRepository;
    @Override // 사용자 컨설팅 조회
    public List<UserConsultingResponse> getUserConsultingUid() {
        log.info(logCurrent(getClassName(), getMethodName(), START));
        String email = SecurityUtil.getCurrentUserEmail();
        UserInfo user = userInfoRepository.findByUserEmail(email)
                .orElseThrow(() -> new NullPointerException(ExceptionHandler.USER_NOT_FOUND));

        List<UserConsultingResponse> consultingList = new ArrayList<>();
        List<ViewUserConsulting> list = viewUserConsultingRepository.findByUid(user.getUid());
        for(ViewUserConsulting item : list) {
            UserConsultingResponse consult = UserConsultingResponse.builder()
                    .cid(item.getCid())
                    .sid(item.getSid())
                    .time(item.getTime())
                    .date(item.getDate())
                    .cancel(item.getCancel())
                    .active(item.getActive())
                    .subscribeProductName(item.getName())
                    .recommendedStartDate(item.getRecommendedStartDate())
                    .recommendedEndDate(item.getRecommendedEndDate())
                    .advice(item.getContent())
                    .startTime(item.getStartTime())
                    .endTime(item.getEndTime())
                    .build();
            consultingList.add(consult);
        }
        return consultingList;
    }

    @Override // 사용자 컨설팅 상세 조회
    public List<UserConsultingResponse> getUserConsultingDetail(Long sid) {
        log.info(logCurrent(getClassName(), getMethodName(), START));
        String email = SecurityUtil.getCurrentUserEmail();
        UserInfo user = userInfoRepository.findByUserEmail(email)
                .orElseThrow(() -> new NullPointerException(ExceptionHandler.USER_NOT_FOUND));

        UserSubscribe userSubscribe = userSubscribeRepository.findByUidAndSid(user, sid)
                .orElseThrow(() -> new NullPointerException(ExceptionHandler.USER_SID_NOT_FOUND));

        List<UserConsultingResponse> consultingListDetail = new ArrayList<>();

        List<ViewUserConsulting> list = viewUserConsultingRepository.findByUidAndSid(user.getUid(), sid);
        //todo : list 없을때 -> 204 , 유저의 sid 가 없을때 -> null 처리 (500) 바꿔야됨
        for(ViewUserConsulting item : list) {
            UserConsultingResponse consult = UserConsultingResponse.builder()
                    .cid(item.getCid())
                    .sid(sid)
                    .time(item.getTime())
                    .date(item.getDate())
                    .cancel(item.getCancel())
                    .active(item.getActive())
                    .subscribeProductName(item.getName())
                    .recommendedStartDate(item.getRecommendedStartDate())
                    .recommendedEndDate(item.getRecommendedEndDate())
                    .advice(item.getContent())
                    .startTime(item.getStartTime())
                    .endTime(item.getEndTime())
                    .build();
            consultingListDetail.add(consult);
        }
        return consultingListDetail;
    }
}
