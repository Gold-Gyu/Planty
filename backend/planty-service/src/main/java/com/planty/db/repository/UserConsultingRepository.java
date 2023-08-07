package com.planty.db.repository;

import com.planty.db.entity.ConsultingBooking;
import com.planty.db.entity.ConsultingBookingUserMapping;
import com.planty.db.entity.UserInfo;
import com.planty.db.entity.ViewUserConsulting;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface UserConsultingRepository extends JpaRepository<ViewUserConsulting, Long> {
    List<ViewUserConsulting> findByUid(Integer userId);
    List<ViewUserConsulting> findBySid(Integer sid);
    @Query(value = "select cb from ConsultingBooking cb where cb.cid in (select max(cid) from ConsultingBooking group by sid) and cb.uid = :uid")
    List<ConsultingBooking> findConsultingBooking(@Param("uid") UserInfo uid);

}