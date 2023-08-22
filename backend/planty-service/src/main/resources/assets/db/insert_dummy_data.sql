use planty;
INSERT INTO time_table
VALUES (1, "10:00"), (2, "10:30"), (3, "11:00"), (4, "11:30"), (5, "12:00"), (6, "12:30"), (7, "13:00"),
(8, "13:30"), (9, "14:00"), (10, "14:30"), (11, "15:00"), (12, "15:30"), (13, "16:00"), (14, "16:30"),
(15, "17:00"), (16, "17:30"), (17, "18:00"), (18, "18:30"), (19, "19:00"), (20, "19:30");

INSERT INTO gm_info(id, pw, nickname, introduce, activate)
VALUES('greenmate1', 'greenmate1', '식물왕 전식물', '안녕하세요. 당신의 식물이 잘! 자랄 수 있도록 도와드릴게요.', 0),
('greenmate2', 'greenmate2', '김드루이드', '드루이드와 함께 식물을 건강하게', 1),
('greenmate3', 'greenmate3', '식물마스터', '안녕하세요 플랜티 그린메이트입니다.', 1),
('greenmate4', 'greenmate4', '식물선인', '안녕하세요 플랜티 그린메이트입니다.', 1),
('greenmate5', 'greenmate5', '초록손', '안녕하세요 플랜티 그린메이트입니다.', 1),
('greenmate6', 'greenmate6', '식물헌터', '안녕하세요 플랜티 그린메이트입니다.', 1),
('greenmate7', 'greenmate7', '녹색전문가', '안녕하세요 플랜티 그린메이트입니다.', 1),
('greenmate8', 'greenmate8', '식물바이블', '안녕하세요 플랜티 그린메이트입니다.', 1),
('greenmate9', 'greenmate9', '식물매직', '안녕하세요 플랜티 그린메이트입니다.', 1),
('greenmate10', 'greenmate10', '식물위즈', '안녕하세요 플랜티 그린메이트입니다.', 1),
('greenmate11', 'greenmate11', '식물마법사', '안녕하세요 플랜티 그린메이트입니다.', 1),
('greenmate12', 'greenmate12', '식물마음', '안녕하세요 플랜티 그린메이트입니다.', 1),
('greenmate13', 'greenmate13', '식물탐험가', '안녕하세요 플랜티 그린메이트입니다.', 1),
('greenmate14', 'greenmate14', '녹색의달인', '안녕하세요 플랜티 그린메이트입니다.', 1),
('greenmate15', 'greenmate15', '식물의달', '안녕하세요 플랜티 그린메이트입니다.', 1),
('greenmate16', 'greenmate16', '식물박사', '안녕하세요 플랜티 그린메이트입니다.', 1);

INSERT INTO user_info(nickname, username, email, `password`, shipping_address, photo)
VALUES ('gardener1','초보 가드너', 'sunflower1@gmail.com', "1q2w3e4r!!", "광주 광산구 하남산단6번로 107", "https://github.com/ycjeon0129/algorithm-problem-solving/assets/79627716/80325b49-8d30-4a49-b13b-dd0261b89a88"),
('develop1', '초보 개발자', 'gardener1@naver.com', "1q2w3e4r!!","서울 강남구 테헤란로 212", "https://github.com/ycjeon0129/algorithm-problem-solving/assets/79627716/7cecbbae-739e-428a-a8c7-632dc5c8b97e");

INSERT INTO user_info(nickname, username, email, `password`)
VALUES ('gardener2','김씨네 아빠', 'sunflower2@gmail.com', "1q2w3e4r!!"), ('develop2', '수완동 보안관', 'gardener2@naver.com', "1q2w3e4r!!"),
('gardener3','초보 가드너3', 'sunflower3@gmail.com', "1q2w3e4r!!"), ('develop3', '초보 개발자3', 'gardener3@naver.com', "1q2w3e4r!!"),
('gardener4','초보 가드너4', 'sunflower4@gmail.com', "1q2w3e4r!!"), ('develop4', '초보 개발자4', 'gardener4@naver.com', "1q2w3e4r!!"),
('gardener5','초보 가드너5', 'sunflower5@gmail.com', "1q2w3e4r!!"), ('develop5', '초보 개발자5', 'gardener5@naver.com', "1q2w3e4r!!");

