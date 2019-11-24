/* create 문제 */
create table TEST_QUIZ(
    quiz_seq number(5) primary key, -- 문제 시퀀스
    quiz_num number(3), -- 문제 번호
    quiz_title VARCHAR2(500), -- 문제 제목
    quiz_image VARCHAR2(50) default NULL, -- 이미지 파일 이름 (~.jpg)
    quiz_1 VARCHAR2(250), -- 1번 보기
    quiz_2 VARCHAR2(250), -- 2번 보기
    quiz_3 VARCHAR2(250), -- 3번 보기
    quiz_4 VARCHAR2(250), -- 4번 보기
    quiz_current number(1), -- 정답 : 1,2,3,4
    quiz_cnt_wrong number(4), -- 사람들이 틀린 횟수
    quiz_cnt_take number(4), -- 사람들이 푼 횟수
    quiz_explanation VARCHAR2 (1000), -- 해설
    quiz_subject VARCHAR2(100), -- 과목
    license_abbreviation VARCHAR2(30), -- 자격증 약어 (왜래키)
    year_date DATE -- 기출문제 년월일
); /* 정보처리기사 EIP(Engineer Information Processing)*/


select * from TEST_QUIZ;
drop table TEST_QUIZ;







create table TEST_EIP_20190427(
    test_num number(5) primary key,
    test_title VARCHAR2(500),
    test_imageIs VARCHAR2(2) default NULL,    
    test_1 VARCHAR2(250), 
    test_2 VARCHAR2(250), 
    test_3 VARCHAR2(250), 
    test_4 VARCHAR2(250),
    test_subject VARCHAR2(100)
); /* 정보처리기사 EIP(Engineer Information Processing)*/

create table TEST_EIP_20190303(
    test_num number(5) primary key,
    test_title VARCHAR2(500),
    test_imageIs VARCHAR2(2) default NULL,    
    test_1 VARCHAR2(250), 
    test_2 VARCHAR2(250), 
    test_3 VARCHAR2(250), 
    test_4 VARCHAR2(250),
    test_subject VARCHAR2(100)
); /* 정보처리기사 EIP(Engineer Information Processing) */

create table TEST_LM1_20190316(
    test_num number(5) primary key,
    test_title VARCHAR2(500),
    test_imageIs VARCHAR2(2) default NULL,    
    test_1 VARCHAR2(250), 
    test_2 VARCHAR2(250), 
    test_3 VARCHAR2(250), 
    test_4 VARCHAR2(250),
    test_subject VARCHAR2(100)
); /* LM1(Linux Master 1grade) */

create table TEST_LM1_20190921(
    test_num number(5) primary key,
    test_title VARCHAR2(500),
    test_imageIs VARCHAR2(2) default NULL,    
    test_1 VARCHAR2(250), 
    test_2 VARCHAR2(250), 
    test_3 VARCHAR2(250), 
    test_4 VARCHAR2(250),
    test_subject VARCHAR2(100)
); /* LM1(Linux Master 1grade) */




/* create 해답 */
create table ANSWER_EIP_20190427(
    test_num number(5) primary key,
    test_answer number(5),
    
    CONSTRAINT fk_ANSWER_EIP_20190427_num FOREIGN KEY(test_num)
    REFERENCES TEST_EIP_20190427(test_num)
); /* 정보처리기사 EIP(Engineer Information Processing)*/

create table ANSWER_EIP_20190303(
    test_num number(5) primary key,
    test_answer number(5),
    
    CONSTRAINT fk_ANSWER_EIP_20190303_num FOREIGN KEY(test_num)
    REFERENCES TEST_EIP_20190303(test_num)
); /* 정보처리기사 EIP(Engineer Information Processing)*/



/* select ALL */
SELECT * FROM TEST_EIP_20190427;
SELECT * FROM TEST_EIP_20190303;
SELECT * FROM TEST_LM1_20190921;
SELECT * FROM TEST_LM1_20190316;

/* select IMAGE*/
SELECT * FROM TEST_EIP_20190427 WHERE TEST_IMAGENAME IS NOT NULL;
SELECT * FROM TEST_EIP_20190427 WHERE TEST_IMAGENAME IS NULL;

SELECT * FROM TEST_EIP_20190303 WHERE TEST_IMAGENAME IS NOT NULL;
SELECT * FROM TEST_EIP_20190303 WHERE TEST_IMAGENAME IS NULL;

SELECT * FROM ANSWER_EIP_20190427;
SELECT * FROM ANSWER_EIP_20190303;

SELECT * FROM TEST_QUIZ WHERE license_abbreviation='EIP'  AND year_date='2019-03-03' AND quiz_subject in ('데이터베이스','전자계산기 구조')

select * from test_quiz;

/* drop */
DROP TABLE ANSWER_EIP_20190427; 
DROP TABLE ANSWER_EIP_20190303; 

DROP TABLE TEST_EIP_20190427; 
DROP TABLE TEST_EIP_20190303; 
DROP TABLE TEST_LM1_20190921; 
DROP TABLE TEST_LM1_20190316; 


/* commit */
commit;
