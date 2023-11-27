--qna
--DROP TABLE
DROP TABLE QNA CASCADE CONSTRAINTS;
DROP SEQUENCE QNA_SEQ; 

--CREATE TABLE
CREATE SEQUENCE QNA_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE QNA(
    QNO NUMBER(5) NOT NULL PRIMARY KEY,
    QTITLE VARCHAR2 (100),
    QCONTENT CLOB,
    QPW VARCHAR2(500),
    ISREPLY VARCHAR2(1) DEFAULT 'N',
    REPLY CLOB,
    QRDATE DATE DEFAULT SYSDATE,
    QGROUP NUMBER(5) NOT NULL,
    QSTEP NUMBER(3),
    QINDENT NUMBER(3),
    Qpwchk varchar2(10) default 'N',
      MID VARCHAR2 (20)
    REFERENCES MEMBER(MID) NOT NULL
);
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'단체관람 할인','동호회 단체관람 예정인데 할인 방법이있나요', QNA_SEQ.CURRVAL,0,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'단체관람 할인','동호회 단체관람 예정인데 할인 방법이있나요', QNA_SEQ.CURRVAL,0,0,'one');
SELECT * FROM QNA;
COMMIT;
--ID  = getAllCount
select count(*) from QNA;
select count(*) from  QNA where QTITLE like '%'||'단'||'%';
SELECT * FROM Qna where qtitle ='tdfs';
--ID = listQna
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM(SELECT * FROM QNA WHERE QTITLE LIKE '%'||'단'||'%' ORDER BY QSTEP, QNO)A)
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
--id =QnaPreReplyStep
UPDATE QNA SET QSTEP = QSTEP+1 WHERE QGROUP = 5 AND QSTEP > 0;
--id =QnaPreReply
--INSERT INTO QNA (QNO,QTITLE,QCONTENT,ISREPLY,REPLY,QGROUP,QSTEP,QINDENT,MID) VALUES
--(QNA_SEQ.NEXTVAL,'단체관람 할인','동호회 단체관람 예정인데 할인 방법이있나요','Y','홈페이지 참조 부탁드려요',5,1,1,'one');
commit;
--UPDATE QNA SET HIT = BHIT+1 WHERE BID=#{bid};

--dummy QNA
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'단체관람 할인','동호회 단체관람 예정인데 할인 방법이있나요', QNA_SEQ.CURRVAL,0,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'단체관람 할인','동호회 단체관람 예정인데 할인 방법이있나요', QNA_SEQ.CURRVAL,1,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'유모차는 어디서 대여하나요?','아기 유모차 대여장소', QNA_SEQ.CURRVAL,0,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'유모차는 어디서 대여하나요?','아기 유모차 대여장소', QNA_SEQ.CURRVAL,1,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'잃어버린 물건','분실물 센터는 어디서 찾아요?', QNA_SEQ.CURRVAL,0,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'잃어버린 물건','분실물 센터는 어디서 찾아요?', QNA_SEQ.CURRVAL,1,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'퍼레이드 시간','퍼레이드 끝나는 시간 문의해요', QNA_SEQ.CURRVAL,0,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'퍼레이드 시간','퍼레이드 끝나는 시간 문의해요', QNA_SEQ.CURRVAL,1,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'유아 놀이기구 이용','3세 유아가 탈만한 놀이기구가 있나요?', QNA_SEQ.CURRVAL,0,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'유아 놀이기구 이용','3세 유아가 탈만한 놀이기구가 있나요?', QNA_SEQ.CURRVAL,1,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'우천할인','우천시 할인권은 어디서 발급받나요', QNA_SEQ.CURRVAL,0,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'우천할인','우천시 할인권은 어디서 발급받나요', QNA_SEQ.CURRVAL,1,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'맛집추천','맛집 추천해주세요', QNA_SEQ.CURRVAL,0,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'맛집추천','맛집 추천해주세요', QNA_SEQ.CURRVAL,1,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'임산부가 탈수 있는 놀이기구','임산부가 탈수 있는 놀이기구가 있나요?', QNA_SEQ.CURRVAL,0,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'임산부가 탈수 있는 놀이기구','임산부가 탈수 있는 놀이기구가 있나요?', QNA_SEQ.CURRVAL,1,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'위치찾아요','수유실은 어디있나요', QNA_SEQ.CURRVAL,0,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'위치찾아요','수유실은 어디있나요', QNA_SEQ.CURRVAL,1,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'핸드폰 분실하였습니다','분실물 센터는 어디서 찾아요?', QNA_SEQ.CURRVAL,0,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'핸드폰 분실하였습니다','분실물 센터는 어디서 찾아요?', QNA_SEQ.CURRVAL,1,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'퍼레이드시 참여','퍼레이드에 참여할 수 있나요?', QNA_SEQ.CURRVAL,0,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'퍼레이드시 참여','퍼레이드에 참여할 수 있나요?', QNA_SEQ.CURRVAL,1,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'어드벤처월드 내 맛집추천','맛집 추천해주세요', QNA_SEQ.CURRVAL,0,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'어드벤처월드 내 맛집추천','맛집 추천해주세요', QNA_SEQ.CURRVAL,1,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QPW,QGROUP,QSTEP,QINDENT,QPWCHK,MID) VALUES
(QNA_SEQ.NEXTVAL,'신용카드 할인','신용카드 포인트로 할인 받을수 없나요?','123', QNA_SEQ.CURRVAL,0,0,'Y','one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QPW,QGROUP,QSTEP,QINDENT,QPWCHK,MID) VALUES
(QNA_SEQ.NEXTVAL,'신용카드 할인','신용카드 포인트로 할인 받을수 없나요?','123', QNA_SEQ.CURRVAL,1,0,'Y','one');
commit;
COMMIT;
select * from ATTRACTION;
select * from qna order by qno desc ;
UPDATE QNA SET ISREPLY ='Y',
                REPLY = '우천시10%할인됩니다',
                QSTEP = QSTEP+1,
                QINDENT = QINDENT+1
                WHERE QNO = 42;
UPDATE QNA SET ISREPLY ='Y',
                REPLY = '우천시10%할인됩니다',
                QSTEP = QSTEP+1,
                QINDENT = QINDENT+1
                WHERE QNO = 42-1;
commit;
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'유모차는 어디서 대여하나요?','아기 유모차 대여장소', QNA_SEQ.CURRVAL,1,0,'one');
DELETE FROM QNA WHERE QNO =29;
commit;
	UPDATE QNA SET
                REPLY = '아기 유모차 대여장소는 지도 참고 부탁드립니다'
                WHERE QNO = 23; 