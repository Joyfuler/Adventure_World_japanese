DROP TABLE LOSTITEM CASCADE CONSTRAINTS;
DROP SEQUENCE LOSTITEM_SEQ;
DROP TABLE ITEM CASCADE CONSTRAINTS;
--DROP SEQUENCE ITEM_SEQ;

--CREATE SEQUENCE ITEM_SEQ;
--CREATE TABLE ITEM(
--    ino   NUMBER(5) PRIMARY KEY,
--    litem   VARCHAR2(100) UNIQUE
--);
CREATE SEQUENCE LOSTITEM_SEQ;
CREATE TABLE LOSTITEM(
    lno   NUMBER(5) PRIMARY KEY NOT NULL,
    litem   VARCHAR2(100) NOT NULL, --REFERENCES ITEM(litem),
    lname    VARCHAR2(100) NOT NULL,
    lphoto  VARCHAR2(4000),
    location  VARCHAR2(1000),
    lrdate  DATE DEFAULT SYSDATE,
    lresult  VARCHAR2(100) DEFAULT '보관중'
);


--LOSTITEM
--ID = item
select * from item;
select * from item where ino = 1;
select * from item where litem like '%'||'신'||'%';
insert into item (ino,litem) VALUES (LOSTITEM_SEQ.NEXTVAL,'가방');
insert into item (ino,litem) VALUES (LOSTITEM_SEQ.NEXTVAL,'신발');
--ID = itemList
SELECT * FROM
    (SELECT ROWNUM RN, A.* 
       FROM(SELECT * FROM LOSTITEM ORDER BY lno DESC)A)WHERE RN BETWEEN 1 AND 3;
SELECT * FROM
    (SELECT ROWNUM RN, A.*
       FROM (SELECT * FROM LOSTITEM WHERE to_char(LRDATE, 'yyyy-mm-dd') = '2023-11-30' ORDER BY LRDATE )A)WHERE RN BETWEEN 1 AND 2;
SELECT * FROM
    (SELECT ROWNUM RN, A.*
        FROM(SELECT * FROM LOSTITEM WHERE LRDATE BETWEEN '2023-11-30' AND '2023-11-30'  
                    AND LITEM like '%'||'가'||'%'  ORDER BY LRDATE DESC)A)WHERE RN BETWEEN 1 AND 3;
SELECT * FROM
    (SELECT ROWNUM RN, A.*
        FROM(SELECT * FROM LOSTITEM WHERE (LITEM LIKE '%'||'신'||'%' OR LNAME LIKE '%'||'신'||'%') ORDER BY LRDATE DESC)A)WHERE RN BETWEEN 1 AND 3;
--ID = insertItem
INSERT INTO LOSTITEM (lno,litem,lname,lphoto,Location) VALUES (LOSTITEM_SEQ.NEXTVAL,'신발','핑크색구두','','범퍼카');
--ID = updateItem
UPDATE LOSTITEM SET lresult ='방문수령' WHERE lno = 1;
--ID = modifyitem
UPDATE LostItem SET
	        litem = '팔찌',
	        lname = '은색링팔찌',
	        lphoto = 'ac.jpg',
	        Location = '범퍼카'
   				 WHERE lno= 21;
--ID = itemTotCnt
SELECT COUNT(*) FROM LOSTITEM;
SELECT COUNT(*) FROM LOSTITEM WHERE LRDATE = '2023-11-30';
SELECT COUNT(*) FROM LOSTITEM WHERE to_char(LRDATE, 'yyyy-mm-dd') = '2023-11-29' AND LITEM like '%'||'신'||'%';
SELECT COUNT(*) FROM LOSTITEM WHERE LRDATE  = '2023-11-29' AND (LITEM LIKE '%'||'신'||'%' OR LNAME LIKE '%'||'신'||'%');
--ID = getItem
SELECT * FROM LOSTITEM WHERE LNO =1;
commit;
--ID = deleteItem
DELETE FROM LOSTITEM WHERE LNO =22;

--dummy
INSERT INTO LOSTITEM (lno,litem,lname,lphoto,Location) VALUES (LOSTITEM_SEQ.NEXTVAL,'신발','아동용 핑크색 개릭터신발','shose3.jpg','범퍼카');
INSERT INTO LOSTITEM (lno,litem,lname,lphoto,Location) VALUES (LOSTITEM_SEQ.NEXTVAL,'카드','우리은행카드','card3.jpg','정글탐험보트');
INSERT INTO LOSTITEM (lno,litem,lname,lphoto,Location) VALUES (LOSTITEM_SEQ.NEXTVAL,'외투','남성용 검은색 롱패딩','outer.jpg','점핑피쉬');
INSERT INTO LOSTITEM (lno,litem,lname,lphoto,Location) VALUES (LOSTITEM_SEQ.NEXTVAL,'신발','아동용 검은색 패딩신발','shose2.jpg','회전목마');
INSERT INTO LOSTITEM (lno,litem,lname,lphoto,Location) VALUES (LOSTITEM_SEQ.NEXTVAL,'신발','여성용 검은색 부츠','shose.jpg','범퍼카');
INSERT INTO LOSTITEM (lno,litem,lname,lphoto,Location) VALUES (LOSTITEM_SEQ.NEXTVAL,'카드','검은색카드','card2.jpg','범퍼카');
INSERT INTO LOSTITEM (lno,litem,lname,lphoto,Location) VALUES (LOSTITEM_SEQ.NEXTVAL,'지갑','루이비통 지갑','wallet2.jpg','후렌치 레볼루션');
INSERT INTO LOSTITEM (lno,litem,lname,lphoto,Location) VALUES (LOSTITEM_SEQ.NEXTVAL,'카드','하늘색카드','card.jpg','와일드 밸리');
INSERT INTO LOSTITEM (lno,litem,lname,lphoto,Location) VALUES (LOSTITEM_SEQ.NEXTVAL,'지갑','회색 지갑','wallet.jpg','회전목마');
INSERT INTO LOSTITEM (lno,litem,lname,lphoto,Location) VALUES (LOSTITEM_SEQ.NEXTVAL,'핸드폰','흰색 아이폰','phone.jpg','후렌치 레볼루션');
INSERT INTO LOSTITEM (lno,litem,lname,lphoto,Location) VALUES (LOSTITEM_SEQ.NEXTVAL,'핸드폰','파란색 아이폰','phone2.jpg','드림보트');
INSERT INTO LOSTITEM (lno,litem,lname,lphoto,Location) VALUES (LOSTITEM_SEQ.NEXTVAL,'화장품','검은색 쿠션','cosmetic.jpg','와일드 윙');
INSERT INTO LOSTITEM (lno,litem,lname,lphoto,Location) VALUES (LOSTITEM_SEQ.NEXTVAL,'모자','흰색 털 모자','hat1.jpg','풍선비행');
INSERT INTO LOSTITEM (lno,litem,lname,lphoto,Location) VALUES (LOSTITEM_SEQ.NEXTVAL,'에어팟','에어팟 한쪽','airpods.jpg','범퍼카');
INSERT INTO LOSTITEM (lno,litem,lname,lphoto,Location) VALUES (LOSTITEM_SEQ.NEXTVAL,'가방','파란색 백팩','bag.jpg','자이로드롭');

commit;