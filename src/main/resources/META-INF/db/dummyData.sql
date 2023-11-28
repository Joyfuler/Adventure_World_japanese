-- 1. Member Insertion (MPOINT, MLEVEL은 DEFAULT값 존재)
INSERT INTO MEMBER (MID, MPW, MNAME, MPHONE, MEMAIL, 
    MADDRESS1, MADDRESS2, MADDRESS3)
    VALUES
    ('one', '1234', '김나리', '010-2525-3535', 'acc@ac.com',
    '133-100', '서울시 성동구 성수동', '1번지 21호');

INSERT INTO MEMBER (MID, MPW, MNAME, MPHONE, MEMAIL, 
    MADDRESS1, MADDRESS2, MADDRESS3)
    VALUES
    ('two', '1234', '김길동', '011-1313-2525', 'acc.ab.com',
    '130-120', '서울시 송파구 잠실2동' , '리센츠 아파트 201동 505호');


SELECT * FROM MEMBER;

-- 2. CART INSERTION 

INSERT INTO CART (CID,P1,P2,TYPE,ATNAME1,ATNAME2,ATNAME3,
PRICE1,PRICE2,RESULT,MID)
    VALUES (CART_SEQ.NEXTVAL, 1,2,'1','아틀란티스','박물관','지하동굴',
    '25000','18000',0, 'one');

INSERT INTO CART( CID, p1, p2, TYPE, ATNAME1, ATNAME2, ATNAME3, PRICE1, PRICE2, RESULT, VISITDATE ,MID )
    VALUES (CART_SEQ.NEXTVAL,1,1,1,'A','B','C',10000,5000,0,'2023-11-23','one');
    SELECT * FROM CART;
    
    
-- 3. ORDER_LIST INSERTION
SELECT * FROM ORDER_LIST;
INSERT INTO ORDER_LIST(OID, OP1, OP2, OTYPE, OATNAME1, OATNAME2, OATNAME3, OPRICE1, OPRICE2, ORESULT, MID)
    VALUES (ORDER_LIST_SEQ.NEXTVAL,1,1,1,'A','B','C',10000,5000,0,'one');
    
-- 4. BANNER INSERTION    
INSERT INTO BANNER (BNO, BTITLE, BORDER, USAGE, BIMG)
    VALUES (BANNER_SEQ.NEXTVAL, '제목1', '1', 'Y', 'mainimgs1.jpg');
INSERT INTO BANNER (BNO, BTITLE, BORDER, USAGE, BIMG)
    VALUES (BANNER_SEQ.NEXTVAL, '제목2', '1', 'Y', 'mainimgs2.jpg');    
INSERT INTO BANNER (BNO, BTITLE, BORDER, USAGE, BIMG)
    VALUES (BANNER_SEQ.NEXTVAL, '제목3', '1', 'Y', 'mainimgs3.jpg');    
INSERT INTO BANNER (BNO, BTITLE, BORDER, USAGE, BIMG)
    VALUES (BANNER_SEQ.NEXTVAL, '제목4', '1', 'Y', 'mainimgs4.jpg');    
INSERT INTO BANNER (BNO, BTITLE, BORDER, USAGE, BIMG)
    VALUES (BANNER_SEQ.NEXTVAL, '제목5', '1', 'N', 'mainimgs5.jpg');    
    
