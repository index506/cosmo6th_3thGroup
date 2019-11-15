create table Member(
    id varchar2(50) primary key,
    pwd varchar2(50) not null,
    name varchar2(50) not null,
    email varchar2(50),
    address varchar2(50),
    tel varchar2(30),
    phone varchar2(30),
    assignDate date default sysdate,
    admin number(1) default 0  /* 0:老馆蜡历, 1:包府磊 */
);

create table notice_List(
    num         NUMBER(5)       PRIMARY KEY,
    name        VARCHAR2(30),
    title       VARCHAR2(50),
    content     VARCHAR2(1000),
    readcount   NUMBER(4)       DEFAULT 0,
    writedate   DATE            DEFAULT SYSDATE,
    imageFileName varchar2(30)
);

create table community_List(
    num         NUMBER(5)       PRIMARY KEY,
    name        VARCHAR2(30),
    title       VARCHAR2(50),
    content     VARCHAR2(1000),
    readcount   NUMBER(4)       DEFAULT 0,
    writedate   DATE            DEFAULT SYSDATE,
    imageFileName varchar2(30)
);

create table question_List(
    num         NUMBER(5)       PRIMARY KEY,
    parentNum   NUMBER(5),
    name        VARCHAR2(30),
    title       VARCHAR2(50),
    content     VARCHAR2(1000),
    readcount   NUMBER(4)       DEFAULT 0,
    writedate   DATE            DEFAULT SYSDATE,
    imageFileName varchar2(30)
);

CREATE SEQUENCE notice_seq start with 1 increment by 1;
CREATE SEQUENCE commu_seq start with 1 increment by 1;
CREATE SEQUENCE quest_seq start with 1 increment by 1;

drop table member;
drop table notice_list;
drop table community_list;
drop table question_list;
drop SEQUENCE notice_seq;
drop SEQUENCE commu_seq;
drop SEQUENCE quest_seq;

commit;