INSERT INTO plant_info(name, tonic_period, size, place, eatable)
VALUES ('바질', 4, 0, 1, 1), ('파슬리', 4, 0, 1, 1), ('토마토', 3, 1, 1, 1), ('래몬', 12, 1, 2, 1), ('라즈베리', 12, 1, 2, 1), 
('스킨답서스', 24, 3, 1, 0), ('아이비', 8, 1, 2, 0), ('소철', 12, 3, 2, 0);

INSERT INTO subscribe_product(PLANT_INFO_idx, GM_INFO_gid, name, period, consulting_cnt, description, level, price, thumbnail)
VALUES(1, 1 , '식린이를 위한 바질 클래스', 12, 4, '식린이라도 걱정하지 마세요! 물만 줘도 잘 자라는 바질과 함께라면 가드너로서 자신감 뿜뿜!!', 1, 20000, "https://github.com/ycjeon0129/algorithm-problem-solving/assets/79627716/d7631a82-1cec-453c-acbd-e440c3510845"),
(2, 2 , '요리사에게 찰떡 파슬리 키우기', 12, 4, '요리를 좋아하신다구요? 찬장에 향신료 3종 이상이라구요? 그렇다면 당장 구독하세요!', 2, 22000, "https://github.com/ycjeon0129/algorithm-problem-solving/assets/79627716/422d4e8d-3696-4a90-8c90-f5cdaf66fefb"),
(3, 3 , '나는야 케찹될꺼야', 24, 4, '멋쟁이 토마토', 3, 25000, "https://github.com/ycjeon0129/algorithm-problem-solving/assets/79627716/9e0485d8-b93a-477b-afd7-90a78ed75843"),
(4, 1 , '상큼한 시트러스, 레몬', 24, 4, '새콤달콤 매력적이야', 4, 29000, "https://github.com/ycjeon0129/algorithm-problem-solving/assets/79627716/cebbfe7d-5db7-4286-945b-5c7965c650fa"),
(5, 1 , '난이도 상 보람 상, 라즈베리', 52, 6, '우리에게 산딸기로도 알려진 라즈베리. 건강 식품의 대표주자입니다. 난이도가 높은 만큼 보람도 업! 라즈베리 클래스에요.', 5, 39000, "https://github.com/ycjeon0129/algorithm-problem-solving/assets/79627716/82059ab2-4119-4363-bd50-a2f00a70d45a"),
(6, 2 , '가장 사랑받는 식물, 스킨답서스!', 24, 6, '초보 가드너도 손쉽게 키울 수 있는 식물을 찾으신다구요? 여기에요 에기~', 1, 25000, "https://github.com/ycjeon0129/algorithm-problem-solving/assets/79627716/471a8afd-5cc5-41b6-abba-b89d750349a9"),
(7, 1 , '공기정화 식물 아이비', 24, 8, '아이비와 함께라면 미세먼지 걱정 끝', 3, 34000, "https://github.com/ycjeon0129/algorithm-problem-solving/assets/79627716/b5be6e7f-b21c-4bed-a9e7-2eb835b5872d"),
(8, 3 , '휴양지 느낌 물씬, 소철', 52, 8, '휴양지의 대표 식물 소철을 직접 키워보세요!', 5, 40000, "https://github.com/ycjeon0129/algorithm-problem-solving/assets/79627716/8389dae3-a019-4f98-8ecf-febef4cfea64");

