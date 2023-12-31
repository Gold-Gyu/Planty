package com.planty.db.entity;

import javax.persistence.*;

import com.planty.common.enums.Role;
import lombok.*;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

@ToString
@Getter
@Setter
@Builder
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@DynamicInsert
@DynamicUpdate
@Table(name = "gm_info")
@Entity
public class GmInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "gid", nullable = false) // 식별키
    private Long gid;

    @NonNull
    @Column(name ="id", length = 16, nullable = false) // 아이디
    private String id;

    @NonNull
    @Column(name ="pw", length = 128, nullable = false) // 비밀번호
    private String pw;

    @NonNull
    @Column(name = "nickname", length = 16, nullable = false) // 닉네임
    private String nickname;

    @Column(name = "introduce", length = 128, nullable = true) // 자기소개
    private String introduce;

    @Column(name = "activate") // 활성화 상태
    @ColumnDefault("0")
    private Boolean activate; // 'GM 활성화 상태. 활성화(1), 비활성화(0)',
}