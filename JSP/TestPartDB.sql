/* ==== info ==== */
/* ---- create ---- */
create table test_license ( -- 자격증 테이블
    license_seq  number(4) primary key,
    license_name VARCHAR2(30) NOT NULL UNIQUE, -- 자격증 이름
    license_abbreviation  VARCHAR2(10) NOT NULL UNIQUE -- 자격증 축약어
);

create table test_year( -- 기출년도 테이블
    year_seq number(4) primary key, -- 시퀀스 번호
    license_name VARCHAR2(30) REFERENCES test_license(license_name), -- 자격증 이름 (외래키)
    year_date DATE NOT NULL -- 기출년도 (년/월/일)
);

create table test_subject ( -- 과목 테이블
    subject_seq number(4) primary key, -- 시퀀스 번호
    subject_names VARCHAR2(150), -- 과목들의 이름 - ex) 데이터베이스/전자계산기 구조/운영체제/소프트웨어 공학/데이터통신
    subject_ranges VARCHAR2(50), -- 과목들의 문제범위 - ex) 1~20/21~40/41~60/61~80/81~100
    subject_numbers VARCHAR2(30), -- 과목들의 문제수 - ex) 20/20/20/20/20
    subject_total NUMBER(5), -- 과목수
    subject_time CHAR(8), -- 시험 시간
    subject_revision DATE, -- 시험 개정년도
    license_name VARCHAR2(30) REFERENCES test_license(license_name) -- 자격증 이름 (외래키) 
);

/*　자동증가 시퀀스 */
CREATE SEQUENCE license_seq START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999;
CREATE SEQUENCE year_seq START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999;
CREATE SEQUENCE subject_seq START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999;



/* ---- insert ---- */
/* 자격증 insert <자격증 이름, 자격증 약어>*/
insert into test_license values(license_seq.NEXTVAL, '정보처리기사', 'EIP');
insert into test_license values(license_seq.NEXTVAL, '리눅스마스터 1급', 'LM1');

/* 기출 년도 insert <번호, 년도, 자격증 이름> */
insert into test_year values(year_seq.NEXTVAL,'정보처리기사', '2019/03/03');
insert into test_year values(year_seq.NEXTVAL,'정보처리기사', '2019/04/27');
insert into test_year values(year_seq.NEXTVAL,'정보처리기사', '2020/03/08');
insert into test_year values(year_seq.NEXTVAL,'리눅스마스터 1급', '2019/09/21' );
insert into test_year values(year_seq.NEXTVAL,'리눅스마스터 1급', '2019/03/16');

/* 과목 insert 번호, 과목이름, 과목문제수, 과목개수, 과목 시험시간, 개정년도, 자격증번호*/
insert into test_subject values(subject_seq.NEXTVAL,'데이터베이스/전자계산기 구조/운영체제/소프트웨어 공학/데이터 통신', '1~20/21~40/41~60/61~80/81~100' ,'20/20/20/20/20',5, '02:30:00', '2000/01/01', '정보처리기사' );
insert into test_subject values(subject_seq.NEXTVAL,'소프트웨어 설계/소프트웨어 개발/데이터베이스 구축/프로그래밍 언어 활용/정보시스템 구축 관리', '1~20/21~40/41~60/61~80/81~100','20/20/20/20/20' ,5, '02:30:00', '2020/01/01', '정보처리기사' );
insert into test_subject values(subject_seq.NEXTVAL,'리눅스 실무의 이해/리눅스 시스템 관리/네트워크 및 서비스의 활용', '1~20/21~60/61~100','20/40/40' ,3, '01:40:00', '2000/01/01', '리눅스마스터 1급');


/* ---- commit ---- */
commit;

/* ==== //info ==== */
/* ==== log ==== */
/* create 기록 */
create table TEST_LOG( 
    log_seq number(4) primary key, -- 로그 시퀀스
    license_name VARCHAR2(30), -- 선택한 자격증 이름
    license_abbreviation VARCHAR2(10), -- 선택한 자격증 약어
    year_date DATE, -- 선택한 기출년도
    subject_names VARCHAR2(150), -- 선택한 과목들의 이름 - ex) 데이터베이스/전자계산기 구조/운영체제/소프트웨어 공학/데이터통신
    subject_ranges VARCHAR2(50), -- 선택한 과목들의 문제범위 - ex) 1~20/21~40/41~60/61~80/81~100
    subject_numbers VARCHAR2(30), -- 선택한 과목들의 문제수 - ex) 20/20/20/20/20 
    subject_currents VARCHAR2(30), -- 선택한 과목들의 맞은개수 - ex) 15/17/16/10/15 
    test_answer VARCHAR2(1000), -- /1:1:1/2:1:0/5:1:1/... (번호:답안:정답)
    log_time CHAR(8), -- 시험시간 or 남은시간
    submityn CHAR(1) default 'N', -- 제출 여부 (Y면 제출, N이면 미제출)
    log_date TIMESTAMP default SYSTIMESTAMP, -- 마지막 기록 날짜
    id VARCHAR2(50) -- 사용자 ID
); /* 정보처리기사 EIP(Engineer Information Processing)*/

CREATE SEQUENCE log_seq START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999;

commit;
/* ==== //log ==== */
/* ==== quiz ==== */
/* create 문제 */
create table TEST_QUIZ(
    quiz_seq number(5) primary key, -- 문제 시퀀스
    quiz_num number(3), -- 문제 번호
    quiz_title VARCHAR2(500), -- 문제 제목
    quiz_image VARCHAR2(50) default NULL, -- 이미지 파일 이름 (~.png / ~.jpg)
    quiz_1 VARCHAR2(250), -- 1번 보기문항
    quiz_2 VARCHAR2(250), -- 2번 보기문항
    quiz_3 VARCHAR2(250), -- 3번 보기문항
    quiz_4 VARCHAR2(250), -- 4번 보기문항
    quiz_current number(1), -- 문제의 정답
    quiz_cnt_wrong number(4), -- 사람들이 틀린 횟수
    quiz_cnt_take number(4), -- 사람들이 푼 횟수
    quiz_explanation VARCHAR2 (1000), -- 해설
    quiz_subject VARCHAR2(100), -- 과목
    license_abbreviation VARCHAR2(30), -- 자격증 약어 (왜래키)
    year_date DATE -- 기출문제 년월일
); /* 정보처리기사 EIP(Engineer Information Processing)*/

commit;
/* ==== //quiz ==== */