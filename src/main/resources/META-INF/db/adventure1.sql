-- 1. DROP TABLE
DROP SEQUENCE CART_SEQ;
DROP TABLE CART;
DROP SEQUENCE ORDER_DETAIL_SEQ;
DROP TABLE ORDER_DETAIL;
DROP SEQUENCE ORDER_SEQ;
DROP TABLE ORDER_LIST;
DROP SEQUENCE BANNER_SEQ;
DROP TABLE BANNER;
DROP SEQUENCE EVENT_SEQ;
DROP TABLE EVENT;
DROP SEQUENCE PARADE_SEQ;
DROP TABLE PARADE;
DROP TABLE ORDER_LIST;
DROP SEQUENCE ORDER_SEQ;
DROP TABLE ORDER_DETAIL;
DROP SEQUENCE ORDER_DETAIL_SEQ;
DROP TABLE QNA;
DROP TABLE NOTICE;
DROP SEQUENCE NOTICE_SEQ;
DROP TABLE FAQ;
DROP TABLE REVIEW;
DROP TABLE REVIEW_SEQ;
DROP SEQUENCE REPORT_SEQ;
DROP TABLE REPORT;
DROP TABLE WORKER;
DROP TABLE MEMBER;

select * from review_comment;


-- 2. TABLE CREATION

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
    MLEVEL NUMBER (1) DEFAULT 1,
    MPOINT NUMBER(10) DEFAULT 1000
);


select * from member;
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
    OID NUMBER(20) PRIMARY KEY,    
    ONAME VARCHAR2(50) NOT NULL,
    OMAIL VARCHAR2(50) NOT NULL,
    OPHONE VARCHAR2(50) NOT NULL,
    ODATE DATE DEFAULT SYSDATE,
    OMPOINT NUMBER(10),
    PAYMENT VARCHAR2(50),
    MID VARCHAR2 (20) REFERENCES MEMBER(MID)
);
SELECT * FROM ORDER_LIST;
CREATE SEQUENCE ORDER_DETAIL_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE ORDER_DETAIL(
    ODID NUMBER(10) PRIMARY KEY,
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
    OID NUMBER(20) REFERENCES ORDER_LIST (OID) NOT NULL     
);

CREATE SEQUENCE BANNER_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE BANNER(
    BNO NUMBER(5) PRIMARY KEY,
    BTITLE VARCHAR2 (30),
    BORDER NUMBER(3) DEFAULT 1,
    USAGE VARCHAR2(1) DEFAULT 'Y',
    BRDATE DATE DEFAULT SYSDATE,
    BIMG VARCHAR2 (1000)
    );  
    
   	SELECT * FROM 
			(SELECT ROWNUM RN, 
			A.RID, A.RTITLE, A.RCONTENT, A.RSCORE, 
			A.RPHOTO, A.RRDATE, A.MID, A.OTYPE, 
			A.OATNAME1, A.R_ODID, A.MNAME, A.OATNAME2, A.OATNAME3, 
			A.OVISITDATE, (SELECT COUNT(*) FROM REVIEW_COMMENT WHERE RID=A.RID) AS COMMENTCOUNT
				FROM (
    				SELECT R.*, OD.ODID AS R_ODID, OD.*, M.MNAME
	    			FROM REVIEW R, ORDER_DETAIL OD, MEMBER M 
    				WHERE R.ODID = OD.ODID AND R.MID = M.MID    			    			
    				ORDER BY R.RRDATE DESC
    	) A 
    		) WHERE RN BETWEEN 1 AND 5;
CREATE SEQUENCE EVENT_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
SELECT * FROM REVIEW_COMMENT WHERE RID = 47;
SELECT * 
		FROM (SELECT ROWNUM RN, A.* 
		FROM (SELECT RC.*, M.MNAME 
		FROM REVIEW_COMMENT RC,	MEMBER M 
		WHERE RID = 47
		ORDER BY RCGROUP, RCSTEP) A) 
		WHERE RN BETWEEN 16 AND 20;
        select * from review_comment;
        
        SELECT * FROM REVIEW_COMMENT WHERE RCID=47;
        SELECT RC.*, M.MNAME FROM REVIEW_COMMENT RC, MEMBER M
        WHERE RC.MID = M.MID AND RCID = 47;
        select * from review;
        SELECT * FROM REVIEW_COMMENT;
        UPDATE REVIEW_COMMENT SET RCCONTENT = 'ㅁㄹ?'
        WHERE RCID = 17;
        
        
