
--------------------------------------------------------
--  DDL for Sequence CINEMA_PK_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CINEMA_PK_SEQ"  MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1 START WITH 20221003 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence QNO
--------------------------------------------------------

   CREATE SEQUENCE  "QNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SCREEN_PK_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCREEN_PK_SEQ"  MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1 START WITH 20222003 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BOOKED_SEATS
--------------------------------------------------------

  CREATE TABLE "BOOKED_SEATS" ("BOOKINGCODE" VARCHAR2(200 BYTE), "SEATCODE" VARCHAR2(200 BYTE), "SCREENCODE" VARCHAR2(200 BYTE)) ;
--------------------------------------------------------
--  DDL for Table BOOKING
--------------------------------------------------------

  CREATE TABLE "BOOKING" ("BOOKINGCODE" VARCHAR2(200 BYTE), "USER_EMAIL" VARCHAR2(200 BYTE), "TIMECODE" VARCHAR2(200 BYTE), "SCREENCODE" VARCHAR2(200 BYTE), "MCODE" VARCHAR2(200 BYTE), "TOTALPRICE" NUMBER(*,0), "CHEAPSEATCOUNT" NUMBER(*,0), "MIDDLESEATCOUNT" NUMBER(*,0), "EXPANSIVESEATCOUNT" NUMBER(*,0)) ;
--------------------------------------------------------
--  DDL for Table CINEMA
--------------------------------------------------------

  CREATE TABLE "CINEMA" ("CINEMACODE" NUMBER(10,0), "CINEMANAME" VARCHAR2(20 BYTE)) ;
--------------------------------------------------------
--  DDL for Table GUEST
--------------------------------------------------------

  CREATE TABLE "GUEST" ("G_EMAIL" VARCHAR2(1000 BYTE), "G_NAME" VARCHAR2(1000 BYTE)) ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "MEMBER" ("USER_EMAIL" VARCHAR2(1000 BYTE), "USER_PASSWD" VARCHAR2(1000 BYTE), "USER_NAME" VARCHAR2(1000 BYTE), "USER_NICK" VARCHAR2(1000 BYTE), "USER_TEL" NUMBER(12,0), "USER_ADDRESS" VARCHAR2(1000 BYTE), "USER_POINT" NUMBER(5,0)) ;
--------------------------------------------------------
--  DDL for Table MOVIEDB
--------------------------------------------------------

  CREATE TABLE "MOVIEDB" ("MCODE" VARCHAR2(200 BYTE), "TITLE" VARCHAR2(60 BYTE), "TITLEENG" VARCHAR2(60 BYTE), "DIRECTORNM" VARCHAR2(60 BYTE), "DIRECTORENNM" VARCHAR2(60 BYTE), "ACTORNM" VARCHAR2(200 BYTE), "ACTORENNM" VARCHAR2(200 BYTE), "COMPANY" VARCHAR2(150 BYTE), "NATION" VARCHAR2(60 BYTE), "GENRE" VARCHAR2(100 BYTE), "RATING" VARCHAR2(60 BYTE), "RUNTIME" VARCHAR2(30 BYTE), "REPRLSDATE" DATE, "KEYWORDS" VARCHAR2(200 BYTE), "PLOTTEXT" VARCHAR2(1500 BYTE), "KMDBURL" VARCHAR2(450 BYTE)) ;
--------------------------------------------------------
--  DDL for Table MOVIE_COMMENT
--------------------------------------------------------

  CREATE TABLE "MOVIE_COMMENT" ("COMMENT_NO" NUMBER, "CONTENT" VARCHAR2(200 BYTE), "COMMENT_DATE" DATE DEFAULT SYSDATE, "MCODE" VARCHAR2(200 BYTE), "USER_EMAIL" VARCHAR2(200 BYTE)) ;
--------------------------------------------------------
--  DDL for Table MOVIE_COMMENT_HATE
--------------------------------------------------------

  CREATE TABLE "MOVIE_COMMENT_HATE" ("COMMENT_NO" NUMBER, "USER_EMAIL" VARCHAR2(200 BYTE)) ;
