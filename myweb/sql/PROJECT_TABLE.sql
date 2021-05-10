-- DB 연결 정보
-- IP : localhost
-- Port : 1521

CREATE USER myweb IDENTIFIED BY admin;
GRANT CONNECT, RESOURCE, DBA TO MYWEB;

CREATE TABLE Movie (
    TITLE VARCHAR2(100) PRIMARY KEY,
    PRICE NUMBER NOT NULL,
    DIRECT  VARCHAR2(30),
    ARTIST  VARCHAR2(100)
);

CREATE TABLE theater_schedule (
    scheduleID number CONSTRAINT PK_Theater_Sche_ScheID PRIMARY KEY,
    theaterName varchar2(50) NOT NULL,
    time_schedule varchar2(20) NOT NULL,
    seatNum varchar2(20) NOT NULL
);

CREATE TABLE ticket (
    ticketID number CONSTRAINT PK_Ticket_TicketID_PK PRIMARY KEY,
    holdDate varchar2(20) NOT NULL,
    scheduleID number NOT NULL,
    title varchar2(100) NOT NULL,
    booked char(5) CHECK (booked IN ('Y')),
    CONSTRAINT FK_Ticket_ScheID FOREIGN KEY (scheduleID) REFERENCES theater_schedule (scheduleID) ON DELETE CASCADE,
    CONSTRAINT FK_Ticket_Title FOREIGN KEY (title) REFERENCES movie (title) ON DELETE CASCADE
);

CREATE TABLE ticket_status (
    ticketID number CONSTRAINT PK_Status_TID PRIMARY KEY,
    user_id varchar2(10) NOT NULL,
    Btime date default sysdate NOT NULL,
    CONSTRAINT FK_Status_TID FOREIGN KEY (ticketID) REFERENCES ticket (ticketID),
    CONSTRAINT FK_Status_UID FOREIGN KEY (user_id) REFERENCES user_info (user_id)
);

CREATE TABLE User_info (
    USER_ID VARCHAR2(10) PRIMARY KEY,
    USER_PW VARCHAR2(40) NOT NULL,
    USER_NAME VARCHAR2(20) NOT NULL,
    GENDER NUMBER NOT NULL,
    EMAIL VARCHAR2(30) NOT NULL,
    PHONE_NUMBER VARCHAR2(20) NOT NULL,
    PURCHASE NUMBER DEFAULT 0,
    GRADE NUMBER DEFAULT 0,
    BIRTH_DATE VARCHAR2(20) NOT NULL
);

CREATE SEQUENCE board_seq;
CREATE TABLE Board_t (
    B_NUM NUMBER PRIMARY KEY,
    B_ID VARCHAR2(20) NOT NULL,
    B_TITLE VARCHAR2(100),
    B_CONTEXT LONG NOT NULL,
    B_DIRECT VARCHAR2(20),
    B_ARTIST VARCHAR2(100),
    CREATE_DATE DATE DEFAULT SYSDATE,
    UPDATE_DATE DATE DEFAULT SYSDATE
   
);

CREATE TABLE COMMENT_T(
B_NUM NUMBER NOT NULL,
B_TITLE VARCHAR2(200) NOT NULL,
C_NUM NUMBER PRIMARY KEY,
C_USERID VARCHAR2(20) NOT NULL,
C_COMMENT LONG NOT NULL,
CREATEDATE DATE DEFAULT SYSDATE,
UPDATEDATE DATE DEFAULT SYSDATE
);

CREATE SEQUENCE comment_seq;

CREATE SEQUENCE file_seq;

CREATE TABLE FILE_T(
    filenum NUMBER PRIMARY KEY,
    movietitle VARCHAR(200),
    fileName VARCHAR(200),
    fileRealName VARCHAR(200)
);



--데이터생성
/*movie 테이블 데이터 생성*/
INSERT INTO movie VALUES ('감기', 9000, '김성수', '장혁,수애,박민하');
INSERT INTO movie VALUES ('미나리', 11000, '정이삭', '스티븐 연,한예리,윤여정');
INSERT INTO movie VALUES ('비밀의 정원', 9000, '박선주', '한우연,전석호');
INSERT INTO movie VALUES ('베테랑', 6000, '류승완', '황정민,유아인,유해진,오달수,장윤주');
INSERT INTO movie VALUES ('테넷', 9000, '크리스토퍼 놀란', '존 데이비드 워싱턴,로버트 패틴슨,엘리자베스 데비키');

