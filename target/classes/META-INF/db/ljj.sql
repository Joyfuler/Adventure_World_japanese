DROP TABLE cart CASCADE CONSTRAINTS;
DROP SEQUENCE cart_cseq;
CREATE SEQUENCE cart_seq INCREMENT BY 1 START WITH 1 NOCYCLE NOCACHE ;
select*from cart;

CREATE TABLE MEMBER
(
	mid varchar2(20) NOT NULL,
	mpw varchar2(20) NOT NULL,
	mname varchar2(20) NOT NULL,
	mphone varchar2(20) NOT NULL,
	memail varchar2(40) NOT NULL,
	maddress1 varchar2(9),
	maddress2 varchar2(1000),
    maddress3 varchar2(1000),
	mrdate date DEFAULT sysdate,
	PRIMARY KEY (mid)
);

CREATE TABLE cart
(
	CID number(10) PRIMARY KEY NOT NULL,
	p1 number(10),
	p2 number(10),
	TYPE number(10),
	ATNAME1 varchar2(100),
	ATNAME2 varchar2(100),
	ATNAME3 varchar2(100),
	PRICE1 number(10) NOT NULL,
	PRICE2 number(10),
	RESULT number(1) DEFAULT 0,
	CRDATE date DEFAULT sysdate,
	VISITDATE date DEFAULT sysdate,
	MID VARCHAR2(20)  REFERENCES MEMBER(MID) 
);
commit;

INSERT INTO MEMBER (mid,mpw, mname,mphone,memail,maddress1,maddress2,maddress3) VALUES ('one', '1234', '김나리', '017-777-7777','acc@abc.com','133-110', '서울시 성동구 성수동1가' , '1번지21호');

--mapper
--1.list id = cartList
SELECT * FROM (SELECT ROWNUM RN, A.* 
    FROM (SELECT C.*, MNAME  FROM CART C, MEMBER M WHERE C.MID = M.MID ORDER BY CRDATE ) A)
  WHERE RN BETWEEN 1 AND 2; 
  
SELECT * FROM (SELECT ROWNUM RN, A.* 
    FROM (SELECT * FROM CART ORDER BY CRDATE)A)
  WHERE RN BETWEEN 1 AND 2; 

SELECT * FROM CART;

--ID =totCntCart
SELECT COUNT(*) FROM CART;
--ID =getDetailCart
SELECT*FROM CART WHERE CID=1;
--ID=registerCart
INSERT INTO CART( CID, p1, p2, TYPE, ATNAME1, ATNAME2, ATNAME3, PRICE1, PRICE2, RESULT, VISITDATE ,MID )
    values(cart_seq.NEXTVAL,1,1,1,'A','B','C',10000,5000,0,'2023-11-23','one');
--ID=modifyBCart
UPDATE CART SET  
        p1 = 2,
        p2 = 1,
        TYPE = 1,
       ATNAME1 = 'A',
       ATNAME2 ='D',
       ATNAME3 = 'C',
       PRICE1 = 20000,
       PRICE2 = 5000,
       RESULT = 1,
       VISITDATE = '2023-11-23',
       MID='one'
       WHERE CID=3;

--id =deleteCart
Delete from cart where cid=1;
DELETE FROM CART WHERE CID=2;
COMMIT;

       
       
















