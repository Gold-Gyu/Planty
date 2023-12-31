package com.planty.db.entity;

import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@ToString
@Getter
@Setter
@Builder
@AllArgsConstructor
@RequiredArgsConstructor
@DynamicInsert
@DynamicUpdate
@Table(name = "consulting_booking")
@Entity
public class ConsultingBooking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cid", nullable = false) // 컨설팅 예약 식별키
    private Long cid;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(referencedColumnName = "sid", name = "USER_SUBSCRIBE_sid") // 사용자 구독정보 식별키
    private UserSubscribe sid;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(referencedColumnName = "uid", name = "USER_INFO_uid") // 사용자 식별키
    private UserInfo uid;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(referencedColumnName = "gid", name = "GM_INFO_gid") // GM 식별키
    private GmInfo gid;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(referencedColumnName = "idx", name = "TIME_TABLE_idx") // 시간 식별키
    private TimeTable timeIdx;

    @Column(name = "date", length = 128) // 예약 날짜
    private String date;

    @Column(name = "cancel") // 취소여부. 취소(1), 미취소(0)
    private Boolean cancel;

    @Column(name = "active") // 실행여부. 실행(1), 미실행(0)
    private Boolean active;

    @Column(name = "connection", length = 512) // OpenVidu Session Token
    private String connection;

}
