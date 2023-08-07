package com.planty.api.consulting.service;

import com.planty.api.consulting.response.UserConsultingResponse;
import com.planty.db.entity.ViewUserConsulting;
import com.planty.db.repository.UserConsultingRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ConsultingServiceImpl implements ConsultingService {
    private final UserConsultingRepository userConsultingRepository;
    @Override
    public List<UserConsultingResponse> getUserConsultingUid(Integer userId) {
        List<UserConsultingResponse> consultingList = new ArrayList<>();
        List<ViewUserConsulting> list = userConsultingRepository.findByUid(userId);
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

    @Override
    public List<UserConsultingResponse> getUserConsultingDetail(Integer sid) {
        List<UserConsultingResponse> consultingListDetail = new ArrayList<>();

        List<ViewUserConsulting> list = userConsultingRepository.findBySid(sid);
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
