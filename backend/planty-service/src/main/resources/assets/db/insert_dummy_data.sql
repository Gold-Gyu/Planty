use planty;
INSERT INTO time_table
VALUES (1, "10:00"), (2, "10:30"), (3, "11:00"), (4, "11:30"), (5, "12:00"), (6, "12:30"), (7, "13:00"),
(8, "13:30"), (9, "14:00"), (10, "14:30"), (11, "15:00"), (12, "15:30"), (13, "16:00"), (14, "16:30"),
(15, "17:00"), (16, "17:30"), (17, "18:00"), (18, "18:30"), (19, "19:00"), (20, "19:30");

INSERT INTO gm_info(id, pw, nickname, introduce)
VALUES('ssafy', 'ssafy202', 'potato', '말하는 감자'),
('gardener', 'gardener202', 'groot', 'I am Groot');

INSERT INTO user_info(user_id, user_name, email)
VALUES('ssafyUser','초보 가드너', 'ssafy@gmail.com'), ('ssafyDevelop', '초보 개발자', 'gardener@naver.com');

INSERT INTO plant_info(name, tonic_period, size, place, edible)
VALUES('토마토', 3, '소','실내',1), ('양파', 4, '소','실내',1);

INSERT INTO subscribe_product(PLANT_INFO_idx, GM_INFO_gid, name, period, consulting_cnt, description, level, price)
VALUES(1, 1 , '한달동안 토마토 키우기', 4, 4, '토마토를 먹고 싶나요? 당장 구독하세요', 1, 50000)
,(2, 2 , '두달동안 양파 키우기', 8, 8, '양파는 좋은 식재료입니다!', 1, 80000);

INSERT INTO user_subscribe(arduino_id, USER_INFO_uid, SUBSCRIBE_PRODUCT_spid, GM_INFO_gid, consulting_remain_cnt, start_date)
VALUES(101,1,1,1,3,'2023-07-29'), (102,2,2,2,4, '2023-07-28'), (103,2,1,1,3, '2023-07-26'), (104,1,2,2,8, '2023-08-07');

INSERT INTO consulting_booking(USER_SUBSCRIBE_sid, USER_INFO_uid, GM_INFO_gid, TIME_TABLE_idx, date, cancel, active)
VALUES(1,1,1,2,"2023-08-01", 0, 1), (1,1,1,7,"2023-08-08", 0, 0),
(2,2,2,2,"2023-08-01", 0, 1), (2,2,2,3,"2023-08-03", 1, 0), (2,2,2,4,"2023-08-11", 0, 0),
(3,2,1,1,"2023-08-02", 0, 1);

INSERT INTO consulting_log(cid, RECOMMENDED_START_DATE, RECOMMENDED_END_DATE, times, content, start_time, end_time)
VALUES(1,"2023-08-11", "2023-08-18", 1, '물 plz', '2023-08-01 10:32:00', '2023-08-01 10:58:00'),
(3,"2023-08-11", "2023-08-18", 1,'햇빛 plz','2023-08-01 10:36:00', '2023-08-01 10:54:00'),
(6,"2023-08-12", "2023-08-19", 1,'물 너무 많아요', '2023-08-01 10:04:00', '2023-08-01 10:29:00');
  
INSERT INTO plant_data(arduino_id, date, time, temp, humidity, soil)
VALUES (103, '2023-08-07','11:00:00', 28.0,42.0,21.0),
(103, '2023-08-07','13:00:00', 29.0,43.0,22.0),
(103, '2023-08-07','15:00:00', 30.0,44.0,23.0),
(103, '2023-08-07','17:00:00', 31.0,45.0,24.0),
(102, '2023-08-05','20:00:00', 28.0,32.0,11.0),
(102, '2023-08-05','22:00:00', 29.0,33.0,12.0),
(102, '2023-08-06','00:00:00', 30.0,34.0,13.0),
(102, '2023-08-06','02:00:00', 31.0,35.0,14.0),
(101, '2023-08-02','20:00:00', 22.0,32.0,15.0),
(101, '2023-08-02','22:00:00', 23.0,33.0,2.0),
(101, '2023-08-02','00:00:00', 24.0,34.0,3.0),
(101, '2023-08-03','02:00:00', 25.0,35.0,4.0);
  
