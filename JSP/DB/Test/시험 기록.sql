/* create ��� */
create table TEST_LOG( 
    log_seq number(4) primary key, -- �α� ������
    license_name VARCHAR2(30), -- �ڰ��� �̸�
    license_abbreviation VARCHAR2(10), -- �ڰ��� ���
    year_date DATE, -- ����⵵
    subject_names VARCHAR2(150), -- ������� �̸� - ex) �����ͺ��̽�/���ڰ��� ����/�ü��/����Ʈ���� ����/���������
    subject_ranges VARCHAR2(50), -- ������� �������� - ex) 1~20/21~40/41~60/61~80/81~100
    test_answer VARCHAR2(1000), -- /1:1:O/2:1:X/5:1:O/... (��ȣ:���:����)
    log_time CHAR(8), -- ����ð� or �����ð�
    submityn CHAR(1) default 'N', -- ���� ���� (Y�� ����, N�̸� ������)
    log_date TIMESTAMP default SYSTIMESTAMP, -- ������ ��� ��¥
    id VARCHAR2(50) -- ����� ID
); /* ����ó����� EIP(Engineer Information Processing)*/

CREATE SEQUENCE log_seq START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999;

commit;



drop table test_log;
drop SEQUENCE log_seq;




select * from test_log;
update test_log set test_answer='/1:3/';




INSERT INTO TEST_LOG ()
VALUES(log_seq.);

