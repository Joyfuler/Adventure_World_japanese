-- 1. Member Insertion
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
            
            