-- gid가 1인 유저 구독 정보
INSERT INTO user_subscribe(arduino_id, USER_INFO_uid, SUBSCRIBE_PRODUCT_spid, GM_INFO_gid, consulting_remain_cnt, start_date)
VALUES(101,1,1,1,2,'2023-05-27'), (102,2,5,1,3,'2023-05-30'), (103,3,7,1,5,'2023-06-05'), (104,4,1,1,3, '2023-06-07'), (105,5,5,1,4, '2023-06-07'), 
(106,6,7,1,6, '2023-06-08'), (107,7,1,1,3, '2023-06-09'), (108,9,1,1,3, '2023-06-10'), (109,1,5,1,4, '2023-06-12'), (110,2,1,1,4, '2023-06-18'),
(111,10,5,1,5, '2023-06-27'), (112,8,7,1,7, '2023-06-29'), (113,3,5,1,5, '2023-07-08'), (114,5,7,1,8, '2023-07-17'), (115,4,7,1,8, '2023-07-18'), (116,1,4,1,4,'2023-08-15');

-- 일자가 지나서 정상 처리, 취소처리(sid:9), 노쇼처리(sid:20), 발표 당일 기준 예약만 한 값 (sid:22) 
INSERT INTO consulting_booking(USER_SUBSCRIBE_sid, USER_INFO_uid, TIME_TABLE_idx, GM_INFO_gid, date, cancel, active, connection)
VALUES (1,1,1,1,"2023-05-26", 0, 1, "ses"), (2,2,5,1,"2023-05-31", 0, 1, "ses"), (3,3,10,1,"2023-06-06", 0, 1, "ses"), (4,4,12,1,"2023-06-10", 0, 1, "ses"),
(5,5,1,1,"2023-06-11", 0, 1, "ses"), (6,6,5,1,"2023-06-16", 0, 1, "ses"), (2,2,15,1,"2023-06-17", 0, 1, "ses"), (3,3,8,1,"2023-06-18", 0, 1, "ses"),
(1,1,10,1,"2023-06-18", 1, 0, null), (5,5,12,1,"2023-06-20", 0, 1, "ses"), (6,6,5,1,"2023-06-21", 0, 1, "ses"), (7,7,6,1,"2023-06-22", 0, 1, "ses"),
(8,9,16,1,"2023-06-25", 0, 1, "ses"), (9,1,18,1,"2023-06-25", 0, 1, "ses"), (11,10,1,1,"2023-06-28", 0, 1, "ses"), (12,8,6,1,"2023-06-29", 0, 1, "ses"),
(13,3,16,1,"2023-07-10", 0, 1, "ses"), (2,2,2,1,"2023-07-12", 0, 1, "ses"), (3,3,3,1,"2023-07-12", 0, 1, "ses"), (9,1,2,1,"2023-07-15", 0, 0, null),
(1,1,12,1,"2023-07-22", 0, 1, "ses"), (16, 1, 16, 1, "2023-08-18", 0, 0, null), (3, 3, 6, 1, "2023-08-20", 0, 0, null), (4, 4, 1, 1, "2023-08-22", 0, 0, null);


