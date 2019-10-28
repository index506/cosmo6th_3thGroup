/* create 문제 */
create table TEST_EIP_20190427(
    test_num number(5) primary key,
    test_title VARCHAR2(500),
    test_imageName VARCHAR2(50) default NULL,    
    test_1 VARCHAR2(250), 
    test_2 VARCHAR2(250), 
    test_3 VARCHAR2(250), 
    test_4 VARCHAR2(250),
    test_subject VARCHAR2(100)
); /* 정보처리기사 EIP(Engineer Information Processing)*/

create table TEST_EIP_20190303(
    test_num number(5) primary key,
    test_title VARCHAR2(500),
    test_imageName VARCHAR2(50) default NULL,    
    test_1 VARCHAR2(250), 
    test_2 VARCHAR2(250), 
    test_3 VARCHAR2(250), 
    test_4 VARCHAR2(250),
    test_subject VARCHAR2(100)
); /* 정보처리기사 EIP(Engineer Information Processing) */

create table TEST_LM1_20190316(
    test_num number(5) primary key,
    test_title VARCHAR2(500),
    test_imageName VARCHAR2(50) default NULL,    
    test_1 VARCHAR2(250), 
    test_2 VARCHAR2(250), 
    test_3 VARCHAR2(250), 
    test_4 VARCHAR2(250),
    test_subject VARCHAR2(100)
); /* LM1(Linux Master 1grade) */

create table TEST_LM1_20190921(
    test_num number(5) primary key,
    test_title VARCHAR2(500),
    test_imageName VARCHAR2(50) default NULL,    
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


/* drop */
DROP TABLE ANSWER_EIP_20190427; 
DROP TABLE ANSWER_EIP_20190303; 

DROP TABLE TEST_EIP_20190427; 
DROP TABLE TEST_EIP_20190303; 
DROP TABLE TEST_LM1_20190921; 
DROP TABLE TEST_LM1_20190316; 


/* commit */
commit;
