create table test_license(
    license_name VARCHAR2(30) primary key, /* [����ó�����] */
    license_abbreviation  VARCHAR2(10) /* [EIP] (���蹮�� ���̺� �� ���) */
); /* �ڰ��� */

create table test_year(
    year_num number(10) primary key, /* (1���� 1�� ����) */
    year_date DATE, /* [2018/12/02] */
    license_name VARCHAR2(30),
    
    CONSTRAINT fk_year_license FOREIGN KEY(license_name)
    REFERENCES test_license(license_name)
); /* ����⵵ */

create table test_subject (
    subject_num number(10) primary key, /* (1���� 1�� ����) */
    subject_names VARCHAR2(150), /* [�����ͺ��̽�/���ڰ��� ����/�ü��/����Ʈ���� ����/���������] (���� �̸�) */
    subject_question_num VARCHAR2(50), /* 20/20/20/20/20 (���� ���� ��) */
    subject_total NUMBER(5), /* 5 (���� ��) */
    subject_revision DATE, /* (���� ������¥) */
    license_name VARCHAR2(30),
    
    CONSTRAINT fk_subject_license FOREIGN KEY(license_name)
    REFERENCES test_license(license_name)
); /* ���� */


/*���ڵ����� ������ */
CREATE SEQUENCE seq_year_num START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999;
CREATE SEQUENCE seq_subject_num START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999;


/* �ڰ��� insert <�ڰ��� �̸�, �ڰ��� ���>*/
insert into test_license values('����ó�����','EIP');
insert into test_license values('������������ 1��','LM1');

/* ���� �⵵ insert <��ȣ, �⵵, �ڰ��� �̸�> */
insert into test_year values(seq_year_num.NEXTVAL,'2019/03/03', '����ó�����');
insert into test_year values(seq_year_num.NEXTVAL,'2019/04/27', '����ó�����');
insert into test_year values(seq_year_num.NEXTVAL,'2019/09/21', '������������ 1��');
insert into test_year values(seq_year_num.NEXTVAL,'2019/03/16', '������������ 1��');

/* ���� insert ��ȣ, �����̸�, ��������, ���񰳼�, ���� ����ð�, �����⵵, �ڰ�����ȣ*/
insert into test_subject values(seq_subject_num.NEXTVAL,'�����ͺ��̽�/���ڰ��� ����/�ü��/����Ʈ���� ����/���������', '20/20/20/20/20' ,5, '2000/01/01', '����ó�����' );
insert into test_subject values(seq_subject_num.NEXTVAL,'������ �ǹ��� ����/������ �ý��� ����/��Ʈ��ũ �� ������ Ȱ��', '20/40/40',3, '2000/01/01', '������������ 1��');


/* select ALL */
select * from test_license;
select * from test_year;
select * from test_subject;

/* select license */
SELECT license_name, license_abbreviation FROM test_license

/* select year */
SELECT year_date FROM test_year WHERE license_name='����ó�����';

SELECT year_date FROM test_year WHERE license_name in ('����ó�����')

/* drop YEAR - SUBJECT - LICENSE*/
drop table test_subject;
drop table test_year;
drop table test_license;

/* drop ������ */
drop SEQUENCE seq_year_num;
drop SEQUENCE seq_subject_num;