/*theater_schedule 테이블 데이터 생성*/
INSERT INTO theater_schedule VALUES (1, '건대', '11:00', 'A-1');
INSERT INTO theater_schedule VALUES (2, '건대', '11:00', 'A-2');
INSERT INTO theater_schedule VALUES (3, '건대', '11:00', 'A-3');
INSERT INTO theater_schedule VALUES (4, '건대', '11:00', 'A-4');
INSERT INTO theater_schedule VALUES (5, '건대', '11:00', 'B-1');
INSERT INTO theater_schedule VALUES (6, '건대', '11:00', 'B-2');
INSERT INTO theater_schedule VALUES (7, '건대', '11:00', 'B-3');
INSERT INTO theater_schedule VALUES (8, '건대', '11:00', 'B-4');
INSERT INTO theater_schedule VALUES (9, '건대', '11:00', 'C-1');
INSERT INTO theater_schedule VALUES (10, '건대', '11:00', 'C-2');
INSERT INTO theater_schedule VALUES (11, '건대', '11:00', 'C-3');
INSERT INTO theater_schedule VALUES (12, '건대', '11:00', 'C-4');
INSERT INTO theater_schedule VALUES (13, '건대', '11:00', 'D-1');
INSERT INTO theater_schedule VALUES (14, '건대', '11:00', 'D-2');
INSERT INTO theater_schedule VALUES (15, '건대', '11:00', 'D-3');
INSERT INTO theater_schedule VALUES (16, '건대', '11:00', 'D-4');

INSERT INTO theater_schedule VALUES (17, '건대', '17:00', 'A-1');
INSERT INTO theater_schedule VALUES (18, '건대', '17:00', 'A-2');
INSERT INTO theater_schedule VALUES (19, '건대', '17:00', 'A-3');
INSERT INTO theater_schedule VALUES (20, '건대', '17:00', 'A-4');
INSERT INTO theater_schedule VALUES (21, '건대', '17:00', 'B-1');
INSERT INTO theater_schedule VALUES (22, '건대', '17:00', 'B-2');
INSERT INTO theater_schedule VALUES (23, '건대', '17:00', 'B-3');
INSERT INTO theater_schedule VALUES (24, '건대', '17:00', 'B-4');
INSERT INTO theater_schedule VALUES (25, '건대', '17:00', 'C-1');
INSERT INTO theater_schedule VALUES (26, '건대', '17:00', 'C-2');
INSERT INTO theater_schedule VALUES (27, '건대', '17:00', 'C-3');
INSERT INTO theater_schedule VALUES (28, '건대', '17:00', 'C-4');
INSERT INTO theater_schedule VALUES (29, '건대', '17:00', 'D-1');
INSERT INTO theater_schedule VALUES (30, '건대', '17:00', 'D-2');
INSERT INTO theater_schedule VALUES (31, '건대', '17:00', 'D-3');
INSERT INTO theater_schedule VALUES (32, '건대', '17:00', 'D-4');

INSERT INTO theater_schedule VALUES (33, '강남', '17:00', 'A-1');
INSERT INTO theater_schedule VALUES (34, '강남', '17:00', 'A-2');
INSERT INTO theater_schedule VALUES (35, '강남', '17:00', 'A-3');
INSERT INTO theater_schedule VALUES (36, '강남', '17:00', 'A-4');
INSERT INTO theater_schedule VALUES (37, '강남', '17:00', 'B-1');
INSERT INTO theater_schedule VALUES (38, '강남', '17:00', 'B-2');
INSERT INTO theater_schedule VALUES (39, '강남', '17:00', 'B-3');
INSERT INTO theater_schedule VALUES (40, '강남', '17:00', 'B-4');
INSERT INTO theater_schedule VALUES (41, '강남', '17:00', 'C-1');
INSERT INTO theater_schedule VALUES (42, '강남', '17:00', 'C-2');
INSERT INTO theater_schedule VALUES (43, '강남', '17:00', 'C-3');
INSERT INTO theater_schedule VALUES (44, '강남', '17:00', 'C-4');
INSERT INTO theater_schedule VALUES (45, '강남', '17:00', 'D-1');
INSERT INTO theater_schedule VALUES (46, '강남', '17:00', 'D-2');
INSERT INTO theater_schedule VALUES (47, '강남', '17:00', 'D-3');
INSERT INTO theater_schedule VALUES (48, '강남', '17:00', 'D-4');

