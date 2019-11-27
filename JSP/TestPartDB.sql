/* ==== info ==== */
/* ---- create ---- */
create table test_license ( -- �ڰ��� ���̺�
    license_seq  number(4) primary key,
    license_name VARCHAR2(30) NOT NULL UNIQUE, -- �ڰ��� �̸�
    license_abbreviation  VARCHAR2(10) NOT NULL UNIQUE -- �ڰ��� ����
);

create table test_year( -- ����⵵ ���̺�
    year_seq number(4) primary key, -- ������ ��ȣ
    license_name VARCHAR2(30) REFERENCES test_license(license_name), -- �ڰ��� �̸� (�ܷ�Ű)
    year_date DATE NOT NULL -- ����⵵ (��/��/��)
);

create table test_subject ( -- ���� ���̺�
    subject_seq number(4) primary key, -- ������ ��ȣ
    subject_names VARCHAR2(150), -- ������� �̸� - ex) �����ͺ��̽�/���ڰ��� ����/�ü��/����Ʈ���� ����/���������
    subject_ranges VARCHAR2(50), -- ������� �������� - ex) 1~20/21~40/41~60/61~80/81~100
    subject_numbers VARCHAR2(30), -- ������� ������ - ex) 20/20/20/20/20
    subject_total NUMBER(5), -- �����
    subject_time CHAR(8), -- ���� �ð�
    subject_revision DATE, -- ���� �����⵵
    license_name VARCHAR2(30) REFERENCES test_license(license_name) -- �ڰ��� �̸� (�ܷ�Ű) 
);

/*���ڵ����� ������ */
CREATE SEQUENCE license_seq START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999;
CREATE SEQUENCE year_seq START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999;
CREATE SEQUENCE subject_seq START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999;



/* ---- insert ---- */
/* �ڰ��� insert <�ڰ��� �̸�, �ڰ��� ���>*/
insert into test_license values(license_seq.NEXTVAL, '����ó�����', 'EIP');
insert into test_license values(license_seq.NEXTVAL, '������������ 1��', 'LM1');

/* ���� �⵵ insert <��ȣ, �⵵, �ڰ��� �̸�> */
insert into test_year values(year_seq.NEXTVAL,'����ó�����', '2019/03/03');
insert into test_year values(year_seq.NEXTVAL,'����ó�����', '2019/04/27');
insert into test_year values(year_seq.NEXTVAL,'����ó�����', '2020/03/08');
insert into test_year values(year_seq.NEXTVAL,'������������ 1��', '2019/09/21' );
insert into test_year values(year_seq.NEXTVAL,'������������ 1��', '2019/03/16');

/* ���� insert ��ȣ, �����̸�, ��������, ���񰳼�, ���� ����ð�, �����⵵, �ڰ�����ȣ*/
insert into test_subject values(subject_seq.NEXTVAL,'�����ͺ��̽�/���ڰ��� ����/�ü��/����Ʈ���� ����/������ ���', '1~20/21~40/41~60/61~80/81~100' ,'20/20/20/20/20',5, '02:30:00', '2000/01/01', '����ó�����' );
insert into test_subject values(subject_seq.NEXTVAL,'����Ʈ���� ����/����Ʈ���� ����/�����ͺ��̽� ����/���α׷��� ��� Ȱ��/�����ý��� ���� ����', '1~20/21~40/41~60/61~80/81~100','20/20/20/20/20' ,5, '02:30:00', '2020/01/01', '����ó�����' );
insert into test_subject values(subject_seq.NEXTVAL,'������ �ǹ��� ����/������ �ý��� ����/��Ʈ��ũ �� ������ Ȱ��', '1~20/21~60/61~100','20/40/40' ,3, '01:40:00', '2000/01/01', '������������ 1��');


/* ---- commit ---- */
commit;

/* ==== //info ==== */
/* ==== log ==== */
/* create ��� */
create table TEST_LOG( 
    log_seq number(4) primary key, -- �α� ������
    license_name VARCHAR2(30), -- ������ �ڰ��� �̸�
    license_abbreviation VARCHAR2(10), -- ������ �ڰ��� ���
    year_date DATE, -- ������ ����⵵
    subject_names VARCHAR2(150), -- ������ ������� �̸� - ex) �����ͺ��̽�/���ڰ��� ����/�ü��/����Ʈ���� ����/���������
    subject_ranges VARCHAR2(50), -- ������ ������� �������� - ex) 1~20/21~40/41~60/61~80/81~100
    subject_numbers VARCHAR2(30), -- ������ ������� ������ - ex) 20/20/20/20/20 
    subject_currents VARCHAR2(30), -- ������ ������� �������� - ex) 15/17/16/10/15 
    test_answer VARCHAR2(1000), -- /1:1:1/2:1:0/5:1:1/... (��ȣ:���:����)
    log_time CHAR(8), -- ����ð� or �����ð�
    submityn CHAR(1) default 'N', -- ���� ���� (Y�� ����, N�̸� ������)
    log_date TIMESTAMP default SYSTIMESTAMP, -- ������ ��� ��¥
    id VARCHAR2(50) -- ����� ID
); /* ����ó����� EIP(Engineer Information Processing)*/

CREATE SEQUENCE log_seq START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999;

commit;
/* ==== //log ==== */
/* ==== quiz ==== */
/* create ���� */
create table TEST_QUIZ(
    quiz_seq number(5) primary key, -- ���� ������
    quiz_num number(3), -- ���� ��ȣ
    quiz_title VARCHAR2(500), -- ���� ����
    quiz_image VARCHAR2(50) default NULL, -- �̹��� ���� �̸� (~.png / ~.jpg)
    quiz_1 VARCHAR2(250), -- 1�� ���⹮��
    quiz_2 VARCHAR2(250), -- 2�� ���⹮��
    quiz_3 VARCHAR2(250), -- 3�� ���⹮��
    quiz_4 VARCHAR2(250), -- 4�� ���⹮��
    quiz_current number(1), -- ������ ����
    quiz_cnt_wrong number(4), -- ������� Ʋ�� Ƚ��
    quiz_cnt_take number(4), -- ������� Ǭ Ƚ��
    quiz_explanation VARCHAR2 (1000), -- �ؼ�
    quiz_subject VARCHAR2(100), -- ����
    license_abbreviation VARCHAR2(30), -- �ڰ��� ��� (�ַ�Ű)
    year_date DATE -- ���⹮�� �����
); /* ����ó����� EIP(Engineer Information Processing)*/

commit;
/* ==== //quiz ==== */