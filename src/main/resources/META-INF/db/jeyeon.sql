-- 테이블 제거
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE WORKER CASCADE CONSTRAINTS;
DROP SEQUENCE NOTICE_SEQ;

-- 시퀀스 생성
CREATE SEQUENCE NOTICE_SEQ;


-- 테이블 생성
CREATE TABLE WORKER(
    WID VARCHAR2(20) PRIMARY KEY,
    WPW VARCHAR2(20) NOT NULL,
    WNAME VARCHAR2(20) NOT NULL,
    WPHONE VARCHAR2(20)
    );


CREATE TABLE NOTICE(
    NID NUMBER(5) PRIMARY KEY,
    NTITLE VARCHAR2(100),
    NCONTENT VARCHAR2(1000),
    NTEXT VARCHAR2(3000),
    NRDATE DATE DEFAULT SYSDATE,
    WID VARCHAR2(20) REFERENCES WORKER(WID)
    );
    

--    REFERENCES MEMBER (MID);

-- 검색
SELECT * FROM NOTICE;

-- 관리자 더미데이터
INSERT INTO WORKER VALUES('admin','1234', '관리자', '010-7777-7777');
    
SELECT * FROM WORKER;

-- 공지사항 리스트
INSERT INTO NOTICE (NID, NTITLE, NCONTENT, NTEXT, NRDATE, WID)
    VALUES(NOTICE_SEQ.NEXTVAL, '결제가 안돼요', 'ㅠㅠ', '내용', SYSDATE , 'admin');
INSERT INTO NOTICE (NID, NTITLE, NCONTENT, NTEXT, NRDATE, WID)
    VALUES(NOTICE_SEQ.NEXTVAL, '티켓교환은 어떻게 하나요?', 'ㅠㅠ','내용', SYSDATE , 'admin');
INSERT INTO NOTICE (NID, NTITLE, NCONTENT, NTEXT, NRDATE, WID)
    VALUES(NOTICE_SEQ.NEXTVAL, '집에 언제가나요?', 'ㅠㅠ', '내용', SYSDATE , 'admin');
INSERT INTO NOTICE (NID, NTITLE, NCONTENT, NTEXT, NRDATE, WID)
    VALUES(NOTICE_SEQ.NEXTVAL, '배고파요', 'ㅠㅠ', '내용', SYSDATE , 'admin');
INSERT INTO NOTICE (NID, NTITLE, NCONTENT, NTEXT, NRDATE, WID)
    VALUES(NOTICE_SEQ.NEXTVAL, '우와 금요일이에요', 'ㅎㅎ', '내용', SYSDATE , 'admin');
INSERT INTO NOTICE (NID, NTITLE, NCONTENT, NTEXT, NRDATE, WID)
    VALUES(NOTICE_SEQ.NEXTVAL, '내일은 주말이에요', 'ㅎㅎ', '내용', SYSDATE , 'admin');
INSERT INTO NOTICE (NID, NTITLE, NCONTENT, NTEXT, NRDATE, WID)
    VALUES(NOTICE_SEQ.NEXTVAL, '추워요', 'ㅠㅠ', '내용', SYSDATE , 'admin');

-- worker dao

-- 비번찾기 id=getWpw
SELECT WPW FROM WORKER WHERE WID='admin';

-- 이름찾기 id=getWname
SELECT WNAME FROM WORKER WHERE WID='admin';

-- 워커 카운트 id=getAllCount
SELECT COUNT(*) FROM WORKER;

-- NOTICE DAO

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
COMMIT;

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


    

    
   


    