--------------------------------------------------------
--  DDL for Table MOVIE_COMMENT_LIKE
--------------------------------------------------------

  CREATE TABLE "MOVIE_COMMENT_LIKE" ("COMMENT_NO" NUMBER, "USER_EMAIL" VARCHAR2(200 BYTE)) ;
--------------------------------------------------------
--  DDL for Table MOVIE_FILE
--------------------------------------------------------

  CREATE TABLE "MOVIE_FILE" ("MCODE" NUMBER, "FNO" NUMBER, "PATH" VARCHAR2(150 BYTE), "MAINPOSTER" NUMBER) ;
--------------------------------------------------------
--  DDL for Table PERFORMANCE_SEAT
--------------------------------------------------------

  CREATE TABLE "PERFORMANCE_SEAT" ("SEATCODE" VARCHAR2(200 BYTE), "TIMECODE" VARCHAR2(200 BYTE), "SEATSTATUS" NUMBER, "SCREENCODE" VARCHAR2(200 BYTE)) ;
--------------------------------------------------------
--  DDL for Table QNA
--------------------------------------------------------

  CREATE TABLE "QNA" ("QNO" NUMBER, "QNA_TITLE" VARCHAR2(100 BYTE), "QNA_AREA" VARCHAR2(50 BYTE), "QNA_WRITER" VARCHAR2(1000 BYTE), "QNA_QUIRYTYPE" NUMBER, "QNA_CONTENT" VARCHAR2(2000 BYTE), "RESPONSE" VARCHAR2(2000 BYTE)) ;
--------------------------------------------------------
--  DDL for Table QNAQUIRYTYPE
--------------------------------------------------------

  CREATE TABLE "QNAQUIRYTYPE" ("QUIRY_NO" NUMBER, "QUIRYTYPE" VARCHAR2(50 BYTE)) ;
--------------------------------------------------------
--  DDL for Table RATING
--------------------------------------------------------

  CREATE TABLE "RATING" ("MCODE" VARCHAR2(200 BYTE), "SCORE" NUMBER(*,0)) ;
--------------------------------------------------------
--  DDL for Table SCREEN
--------------------------------------------------------

  CREATE TABLE "SCREEN" ("SCREENCODE" VARCHAR2(200 BYTE), "CINEMACODE" NUMBER(10,0), "SCREENNAME" VARCHAR2(20 BYTE)) ;
--------------------------------------------------------
--  DDL for Table SCREEN_MOVIE
--------------------------------------------------------

  CREATE TABLE "SCREEN_MOVIE" ("SCREENCODE" VARCHAR2(200 BYTE), "MCODE" VARCHAR2(200 BYTE), "STARTDATE" DATE, "ENDDATE" DATE) ;
--------------------------------------------------------
--  DDL for Table SEAT
--------------------------------------------------------
-- 수정한 부분 SEATROW -> SEATTYPE, SEATCOL -> SEATNO 
  CREATE TABLE "SEAT" ("SEATCODE" VARCHAR2(200 BYTE), "SCREENCODE" VARCHAR2(200 BYTE), "SEATTYPE" VARCHAR2(200 BYTE), "SEATNO" VARCHAR2(200 BYTE)) ;
--------------------------------------------------------
--  DDL for Table TIME
--------------------------------------------------------

  CREATE TABLE "TIME" ("TIMECODE" VARCHAR2(200 BYTE), "STARTTIME" VARCHAR2(200 BYTE), "ENDTIME" VARCHAR2(200 BYTE), "MOVIEDATE" DATE, "MOVIECOINT" NUMBER(*,0), "SCREENCODE" VARCHAR2(200 BYTE), "MCODE" VARCHAR2(200 BYTE)) ;
--------------------------------------------------------
--  DDL for Table WATCHLIST
--------------------------------------------------------

  CREATE TABLE "WATCHLIST" ("USER_EMAIL" VARCHAR2(200 BYTE), "MCODE" VARCHAR2(200 BYTE)) ;
