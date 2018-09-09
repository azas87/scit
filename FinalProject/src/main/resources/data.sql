
drop sequence fishNum;
drop sequence fishCategoryNum;
drop sequence buyNum;
drop sequence saleNum;
drop sequence reviewNum;
drop sequence replyNum;
drop sequence qnaNum;
drop sequence noticeNum;
drop sequence FAQNum;

drop table notice purge;
drop table FAQ purge;
drop table QnAreply purge;
drop table qna purge;
drop table saleList purge;
drop table review purge;
drop table priorityList purge;
drop table buyList purge;
drop table wishList purge;
drop table memberinfo purge;
drop table fishList purge;
drop table fishCategoryList purge;



create sequence fishNum;
create sequence fishCategoryNum;
create sequence buyNum;
create sequence saleNum;
create sequence reviewNum;
create sequence replyNum;
create sequence qnaNum;
create sequence noticeNum;
create sequence FAQNum;



create table fishCategoryList(				
fishCategoryNum number primary key,
CategoryName varchar2(500)
);

create table fishList(
fishName varchar2(50) primary key,
fishCategoryNum number,
locations varchar2(200),
seasonInfo varchar2(100),
fishInfo varchar2(2000),
CONSTRAINT fk_fishList FOREIGN KEY(fishCategoryNum) REFERENCES fishCategoryList(fishCategoryNum) ON DELETE CASCADE
);


create table memberinfo(
id varchar2(50) primary key,
password varchar2(50) not null,
nameKana varchar2(50),
name varchar2(50) not null,
address varchar2(100) not null,
addrHurikana varchar2(100),
tel number,
email varchar2(100) unique,
alarm varchar2(50),
grade varchar2(50),
first varchar2(50) default 'first',
joinDate date,
outDate date,
memberStatus varchar2(50) default 'join'
);

create table wishList(
wishNum number primary key,
id varchar2(50),
wish varchar2(50),
CONSTRAINT fk_wishList_wish FOREIGN KEY(wish) REFERENCES fishList(fishName),
CONSTRAINT fk_wishList_id FOREIGN KEY(id) REFERENCES memberinfo(id)
);



create table buyList(
buyNum number primary key,
fishName varchar2(50),
buyerId varchar2(50),
registDate date default sysdate,
uploadDate date,
deadline date,
weight number,
saleStatus varchar2(50) default 'onSale',
price number,
successSellerId  varchar2(50),
buyListComment  varchar2(1000),
location varchar2(200),
CONSTRAINT fk_buyList_buyerId FOREIGN KEY(buyerId) REFERENCES memberinfo(id),
CONSTRAINT fk_buyList_fishname FOREIGN KEY(fishName) REFERENCES fishList(fishName),
CONSTRAINT fk_buyList_successSellerId FOREIGN KEY(successSellerId) REFERENCES memberinfo(id) 
);

create table priorityList(
priorityNum number primary key,
buyNum number,
priorityId varchar2(50),
CONSTRAINT fk_priorityList_buynum FOREIGN KEY(buyNum) REFERENCES buyList(buyNum) ON DELETE CASCADE,
CONSTRAINT fk_priorityList_id FOREIGN KEY(priorityId) REFERENCES memberinfo(id) ON DELETE CASCADE
);

create table saleList(
saleNum number primary key,
buyNum number,
sellerId varchar2(50),
CONSTRAINT fk_saleList_buynum FOREIGN KEY(buyNum) REFERENCES buyList(buyNum) ON DELETE CASCADE,
CONSTRAINT fk_saleList_sellerId FOREIGN KEY(sellerId) REFERENCES memberinfo(id) ON DELETE CASCADE
);

create table review(
reviewNum number primary key,
buyNum number,
star number,
sellerId varchar2(50),
reviewComment varchar2(1000),
CONSTRAINT fk_review_buynum FOREIGN KEY(buyNum) REFERENCES buyList(buyNum) ON DELETE CASCADE,
CONSTRAINT fk_review_sellerId FOREIGN KEY(sellerId) REFERENCES memberinfo(id) ON DELETE CASCADE
);