INSERT INTO theater_schedule VALUES (49, '강남', '20:00', 'A-1');
INSERT INTO theater_schedule VALUES (50, '강남', '20:00', 'A-2');
INSERT INTO theater_schedule VALUES (51, '강남', '20:00', 'A-3');
INSERT INTO theater_schedule VALUES (52, '강남', '20:00', 'A-4');
INSERT INTO theater_schedule VALUES (53, '강남', '20:00', 'B-1');
INSERT INTO theater_schedule VALUES (54, '강남', '20:00', 'B-2');
INSERT INTO theater_schedule VALUES (55, '강남', '20:00', 'B-3');
INSERT INTO theater_schedule VALUES (56, '강남', '20:00', 'B-4');
INSERT INTO theater_schedule VALUES (57, '강남', '20:00', 'C-1');
INSERT INTO theater_schedule VALUES (58, '강남', '20:00', 'C-2');
INSERT INTO theater_schedule VALUES (59, '강남', '20:00', 'C-3');
INSERT INTO theater_schedule VALUES (60, '강남', '20:00', 'C-4');
INSERT INTO theater_schedule VALUES (61, '강남', '20:00', 'D-1');
INSERT INTO theater_schedule VALUES (62, '강남', '20:00', 'D-2');
INSERT INTO theater_schedule VALUES (63, '강남', '20:00', 'D-3');
INSERT INTO theater_schedule VALUES (64, '강남', '20:00', 'D-4');

/*시퀀스 생성*/
CREATE SEQUENCE N;

/*ticket 테이블 데이터 생성*/
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 1, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 2, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 3, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 4, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 5, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 6, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 7, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 8, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 9, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 10, '감기');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 11, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 12, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 13, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 14, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 15, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 16, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 17, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 18, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 19, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 20, '감기');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 21, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 22, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 23, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 24, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 25, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 26, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 27, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 28, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 29, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 30, '감기');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 31, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 32, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 33, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 34, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 35, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 36, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 37, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 38, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 39, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 40, '감기');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 41, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 42, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 43, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 44, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 45, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 46, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 47, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 48, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 49, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 50, '감기');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 51, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 52, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 53, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 54, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 55, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 56, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 57, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 58, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 59, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 60, '감기');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 61, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 62, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 63, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 64, '감기');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 1, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 2, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 3, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 4, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 5, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 6, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 7, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 8, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 9, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 10, '감기');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 11, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 12, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 13, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 14, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 15, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 16, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 17, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 18, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 19, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 20, '감기');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 21, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 22, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 23, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 24, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 25, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 26, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 27, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 28, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 29, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 30, '감기');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 31, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 32, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 33, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 34, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 35, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 36, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 37, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 38, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 39, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 40, '감기');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 41, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 42, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 43, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 44, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 45, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 46, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 47, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 48, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 49, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 50, '감기');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 51, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 52, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 53, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 54, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 55, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 56, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 57, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 58, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 59, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 60, '감기');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 61, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 62, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 63, '감기');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 64, '감기');





