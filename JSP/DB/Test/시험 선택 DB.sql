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
insert into test_subject values(subject_seq.NEXTVAL,'�����ͺ��̽�/���ڰ��� ����/�ü��/����Ʈ���� ����/������ ���', '1~20/21~40/41~60/61~80/81~100' ,5, '02:30:00', '2000/01/01', '����ó�����' );
insert into test_subject values(subject_seq.NEXTVAL,'����Ʈ���� ����/����Ʈ���� ����/�����ͺ��̽� ����/���α׷��� ��� Ȱ��/�����ý��� ���� ����', '1~20/21~40/41~60/61~80/81~100' ,5, '02:30:00', '2020/01/01', '����ó�����' );
insert into test_subject values(subject_seq.NEXTVAL,'������ �ǹ��� ����/������ �ý��� ����/��Ʈ��ũ �� ������ Ȱ��', '1~20/21~60/61~100',3, '01:40:00', '2000/01/01', '������������ 1��');


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
SELECT year_date FROM test_year WHERE license_name='����ó�����';
SELECT year_date FROM test_year WHERE license_name in ('����ó�����');

/* select subject */
select * from test_subject where license_name='����ó�����' AND subject_revision in 
     (SELECT MAX(subject_revision) FROM test_subject 
     WHERE license_name='����ó�����' AND subject_revision < '2019/03/03');   

SELECT subject_names, subject_quiznums, subject_total, subject_time 
FROM test_subject WHERE license_name='����ó�����' AND subject_revision IN( 
    SELECT MAX(subject_revision) 
    FROM test_subject 
    WHERE license_name='����ó�����' AND subject_revision < '2019/03/03'
)









