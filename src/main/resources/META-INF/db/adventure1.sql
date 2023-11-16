-- 1. DROP TABLE
DROP TABLE MEMBER;
DROP SEQUENCE CART_SEQ;
DROP TABLE CART;
DROP SEQUENCE ORDER_SEQ;
DROP TABLE ORDER;

UPDATE MEMBER SET MPW = '4444' WHERE MID = 'one';

-- 2. CREATE TABLE
SELECT * FROM MEMBER;
CREATE TABLE MEMBER
(
	MID VARCHAR2(20) NOT NULL PRIMARY KEY,
	MPW VARCHAR2(20) NOT NULL,
	MNAME VARCHAR2(20) NOT NULL,
	MPHONE VARCHAR2(20) NOT NULL,
	MEMAIL VARCHAR2(40) NOT NULL,
	MADDRESS1 VARCHAR2 (9),
	MADDRESS2 VARCHAR2 (1000),
    MADDRESS3 VARCHAR2 (1000),
    MRDATE DATE DEFAULT SYSDATE,	
    MLEVEL VARCHAR2 (1) DEFAULT '1'
);

CREATE SEQUENCE CART_SEQ MAXVALUE 99999
NOCACHE NOCYCLE;
CREATE TABLE CART(
    CID NUMBER(10) PRIMARY KEY,
    P1 NUMBER(10),
    P2 NUMBER(10),
    TYPE NUMBER(2),
    ATNAME1 VARCHAR2 (100),
    ATNAME2 VARCHAR2 (100),
    ATNAME3 VARCHAR2 (100),
    PRICE1 NUMBER(10),
    PRICE2 NUMBER(10),
    RESULT NUMBER(1),
    CRDATE DATE DEFAULT SYSDATE,
    VISITDATE DATE DEFAULT SYSDATE,
    MID VARCHAR2 (20)
    REFERENCES MEMBER(MID) NOT NULL
);

CREATE SEQUENCE ORDER_LIST_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE ORDER_LIST(
    OID NUMBER(10) PRIMARY KEY,
    OP1 NUMBER(10),
    OP2 NUMBER(10),
    OTYPE NUMBER(2),
    OATNAME1 VARCHAR2 (100),
    OATNAME2 VARCHAR2 (100),
    OATNAME3 VARCHAR2 (100),
    OPRICE1 NUMBER(10),
    OPRICE2 NUMBER(10),
    ORESULT NUMBER(1),
    OCRDATE DATE DEFAULT SYSDATE,
    OVISITDATE DATE DEFAULT SYSDATE,
    MID VARCHAR2 (20) REFERENCES MEMBER (MID) NOT NULL
);





-- 3. Member Query

-- 1) 회원가입 joinMember
INSERT INTO MEMBER (MID, MPW, MNAME, MPHONE, MEMAIL, 
    MADDRESS1, MADDRESS2, MADDRESS3)
    VALUES
    ('one', '1234', '김나리', '010-2525-3535', 'acc@ac.com',
    '133-100', '서울시 성동구 성수동', '1번지 21호');
    
-- 2) 회원정보수정 modifyMember
UPDATE MEMBER SET MPW = '222', 
    MNAME = '김김김',
    MPHONE = '010-2525-3535',
    MEMAIL = 'tt@rr.com',
    MADDRESS1 = '011336',
    MADDRESS2 = '서울시 잠수동',
    MADDRESS3 = '프로아파트'
    WHERE MID = 'one';
    
-- 3) 특정회원 정보 가져오기 getMember
    SELECT * FROM MEMBER WHERE MID = 'one';

-- 4) 회원탈퇴 withDrawalMember
    UPDATE MEMBER SET MLEVEL = '0' WHERE MID = 'one';

-- 5) 회원 장바구니 목록 cartList
    SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM
    (SELECT * FROM CART WHERE MID = 'one' ORDER BY CRDATE DESC) A) 
    WHERE RN BETWEEN 1 AND 2;

-- 6) 회원 주문내역 orderList
    SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM
    (SELECT * FROM ORDER_LIST WHERE MID = 'one' ORDER BY OCRDATE DESC) A) 
    WHERE RN BETWEEN 1 AND 2;
    
    

-- 4. CART QUERY
-- 장바구니 담기
INSERT INTO CART (CID,P1,P2,TYPE,ATNAME1,ATNAME2,ATNAME3,
PRICE1,PRICE2,RESULT)
VALUES (CART_SEQ.NEXTVAL, 1,2,'1','아틀란티스','박물관','지하동굴',
'25000','18000',0);


-- 5. ORDER QUERY
-- 주문내역 담기

INSERT INTO ORDER_LIST
(OID, OP1, OP2, OTYPE, OATNAME1, OATNAME2, OATNAME3,
OPRICE1, OPRICE2, ORESULT, MID)
    VALUES (ORDER_LIST_SEQ.NEXTVAL, 1,2,'1','아틀란티스','박물관','지하동굴',
'25000','18000',0, 'two');