CREATE TABLE EVENT(
    ENO NUMBER(5) PRIMARY KEY,
    EPERIOD VARCHAR2 (300),
    EINFO VARCHAR2 (1000),
    EINFO2 VARCHAR2 (1000),
    EIMAGE VARCHAR2 (100)
);

CREATE SEQUENCE ATTRACTION_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE ATTRACTION(
    AID NUMBER(5) PRIMARY KEY,
    ANAME VARCHAR2 (100) NOT NULL,
    ACONTENT CLOB,
    HEIGHT VARCHAR2(1000),
    AGE VARCHAR2 (1000),
    BEST VARCHAR2 (1), 
    STOPDAY VARCHAR2 (1),
    TAG1 VARCHAR2 (100),
    TAG2 VARCHAR2 (100),
    AIMAGE VARCHAR2 (255),
    HEADCOUNT NUMBER(4)
    );
    
CREATE SEQUENCE PARADE_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE PARADE(
    PNO NUMBER(5) PRIMARY KEY,
    PTITLE VARCHAR2 (100),
    PINFO VARCHAR2 (1000),
    PPLACE VARCHAR2 (300),
    PPERIOD VARCHAR2 (300),
    PCAUTION VARCHAR2 (1000),
    PIMG VARCHAR2 (300)
);

CREATE TABLE WORKER(
    WID VARCHAR2(20) PRIMARY KEY,
    WPW VARCHAR2(20) NOT NULL,
    WNAME VARCHAR2(20) NOT NULL,
    WPHONE VARCHAR2(20)
    );

CREATE SEQUENCE NOTICE_SEQ NOCACHE NOCYCLE;
CREATE TABLE NOTICE(
    NID NUMBER(5) PRIMARY KEY,
    NTITLE VARCHAR2(100),
    NCONTENT VARCHAR2(1000),
    NTEXT VARCHAR2(3000),
    NRDATE DATE DEFAULT SYSDATE,
    WID VARCHAR2(20) REFERENCES WORKER(WID)
    );

CREATE SEQUENCE QNA_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE QNA(
    QNO NUMBER(5) NOT NULL PRIMARY KEY,
    QTITLE VARCHAR2 (100),
    QCONTENT VARCHAR2 (1000),
    QPW VARCHAR2(500),
    ISREPLY VARCHAR2(1) DEFAULT 'N',
    REPLY VARCHAR2 (1000),
    QRDATE DATE DEFAULT SYSDATE,
    QGROUP NUMBER(5) NOT NULL,
    QSTEP NUMBER(3),
    QINDENT NUMBER(3),
    Qpwchk varchar2(10) default 'N',
      MID VARCHAR2 (20)
    REFERENCES MEMBER(MID) NOT NULL
    );
    
CREATE SEQUENCE FAQ_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE FAQ(
    FNO NUMBER(5) NOT NULL PRIMARY KEY,
    FTITLE VARCHAR2 (500),
    FCONTENT VARCHAR2 (2000)
);

CREATE SEQUENCE REVIEW_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE REVIEW(
    RID VARCHAR2(5) PRIMARY KEY,
    RTITLE VARCHAR2(300) NOT NULL,
    RCONTENT CLOB,
    RSCORE NUMBER(1),
    RPHOTO VARCHAR2(300),
    DISPLAY VARCHAR2(1) DEFAULT 'Y',
    RRDATE DATE DEFAULT SYSDATE,
    MID VARCHAR2(20) REFERENCES MEMBER(MID),
    ODID NUMBER(10) REFERENCES ORDER_DETAIL(ODID)    
);
CREATE SEQUENCE REVIEW_COMMENT_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE REVIEW_COMMENT(
    RCID NUMBER(5) PRIMARY KEY,
    RCCONTENT CLOB NOT NULL,
    RCRDATE DATE DEFAULT SYSDATE,
    RCGROUP NUMBER(5),
    RCSTEP NUMBER(5),
    RCINDENT NUMBER(5),
    RID VARCHAR2(5) REFERENCES REVIEW(RID),
    MID VARCHAR2(20) REFERENCES MEMBER(MID)
);


                SELECT REVIEW.*, MEMBER.MID, MEMBER.MNAME, REPORT.RNO,
				REPORT.RREASON, REPORT.MID AS REPORTERMID, REPORT.REPORTDATE FROM 
				REVIEW, MEMBER, REPORT WHERE REVIEW.RID = REPORT.RID AND MEMBER.MID = REPORT.MID
				ORDER BY REPORTDATE DESC;