INSERT INTO consulting_log(cid, RECOMMENDED_START_DATE, RECOMMENDED_END_DATE, times, content, start_time, end_time)
VALUES(1,"2023-06-11", "2023-06-18", 1, '전반적으로 잘 시작하셨어요. 채광에 조금만 더 신경 써 주세요.', '2023-05-26 10:01:21', '2023-05-26 10:28:29'),
(2,"2023-06-11", "2023-06-18", 1, '물을 조금 더 과감하게 주세요!', '2023-05-31 12:00:25', '2023-05-31 12:26:22'),
(3,"2023-06-11", "2023-06-18", 1, '좋은 시작이에요. 습도에 유의해주세요.', '2023-06-06 14:35:05', '2023-06-06 14:59:22'),
(4,"2023-08-11", "2023-08-20", 1, '씨앗을 조금 더 깊숙히 심어주세요!', '2023-06-10 15:35:05', '2023-06-10 15:59:22'),
(5,"2023-06-11", "2023-06-20", 1, '온도에 예민한 식물이에요.', '2023-06-11 10:05:05', '2023-06-11 10:29:22'),
(6,"2023-06-15", "2023-06-25", 1, '새싹에 먼지를 잘 닦아주세요.', '2023-06-16 12:03:12', '2023-06-16 12:24:25'),
(7,"2023-07-10", "2023-07-20", 2, '물을 적당히 잘 주고 계세요.', '2023-06-17 17:03:12', '2023-06-17 17:24:25'),
(8,"2023-07-10", "2023-07-20", 2, '습도가 너무 높아요 :<', '2023-06-18 13:33:12', '2023-06-18 13:54:25'),
(10,"2023-08-10", "2023-08-20", 2, '적정 온도를 잘 유지하고 있어요 :D', '2023-06-20 15:33:12', '2023-06-20 15:54:25'),
(11,"2023-08-10", "2023-08-20", 2, '화분 관리를 잘 하고 계세요', '2023-06-21 12:04:14', '2023-06-21 12:25:25'),
(12,"2023-08-15", "2023-08-25", 1, '떡잎 나오고 3일이 가장 중요해요', '2023-06-22 12:34:14', '2023-06-22 12:55:25'),
(13,"2023-08-15", "2023-08-25", 1, '난이도가 높은 식물이니 신경 많이 써주세요', '2023-06-25 17:34:14', '2023-06-25 17:55:25'),
(14,"2023-08-15", "2023-08-25", 1, '열매를 맺기까지 오래 걸리니 인내심을 가져주세요', '2023-06-25 18:34:14', '2023-06-25 18:55:25'),
(15,"2023-08-20", "2023-08-30", 1, '어려운 식물이니 각오해야해요', '2023-06-28 11:04:14', '2023-06-28 11:25:25'),
(16,"2023-08-20", "2023-08-30", 1, '넓게 뿌리는 식물이니 위치 선정이 중요해요', '2023-06-29 12:31:53', '2023-06-29 12:58:11'),
(17,"2023-09-02", "2023-09-12", 1, '겨울에 열매를 맺기까지 많은 노력이 필요해요', '2023-07-10 17:31:53', '2023-07-10 17:58:11'),
(18,"2023-09-02", "2023-09-12", 3, '벌써 반절이에요. 지금처럼만 해주세요', '2023-07-12 10:31:53', '2023-07-12 10:58:11'),
(19,"2023-09-02", "2023-09-12", 3, '습도 관리에 유념해주세요', '2023-07-12 11:01:53', '2023-07-12 11:28:11'),
(21,"2023-09-02", "2023-09-12", 3, '인 부족 증상이 보여요. 영양제를 보충해주세요', '2023-07-22 15:31:53', '2023-07-22 15:58:11');


INSERT INTO emergency_log(USER_INFO_uid, GM_INFO_gid, name, type, content, request_time, start_time, end_time, connection)
VALUES(1, 1, "다육이", 1, '놔두면 잘 큽니다', '2023-08-01 10:30:04', '2023-08-01 10:32:12', '2023-08-01 10:58:34', null),
      (2, 1, "동충하초", 1, '여름되면 잘 자랍니다', '2023-08-03 10:03:42', '2023-08-03 10:04:43', '2023-08-03 10:29:23', null),
      (1, 1, "소나무", 1, '햇빛을 더 신경써주세요', '2023-08-13 10:36:21', '2023-08-13 10:36:45', '2023-08-13 10:54:23', null);
  
