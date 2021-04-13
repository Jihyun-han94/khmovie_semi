CREATE TABLE Movie (
    TITLE VARCHAR2(100) PRIMARY KEY,
    START_DATE DATE DEFAULT SYSDATE,
    END_DATE  DATE DEFAULT SYSDATE,
    TIME VARCHAR2(10) NOT NULL,
    PRICE NUMBER NOT NULL,
    LIMIT NUMBER NOT NULL,
    DIRECT  VARCHAR2(20),
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
    USER_NAME VARCHAR2(10) NOT NULL,
    GENDER NUMBER NOT NULL,
    EMAIL VARCHAR2(30) NOT NULL,
    PHONE_NUMBER VARCHAR2(20) NOT NULL,
    PURCHASE NUMBER,
    GRADE NUMBER,
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
    UPDATE_DATE DATE DEFAULT SYSDATE,
    CONSTRAINTS FK_TITLE FOREIGN KEY (B_TITLE) REFERENCES Movie (TITLE)
);

CREATE TABLE BOARD_COMMENT 
(
  CNUM NUMBER PRIMARY KEY,
  CID VARCHAR2(15),
  CDATE DATE,
  CPARENTNUM NUMBER,
  CCONTENT VARCHAR2(500) NOT NULL,
  CCOUNT NUMBER
);
create sequence COMMENT_SEQ;

CREATE TABLE FILE_T(
    movietitle VARCHAR(200),
    fileName VARCHAR(200),
    fileRealName VARCHAR(200)
);