CREATE SEQUENCE REPORT_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE REPORT(
    RNO NUMBER(5) PRIMARY KEY,
    RREASON NUMBER(1) NOT NULL,
    REPORTDATE DATE DEFAULT SYSDATE,
    MID VARCHAR2 (20) REFERENCES MEMBER (MID),
    RID VARCHAR2(5) REFERENCES REVIEW (RID)
);
    
    SELECT *
    			FROM (SELECT ROWNUM RN, A.* 
            	FROM (SELECT O.*, OD.ODID, OD.OP1, OD.OP2, OD.OTYPE, 
            	OD.OATNAME1, OD.OATNAME2, OD.OATNAME3, OD.OPRICE1, 
            	OD.OPRICE2, OD.ORESULT, OD.OCRDATE, OD.OVISITDATE 
                FROM ORDER_LIST O, ORDER_DETAIL OD 
                WHERE O.OID = OD.OID AND MID = 'trio' ORDER BY O.OID DESC) A )
    			WHERE RN BETWEEN 1 AND 5;
    select * from order_detail;
    DESC LOSTITEM;
    SELECT * FROM LOSTITEM;
-- 3. Member Query
-- 1) 회원가입 joinMember
    INSERT INTO MEMBER (MID, MPW, MNAME, MPHONE, MEMAIL, 
    MADDRESS1, MADDRESS2, MADDRESS3)
    VALUES
    ('KIM', '1234', '김나리', '010-2525-3535', 'acc@ac.com',
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
    
-- 특정 아이디의 장바구니를 체크한 것만큼 복수 출력
SELECT * FROM CART WHERE CID IN (3,4,7) AND TYPE = 0;

-- 장바구니 후 결제 시, 모든 티켓의 양과 금액을 출력
select 
    (select sum(p1) from cart where cid in (3,4,7) and type =0) type0adult,
    (select sum(p2) from cart where cid in (3,4,7) and type =0) type0youth,    
    (select sum(price1)+sum(price2) from cart where cid in (3,4,7) and type=0) type0Sum,
    (select sum(p1) from cart where cid in (3,4,7) and type =1) type1adult,
    (select sum(p2) from cart where cid in (3,4,7) and type =1) type1youth,    
    (select sum(price1)+sum(price2) from cart where cid in (3,4,7) and type=1) type1Sum
    from dual;

-- 5. ORDER QUERY
-- 주문내역 담기

INSERT INTO ORDER_LIST
(OID, OP1, OP2, OTYPE, OATNAME1, OATNAME2, OATNAME3,
OPRICE1, OPRICE2, ORESULT, MID)
    VALUES (ORDER_LIST_SEQ.NEXTVAL, 1,2,'1','아틀란티스','박물관','지하동굴',
'25000','18000',0, 'two');

-- 6. EVENT QUERY
-- 이벤트 추가
INSERT INTO EVENT (ENO, EPERIOD, EINFO, EINFO2, EIMAGE)
    VALUES
    (EVENT_SEQ.NEXTVAL, '2023년 5월 1일 ~ 5월 31일','월드카드로 최대 10만원 캐시백 혜택 챙겨요! 40000원', '행사기간 동안 월드카드 1회 이상 이용 및 2023.6.15(월)까지 국내외 가맹점에서 일시불 및 할부 합산 10만원 이상 이용 시 8만원 캐시백,
종합 자유이용권-어른: 40000원 청소년: 30000원 어린이: 28000원','card');

-- 7. ATTRACTION QUERY
-- 어트랙션 추가
INSERT INTO ATTRACTION (AID, ANAME, ACONTENT, HEIGHT, AGE, BEST, STOPDAY, TAG1, TAG2, AIMAGE, HEADCOUNT)
VALUES
(ATTRACTION_SEQ.NEXTVAL, '범퍼카' ,'화려한 조명과 신나는 음악 속에서 스릴만점의 자동차 경주가 펼쳐진다. 
앞에서 쾅~ 뒤에서 쾅~ 어디서 달려들지 모르는 좌충우돌 범퍼카! 부딪칠수록 즐거움이 더욱 커집니다.',
'125cm 이상 탑승가능', '65세 이하 탑승 가능', 'Y', 'N', '익사이팅', '어린이', 'car.jpg', 1);

-- worker Attraction
-- 어트랙션 검색 id=attractionListP
SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
        FROM(SELECT * FROM ATTRACTION
            WHERE UPPER(ANAME) LIKE '%' || UPPER('범') || '%' ORDER BY AID DESC) A)
        WHERE RN BETWEEN 1 AND 4
-- 어트랙션 insert id=insertAttraction
INSERT INTO ATTRACTION (AID, ANAME, ACONTENT, HEIGHT, AGE, BEST, STOPDAY, TAG1, TAG2, AIMAGE, HEADCOUNT)
VALUES
(ATTRACTION_SEQ.NEXTVAL, '범퍼카' ,'화려한 조명과 신나는 음악 속에서 스릴만점의 자동차 경주가 펼쳐진다. 
앞에서 쾅~ 뒤에서 쾅~ 어디서 달려들지 모르는 좌충우돌 범퍼카! 부딪칠수록 즐거움이 더욱 커집니다.',
'125cm 이상 탑승가능', '65세 이하 탑승 가능', 'Y', 'N', '익사이팅', '어린이', 'car.jpg', 1);
-- 어트랙션 update id=updateAttraction
UPDATE ATTRACTION SET
        ANAME = '왕밤빵카',
        ACONTENT = '화려한 조명이 날 비추네',
        HEIGHT = '180cm이상탑승가능',
        AGE = '75세 이하 탑승가능',
        BEST = 'N',
        STOPDAY = 'Y',
        TAG1 = '익사이팅',
        TAG2 = '어른이',
        AIMAGE = 'car.jpg',
        HEADCOUNT = 2
    WHERE AID = 2;
-- 어트랙션 갯수 id=totCntAttraction
SELECT COUNT(*) FROM ATTRACTION WHERE UPPER(ANAME) LIKE'%' || UPPER('범') || '%';
-- 어트랙션 delete id=deleteAttraction
DELETE FROM ATTRACTION WHERE AID=1;

-- 8. PARADE QUERY
-- 퍼레이드 추가
INSERT INTO PARADE (PNO, PTITLE, PINFO, PPLACE, PPERIOD, PCAUTION,PIMG,PIMG2)
VALUES (PARADE_SEQ.NEXTVAL, '카니발 판타지 퍼레이드', '브라질의 삼바, 베니스의 가면, 카리브 축제가 한자리에 모였다!<br>
		세계 유명 축제를 한 번에 즐길 수 있는 기회를 놓치지 마세요!','퍼레이드 길, 카니발 광장 (가이드맵 167)','11.17(금) ~ 12.18(일)',
        '※ 현장 상황 및 기상 예보에 따라 공연 일정이 변경 및 취소될 수 있습니다.
		※ 이용 정보-운영시간에서 공연시간 확인 가능합니다.','parade1.jpg','paradeDetail1');

-- 9. ORDER QUERY
-- 특정 아이디의 전체 주문내역 출력
SELECT O.*, OD.* FROM ORDER_LIST O, 
ORDER_DETAIL OD WHERE O.OID = OD.OID AND MID ='trio';

-- 특정 아이디의 주문내역을 페이징 처리하여 최신 순으로 출력

SELECT *
    from (SELECT ROWNUM RN, A.* 
            FROM (SELECT O.*, OD.ODID, OD.OP1, OD.OP2, OD.OTYPE, OD.OATNAME1, OD.OATNAME2, OD.OATNAME3, OD.OPRICE1, OD.OPRICE2, OD.ORESULT, OD.OCRDATE, OD.OVISITDATE 
                FROM ORDER_LIST O, ORDER_DETAIL OD WHERE O.OID = OD.OID AND MID = 'trio' ORDER BY O.OID DESC) A )
    WHERE RN BETWEEN 1 AND 5;
    
-- 10. WORKER QUERY
-- 비번찾기 id=getWpw
SELECT WPW FROM WORKER WHERE WID='admin';

-- 이름찾기 id=getWname
SELECT WNAME FROM WORKER WHERE WID='admin';

-- 워커 카운트 id=getAllCount
SELECT COUNT(*) FROM WORKER;

alter table order_detail add display varchar2(1) default 'Y';
-- 11. NOTICE QUERY
-- 공지사항 리스트 id=NoticeList
SELECT * FROM NOTICE WHERE NTITLE LIKE '%' || '결' || '%' ORDER BY NID DESC;
SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
        FROM(SELECT * FROM NOTICE
            WHERE UPPER(NTITLE) LIKE '%' || UPPER('결') || '%' ORDER BY NID DESC) A)
        WHERE RN BETWEEN 1 AND 4;
-- 전체 공지사항 리스트
SELECT * FROM NOTICE ORDER BY NTITLE;
SELECT ROWNUM RN, A.*
    FROM (SELECT * FROM NOTICE ORDER BY NTITLE) A;
SELECT *
    FROM (SELECT ROWNUM RN, A.*
        FROM (SELECT * FROM NOTICE ORDER BY NTITLE) A)
    WHERE RN BETWEEN 1 AND 5;
-- 전체 공시사항 리스트 id=totCntNotice
SELECT COUNT(*) FROM NOTICE;
-- 검색했을 때 공지사항 몇개인지
SELECT COUNT(*) FROM NOTICE WHERE UPPER(NTITLE) LIKE'%' || UPPER('결') || '%';
-- 공지번호로 가져오기 id=getDetailBook(dto가져오기 번호로)
SELECT * FROM NOTICE WHERE NID=2;

-- 공지insert id=insertNotice
INSERT INTO NOTICE (NID, NTITLE, NCONTENT, NTEXT, NRDATE, WID)
    VALUES(NOTICE_SEQ.NEXTVAL, '결제가 안돼요', 'noImg.png','내용', SYSDATE , 'admin');
-- 공지수정 id=updateNotice
UPDATE NOTICE SET
        NTITLE = '공지수정',
        NCONTENT = 'noImg.png',
        NTEXT = '내용',
        NRDATE = SYSDATE,
        WID = 'admin'
    WHERE NID=2;
SELECT * FROM NOTICE;
-- 공지삭제 id=deleteNotice
DELETE FROM NOTICE WHERE NID=1;

-- 12. QNA QUERY

--ID  = getAllCount
select count(*) from QNA;
select count(*) from  QNA where QTITLE like '%'||'단'||'%';
SELECT * FROM Qna where qtitle ='tdfs';
--ID = listQna
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM(SELECT * FROM QNA WHERE QTITLE LIKE '%'||'단'||'%' ORDER BY QNO DESC)A)
    WHERE RN BETWEEN 1 AND 100;
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM(SELECT * FROM QNA ORDER BY QNO DESC)A)
    WHERE RN BETWEEN 1 AND 30;
--ID = getQna
SELECT * FROM QNA WHERE QNO = 1;
--ID = insertQna
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QPW,QGROUP,QSTEP,QINDENT,qpwchk,MID) VALUES
(QNA_SEQ.NEXTVAL,'단체관람 할인','동호회 단체관람 예정인데 할인 방법이있나요','123', QNA_SEQ.CURRVAL,0,0,'Y','one');

commit;
--id =QnaPreReply
--INSERT INTO QNA (QNO,QTITLE,QCONTENT,ISREPLY,REPLY,QGROUP,QSTEP,QINDENT,MID) VALUES
--(QNA_SEQ.NEXTVAL,'단체관람 할인','동호회 단체관람 예정인데 할인 방법이있나요','Y','홈페이지 참조 부탁드려요',5,1,1,'one');
commit;
--UPDATE QNA SET HIT = BHIT+1 WHERE BID=#{bid};

--WOKERMEMEBRLIST
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM MEMBER WHERE MID LIKE '%'||'w'||'%' ORDER BY MRDATE DESC)A) WHERE RN BETWEEN 1 AND 5;