--------------------------------------------------------
--  DDL for View QNA_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "QNA_VIEW" ("QNO", "QNA_TITLE", "QNA_AREA", "QNA_WRITER", "QUIRYTYPE", "QNA_CONTENT", "RESPONSE") AS SELECT Q.QNO, Q.QNA_TITLE, Q.QNA_AREA, Q.QNA_WRITER, QQ.QUIRYTYPE, Q.QNA_CONTENT, Q.RESPONSE
FROM QNA Q, QNAQUIRYTYPE QQ
WHERE Q.QNA_QUIRYTYPE = QQ.QUIRY_NO
;
REM INSERTING into BOOKED_SEATS
SET DEFINE OFF;
REM INSERTING into BOOKING
SET DEFINE OFF;
REM INSERTING into CINEMA
SET DEFINE OFF;
REM INSERTING into GUEST
SET DEFINE OFF;
REM INSERTING into MEMBER
SET DEFINE OFF;
INSERT INTO MEMBER (USER_EMAIL,USER_PASSWD,USER_NAME,USER_NICK,USER_TEL,USER_ADDRESS,USER_POINT) VALUES ('test','test','test','test',1012345678,'서울시',1000);
INSERT INTO MEMBER (USER_EMAIL,USER_PASSWD,USER_NAME,USER_NICK,USER_TEL,USER_ADDRESS,USER_POINT) VALUES ('test1','test','test1','test1',123456789,'서울시',1000);
INSERT INTO MEMBER (USER_EMAIL,USER_PASSWD,USER_NAME,USER_NICK,USER_TEL,USER_ADDRESS,USER_POINT) VALUES ('test222','1234','test1','test1',123456789,'서울시',1000);
INSERT INTO MEMBER (USER_EMAIL,USER_PASSWD,USER_NAME,USER_NICK,USER_TEL,USER_ADDRESS,USER_POINT) VALUES ('test0002@google.com','123456q1!','test001','test001',1023545456,'04058 서울 마포구 신촌로 지하 90 신촌',1000);
INSERT INTO MEMBER (USER_EMAIL,USER_PASSWD,USER_NAME,USER_NICK,USER_TEL,USER_ADDRESS,USER_POINT) VALUES ('test0001@naver.com','123456q1!','test12','test12',1234567890,'03967 서울 마포구 성미산로 51 홍대',1000);
REM INSERTING into MOVIEDB
SET DEFINE OFF;
REM INSERTING into MOVIE_COMMENT
SET DEFINE OFF;
REM INSERTING into MOVIE_COMMENT_HATE
SET DEFINE OFF;
REM INSERTING into MOVIE_COMMENT_LIKE
SET DEFINE OFF;
REM INSERTING into MOVIE_FILE
SET DEFINE OFF;
REM INSERTING into PERFORMANCE_SEAT
SET DEFINE OFF;
REM INSERTING into QNA
SET DEFINE OFF;
INSERT INTO QNA (QNO,QNA_TITLE,QNA_AREA,QNA_WRITER,QNA_QUIRYTYPE,QNA_CONTENT,RESPONSE) VALUES (4,'sdfsdfsdfsdf','seoul','test0001@naver.com',2,'sd1f5sdf1sd5f',NULL);
INSERT INTO QNA (QNO,QNA_TITLE,QNA_AREA,QNA_WRITER,QNA_QUIRYTYPE,QNA_CONTENT,RESPONSE) VALUES (6,'sdfsdf','seoul','test0001@naver.com',2,'sdfsdfewr',NULL);
INSERT INTO QNA (QNO,QNA_TITLE,QNA_AREA,QNA_WRITER,QNA_QUIRYTYPE,QNA_CONTENT,RESPONSE) VALUES (5,'sdfsdfsdfsdf','seoul','test0001@naver.com',2,'sd1f5sdf1sd5f',NULL);
REM INSERTING into QNAQUIRYTYPE
SET DEFINE OFF;
INSERT INTO QNAQUIRYTYPE (QUIRY_NO,QUIRYTYPE) VALUES (1,'일반문의');
INSERT INTO QNAQUIRYTYPE (QUIRY_NO,QUIRYTYPE) VALUES (2,'불만');
INSERT INTO QNAQUIRYTYPE (QUIRY_NO,QUIRYTYPE) VALUES (3,'제안');
REM INSERTING into RATING
SET DEFINE OFF;
REM INSERTING into SCREEN
SET DEFINE OFF;
REM INSERTING into SCREEN_MOVIE
SET DEFINE OFF;
REM INSERTING into SEAT
SET DEFINE OFF;
REM INSERTING into TIME
SET DEFINE OFF;
REM INSERTING into WATCHLIST
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index BOOKED_SEATS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOOKED_SEATS_PK" ON "BOOKED_SEATS" ("BOOKINGCODE", "SEATCODE", "SCREENCODE") ;
--------------------------------------------------------
--  DDL for Index SCREEN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCREEN_PK" ON "SCREEN" ("SCREENCODE") ;
--------------------------------------------------------
--  DDL for Index SCREEN_MOVIE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCREEN_MOVIE" ON "SCREEN_MOVIE" ("SCREENCODE", "MCODE") ;
--------------------------------------------------------
--  DDL for Index MOVIEDB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOVIEDB_PK" ON "MOVIEDB" ("MCODE") ;
--------------------------------------------------------
--  DDL for Index PERFORMANCE_SEAT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PERFORMANCE_SEAT" ON "PERFORMANCE_SEAT" ("SEATCODE", "TIMECODE") ;
--------------------------------------------------------
--  DDL for Index CINEMA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CINEMA_PK" ON "CINEMA" ("CINEMACODE") ;
--------------------------------------------------------
--  DDL for Index PERFORMANCE_SEAT1
--------------------------------------------------------

  CREATE UNIQUE INDEX "PERFORMANCE_SEAT1" ON "PERFORMANCE_SEAT" ("SEATCODE", "TIMECODE", "SCREENCODE") ;