/**/
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 1, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 2, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 3, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 4, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 5, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 6, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 7, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 8, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 9, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 10, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 11, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 12, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 13, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 14, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 15, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 16, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 17, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 18, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 19, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 20, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 21, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 22, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 23, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 24, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 25, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 26, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 27, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 28, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 29, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 30, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 31, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 32, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 33, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 34, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 35, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 36, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 37, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 38, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 39, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 40, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 41, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 42, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 43, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 44, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 45, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 46, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 47, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 48, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 49, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 50, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 51, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 52, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 53, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 54, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 55, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 56, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 57, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 58, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 59, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 60, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 61, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 62, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 63, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 64, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 1, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 2, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 3, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 4, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 5, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 6, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 7, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 8, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 9, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 10, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 11, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 12, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 13, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 14, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 15, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 16, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 17, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 18, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 19, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 20, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 21, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 22, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 23, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 24, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 25, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 26, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 27, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 28, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 29, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 30, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 31, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 32, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 33, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 34, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 35, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 36, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 37, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 38, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 39, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 40, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 41, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 42, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 43, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 44, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 45, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 46, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 47, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 48, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 49, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 50, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 51, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 52, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 53, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 54, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 55, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 56, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 57, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 58, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 59, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 60, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 61, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 62, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 63, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 64, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 1, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 2, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 3, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 4, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 5, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 6, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 7, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 8, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 9, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 10, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 11, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 12, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 13, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 14, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 15, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 16, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 17, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 18, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 19, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 20, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 21, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 22, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 23, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 24, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 25, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 26, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 27, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 28, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 29, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 30, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 31, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 32, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 33, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 34, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 35, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 36, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 37, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 38, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 39, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 40, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 41, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 42, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 43, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 44, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 45, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 46, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 47, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 48, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 49, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 50, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 51, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 52, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 53, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 54, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 55, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 56, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 57, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 58, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 59, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 60, '미나리');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 61, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 62, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 63, '미나리');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 64, '미나리');




/**/
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 1, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 2, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 3, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 4, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 5, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 6, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 7, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 8, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 9, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 10, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 11, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 12, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 13, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 14, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 15, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 16, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 17, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 18, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 19, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 20, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 21, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 22, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 23, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 24, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 25, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 26, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 27, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 28, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 29, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 30, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 31, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 32, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 33, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 34, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 35, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 36, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 37, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 38, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 39, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 40, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 41, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 42, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 43, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 44, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 45, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 46, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 47, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 48, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 49, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 50, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 51, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 52, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 53, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 54, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 55, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 56, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 57, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 58, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 59, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 60, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 61, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 62, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 63, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-15', 64, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 1, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 2, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 3, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 4, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 5, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 6, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 7, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 8, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 9, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 10, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 11, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 12, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 13, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 14, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 15, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 16, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 17, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 18, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 19, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 20, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 21, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 22, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 23, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 24, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 25, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 26, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 27, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 28, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 29, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 30, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 31, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 32, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 33, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 34, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 35, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 36, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 37, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 38, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 39, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 40, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 41, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 42, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 43, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 44, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 45, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 46, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 47, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 48, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 49, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 50, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 51, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 52, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 53, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 54, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 55, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 56, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 57, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 58, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 59, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 60, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 61, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 62, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 63, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 64, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 1, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 2, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 3, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 4, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 5, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 6, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 7, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 8, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 9, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 10, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 11, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 12, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 13, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 14, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 15, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 16, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 17, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 18, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 19, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 20, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 21, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 22, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 23, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 24, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 25, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 26, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 27, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 28, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 29, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 30, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 31, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 32, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 33, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 34, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 35, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 36, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 37, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 38, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 39, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 40, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 41, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 42, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 43, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 44, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 45, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 46, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 47, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 48, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 49, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 50, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 51, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 52, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 53, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 54, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 55, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 56, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 57, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 58, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 59, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 60, '비밀의 정원');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 61, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 62, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 63, '비밀의 정원');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 64, '비밀의 정원');




