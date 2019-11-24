/* create 기록 */
create table TEST_LOG( 
    log_seq number(4) primary key, -- 로그 시퀀스
    license_name VARCHAR2(30), -- 자격증 이름
    license_abbreviation VARCHAR2(10), -- 자격증 약어
    year_date DATE, -- 기출년도
    subject_names VARCHAR2(150), -- 과목들의 이름 - ex) 데이터베이스/전자계산기 구조/운영체제/소프트웨어 공학/데이터통신
    subject_ranges VARCHAR2(50), -- 과목들의 문제범위 - ex) 1~20/21~40/41~60/61~80/81~100
    test_answer VARCHAR2(1000), -- /1:1:O/2:1:X/5:1:O/... (번호:답안:정답)
    log_time CHAR(8), -- 시험시간 or 남은시간
    submityn CHAR(1) default 'N', -- 제출 여부 (Y면 제출, N이면 미제출)
    log_date TIMESTAMP default SYSTIMESTAMP, -- 마지막 기록 날짜
    id VARCHAR2(50) -- 사용자 ID
); /* 정보처리기사 EIP(Engineer Information Processing)*/

CREATE SEQUENCE log_seq START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999;

commit;



drop table test_log;
drop SEQUENCE log_seq;




select * from test_log;
update test_log set test_answer='/1:3/';




INSERT INTO TEST_LOG ()
VALUES(log_seq.);

