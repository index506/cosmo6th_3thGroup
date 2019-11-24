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
insert into test_subject values(subject_seq.NEXTVAL,'데이터베이스/전자계산기 구조/운영체제/소프트웨어 공학/데이터 통신', '1~20/21~40/41~60/61~80/81~100' ,5, '02:30:00', '2000/01/01', '정보처리기사' );
insert into test_subject values(subject_seq.NEXTVAL,'소프트웨어 설계/소프트웨어 개발/데이터베이스 구축/프로그래밍 언어 활용/정보시스템 구축 관리', '1~20/21~40/41~60/61~80/81~100' ,5, '02:30:00', '2020/01/01', '정보처리기사' );
insert into test_subject values(subject_seq.NEXTVAL,'리눅스 실무의 이해/리눅스 시스템 관리/네트워크 및 서비스의 활용', '1~20/21~60/61~100',3, '01:40:00', '2000/01/01', '리눅스마스터 1급');


/* ---- commit ---- */
commit;



/* ---- drop ---- */
drop table test_subject;
drop table test_year;
drop table test_license;
drop SEQUENCE license_seq;
drop SEQUENCE year_seq;
drop SEQUENCE subject_seq;




/* ---- select ---- */

/* select ALL */
select * from test_license;
select * from test_year;
select * from test_subject;

/* select license */
SELECT license_name, license_abbreviation FROM test_license;

/* select year */
SELECT year_date FROM test_year WHERE license_name='정보처리기사';
SELECT year_date FROM test_year WHERE license_name in ('정보처리기사');

/* select subject */
select * from test_subject where license_name='정보처리기사' AND subject_revision in 
     (SELECT MAX(subject_revision) FROM test_subject 
     WHERE license_name='정보처리기사' AND subject_revision < '2019/03/03');   

SELECT subject_names, subject_quiznums, subject_total, subject_time 
FROM test_subject WHERE license_name='정보처리기사' AND subject_revision IN( 
    SELECT MAX(subject_revision) 
    FROM test_subject 
    WHERE license_name='정보처리기사' AND subject_revision < '2019/03/03'
)