--------------------------------------------------------
--  Constraints for Table BOOKING
--------------------------------------------------------

  ALTER TABLE "BOOKING" ADD PRIMARY KEY ("BOOKINGCODE") ENABLE;
--------------------------------------------------------
--  Constraints for Table QNAQUIRYTYPE
--------------------------------------------------------

  ALTER TABLE "QNAQUIRYTYPE" ADD PRIMARY KEY ("QUIRY_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table TIME
--------------------------------------------------------

  ALTER TABLE "TIME" ADD PRIMARY KEY ("TIMECODE") ENABLE;
--------------------------------------------------------
--  Constraints for Table SEAT
--------------------------------------------------------

  ALTER TABLE "SEAT" ADD PRIMARY KEY ("SEATCODE") ENABLE;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "MEMBER" ADD PRIMARY KEY ("USER_EMAIL") ENABLE;
--------------------------------------------------------
--  Constraints for Table PERFORMANCE_SEAT
--------------------------------------------------------

  ALTER TABLE "PERFORMANCE_SEAT" ADD CONSTRAINT "PERFORMANCE_SEAT" PRIMARY KEY ("SEATCODE", "TIMECODE", "SCREENCODE") ENABLE;
  ALTER TABLE "PERFORMANCE_SEAT" MODIFY ("SCREENCODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MOVIE_COMMENT
--------------------------------------------------------

  ALTER TABLE "MOVIE_COMMENT" ADD PRIMARY KEY ("COMMENT_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table BOOKED_SEATS
--------------------------------------------------------

  ALTER TABLE "BOOKED_SEATS" ADD CONSTRAINT "BOOKED_SEATS_PK" PRIMARY KEY ("BOOKINGCODE", "SEATCODE", "SCREENCODE") ENABLE;
  ALTER TABLE "BOOKED_SEATS" MODIFY ("SCREENCODE" NOT NULL ENABLE);
  ALTER TABLE "BOOKED_SEATS" MODIFY ("SEATCODE" NOT NULL ENABLE);
  ALTER TABLE "BOOKED_SEATS" MODIFY ("BOOKINGCODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GUEST
--------------------------------------------------------

  ALTER TABLE "GUEST" ADD PRIMARY KEY ("G_EMAIL") ENABLE;
--------------------------------------------------------
--  Constraints for Table RATING
--------------------------------------------------------

  ALTER TABLE "RATING" ADD PRIMARY KEY ("MCODE") ENABLE;
--------------------------------------------------------
--  Constraints for Table CINEMA
--------------------------------------------------------

  ALTER TABLE "CINEMA" ADD CONSTRAINT "CINEMA_PK" PRIMARY KEY ("CINEMACODE") ENABLE;
--------------------------------------------------------
--  Constraints for Table MOVIEDB
--------------------------------------------------------

  ALTER TABLE "MOVIEDB" MODIFY ("MCODE" NOT NULL ENABLE);
  ALTER TABLE "MOVIEDB" ADD CONSTRAINT "MOVIEDB_PK" PRIMARY KEY ("MCODE") ENABLE;
--------------------------------------------------------
--  Constraints for Table QNA
--------------------------------------------------------

  ALTER TABLE "QNA" ADD PRIMARY KEY ("QNO") ENABLE;
--------------------------------------------------------
--  Constraints for Table SCREEN
--------------------------------------------------------

  ALTER TABLE "SCREEN" ADD CONSTRAINT "SCREEN_PK" PRIMARY KEY ("SCREENCODE") ENABLE;
--------------------------------------------------------
--  Constraints for Table SCREEN_MOVIE
--------------------------------------------------------

  ALTER TABLE "SCREEN_MOVIE" ADD CONSTRAINT "SCREEN_MOVIE" PRIMARY KEY ("SCREENCODE", "MCODE") ENABLE;
--------------------------------------------------------
--  Constraints for Table WATCHLIST
--------------------------------------------------------

  ALTER TABLE "WATCHLIST" ADD PRIMARY KEY ("USER_EMAIL") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOOKING
--------------------------------------------------------

  ALTER TABLE "BOOKING" ADD CONSTRAINT "BOOKING_EMAIL_FK" FOREIGN KEY ("USER_EMAIL") REFERENCES "MEMBER" ("USER_EMAIL") ON DELETE CASCADE ENABLE;
  ALTER TABLE "BOOKING" ADD CONSTRAINT "BOOKING_SCREENCODE_FK" FOREIGN KEY ("SCREENCODE") REFERENCES "SCREEN" ("SCREENCODE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "BOOKING" ADD CONSTRAINT "BOOKING_TIMECODE_FK" FOREIGN KEY ("TIMECODE") REFERENCES "TIME" ("TIMECODE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "BOOKING" ADD CONSTRAINT "BOOKING_MCODE_FK" FOREIGN KEY ("MCODE") REFERENCES "MOVIEDB" ("MCODE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QNA
--------------------------------------------------------

  ALTER TABLE "QNA" ADD CONSTRAINT "QNA_QUIRYTYPE_FK" FOREIGN KEY ("QNA_QUIRYTYPE") REFERENCES "QNAQUIRYTYPE" ("QUIRY_NO") ON DELETE SET NULL ENABLE;
  ALTER TABLE "QNA" ADD CONSTRAINT "QNA_WRITER_FK" FOREIGN KEY ("QNA_WRITER") REFERENCES "MEMBER" ("USER_EMAIL") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SCREEN
--------------------------------------------------------

  ALTER TABLE "SCREEN" ADD CONSTRAINT "SCREEN_CINEMACODE_FK" FOREIGN KEY ("CINEMACODE") REFERENCES "CINEMA" ("CINEMACODE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SEAT
--------------------------------------------------------

  ALTER TABLE "SEAT" ADD CONSTRAINT "SEAT_SCREENCODE_FK" FOREIGN KEY ("SCREENCODE") REFERENCES "SCREEN" ("SCREENCODE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TIME
--------------------------------------------------------

  ALTER TABLE "TIME" ADD CONSTRAINT "TIME_SCREENCODE_FK" FOREIGN KEY ("SCREENCODE") REFERENCES "SCREEN" ("SCREENCODE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "TIME" ADD CONSTRAINT "TIME_MCODE_FK" FOREIGN KEY ("MCODE") REFERENCES "MOVIEDB" ("MCODE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table WATCHLIST
--------------------------------------------------------

  ALTER TABLE "WATCHLIST" ADD CONSTRAINT "WL_MCODE_FK" FOREIGN KEY ("MCODE") REFERENCES "MOVIEDB" ("MCODE") ON DELETE CASCADE ENABLE;
---------------------------------------------------------------------------

-- PRIMARY KEY 관련 시퀀스 생성
-- CINEMA PK 시퀀스
CREATE SEQUENCE CINEMA_PK_SEQ
INCREMENT BY 1
START WITH 20221003
MAXVALUE 99999999
;
-- SCREEN PK 시퀀스
CREATE SEQUENCE SCREEN_PK_SEQ
INCREMENT BY 1
START WITH 20222003
MAXVALUE 99999999
;

-- BOOKING PK 시퀀스
CREATE SEQUENCE BOOKING_PK_SEQ
INCREMENT BY 1
START WITH 20228001
MAXVALUE 99999999;

-- Movie DB 시퀀스
CREATE SEQUENCE  "MOVIE_CODE"  MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1 START WITH 20221003 CACHE 20 NOORDER  NOCYCLE ;
---------------------------------------------------------------------------
-- 더미 데이터 입력부

INSERT INTO CINEMA VALUES ('20221001', '신촌');
INSERT INTO CINEMA VALUES ('20221002', '강남');

INSERT INTO SCREEN VALUES ('20222001', '20221001', '1관');
INSERT INTO SCREEN VALUES ('20222002', '20221001', '2관');
INSERT INTO SCREEN VALUES ('20222003', '20221001', '3관');
INSERT INTO SCREEN VALUES ('20222004', '20221002', '1관');
INSERT INTO SCREEN VALUES ('20222005', '20221002', '2관');
INSERT INTO SCREEN VALUES ('20222006', '20221002', '3관');

INSERT INTO MOVIEDB VALUES('20220001', 'mtitle1', 'mtitleeng1', '123','123','123','123','123','123','123','123','123','22/07/01 00:00', '123', '123', '123');
INSERT INTO MOVIEDB VALUES('20220002', 'mtitle2', 'mtitleeng2', '123','123','123','123','123','123','123','123','123','22/07/01 00:00', '123', '123', '123');
INSERT INTO MOVIEDB VALUES('20220003', 'mtitle3', 'mtitleeng3', '123','123','123','123','123','123','123','123','123','22/07/01 00:00', '123', '123', '123');
INSERT INTO MOVIEDB VALUES('20220004', 'mtitle4', 'mtitleeng4', '123','123','123','123','123','123','123','123','123','22/07/01 00:00', '123', '123', '123');
INSERT INTO MOVIEDB VALUES('20220005', 'mtitle5', 'mtitleeng5', '123','123','123','123','123','123','123','123','123','22/07/01 00:00', '123', '123', '123');
INSERT INTO MOVIEDB VALUES('20220006', 'mtitle6', 'mtitleeng6', '123','123','123','123','123','123','123','123','123','22/07/01 00:00', '123', '123', '123');

INSERT INTO SCREEN_MOVIE VALUES('20222001', '20220001', '22/07/01 00:00', '22/08/10 00:00');
INSERT INTO SCREEN_MOVIE VALUES('20222002', '20220002', '22/07/01 00:00', '22/08/10 00:00');
INSERT INTO SCREEN_MOVIE VALUES('20222004', '20220003', '22/07/01 00:00', '22/08/10 00:00');
INSERT INTO SCREEN_MOVIE VALUES('20222005', '20220004', '22/07/01 00:00', '22/08/10 00:00');

INSERT INTO TIME VALUES('20223001', '08:10', '10:00', '22/07/02 00:00', 1, '20222001', '20220001');
INSERT INTO TIME VALUES('20223002', '10:30', '12:20', '22/07/02 00:00', 2, '20222001', '20220001');
INSERT INTO TIME VALUES('20223003', '14:10', '16:00', '22/07/02 00:00', 3, '20222001', '20220001');

INSERT INTO TIME VALUES('20223004', '08:30', '10:20', '22/07/02 00:00', 1, '20222002', '20220002');
INSERT INTO TIME VALUES('20223005', '10:40', '12:30', '22/07/02 00:00', 2, '20222002', '20220002');
INSERT INTO TIME VALUES('20223006', '14:00', '15:50', '22/07/02 00:00', 3, '20222002', '20220002');

INSERT INTO TIME VALUES('20223007', '08:30', '10:20', '22/07/02 00:00', 1, '20222003', '20220003');
INSERT INTO TIME VALUES('20223008', '10:40', '12:30', '22/07/02 00:00', 2, '20222003', '20220003');
INSERT INTO TIME VALUES('20223009', '14:00', '15:50', '22/07/02 00:00', 3, '20222003', '20220003');

INSERT INTO TIME VALUES('20223010', '08:30', '10:20', '22/07/02 00:00', 1, '20222004', '20220004');
INSERT INTO TIME VALUES('20223011', '10:40', '12:30', '22/07/02 00:00', 2, '20222004', '20220004');
INSERT INTO TIME VALUES('20223012', '14:00', '15:50', '22/07/02 00:00', 3, '20222004', '20220004');

INSERT INTO TIME VALUES('20223013', '08:30', '10:20', '22/07/02 00:00', 1, '20222005', '20220005');
INSERT INTO TIME VALUES('20223014', '10:40', '12:30', '22/07/02 00:00', 2, '20222005', '20220005');
INSERT INTO TIME VALUES('20223015', '14:00', '15:50', '22/07/02 00:00', 3, '20222005', '20220005');

INSERT INTO SEAT VALUES('20224001', '20222001', 'A', '1');
INSERT INTO SEAT VALUES('20224002', '20222001', 'A', '2');
INSERT INTO SEAT VALUES('20224003', '20222001', 'A', '3');
INSERT INTO SEAT VALUES('20224004', '20222001', 'A', '4');
INSERT INTO SEAT VALUES('20224005', '20222001', 'A', '5');
INSERT INTO SEAT VALUES('20224006', '20222001', 'A', '6');
INSERT INTO SEAT VALUES('20224007', '20222001', 'A', '7');
INSERT INTO SEAT VALUES('20224008', '20222001', 'A', '8');
INSERT INTO SEAT VALUES('20224009', '20222001', 'A', '9');
INSERT INTO SEAT VALUES('20224010', '20222001', 'A', '10');
INSERT INTO SEAT VALUES('20224011', '20222002', 'B', '1');
INSERT INTO SEAT VALUES('20224012', '20222002', 'B', '2');
INSERT INTO SEAT VALUES('20224013', '20222002', 'B', '3');
INSERT INTO SEAT VALUES('20224014', '20222002', 'B', '4');
INSERT INTO SEAT VALUES('20224015', '20222002', 'B', '5');
INSERT INTO SEAT VALUES('20224016', '20222002', 'B', '6');
INSERT INTO SEAT VALUES('20224017', '20222002', 'B', '7');
INSERT INTO SEAT VALUES('20224018', '20222002', 'B', '8');
INSERT INTO SEAT VALUES('20224019', '20222002', 'B', '9');
INSERT INTO SEAT VALUES('20224020', '20222002', 'B', '10');
INSERT INTO SEAT VALUES('20224021', '20222003', 'C', '1');
INSERT INTO SEAT VALUES('20224022', '20222003', 'C', '2');
INSERT INTO SEAT VALUES('20224023', '20222003', 'C', '3');
INSERT INTO SEAT VALUES('20224024', '20222003', 'C', '4');
INSERT INTO SEAT VALUES('20224025', '20222003', 'C', '5');
INSERT INTO SEAT VALUES('20224026', '20222003', 'C', '6');
INSERT INTO SEAT VALUES('20224027', '20222003', 'C', '7');
INSERT INTO SEAT VALUES('20224028', '20222003', 'C', '8');
INSERT INTO SEAT VALUES('20224029', '20222003', 'C', '9');
INSERT INTO SEAT VALUES('20224030', '20222003', 'C', '10');
INSERT INTO SEAT VALUES('20224031', '20222004', 'D', '1');
INSERT INTO SEAT VALUES('20224032', '20222004', 'D', '2');
INSERT INTO SEAT VALUES('20224033', '20222004', 'D', '3');
INSERT INTO SEAT VALUES('20224034', '20222004', 'D', '4');
INSERT INTO SEAT VALUES('20224035', '20222004', 'D', '5');
INSERT INTO SEAT VALUES('20224036', '20222004', 'D', '6');
INSERT INTO SEAT VALUES('20224037', '20222004', 'D', '7');
INSERT INTO SEAT VALUES('20224038', '20222004', 'D', '8');
INSERT INTO SEAT VALUES('20224039', '20222004', 'D', '9');
INSERT INTO SEAT VALUES('20224040', '20222004', 'D', '10');


---------------------------------------------------------------------------

-- sql문

SELECT SC.SCREENCODE, SC.CINEMACODE, (SELECT CINEMANAME FROM CINEMA C WHERE C.CINEMACODE = SC.CINEMACODE) AS CINEMANAME, SC.SCREENNAME FROM SCREEN SC;

SELECT TI.TIMECODE, TI.SCREENCODE, TI.MCODE, (SELECT SCREENNAME FROM SCREEN SC WHERE SC.SCREENCODE = TI.SCREENCODE) AS SCREENNAME, TI.STARTTIME, (SELECT TITLE FROM MOVIEDB MV WHERE MV.MCODE = TI.MCODE) AS TITLE FROM TIME TI WHERE SCREENCODE = 20222001 AND TI.MOVIEDATE LIKE '22/07/02' || '%';

SELECT DISTINCT SEATTYPE FROM SEAT WHERE SCREENCODE = '20222001';

INSERT INTO BOOKING VALUES(BOOKING_PK_SEQ.NEXTVAL,'id','tiemcoede',SCREENCODE,'mocde','totlaprce',0,0,0);

INSERT INTO BOOKED_SEATS VALUSE('bookingcode', 'seatcode', SCREENCODE;

SELECT SEATCODE FROM SEAT WHERE SCREENCODE = '20222001' AND SEATNO = 1;

SELECT BOOKINGCODE FROM BOOKING WHERE USER_EMAIL = 'test' AND TIMECODE = 'timecodd';

select * from moviedb;

select sc.screencode, sc.cinemacode,
		 (select cinemaname from cinema c where c.cinemacode = sc.cinemacode) as cinemaname, sc.screenname 
		from screen sc;
select cinemaname from cinema c, screen s where c.cinemacode = s.cinemacode;


select cinemaname, (select screencode from screen_movie where mcode = '20220001' and startdate <= '22/07/02' and enddate >= '22/07/02') as screencode from cinema c,(select cinemacode from screen s, (select screencode from screen_movie where mcode = '20220001' and startdate <= '22/07/02' and enddate >= '22/07/02') sm where s.screencode = sm.screencode) ss where c.cinemacode = ss.cinemacode;

select * from screen;
    
select * from time where moviedate = '22/07/02' and screencode = '20222001';

select timecode, starttime, endtime, mcode, screencode, (select screenname from screen where screencode = '20222001') screenname from time t where moviedate = '22/07/02' and screencode = '20222001' and mcode = '20220001';

---------------------------------------------------------------------------

-- DATE FORMAT 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YY/MM/DD HH24:MI';

-- 모든 DROP 문 출력
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM USER_TABLES;
