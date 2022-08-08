--------------------------------------
-- 사용 계정
CREATE USER CINEMAPES IDENTIFIED BY 123456;
GRANT RESOURCE, CONNECT, DBA TO CINEMAPES;
-------------------------------------
-- 영화관 테이블
CREATE TABLE CINEMA(
    -- 영화관 구분 번호
    CNO VARCHAR2(8) PRIMARY KEY,
    -- 영화관 이름 , 테이블 구분이 필요한가?
    CNAME VARCHAR2(16)
);
CREATE TABLE THEATER(
    -- 극장 구분 번호
    TNO VARCHAR2(8) PRIMARY KEY,
    CNO VARCHAR2(8),
    -- 극장명(1관 ~층, 2관 ~~룸 등)
    TNAME VARCHAR2(50),
    -- 좌석 구성 X축
    SEATX NUMBER(2),
    -- 좌석 구성 Y축
    SEATY NUMBER(2)
);
ALTER TABLE THEATER ADD CONSTRAINT THEATER_CNO_FK FOREIGN KEY(CNO) REFERENCES CINEMA(CNO) ON DELETE CASCADE;
---------------------------------------------------------------------------
-- (임시) 영화 정보 테이블
CREATE TABLE MOVIE_INFO(
    -- 영화 구분 번호
    MNO VARCHAR2(50) PRIMARY KEY,
    -- 영화 제목
    MNAME VARCHAR2(100)
);
----------------------------------------------------------------------
-- (임시) 영화 상영 정보 테이블
CREATE TABLE MOVIE_SCHEDULE(
    -- 상영 시간 구분 번호
    SNO VARCHAR2(8) PRIMARY KEY,
    -- 극장 구분 번호
    TNO VARCHAR2(8),
    -- 영화 구분 번호
    MNO VARCHAR2(50),
    -- 영화 상영 시간
    SDATE DATE,
    -- 영화 요금(조조, 등 고려)
    SPRICE NUMBER(6)
);
ALTER TABLE MOVIE_SCHEDULE ADD CONSTRAINT MOVIE_CNO_FK FOREIGN KEY(TNO) REFERENCES THEATER(TNO) ON DELETE CASCADE;
ALTER TABLE MOVIE_SCHEDULE ADD CONSTRAINT MOVIE_MNO_FK FOREIGN KEY(MNO) REFERENCES MOVIE_INFO(MNO) ON DELETE CASCADE;
-------------------------------------------------------------------
-- 예매 정보 테이블
CREATE TABLE reservation(
    -- 예매 구분 번호
    RNO VARCHAR2(8) PRIMARY KEY,
    -- 상영 시간 구분 번호
    SNO VARCHAR2(8),
    -- 예매자
    ID VARCHAR2(30),
    -- 예매 당시 날짜
    RDATE DATE DEFAULT SYSDATE,
    -- 예매 좌석
    RSEAT VARCHAR2(10)
    );

ALTER TABLE reservation ADD CONSTRAINT reservation_SNO_FK FOREIGN KEY(SNO) REFERENCES MOVIE_SCHEDULE(SNO) ON DELETE CASCADE;

-- 예매 시퀀스 생성
CREATE SEQUENCE RESERVATION_SEQ;

----------------------------------------------------------------------

-- DATE FORMAT 변경
ALTER SESSION set NLS_DATE_FORMAT = 'YY/MM/DD HH24:MI';

-- 더미 데이터 입력
INSERT INTO CINEMA VALUES ('C001', '신촌점');
INSERT INTO CINEMA VALUES ('C002', '강남점');

INSERT INTO MOVIE_INFO VALUES ('M001', '영화제목1');
INSERT INTO MOVIE_INFO VALUES ('M002', '영화제목2');
INSERT INTO MOVIE_INFO VALUES ('M003', '영화제목3');
INSERT INTO MOVIE_INFO VALUES ('M004', '영화제목4');

INSERT INTO THEATER VALUES ('T001', 'C001', '1관', 20, 10);
INSERT INTO THEATER VALUES ('T002', 'C001', '2관', 20, 10);
INSERT INTO THEATER VALUES ('T003', 'C002', '1관', 20, 8);
INSERT INTO THEATER VALUES ('T004', 'C002', '2관', 20, 8);

INSERT INTO MOVIE_SCHEDULE VALUES('S001', 'T001', 'M001', '22/07/22 08:30', 9000);
INSERT INTO MOVIE_SCHEDULE VALUES('S002', 'T002', 'M001', '22/07/22 11:30', 12000);
INSERT INTO MOVIE_SCHEDULE VALUES('S003', 'T003', 'M002', '22/07/22 09:10', 9000);
INSERT INTO MOVIE_SCHEDULE VALUES('S004', 'T004', 'M002', '22/07/22 13:40', 12000);
INSERT INTO MOVIE_SCHEDULE VALUES('S005', 'T002', 'M001', '22/07/22 15:40', 12000);
INSERT INTO MOVIE_SCHEDULE VALUES('S006', 'T001', 'M002', '22/07/22 12:40', 12000);
INSERT INTO MOVIE_SCHEDULE VALUES('S007', 'T001', 'M002', '22/07/22 13:10', 12000);
INSERT INTO MOVIE_SCHEDULE VALUES('S008', 'T001', 'M001', '22/07/22 16:00', 12000);
INSERT INTO MOVIE_SCHEDULE VALUES('S009', 'T002', 'M001', '22/07/22 18:50', 12000);
-------------------------------------------------------
-- 사용 SQL문
SELECT * FROM CINEMA;

select * from MOVIE_SCHEDULE;

select ms.sno, (select tname from theater where tno = ms.tno) as tname, (select mname from movie_info where mno = ms.mno) as mname, ms.sdate, ms.sprice
from MOVIE_SCHEDULE ms, (select tno from theater where cno = 'C001') th where th.tno = ms.tno and ms.sdate like '22/07/22' || '%';

select ms.sno, (select tname from theater where tno = ms.tno) as tname,
		(select mname from movie_info where mno = ms.mno) as mname,
		ms.sdate, ms.sprice from
		MOVIE_SCHEDULE ms, (select tno from theater where cno = 'C001') th
		where th.tno = ms.tno and ms.sdate like '22/07/22' || '%' order by sdate asc;

insert into reservation VALUES(RESERVATION_SEQ.NEXTVAL, 'S001', 'TEST', SYSDATE, seat);

select tname, seatx, seaty from theater th, (select tno from movie_schedule where sno = 'S001') ms where ms.tno = th.tno;


-- 모든 DROP문 받아오기
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