/**/
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 1, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 2, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 3, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 4, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 5, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 6, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 7, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 8, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 9, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 10, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 11, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 12, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 13, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 14, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 15, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 16, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 17, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 18, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 19, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 20, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 21, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 22, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 23, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 24, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 25, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 26, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 27, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 28, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 29, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 30, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 31, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 32, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 33, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 34, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 35, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 36, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 37, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 38, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 39, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 40, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 41, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 42, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 43, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 44, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 45, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 46, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 47, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 48, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 49, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 50, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 51, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 52, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 53, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 54, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 55, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 56, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 57, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 58, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 59, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 60, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 61, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 62, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 63, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 64, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 1, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 2, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 3, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 4, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 5, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 6, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 7, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 8, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 9, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 10, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 11, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 12, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 13, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 14, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 15, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 16, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 17, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 18, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 19, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 20, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 21, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 22, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 23, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 24, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 25, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 26, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 27, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 28, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 29, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 30, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 31, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 32, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 33, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 34, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 35, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 36, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 37, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 38, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 39, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 40, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 41, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 42, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 43, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 44, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 45, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 46, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 47, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 48, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 49, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 50, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 51, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 52, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 53, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 54, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 55, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 56, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 57, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 58, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 59, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 60, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 61, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 62, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 63, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 64, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 1, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 2, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 3, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 4, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 5, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 6, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 7, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 8, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 9, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 10, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 11, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 12, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 13, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 14, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 16, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 17, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 18, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 18, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 19, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 20, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 21, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 22, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 23, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 24, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 25, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 26, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 27, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 28, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 29, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 30, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 31, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 32, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 33, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 34, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 35, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 36, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 37, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 38, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 39, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 40, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 41, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 42, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 43, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 44, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 45, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 46, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 47, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 48, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 49, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 50, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 51, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 52, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 53, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 54, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 55, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 56, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 57, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 58, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 59, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 60, '베테랑');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 61, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 62, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 63, '베테랑');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 64, '베테랑');




/**/
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 1, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 2, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 3, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 4, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 5, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 6, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 7, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 8, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 9, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 10, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 11, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 12, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 13, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 14, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 15, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 16, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 17, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 18, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 19, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 20, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 21, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 22, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 23, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 24, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 25, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 26, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 27, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 28, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 29, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 30, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 31, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 32, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 33, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 34, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 35, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 36, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 37, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 38, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 39, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 40, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 41, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 42, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 43, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 44, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 45, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 46, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 47, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 48, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 49, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 50, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 51, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 52, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 53, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 54, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 55, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 56, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 57, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 58, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 59, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 60, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 61, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 62, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 63, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-16', 64, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 1, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 2, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 3, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 4, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 5, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 6, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 7, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 8, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 9, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 10, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 11, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 12, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 13, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 14, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 15, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 16, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 17, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 18, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 19, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 20, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 21, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 22, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 23, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 24, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 25, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 26, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 27, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 28, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 29, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 30, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 31, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 32, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 33, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 34, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 35, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 36, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 37, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 38, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 39, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 40, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 41, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 42, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 43, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 44, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 45, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 46, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 47, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 48, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 49, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 50, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 51, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 52, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 53, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 54, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 55, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 56, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 57, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 58, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 59, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 60, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 61, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 62, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 63, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-17', 64, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 1, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 2, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 3, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 4, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 5, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 6, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 7, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 8, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 9, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 10, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 11, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 12, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 13, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 14, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 16, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 17, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 18, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 18, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 19, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 20, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 21, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 22, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 23, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 24, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 25, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 26, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 27, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 28, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 29, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 30, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 31, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 32, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 33, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 34, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 35, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 36, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 37, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 38, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 39, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 40, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 41, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 42, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 43, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 44, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 45, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 46, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 47, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 48, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 49, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 50, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 51, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 52, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 53, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 54, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 55, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 56, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 57, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 58, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 59, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 60, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 61, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 62, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 63, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-18', 64, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 1, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 2, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 3, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 4, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 5, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 6, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 7, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 8, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 9, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 10, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 11, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 12, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 13, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 14, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 16, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 17, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 18, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 19, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 19, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 20, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 21, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 22, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 23, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 24, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 25, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 26, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 27, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 28, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 29, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 30, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 31, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 32, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 33, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 34, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 35, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 36, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 37, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 38, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 39, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 40, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 41, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 42, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 43, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 44, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 45, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 46, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 47, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 48, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 49, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 50, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 51, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 52, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 53, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 54, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 55, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 56, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 57, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 58, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 59, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 60, '테넷');

INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 61, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 62, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 63, '테넷');
INSERT INTO ticket (ticketID, holdDate, scheduleID, title) VALUES (N.NEXTVAL, '21-04-19', 64, '테넷');




COMMIT;


