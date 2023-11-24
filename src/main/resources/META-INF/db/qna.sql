--qna
--DROP TABLE
DROP TABLE QNA CASCADE CONSTRAINTS;
DROP SEQUENCE QNA_SEQ; 

--CREATE TABLE
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
(QNA_SEQ.NEXTVAL,'유모차는 어디서 대여하나요?','아기 유모차 대여장소', QNA_SEQ.CURRVAL,1,'one');
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

--FAQ
DROP TABLE faq CASCADE CONSTRAINTS;
DROP SEQUENCE FAQ_SEQ; 
CREATE SEQUENCE FAQ_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
CREATE TABLE FAQ(
    FNO NUMBER(5) NOT NULL PRIMARY KEY,
    FTITLE VARCHAR2 (500),
    FCONTENT VARCHAR2 (2000)
);
--id = faqList
SELECT * FROM FAQ ORDER BY FNO;
--ID = faqmodyfy
UPDATE FAQ SET FTITLE = '매직패스 사전예매는 어떻게 하나요?',
               FCONTENT = '매직패스 프리미엄 사전 예매는 롯데월드 앱에서만 가능하며매일 자정, 당일을 포함한 3일간의 예매가 가능합니다.<br><br>
또한 한정수량 상품임을 고려하여 1인당 최대 4매까지만 구매가 가능하며,<br><br>
온라인 사전 예매 시 예약일 기준 3일 이내 재구매가 불가능합니다.<br><br>
매직패스 프리미엄 사전 예매 수량 변경을 원하시면 취소 이후 재구매 하셔야 합니다.<br><br>
단, 예매 취소 시 매직패스 프리미엄 수량이 남아있지 않을 수 있으며,<br><br>
당일 예매의 경우 예약 1시간 이후부터 취소 위약금 100%가 발생합니다. <br><br>
※ 매직패스 프리미엄은 실사용 목적을 위한 구매를 우선으로 하며, 비정상적인 방법으로의 구매, <br><br>
   과도한 매수의 구매, 반복적인 구매 및 취소 행위, 재판매 행위 시 구매가 제한될 수 있습니다. <br><br>'
   WHERE FNO = 1 ;