INSERT INTO plant_data(arduino_id, date, time, temp, humidity, soil)
VALUES (101, '2023-08-01','12:00:00', 24.0,45.0,32.0),
(101, '2023-08-01','16:00:00', 22.0,46.0,30.0),
(101, '2023-08-01','20:00:00', 25.0,50.0,33.0),
(101, '2023-08-02','00:00:00', 23.0,45.0,28.0),
(101, '2023-08-02','04:00:00', 25.0,45.0,30.0),
(101, '2023-08-02','08:00:00', 26.0,46.0,29.0),
(101, '2023-08-02','12:00:00', 27.0,48.0,28.0),
(101, '2023-08-02','16:00:00', 25.0,45.0,27.0),
(101, '2023-08-02','20:00:00', 26.0,46.0,26.0),
(101, '2023-08-03','00:00:00', 21.0,48.0,28.0),
(101, '2023-08-03','04:00:00', 23.0,49.0,30.0),
(101, '2023-08-03','08:00:00', 25.0,50.0,29.0),
(101, '2023-08-03','12:00:00', 27.0,52.0,28.0),
(101, '2023-08-03','16:00:00', 25.0,53.0,27.0),
(101, '2023-08-03','20:00:00', 28.0,56.0,26.0),
(101, '2023-08-04','00:00:00', 26.0,45.0,30.0),
(101, '2023-08-04','04:00:00', 28.0,46.0,35.0),
(101, '2023-08-04','08:00:00', 28.0,47.0,55.0),
(101, '2023-08-04','12:00:00', 26.0,52.0,56.0),
(101, '2023-08-04','16:00:00', 25.0,53.0,60.0),
(101, '2023-08-04','20:00:00', 24.0,54.0,60.0),
(101, '2023-08-05','00:00:00', 23.0,45.0,50.0),
(101, '2023-08-05','04:00:00', 25.0,45.0,55.0),
(101, '2023-08-05','08:00:00', 26.0,46.0,51.0),
(101, '2023-08-05','12:00:00', 27.0,48.0,52.0),
(101, '2023-08-05','16:00:00', 25.0,45.0,53.0),
(101, '2023-08-05','20:00:00', 26.0,46.0,52.0),
(101, '2023-08-06','00:00:00', 25.0,45.0,45.0),
(101, '2023-08-06','04:00:00', 26.0,45.0,42.0),
(101, '2023-08-06','08:00:00', 27.0,46.0,40.0),
(101, '2023-08-06','12:00:00', 25.0,48.0,43.0),
(101, '2023-08-06','16:00:00', 26.0,45.0,46.0),
(101, '2023-08-06','20:00:00', 25.0,46.0,48.0),
(101, '2023-08-07','00:00:00', 24.0,40.0,38.0),
(101, '2023-08-07','04:00:00', 22.0,38.0,37.0),
(101, '2023-08-07','08:00:00', 23.0,37.0,35.0),
(101, '2023-08-07','12:00:00', 22.0,35.0,36.0),
(101, '2023-08-07','16:00:00', 23.0,36.0,38.0),
(101, '2023-08-07','20:00:00', 21.0,37.0,39.0),
(101, '2023-08-05','00:00:00', 23.0,35.0,35.0),
(101, '2023-08-05','04:00:00', 21.0,33.0,33.0),
(101, '2023-08-05','08:00:00', 22.0,32.0,32.0),
(101, '2023-08-05','12:00:00', 20.0,35.0,31.0),
(101, '2023-08-05','16:00:00', 22.0,35.0,33.0),
(101, '2023-08-05','20:00:00', 23.0,35.0,34.0),