-- [user_subscribe_list -> [user_subscribe, subscribe_product, plant_info, gm_info] join view / 사용자 구독 목록 리스트]
-- Create View view_user_subscribe AS
-- select  us.sid, us.USER_INFO_uid as uid, us.arduino_id, us.consulting_remain_cnt,
-- us.start_date, us.end_date,
-- sp.name as sp_name, sp.period, sp.consulting_cnt, sp.description,
-- pi.name as pi_name, pi.tonic_period, gm.nickname, cb.date as cb_date, cb.TIME_TABLE_idx as cb_time, cb.cancel, cb.active
-- from subscribe_product sp
-- join gm_info gm
-- on 	gm.gid = sp.GM_INFO_gid
-- join user_subscribe us
-- on us.SUBSCRIBE_PRODUCT_spid = sp.spid
-- join plant_info pi
-- on pi.idx = sp.PLANT_INFO_idx
-- left join consulting_booking cb
-- on us.sid = cb.USER_SUBSCRIBE_sid and
-- cb.cid in (select max(cid) from consulting_booking 
-- group by USER_SUBSCRIBE_sid) order by us.sid;

-- desc view_user_subscribe;
-- SELECT * FROM planty.view_user_subscribe;

-- consulting_booking -> sid 접근
select *
from consulting_booking
where USER_SUBSCRIBE_sid = 2;

-- plant_data -> arduino id 접근
select *
from plant_data
where arduino_id = 21;

-- [view_user_consulting -> [consulting_booking, consulting_log, user_subscribe, subscribe_product] join view / 사용자 예약 목록 리스트]
-- Create View view_user_consulting AS
-- select cb.USER_INFO_uid as uid, us.sid, cb.cid, cb.TIME_TABLE_idx as time, cb.date, cb.cancel, cb.active,
-- sp.name, cl.RECOMMENDED_START_DATE, cl.RECOMMENDED_END_DATE, cl.content, cl. start_time, cl.end_time
-- from consulting_booking cb
-- left join consulting_log cl
-- on cb.cid = cl.cid
-- join user_subscribe us
-- on cb.USER_SUBSCRIBE_sid = us.sid
-- join subscribe_product sp
-- on us.SUBSCRIBE_PRODUCT_spid = sp.spid
-- order by cb.cid;

SELECT * FROM planty.view_user_consulting
where sid = 2;

SELECT * FROM planty.view_user_subscribe
where uid = 1;

select * from consulting_booking cb where cb.cid in (select max(cid) from consulting_booking
group by USER_SUBSCRIBE_sid) and cb.user_info_uid = 2;

select * from consulting_booking where cid in (select max(cid) from consulting_booking 
group by USER_SUBSCRIBE_sid) and user_info_uid = 2 and USER_SUBSCRIBE_sid = 3;

select * from plant_data where arduino_id = 21;
-- 일간통계
SELECT date, avg(temp), avg(humidity), avg(soil)
FROM plant_data
where arduino_id = 102
GROUP BY date;

SELECT *
FROM plant_data
where arduino_id = 101;

-- 주간통계
-- SELECT DATE_FORMAT(DATE_SUB(date, INTERVAL (DAYOFWEEK(date)-1) DAY), '%Y/%m/%d') as start,
--        DATE_FORMAT(DATE_SUB(date, INTERVAL (DAYOFWEEK(date)-7) DAY), '%Y/%m/%d') as end,
--        DATE_FORMAT(date, '%Y%U') AS `date`,
--        avg(temp)
-- FROM plant_data
-- where arduino_id = 21
-- GROUP BY date;

-- 월간통계
-- SELECT MONTH(date),
--        avg(temp)
-- FROM plant_data
-- where arduino_id = 21
-- GROUP BY date;