--ID = faqinsert
--dummy FAQ
INSERT INTO FAQ(FNO, FTITLE, FCONTENT) VALUES (FAQ_SEQ.NEXTVAL, '매직패스 사전예매는 어떻게 하나요?','매직패스 프리미엄 사전 예매는 롯데월드 앱에서만 가능하며<br>
매일 자정, 당일을 포함한 3일간의 예매가 가능합니다.<br>
또한 한정수량 상품임을 고려하여 1인당 최대 4매까지만 구매가 가능하며,<br>
온라인 사전 예매 시 예약일 기준 3일 이내 재구매가 불가능합니다.<br><br>
매직패스 프리미엄 사전 예매 수량 변경을 원하시면 취소 이후 재구매 하셔야 합니다.<br>
단, 예매 취소 시 매직패스 프리미엄 수량이 남아있지 않을 수 있으며,<br>
당일 예매의 경우 예약 1시간 이후부터 취소 위약금 100%가 발생합니다.<br><br>
※ 매직패스 프리미엄은 실사용 목적을 위한 구매를 우선으로 하며, 비정상적인 방법으로의 구매,<br>
   과도한 매수의 구매, 반복적인 구매 및 취소 행위, 재판매 행위 시 구매가 제한될 수 있습니다.<br>.');
INSERT INTO FAQ(FNO, FTITLE, FCONTENT) VALUES (FAQ_SEQ.NEXTVAL, '어드벤처를 나갔다가 다시 들어올 수 있나요? ','롯데월드 어드벤처에서는 파크 입장 후 퇴장하시면 원칙적으로 재입장이 불가능합니다.<br><br>
단, 재입장을 도와드리는 몇가지 사항에 대해 안내해 드립니다.<br><br>
  ① 아이스링크 이용 손님<br><br>
  ② 저자거리 또는 민속박물관 이용 손님(어드벤처 3F 민속관게이트 이용)<br><br>
  ③ 의무실 방문 후 간호사 진단에 따라 외부 의료기관 방문하는 경우<br><br>
  ④ 파크 입장 후 매직패스 프리미엄 티켓 구매를 희망하시는 경우<br>';
INSERT INTO FAQ(FNO, FTITLE, FCONTENT) VALUES (FAQ_SEQ.NEXTVAL,'공연에 대해 궁금한 것은 어디에 물어보나요?','공연 및 공연참여와 관련된 질문은 공연참여사무실로 연락주시면 안내 및 상담이 가능합니다.<br><br>
※ 공연참여사무실 : 02-411-4339(운영시간 12:00~20:00)<br><br>
현재 롯데월드에서 진행중인 공연 정보가 궁금하시다면,<br><br>
홈페이지 즐길거리-공연-금주의공연 메뉴를 통해서 자세한 공연의 정보와 공연 스케줄을 확인하실 수 있습니다.<br>');
 INSERT INTO FAQ(FNO, FTITLE, FCONTENT) VALUES (FAQ_SEQ.NEXTVAL,'어린이, 청소년이 어른티켓으로 이용할 수 있나요?','어린이(36개월이상~만 12세), 청소년(만 13세~만 18세) 손님은 어른(만 19세 이상)티켓 사용이 가능합니다.<br><br>
참고로, 만 36개월 미만인 유아손님의 경우 무료입장이 가능하니 참고부탁드립니다.<br>
※ 단, 유아용 어트랙션 탑승 시 베이비 티켓 구매 필요(0~12개월 미만의 경우 어트랙션 무료이용 가능)');
 INSERT INTO FAQ(FNO, FTITLE, FCONTENT) VALUES (FAQ_SEQ.NEXTVAL,'티켓의 QR코드를 캡쳐해서 이용 가능한가요?','캡쳐 된 티켓의 QR코드는 입장 및 매직패스 사용이 어렵습니다.<br><br>
다른 분께 티켓을 보내실 경우 마이티켓에서 보내고자 하는 티켓의 "선물하기" 버튼을 활용해 티켓을 전송해주시기 바랍니다.<br><br>');
INSERT INTO FAQ(FNO, FTITLE, FCONTENT) VALUES (FAQ_SEQ.NEXTVAL,'홈페이지 로그인이 되지 않아요','1. 로그인이 되지 않을 때 쿠키설정을 확인해주시기 바랍니다.<br><br>
    인터넷 익스플로러 브라우저 사용 시 "쿠키 처리 방식"이 "허용"으로 되어 있어야 로그인이 가능합니다.<br><br>
    ※확인 방법 : 인터넷 옵션 → 개인정보 → 고급 → 현재 사이트의 쿠키/링크된 사이트의 쿠키 설정 "허용"<br><br><br>
2. 팝업 차단이 되어 있을 경우 로그인창이 뜨지 않을 수 있습니다.<br><br>
    팝업 설정을 "허용"으로 변경해주시기 바랍니다.<br><br>
    ※확인 방법 : 인터넷 옵션 → 개인정보 → "팝업 차단 사용" 체크박스 해지<br>');
INSERT INTO FAQ(FNO, FTITLE, FCONTENT) VALUES (FAQ_SEQ.NEXTVAL,'롯데월드에서 사용가능한 상품권은 뭐가있나요?','롯데월드 어드벤처에서 사용 가능한 상품권은 총 3가지 입니다.<br><br>
- 롯데백화점 상품권<br><br>
- 롯데호텔 상품권(※ 뒷면 사용처 확인 필수)<br><br>
- 국민관광 상품권<br><br><br>
※ 롯데백화점 식품관 전용 상품권은 사용이 불가합니다.<br><br>
※ 롯데호텔 상품권 사용처에는 LOTTEWORLD ADVENTURE 또는 롯데월드 어드벤처가 기재되어 있어야 합니다.<br><br>
    - 사용장소에 "월드"라고 기재되어 있는 것은 롯데호텔월드 지점을 뜻하며, 어드벤처는 사용이 불가합니다.<br><br>
※ 롯데백화점 모바일 상품권은 어드벤처 내 식음매장 및 상품매장에서 사용이 불가합니다.<br>');

COMMIT;