(109, '2023-08-01','12:00:00', 24.0,45.0,32.0),
(109, '2023-08-01','16:00:00', 22.0,46.0,30.0),
(109, '2023-08-01','20:00:00', 25.0,50.0,33.0),
(109, '2023-08-02','00:00:00', 23.0,45.0,28.0),
(109, '2023-08-02','04:00:00', 25.0,45.0,30.0),
(109, '2023-08-02','08:00:00', 26.0,46.0,29.0),
(109, '2023-08-02','12:00:00', 27.0,48.0,28.0),
(109, '2023-08-02','16:00:00', 25.0,45.0,27.0),
(109, '2023-08-02','20:00:00', 26.0,46.0,26.0),
(109, '2023-08-03','00:00:00', 21.0,48.0,28.0),
(109, '2023-08-03','04:00:00', 23.0,49.0,30.0),
(109, '2023-08-03','08:00:00', 25.0,50.0,29.0),
(109, '2023-08-03','12:00:00', 27.0,52.0,28.0),
(109, '2023-08-03','16:00:00', 25.0,53.0,27.0),
(109, '2023-08-03','20:00:00', 28.0,56.0,26.0),
(109, '2023-08-04','00:00:00', 26.0,45.0,30.0),
(109, '2023-08-04','04:00:00', 28.0,46.0,35.0),
(109, '2023-08-04','08:00:00', 28.0,47.0,32.0),
(109, '2023-08-04','12:00:00', 26.0,52.0,31.0),
(109, '2023-08-04','16:00:00', 25.0,53.0,28.0),
(109, '2023-08-04','20:00:00', 24.0,54.0,27.0),
(109, '2023-08-05','00:00:00', 23.0,45.0,55.0),
(109, '2023-08-05','04:00:00', 25.0,45.0,55.0),
(109, '2023-08-05','08:00:00', 26.0,46.0,51.0),
(109, '2023-08-05','12:00:00', 27.0,48.0,52.0),
(109, '2023-08-05','16:00:00', 25.0,45.0,53.0),
(109, '2023-08-05','20:00:00', 26.0,46.0,52.0),
(109, '2023-08-06','00:00:00', 25.0,45.0,45.0),
(109, '2023-08-06','04:00:00', 26.0,45.0,42.0),
(109, '2023-08-06','08:00:00', 27.0,46.0,40.0),
(109, '2023-08-06','12:00:00', 25.0,48.0,43.0),
(109, '2023-08-06','16:00:00', 26.0,45.0,46.0),
(109, '2023-08-06','20:00:00', 25.0,46.0,48.0),
(109, '2023-08-07','00:00:00', 24.0,40.0,38.0),
(109, '2023-08-07','04:00:00', 22.0,38.0,37.0),
(109, '2023-08-07','08:00:00', 23.0,37.0,35.0),
(109, '2023-08-07','12:00:00', 22.0,35.0,36.0),
(109, '2023-08-07','16:00:00', 23.0,36.0,38.0),
(109, '2023-08-07','20:00:00', 21.0,37.0,39.0),
(109, '2023-08-05','00:00:00', 23.0,35.0,35.0),
(109, '2023-08-05','04:00:00', 21.0,33.0,33.0),
(109, '2023-08-05','08:00:00', 22.0,32.0,32.0),
(109, '2023-08-05','12:00:00', 20.0,35.0,31.0),
(109, '2023-08-05','16:00:00', 22.0,35.0,33.0),
(109, '2023-08-05','20:00:00', 23.0,35.0,34.0),

(116, '2023-08-15','12:00:00', 24.0,45.0,52.0),
(116, '2023-08-15','16:00:00', 22.0,46.0,50.0),
(116, '2023-08-15','20:00:00', 25.0,50.0,53.0),
(116, '2023-08-16','00:00:00', 23.0,45.0,58.0),
(116, '2023-08-16','04:00:00', 25.0,45.0,50.0),
(116, '2023-08-16','08:00:00', 26.0,46.0,59.0),
(116, '2023-08-16','12:00:00', 27.0,48.0,58.0),
(116, '2023-08-16','16:00:00', 25.0,45.0,57.0),
(116, '2023-08-16','20:00:00', 26.0,46.0,56.0),
(116, '2023-08-17','00:00:00', 21.0,48.0,78.0),
(116, '2023-08-17','04:00:00', 23.0,49.0,70.0),
(116, '2023-08-17','08:00:00', 25.0,50.0,79.0),
(116, '2023-08-17','12:00:00', 27.0,52.0,78.0),
(116, '2023-08-17','16:00:00', 25.0,53.0,77.0),
(116, '2023-08-17','20:00:00', 28.0,56.0,76.0),
(116, '2023-08-18','00:00:00', 26.0,45.0,70.0),
(116, '2023-08-18','04:00:00', 28.0,46.0,65.0),
(116, '2023-08-18','08:00:00', 28.0,47.0,68.0),
(116, '2023-08-18','12:00:00', 26.0,52.0,61.0);

INSERT INTO ticket_product (name, count, price)
VALUES ("1회 이용권", 1, 9900),
       ("3회 이용권", 3, 24000),
       ("5회 이용권", 5, 36000),
       ("10회 이용권", 10, 59000);
