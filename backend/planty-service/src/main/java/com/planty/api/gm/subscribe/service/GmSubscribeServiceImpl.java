package com.planty.api.gm.subscribe.service;

import com.planty.api.gm.subscribe.response.GmSubscribeDetailResponse;
import com.planty.api.gm.subscribe.response.GmSubscribeResponse;
import com.planty.common.exception.handler.CustomException;
import com.planty.common.util.LogCurrent;
import com.planty.common.util.SecurityUtil;
import com.planty.db.entity.GmInfo;
import com.planty.db.entity.PlantInfo;
import com.planty.db.entity.SubscribeProduct;
import com.planty.db.entity.UserSubscribe;
import com.planty.db.repository.GmInfoRepository;
import com.planty.db.repository.PlantyInfoRepository;
import com.planty.db.repository.SubscribeProductRepository;
import com.planty.db.repository.UserSubscribeRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import static com.planty.common.exception.handler.ErrorCode.*;

@Slf4j
@Service
@RequiredArgsConstructor
public class GmSubscribeServiceImpl implements GmSubscribeService {

    private final GmInfoRepository gmInfoRepository;
    private final SubscribeProductRepository subscribeProductRepository;
    private final UserSubscribeRepository userSubscribeRepository;
    private final PlantyInfoRepository plantyInfoRepository;

    @Override
    public List<GmSubscribeResponse> findSubscribeList() {
        List<GmSubscribeResponse> subscribeList = new ArrayList<>();
        Long gid = SecurityUtil.getCurrentGid();
        GmInfo gmInfo = gmInfoRepository.findByGid(gid)
                .orElseThrow(() -> new CustomException(GM_NOT_FOUND));
        List<SubscribeProduct> subscribeProduct = subscribeProductRepository.findByGid(gmInfo);
        for (SubscribeProduct sp : subscribeProduct) {
            List<UserSubscribe> numList = userSubscribeRepository.findBySpid(sp);
            subscribeList.add(GmSubscribeResponse.builder()
                    .spid(sp.getSpid())
                    .name(sp.getName())
                    .thumbnail(sp.getThumbnail())
                    .subscriberCnt(numList.size())
                    .period(sp.getPeriod())
                    .build()
            );
        }
        return subscribeList;
    }

    @Override
    public GmSubscribeDetailResponse findSubscribeDetail(Long spid) {
        SubscribeProduct spInfo = subscribeProductRepository.findBySpid(spid)
                .orElseThrow(() -> new CustomException(PRODUCT_NOT_FOUND));
        if (spInfo.getGid().getGid() != SecurityUtil.getCurrentGid()) { // 해당 구독 상품의 담당 그린메이트가 아닐 경우
            return null;
        }
        PlantInfo plantInfo = plantyInfoRepository.findByIdx(spInfo.getPlantInfoIdx().getIdx())
                .orElseThrow(() -> new CustomException(PLANT_NOT_FOUND));
        String plant = plantInfo.getName();
        List<UserSubscribe> numList = userSubscribeRepository.findBySpid(spInfo);
        return GmSubscribeDetailResponse.builder()
                .spid(spInfo.getSpid())
                .name(spInfo.getName())
                .thumbnail(spInfo.getThumbnail())
                .subscriberCnt(numList.size())
                .period(spInfo.getPeriod())
                .price(spInfo.getPrice())
                .level(spInfo.getLevel())
                .plant(plant)
                .consultingCnt(spInfo.getConsultingCnt())
                .build();
    }
}