create table QnA(
qnaNum number primary key,
id varchar2(50),
writeBoardDate date,
updateBoardDate date,
title varchar2(100),
content varchar2(2000),
hitcount number,
CONSTRAINT fk_QnA_id FOREIGN KEY(id) REFERENCES memberinfo(id) 
);

create table QnAreply(
replyNum number primary key,
qnaNum number,
id varchar2(50),
replyContent varchar2(100),
replyRegdate date,
CONSTRAINT fk_QnAreply_num FOREIGN KEY(qnaNum) REFERENCES QnA(qnaNum),
CONSTRAINT fk_QnAreply_id FOREIGN KEY(id) REFERENCES memberinfo(id) 
);

create table notice(
noticeNum number primary key,
id varchar2(50),
writeBoardDate date,
updateBoardDate date,
title varchar2(100),
content varchar2(2000),
hitcount number,
CONSTRAINT fk_notice_id FOREIGN KEY(id) REFERENCES memberinfo(id) 
);
create table FAQ(
FAQNum number primary key,
id varchar2(50),
writeBoardDate date,
updateBoardDate date,
title varchar2(100),
content varchar2(2000),
hitcount number,
CONSTRAINT fk_FAQ_id FOREIGN KEY(id) REFERENCES memberinfo(id) 
);

insert into fishCategoryList(fishCategoryNum, CategoryName) values(1,'イカ');                                                                                           
insert into fishCategoryList(fishCategoryNum, CategoryName) values(2,'すずき');
insert into fishCategoryList(fishCategoryNum, CategoryName) values(3,'エビ');
insert into fishCategoryList(fishCategoryNum, CategoryName) values(4,'サバ');
insert into fishCategoryList(fishCategoryNum, CategoryName) values(5,'タイ');
insert into fishCategoryList(fishCategoryNum, CategoryName) values(6,'カイ');
insert into fishCategoryList(fishCategoryNum, CategoryName) values(7,'カツオ');
insert into fishCategoryList(fishCategoryNum, CategoryName) values(8,'サンマ');
insert into fishCategoryList(fishCategoryNum, CategoryName) values(9,'トビウオ');
insert into fishCategoryList(fishCategoryNum, CategoryName) values(10,'アイナメ');
insert into fishCategoryList(fishCategoryNum, CategoryName) values(11,'マグロ');


insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('ジンドウイカ', 1, '宮城,兵庫,和歌山',  '春',  '市場ではヒイカとか小イカと呼ばれる小型のイカで外套長は成魚でも１０ｃｍ程度。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('ホタルイカ', 1, '福井,鳥取,島根',  '春',  '?中に?光器官を持ち,?間にも?光して明るい海面に溶け?むようにカモフラ?ジュし,下からおそってくる敵から見つかりにくくしている。最適な水?は15℃前後。?間は水深200～600ｍの中層にいて,夜間には表層近くまで上がってくる。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('スルメイカ', 1, '長崎,鳥取,兵庫,石川,?森,',  '秋',  '日本を代表するイカで漁獲が最も多く,ほぼ通年でまわる。生息に最適な?度は15℃。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('アオリイカ', 1, '三重,和歌山,?島,高知,愛媛',  '秋,冬',  '北海道南部以南の日本海側,太平洋側の日本各地沿岸部,特に九州,沖?に多く分布しています。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('すずき', 2, '大阪,兵庫,和歌山',  '夏',  '春のマダイに?して夏のスズキとも云われ,夏を代表する白身魚。ブリやボラと同じく出世魚で,?長30㎝程度の幼魚をセイゴ,45㎝程度をハネとかフッコ,60cm位以上をスズキと呼ぶ。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('クルマエビ', 3, '大分,熊本,長崎,鹿?島',  '冬,夏',  '市場への入荷は通年平均しており,7～8割は養殖物が占める。天然物の割合が多いのは産卵期の7月～9月。天然物は大分,熊本などからの入荷。養殖物は熊本,鹿?島,沖?からの入荷。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('イセエビ', 3, '千葉,三重',  '秋,冬',  '生息水?は20～26℃。夜行性で?間は岩礁,防波堤の?裂や穴の間隙に入っており夜間に周?を?いて餌を探す。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('クマエビ', 3, '和歌山,?島',  '春,秋',  'クルマエビ科の海老で,クルマエビに次ぐ高級海老とされる。?色が全?に赤っぽく,特に??（?）と脚が鮮やかな赤色で,?西での呼名もアシアカ（足赤）。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('マサバ', 4, '長崎,福岡,?森,宮城,新潟',  '秋,冬',  '日本各地で漁獲され,最もポピュラ?な大衆魚のひとつで重要な水産資源。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('キダイ', 5, '島根,長崎',  '秋',  'マダイと比べ?色が?色っぽく,市場では「レンコダイ」の通?で呼ばれる。マダイより適水?が高く,本州の中部以南で獲れるため,?東より?西以西でおなじみの魚。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('キンメダイ', 5, '千葉,神奈川,高知,長崎',  '冬',  '名前の由?は,目が大きくて瞳孔が金色なことから。?色は鮮やかな赤身をおびたオレンジ色で,魚屋の店頭でもひときわ目立ちます。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('イボダイ', 5, '兵庫,和歌山,京都,島根,山口,長崎,熊本,鹿?島',  '秋',  '沿岸の低層に生息,夜間は海面近くまで上がってくる。くらげが大好物で,くらげ魚と呼ばれる事もあります。このため,くらげの?生が多い年は豊漁です。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('ホタテガイ', 6, '北海道,?森,岩手',  '冬',  '東北,三陸以北に分布し潮通しのよい水深70ｍ以?の砂泥底,砂礫底に生息。水深30ｍ以?に多い。水?が２５℃を超えると全滅する。低?分にも弱い。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('トリガイ', 6, '愛知,三重,京都,香川,熊本',  '春',  '??の生産は減少しており,市場への入荷は韓?産が7割程度を占めていたが,07年は伊勢?や三河?で大量?生したため?産が主力となった。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('ハマグリ', 6, '福岡,長崎,熊本,佐賀',  '冬,春',  '左右の?がしっかりかみ合って,ほかの?に合わないところが夫婦和合のしるしとされ,お祝い料理に使われる。このため,正月や雛祭りに需要が多い。夏場に産卵するため,秋から春までのものがおいしい。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('バカガイ', 6, '三重,愛知,千葉',  '春',  '?東では?司だね用として生で出回ることが多いが,?西の場合は「湯ばか」と云って?き身をボイルしてセイロに?べたものが多い。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('カツオ', 7, '千葉,三重,?岡,和歌山,高知,鹿?島',  '夏',  '初夏のカツオは初物で美味ではあるが脂ののりは薄く淡白。秋口に南下してくるカツオは「?りカツオ」とか「もちカツオ」と呼んで脂も?ってさらに美味しい。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('サンマ', 8, '北海道,岩手,宮城,福島,千葉',  '秋',  '８月～１１月,この時期の秋刀魚は北海道以北の冷たい水域で?養を蓄えた脂のよく?った美味しい秋刀魚です。秋刀魚の旬として漁獲販?されます。美味しくて,安くて,?者要らずの高?養魚です。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('ハマトビウオ', 9, '鹿?島,宮崎',  '春,夏',  'トビウオ科の中では最も大型です。九州南部から四?沿岸の太平洋,伊豆諸島周?が主な漁場です。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('ツクシトビウオ', 9, '高知,和歌山',  '春,夏',  '中型のトビウオで約35㎝,300ｇ程度のものが多いようです。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('ホソトビウオ', 9, '鳥取,島根',  '春,夏',  '?長30㎝程度と小柄で,?の?面が丸いことから,市場では丸トビと呼ばれます。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('アイナメ', 10, '福島,茨城,千葉,兵庫,愛媛',  '春,夏',  '近年は漁獲量が激減して高級魚となり,春先の白身魚として割烹,フランス料理店など業務向けの需要が中心となっています。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('ビンナガマグロ', 11, '宮城,?岡,和歌山',  '春,夏',  '長い胸びれを?型の?（ビン）に見立てて,?長（びんなが,びんちょう）といいます。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('キハダマグロ', 11, '?岡,和歌山,高知,宮崎,鹿?島',  '夏',  '?西で赤身のマグロといえばこのキハダが主力。東日本より名古屋以西の西日本で人?がある。');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('メバチマグロ', 11, '宮城,?岡,和歌山,鹿?島,沖?',  '冬',  'マグロ類の種類別漁獲量ではキハダに次ぐ。日本近海に回遊してくるのは,水?が18℃を超える4月から5月。9月から翌年2月にかけて?子から金華山沖で獲れるものは脂がのっている。');


insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id1', '11'    ,'kim', '구미'  ,'c@com','1'  ,'1'   , 'first','join'     );
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id2', '11'    ,'kim', '구미'  ,'c@com2','1'  ,'1'   , 'first','join'     );
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id3', '11'    ,'kim', '구미'  ,'c@com3','1'  ,'1'   , 'first','join'     );


insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('2', '2'    ,'kim', '구미'  ,'2@com2','1'  ,'1'   , 'first','join'     );
            
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId, location) 
            values (12  , 'クマエビ',  '2'  , sysdate  , SYSDATE+1 ,SYSDATE+1, 2     , 'saleComplete'  , 10000,'id1'          , '여수'   );
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId, location) 
            values (13  , 'ジンドウイカ',  '2'  , sysdate  , SYSDATE+1 ,SYSDATE+1, 2     , 'saleComplete'  , 40000,'id3'          , '원산'   );



        
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId, location) 
            values (70 , 'ジンドウイカ',  '2'  , sysdate  , SYSDATE+1 ,'20180801', 2     , 'saleComplete'  , 10000,'id1'          , '인천'   );
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId, location) 
            values (71 , 'ホタルイカ',  '2'  , sysdate  , SYSDATE+1 ,'20180801', 2     , 'saleComplete'  , 20000,'id2'          , '서울'   );
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId, location) 
            values (72 , 'スルメイカ',  '2'  , sysdate  , SYSDATE+1 ,'20180701', 2     , 'saleComplete'  , 30000,'id3'          , '광주'   );
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId, location) 
            values (73 , 'ジンドウイカ',  '2'  , sysdate  , SYSDATE+1 ,'20180701', 2     , 'saleComplete'  , 20000,'id2'          , '부산'   );               
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId, location) 
            values (74 , 'クルマエビ',  '2'  , sysdate  , SYSDATE+1 ,'20180501', 2     , 'saleComplete'  , 30000,'id3'          , '제주'   );               
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId, location) 
            values (75 , 'アオリイカ',  '2'  , sysdate  , SYSDATE+1 ,'20180501', 2     , 'saleComplete'  , 10000,'id1'          , '인천'   );
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId, location) 
            values (76 , 'ジンドウイカ',  '2'  , sysdate  , SYSDATE+1 ,'20180401', 2     , 'saleComplete'  , 20000,'id2'          , '서울'   );
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId, location) 
            values (77 , 'すずき',  '2'  , sysdate  , SYSDATE+1 ,'20180401', 2     , 'saleComplete'  , 30000,'id3'          , '경주'   );               
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId, location) 
            values (78 , 'ジンドウイカ',  '2'  , sysdate  , SYSDATE+1 ,'20180301', 2     , 'saleComplete'  , 10000,'id1'          , '인천'   );            
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId, location) 
            values (79  , 'ジンドウイカ',  '2'  , sysdate  , SYSDATE+1 ,'20180301', 2     , 'saleComplete'  , 20000,'id2'          , '강릉'   );            
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId, location) 
            values (80  , 'アオリイカ',  '2'  , sysdate  , SYSDATE+1 ,'20171101', 2     , 'saleComplete'  , 30000,'id3'          , '광양'   );
            
            
insert into saleList(salenum, buynum, sellerid) values(1,1,'id3');
insert into saleList(salenum, buynum, sellerid) values(2,1,'id2');
insert into saleList(salenum, buynum, sellerid) values(3,2,'id1');
insert into saleList(salenum, buynum, sellerid) values(4,2,'id3');
insert into saleList(salenum, buynum, sellerid) values(5,3,'id1');
insert into saleList(salenum, buynum, sellerid) values(6,3,'id2');
insert into saleList(salenum, buynum, sellerid) values(7,3,'id3');

