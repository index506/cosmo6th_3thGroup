create table test_license(
    license_name VARCHAR2(30) primary key, /* [정보처리기사] */
    license_abbreviation  VARCHAR2(10) /* [EIP] (시험문제 테이블 용 약어) */
); /* 자격증 */

create table test_year(
    year_num number(10) primary key, /* (1부터 1씩 증가) */
    year_date DATE, /* [2018/12/02] */
    license_name VARCHAR2(30),
    
    CONSTRAINT fk_year_license FOREIGN KEY(license_name)
    REFERENCES test_license(license_name)
); /* 기출년도 */

create table test_subject (
    subject_num number(10) primary key, /* (1부터 1씩 증가) */
    subject_names VARCHAR2(150), /* [데이터베이스/전자계산기 구조/운영체제/소프트웨어 공학/데이터통신] (과목별 이름) */
    subject_quiznums VARCHAR2(50), /* 20/20/20/20/20 (과목별 문제 수) */
    subject_total NUMBER(5), /* 5 (과목 수) */
    subject_time NUMBER(10),
    subject_revision DATE, /* (시험 개정날짜) */
    license_name VARCHAR2(30),
    
    CONSTRAINT fk_subject_license FOREIGN KEY(license_name)
    REFERENCES test_license(license_name)
); /* 과목 */


/*　자동증가 시퀀스 */
CREATE SEQUENCE seq_year_num START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999;
CREATE SEQUENCE seq_subject_num START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999;



/* 자격증 insert <자격증 이름, 자격증 약어>*/
insert into test_license values('정보처리기사','EIP');
insert into test_license values('리눅스마스터 1급','LM1');

/* 기출 년도 insert <번호, 년도, 자격증 이름> */
insert into test_year values(seq_year_num.NEXTVAL,'2019/03/03', '정보처리기사');
insert into test_year values(seq_year_num.NEXTVAL,'2019/04/27', '정보처리기사');
insert into test_year values(seq_year_num.NEXTVAL,'2020/03/08', '정보처리기사');

insert into test_year values(seq_year_num.NEXTVAL,'2019/03/16', '리눅스마스터 1급');
insert into test_year values(seq_year_num.NEXTVAL,'2019/09/21', '리눅스마스터 1급');


/* 과목 insert 번호, 과목이름, 과목문제수, 과목개수, 과목 시험시간, 개정년도, 자격증번호*/
insert into test_subject values(seq_subject_num.NEXTVAL,'데이터베이스/전자계산기 구조/운영체제/소프트웨어 공학/데이터 통신', '1~20/21~40/41~60/61~80/81~100' ,5, 150, '2000/01/01', '정보처리기사' );
insert into test_subject values(seq_subject_num.NEXTVAL,'소프트웨어 설계/소프트웨어 개발/데이터베이스 구축/프로그래밍 언어 활용/정보시스템 구축 관리', '1~20/21~40/41~60/61~80/81~100' ,5, 150, '2020/01/01', '정보처리기사' );
insert into test_subject values(seq_subject_num.NEXTVAL,'리눅스 실무의 이해/리눅스 시스템 관리/네트워크 및 서비스의 활용', '1~20/21~60/61~100',3, 100, '2000/01/01', '리눅스마스터 1급');



/*--------------------------------------*/


/* select ALL */
select * from test_license;
select * from test_year;
select * from test_subject;

/* select license */
SELECT license_name, license_abbreviation FROM test_license

/* select year */
SELECT year_date FROM test_year WHERE license_name='정보처리기사';
SELECT year_date FROM test_year WHERE license_name in ('정보처리기사')

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


/*--------------------------------------*/



/* drop YEAR - SUBJECT - LICENSE*/
drop table test_subject;
drop table test_year;
drop table test_license;

/* drop 시퀀스 */
drop SEQUENCE seq_year_num;
drop SEQUENCE seq_subject_num;



/* commit */
commit;
