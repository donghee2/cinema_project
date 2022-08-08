--------------------------------------
-- ��� ����
CREATE USER CINEMAPES IDENTIFIED BY 123456;
GRANT RESOURCE, CONNECT, DBA TO CINEMAPES;
-------------------------------------
-- ��ȭ�� ���̺�
CREATE TABLE CINEMA(
    -- ��ȭ�� ���� ��ȣ
    CNO VARCHAR2(8) PRIMARY KEY,
    -- ��ȭ�� �̸� , ���̺� ������ �ʿ��Ѱ�?
    CNAME VARCHAR2(16)
);
CREATE TABLE THEATER(
    -- ���� ���� ��ȣ
    TNO VARCHAR2(8) PRIMARY KEY,
    CNO VARCHAR2(8),
    -- �����(1�� ~��, 2�� ~~�� ��)
    TNAME VARCHAR2(50),
    -- �¼� ���� X��
    SEATX NUMBER(2),
    -- �¼� ���� Y��
    SEATY NUMBER(2)
);
ALTER TABLE THEATER ADD CONSTRAINT THEATER_CNO_FK FOREIGN KEY(CNO) REFERENCES CINEMA(CNO) ON DELETE CASCADE;
---------------------------------------------------------------------------
-- (�ӽ�) ��ȭ ���� ���̺�
CREATE TABLE MOVIE_INFO(
    -- ��ȭ ���� ��ȣ
    MNO VARCHAR2(50) PRIMARY KEY,
    -- ��ȭ ����
    MNAME VARCHAR2(100)
);
----------------------------------------------------------------------
-- (�ӽ�) ��ȭ �� ���� ���̺�
CREATE TABLE MOVIE_SCHEDULE(
    -- �� �ð� ���� ��ȣ
    SNO VARCHAR2(8) PRIMARY KEY,
    -- ���� ���� ��ȣ
    TNO VARCHAR2(8),
    -- ��ȭ ���� ��ȣ
    MNO VARCHAR2(50),
    -- ��ȭ �� �ð�
    SDATE DATE,
    -- ��ȭ ���(����, �� ���)
    SPRICE NUMBER(6)
);
ALTER TABLE MOVIE_SCHEDULE ADD CONSTRAINT MOVIE_CNO_FK FOREIGN KEY(TNO) REFERENCES THEATER(TNO) ON DELETE CASCADE;
ALTER TABLE MOVIE_SCHEDULE ADD CONSTRAINT MOVIE_MNO_FK FOREIGN KEY(MNO) REFERENCES MOVIE_INFO(MNO) ON DELETE CASCADE;
-------------------------------------------------------------------
-- ���� ���� ���̺�
CREATE TABLE reservation(
    -- ���� ���� ��ȣ
    RNO VARCHAR2(8) PRIMARY KEY,
    -- �� �ð� ���� ��ȣ
    SNO VARCHAR2(8),
    -- ������
    ID VARCHAR2(30),
    -- ���� ��� ��¥
    RDATE DATE DEFAULT SYSDATE,
    -- ���� �¼�
    RSEAT VARCHAR2(10)
    );

ALTER TABLE reservation ADD CONSTRAINT reservation_SNO_FK FOREIGN KEY(SNO) REFERENCES MOVIE_SCHEDULE(SNO) ON DELETE CASCADE;

-- ���� ������ ����
CREATE SEQUENCE RESERVATION_SEQ;

----------------------------------------------------------------------

-- DATE FORMAT ����
ALTER SESSION set NLS_DATE_FORMAT = 'YY/MM/DD HH24:MI';

-- ���� ������ �Է�
INSERT INTO CINEMA VALUES ('C001', '������');
INSERT INTO CINEMA VALUES ('C002', '������');

INSERT INTO MOVIE_INFO VALUES ('M001', '��ȭ����1');
INSERT INTO MOVIE_INFO VALUES ('M002', '��ȭ����2');
INSERT INTO MOVIE_INFO VALUES ('M003', '��ȭ����3');
INSERT INTO MOVIE_INFO VALUES ('M004', '��ȭ����4');

INSERT INTO THEATER VALUES ('T001', 'C001', '1��', 20, 10);
INSERT INTO THEATER VALUES ('T002', 'C001', '2��', 20, 10);
INSERT INTO THEATER VALUES ('T003', 'C002', '1��', 20, 8);
INSERT INTO THEATER VALUES ('T004', 'C002', '2��', 20, 8);

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
-- ��� SQL��
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


-- ��� DROP�� �޾ƿ���
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
