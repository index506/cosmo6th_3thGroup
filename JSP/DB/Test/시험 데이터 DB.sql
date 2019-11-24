/* create ���� */
create table TEST_QUIZ(
    quiz_seq number(5) primary key, -- ���� ������
    quiz_num number(3), -- ���� ��ȣ
    quiz_title VARCHAR2(500), -- ���� ����
    quiz_image VARCHAR2(50) default NULL, -- �̹��� ���� �̸� (~.jpg)
    quiz_1 VARCHAR2(250), -- 1�� ����
    quiz_2 VARCHAR2(250), -- 2�� ����
    quiz_3 VARCHAR2(250), -- 3�� ����
    quiz_4 VARCHAR2(250), -- 4�� ����
    quiz_current number(1), -- ���� : 1,2,3,4
    quiz_cnt_wrong number(4), -- ������� Ʋ�� Ƚ��
    quiz_cnt_take number(4), -- ������� Ǭ Ƚ��
    quiz_explanation VARCHAR2 (1000), -- �ؼ�
    quiz_subject VARCHAR2(100), -- ����
    license_abbreviation VARCHAR2(30), -- �ڰ��� ��� (�ַ�Ű)
    year_date DATE -- ���⹮�� �����
); /* ����ó����� EIP(Engineer Information Processing)*/


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
); /* ����ó����� EIP(Engineer Information Processing)*/

create table TEST_EIP_20190303(
    test_num number(5) primary key,
    test_title VARCHAR2(500),
    test_imageIs VARCHAR2(2) default NULL,    
    test_1 VARCHAR2(250), 
    test_2 VARCHAR2(250), 
    test_3 VARCHAR2(250), 
    test_4 VARCHAR2(250),
    test_subject VARCHAR2(100)
); /* ����ó����� EIP(Engineer Information Processing) */

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




/* create �ش� */
create table ANSWER_EIP_20190427(
    test_num number(5) primary key,
    test_answer number(5),
    
    CONSTRAINT fk_ANSWER_EIP_20190427_num FOREIGN KEY(test_num)
    REFERENCES TEST_EIP_20190427(test_num)
); /* ����ó����� EIP(Engineer Information Processing)*/

create table ANSWER_EIP_20190303(
    test_num number(5) primary key,
    test_answer number(5),
    
    CONSTRAINT fk_ANSWER_EIP_20190303_num FOREIGN KEY(test_num)
    REFERENCES TEST_EIP_20190303(test_num)
); /* ����ó����� EIP(Engineer Information Processing)*/



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

SELECT * FROM TEST_QUIZ WHERE license_abbreviation='EIP'  AND year_date='2019-03-03' AND quiz_subject in ('�����ͺ��̽�','���ڰ��� ����')

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