-- 5. EVENT INSERTION
INSERT INTO EVENT (ENO, EPERIOD, EINFO, EINFO2, EIMAGE)
    VALUES
    (EVENT_SEQ.NEXTVAL, '2023년 11월 1일 ~ 11월 31일','월드카드로 최대 10만원 캐시백 혜택 챙겨요! 40000원', '행사기간 동안 월드카드 1회 이상 이용 및 2023.6.15(월)까지 국내외 가맹점에서 일시불 및 할부 합산 10만원 이상 이용 시 8만원 캐시백,
종합 자유이용권-어른: 40000원 청소년: 30000원 어린이: 28000원','card.png');
INSERT INTO EVENT (ENO, EPERIOD, EINFO, EINFO2, EIMAGE)
    VALUES
    (EVENT_SEQ.NEXTVAL, '2023년 11월 1일 ~ 12월 31일','월드 최대 30% 할인 + 이용금액 100% 캐시백까지', '2024년 1월 1일까지 국내외 가맹점에서 일시불 및 할부 합산 20만원 이상 이용 시
월드 카드 이용시 최대 자유이용권 30%할인 - 이용금액은 한달 후 100% 캐시백 가능.','point.jpg');
INSERT INTO EVENT (ENO, EPERIOD, EINFO, EINFO2, EIMAGE)
    VALUES
    (EVENT_SEQ.NEXTVAL, '~2023년 11월 31일','11월은 꼭 네이버페이로!', '네이버 페이로 결제 시, 종합이용권: 39,900원
최대 수량 4개까지 가능.','npay.jpg');

INSERT INTO EVENT (ENO, EPERIOD, EINFO, EINFO2, EIMAGE)
    VALUES
    (EVENT_SEQ.NEXTVAL, '~2024년 4월 30일','교복 패키지 50,000원', '교복 착용하면 즉시 할인!
총 2인 종합이용권 가격 : 50000원. 구매 시 신분증 / 학생증 필요.','76419_59366_5741.jpg');

INSERT INTO EVENT (ENO, EPERIOD, EINFO, EINFO2, EIMAGE)
    VALUES
    (EVENT_SEQ.NEXTVAL, '~2024년 4월 30일','패밀리 패키지(어른+어린이) 70,000원', '	어른1명 + 어린이1명 종합이용권 총금액=70000만원
	      	최대수량3개까지 가능.','family.jpg');
            
INSERT INTO EVENT (ENO, EPERIOD, EINFO, EINFO2, EIMAGE)
    VALUES
    (EVENT_SEQ.NEXTVAL, '~ 2024년 5월30일', '프랜드 패키지(어른+어른) 90,000원', '어른1명 + 어른1명 종합이용권 총금액=90000만원
      		/구매 시 신분증 확인 필요.','friend.png');            
            
INSERT INTO EVENT (ENO, EPERIOD, EINFO, EINFO2, EIMAGE)
    VALUES
    (EVENT_SEQ.NEXTVAL, '~2023년 12월31일','패스트패스 100,000원','패스트패스 행사 기념 100,000원 가격 이벤트 1인1구매 가능<br>
    		구매 시 신분증 확인 필요','fastfast.jpg');

INSERT INTO EVENT (ENO, EPERIOD, EINFO, EINFO2, EIMAGE)
    VALUES
    (EVENT_SEQ.NEXTVAL, '~2024년 6월31일','스프링데이 30,000원','스프링 데이 기념 가격 이벤트 하루 선착순 30명까지 가능.
      		1인1구매 가능. 구매 시 신분증 확인 필요.','springspring.jpg');   
    
-- 6. ATTRACTION INSERTION
INSERT INTO ATTRACTION (AID, ANAME, ACONTENT, HEIGHT, AGE, BEST, STOPDAY, TAG1, TAG2, AIMAGE, HEADCOUNT)
VALUES
(ATTRACTION_SEQ.NEXTVAL, '범퍼카' ,'화려한 조명과 신나는 음악 속에서 스릴만점의 자동차 경주가 펼쳐진다. 
앞에서 쾅~ 뒤에서 쾅~ 어디서 달려들지 모르는 좌충우돌 범퍼카! 부딪칠수록 즐거움이 더욱 커집니다.',
'125cm 이상 탑승가능', '65세 이하 탑승 가능', 'Y', 'N', '익사이팅', '어린이', 'car.jpg', 1);

INSERT INTO ATTRACTION (AID, ANAME, ACONTENT, HEIGHT, AGE, BEST, STOPDAY, TAG1, TAG2, AIMAGE, HEADCOUNT)
VALUES
(ATTRACTION_SEQ.NEXTVAL, '자이로드롭', '구름이 맞닿을 듯한 높이까지 올라갔다 한 순간에 떨어지는 스릴만점 어트랙션입니다.',
'125cm ~ 190cm 탑승가능', '65세 이하 탑승 가능','Y','N','익사이팅','베스트','drop.jpg',40);

INSERT INTO ATTRACTION (AID, ANAME, ACONTENT, HEIGHT, AGE, BEST, STOPDAY, TAG1, TAG2, AIMAGE, HEADCOUNT)
VALUES
(ATTRACTION_SEQ.NEXTVAL, '회전목마', '64필의 아름다운 백마를 타고 떠나는 로멘틱한 여행!','100cm 탑승가능', '100cm 미만 아동은 보호자 동반 필요','Y','N','익사이팅','베스트',
'horse.jpg',64);

INSERT INTO ATTRACTION (AID, ANAME, ACONTENT, HEIGHT, AGE, BEST, STOPDAY, TAG1, TAG2, AIMAGE, HEADCOUNT)
VALUES
(ATTRACTION_SEQ.NEXTVAL,'드래곤 와일드슈팅' ,'로티왕이 살고있는 로티성에 심술쟁이 여왕드래곤과 익살스런 대왕 드래곤이 쳐들어왔어요! 기사로 멋지게 변신하여 위기에 빠진 로티성을 구해주세요!!',
'110cm 이상 탑승가능', '6세미만은 보호자 동반', 'Y','Y','익사이팅','어린이','lotty_dragon.jpg', 4);

INSERT INTO ATTRACTION (AID, ANAME, ACONTENT, HEIGHT, AGE, BEST, STOPDAY, TAG1, TAG2, AIMAGE, HEADCOUNT)
VALUES
(ATTRACTION_SEQ.NEXTVAL,'4D슈팅시어터' ,'지하 동굴속에 숨어든 괴물들을 향하여 슈팅건으로 스크린속 괴물들을 명중시켜 점수를 얻어보세요!',
'120cm 탑승 가능','65세 이하 탑승 가능','Y', 'Y', '익사이팅','어린이',
'4dgun.jpg',40);

INSERT INTO ATTRACTION (AID, ANAME, ACONTENT, HEIGHT, AGE, BEST, STOPDAY, TAG1, TAG2, AIMAGE, HEADCOUNT)
VALUES
(ATTRACTION_SEQ.NEXTVAL,'풍선비행','하늘 꼭대기에서 내려다본 작은 세계, 풍선을 타고 떠나 보세요! 롯데월드 최고의 전망코스~',
'6세이상, 100cm 이상 탑승가능', '6세미만은 보호자 동반','N','N','베스트','어린이',
'lotty_ballon.jpg',6);

INSERT INTO ATTRACTION (AID, ANAME, ACONTENT, HEIGHT, AGE, BEST, STOPDAY, TAG1, TAG2, AIMAGE, HEADCOUNT)
VALUES
(ATTRACTION_SEQ.NEXTVAL,'정글탐험보트' ,'보트를 타고  떠나는 어둠 속 정글 급류 탐험!
동굴로 들어서는 순간 무시무시한 정글이 펼쳐지고, 보트는 급류에 휘말리는데… ','110cm 이상 탑승가능', '65세 이하',
'Y','Y','익사이팅','어린이','lotty_boat.jpg',6 );

INSERT INTO ATTRACTION (AID, ANAME, ACONTENT, HEIGHT, AGE, BEST, STOPDAY, TAG1, TAG2, AIMAGE, HEADCOUNT)
VALUES
(ATTRACTION_SEQ.NEXTVAL,'점핑피쉬' ,'거대한 조개를 지나 다양한 물고기 친구들과 로티 로리와 함께 떠나는 신나는 해저여행. 무지막지한 상어를 피해 점핑 점핑!!! 
','110cm ~ 140cm 탑승가능', '65세 이하 탑승 가능','Y','N','익사이팅','어린이',
'lotty_fish.jpg',24);

INSERT INTO ATTRACTION (AID, ANAME, ACONTENT, HEIGHT, AGE, BEST, STOPDAY, TAG1, TAG2, AIMAGE, HEADCOUNT)
VALUES
(ATTRACTION_SEQ.NEXTVAL, '와일드 윙' ,'강렬한 바람을 가르며 비행하는 와일드 윙',
'110cm 이상 탑승 가능', '65세 이하 탑승 가능','N','N','윙','어린이','wildwing.jpg',12);

INSERT INTO ATTRACTION (AID, ANAME, ACONTENT, HEIGHT, AGE, BEST, STOPDAY, TAG1, TAG2, AIMAGE, HEADCOUNT)
VALUES
(ATTRACTION_SEQ.NEXTVAL,'와일드 밸리' ,'세찬 물살을 가르며 펼쳐지는 스릴만점 추격전 와일드 밸리',
'110cm 이상 탑승 가능', '65세 이하 탑승 가능','N','N','밸리','어린이','wildbelly.jpg',12);

INSERT INTO ATTRACTION (AID, ANAME, ACONTENT, HEIGHT, AGE, BEST, STOPDAY, TAG1, TAG2, AIMAGE, HEADCOUNT)
VALUES
(ATTRACTION_SEQ.NEXTVAL,'드림보트','2인승 보트 타고 요정의 세계로 떠나는 패밀리 후룸라이드',
'120cm 이상 ~ 140cm 탑승 가능', '90cm 이상 ~ 120cm미만 보호자 동반 탑승 시 이용가능','N','Y',
'드림보트','어린이','dreamboat.jpg',2);

INSERT INTO ATTRACTION (AID, ANAME, ACONTENT, HEIGHT, AGE, BEST, STOPDAY, TAG1, TAG2, AIMAGE, HEADCOUNT)
VALUES
(ATTRACTION_SEQ.NEXTVAL,'후렌치 레볼루션','대표 롤러코스터! 짜릿한 하강과 정신이 아득해지는 원형 트랙에서 저세상
스릴을 느껴보세요!','120cm 이상 탑승 가능', '65세 이하 탑승 가능','N','N','롤러코스터','스릴',
'rollercoaster.jpg',28);

-- 7. PARADE INSERTION
INSERT INTO PARADE (PNO, PTITLE, PINFO, PPLACE, PPERIOD, PCAUTION,PIMG,PIMG2)
    VALUES (PARADE_SEQ.NEXTVAL, '레니의 대모험 ~드래곤 성을 찾아서~',
    '평화롭던 이솝빌리지에 찾아온 어둠의 기운...
	레니와 라라는 이솝빌리지를 위험에서 구하기 위해
	드래곤 성을 찾아 떠나는데…!', '퍼레이드 길, 카니발 광장 (가이드맵 167)', '11.18 ~ 12.31',            
	'※ 공연장 입장은 공연 시작 30분전부터 가능하며,
	  공연 시작 이후에는 입장이 불가합니다.
	※ 본 공연은 좌석이 지정되지 않는 자유석으로 운영됩니다.
	※ 현장 상황에 따라 공연이 취소되거나 축소 운영될 수 있으며,
	 공연 일정이 변경될 수 있습니다.
	※ 현장 운영 상황에 따라 현장줄서기로 전환될 수 있습니다.','parade2.jpg','paradeDetail2.jpg');           
            
INSERT INTO PARADE (PNO, PTITLE, PINFO, PPLACE, PPERIOD, PCAUTION, PIMG, PIMG2)
    VALUES (PARADE_SEQ.NEXTVAL,'문라이트 퍼레이드','밤을 화려하게 장식해 줄 빛의 축제!<br>
			반짝이는 빛과 신나는 음악이 만드는 환상의 퍼레이드!','퍼레이드 길, 카니발 광장 (가이드맵 167)','11.17(금) ~','※ 현장 상황 및 기상 예보에 따라 공연 일정이 변경 및 취소될 수 있습니다.
			※ 이용 정보-운영시간에서 공연시간 확인 가능합니다.','parade3.jpg','paradeDetail3.jpg');
            
INSERT INTO PARADE (PNO, PTITLE, PINFO, PPLACE, PPERIOD, PCAUTION,PIMG, PIMG2)
    VALUES (PARADE_SEQ.NEXTVAL, '타임 오디세이', '어디에서도 경험해 보지 못한 황홀한 빛의 세계!
			감동적 스토리와 환상적인 음악,
			그리고 밤하늘을 장식할 화려한 불꽃쇼로
			여러분을 초대합니다!','포시즌스 가든 (가이드맵 165)','11.17(금) ~','※현장 상황 및 기상 예보에 따라 공연 일정이 변경 및 취소될 수 있습니다.
			※ 이용 정보-운영 시간에서 공연시간 확인이 가능합니다.','parade4.jpg','paradeDetail4');

-- 8. NOTICE INSERTION
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

-- 9. QNA INSERTION
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'단체관람 할인','동호회 단체관람 예정인데 할인 방법이있나요', QNA_SEQ.CURRVAL,0,0,'one');
INSERT INTO QNA (QNO,QTITLE,QCONTENT,QGROUP,QSTEP,QINDENT,MID) VALUES
(QNA_SEQ.NEXTVAL,'단체관람 할인','동호회 단체관람 예정인데 할인 방법이있나요', QNA_SEQ.CURRVAL,0,0,'one');
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
(QNA_SEQ.NEXTVAL,'신용카드 할인','신용카드 포인트로 할인 받을수 없나요?','123', 

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

-- 10. WORKER INSERTION
INSERT INTO WORKER VALUES('admin','1234', '관리자', '010-7777-7777');
-- 관리자 댓글달기용 MEMBER 일반계정
INSERT INTO MEMBER (MID, MPW, MNAME, MPHONE ,MEMAIL)
VALUES ('admin', '1234', '관리자', '010-7777-7777', 'admin@naver.com');

-- 11. REVIEW_COMMENT INSERTION
INSERT INTO REVIEW_COMMENT (RCID, RCCONTENT, RCGROUP, RCSTEP, RCINDENT, RID, MID)
VALUES (REVIEW_COMMENT_SEQ.NEXTVAL, '잘보고갑니다', REVIEW_COMMENT_SEQ.CURRVAL, 0, 0, 47, 'trio');
SELECT * FROM REVIEW;
SELECT RC.*, M.MNAME FROM REVIEW_COMMENT RC, MEMBER M WHERE RC.MID = M.MID AND RID = 47 ORDER BY RCRDATE DESC;
SELECT COUNT(*) CNT FROM REVIEW_COMMENT WHERE RID = 47;

SELECT R.*, OD.ODID AS R_ODID, OD.*, M.MNAME, (select count(*) from review_comment where rid=r.rid) cnt 
    	FROM REVIEW R, ORDER_DETAIL OD, MEMBER M 
    	WHERE R.ODID = OD.ODID AND R.MID = M.MID and RID = 47;











            