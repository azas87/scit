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
drop table WeekAvgList purge;

drop sequence fishCategoryNum;
drop sequence buyNum;
drop sequence saleNum;
drop sequence reviewNum;
drop sequence replyNum;
drop sequence qnaNum;
drop sequence noticeNum;
drop sequence FAQNum;
drop sequence wishNum;
drop sequence priorityNum;
drop SEQUENCE avgListNum;

create sequence fishCategoryNum;
create sequence buyNum;
create sequence saleNum;
create sequence reviewNum;
create sequence replyNum;
create sequence qnaNum;
create sequence noticeNum;
create sequence FAQNum;
create sequence wishNum;
create sequence priorityNum;
create SEQUENCE avgListNum;
-----------------------------------------------------------------------------------------------------------------------


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

insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id00', '00' , 'kim', '±¸¹Ì' , 'a00@com', 'on' , 'manager' , 'first', 'join');
/*°ü¸®ÀÚ*/
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id01', '01' , 'kim', '±¸¹Ì' , 'a01@com', 'on' , 'buyer' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id02', '02' , 'kim', '±¸¹Ì' , 'a02@com', 'on' , 'buyer' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id03', '03' , 'lee', '°æ»ê' , 'a03@com', 'on' , 'buyer' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id04', '04' , 'park', '´ë±¸' , 'a04@com', 'on' , 'buyer' , 'first', 'join');
/*°¡ÀÔ»óÅÂ. ¾Ë¶÷ ON*/              
              
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id05', '05' , 'kim', '±¸¹Ì' , 'a05@com', 'on' , 'buyer' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id06', '06' , 'kim', '±¸¹Ì' , 'a06@com', 'on' , 'buyer' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id07', '07' , 'lee', '°æ»ê' , 'a07@com', 'on' , 'buyer' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id08', '08' , 'park', '´ë±¸' , 'a08@com', 'on' , 'buyer' , 'first', 'join');
/*°¡ÀÔ»óÅÂ. ¾Ë¶÷ OFF*/

insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id09', '09' , 'kim', '±¸¹Ì' , 'a09@com', 'on' , 'buyer' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id10', '10' , 'kim', '±¸¹Ì' , 'a10@com', 'on' , 'buyer' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id11', '11' , 'lee', '°æ»ê' , 'a11@com', 'on' , 'buyer' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id12', '12' , 'park', '´ë±¸' , 'a12@com', 'on' , 'buyer' , 'not_first', 'join');
/*°¡ÀÔ»óÅÂ. Ã¹ ·Î±×ÀÎ ¾Æ´Ô. ¾Ë¶÷ ON*/
              
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id13', '13' , 'kim', '±¸¹Ì' , 'a13@com', 'off' , 'buyer' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id14', '14' , 'kim', '±¸¹Ì' , 'a14@com', 'off' , 'buyer' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id15', '15' , 'lee', '°æ»ê' , 'a15@com', 'off' , 'buyer' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id16', '16' , 'park', '´ë±¸' , 'a16@com', 'off' , 'buyer' , 'not_first', 'join');
/*°¡ÀÔ»óÅÂ. Ã¹ ·Î±×ÀÎ ¾Æ´Ô. ¾Ë¶÷ OFF*/  



insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id17', '17' , 'kim', '±¸¹Ì' , 'a17@com', 'on' , 'buyer' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id18', '18' , 'kim', '±¸¹Ì' , 'a18@com', 'on' , 'buyer' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id19', '19' , 'lee', '°æ»ê' , 'a19@com', 'on' , 'buyer' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id20', '20' , 'park', '´ë±¸' , 'a20@com', 'on' , 'buyer' , 'first', 'out');
/*Å»Åð»óÅÂ. ¾Ë¶÷ ON*/    

insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id21', '21' , 'kim', '±¸¹Ì' , 'a21@com', 'on' , 'buyer' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id22', '22' , 'kim', '±¸¹Ì' , 'a22@com', 'on' , 'buyer' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id23', '23' , 'lee', '°æ»ê' , 'a23@com', 'on' , 'buyer' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id24', '24' , 'park', '´ë±¸' , 'a24@com', 'on' , 'buyer' , 'first', 'out');
/*Å»Åð»óÅÂ. ¾Ë¶÷ OFF*/

insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id25', '25' , 'kim', '±¸¹Ì' , 'a25@com', 'on' , 'buyer' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id26', '26' , 'kim', '±¸¹Ì' , 'a26@com', 'on' , 'buyer' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id27', '27' , 'lee', '°æ»ê' , 'a27@com', 'on' , 'buyer' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id28', '28' , 'park', '´ë±¸' , 'a28@com', 'on' , 'buyer' , 'not_first', 'out');
/*Å»Åð»óÅÂ. Ã¹ ·Î±×ÀÎ ¾Æ´Ô. ¾Ë¶÷ ON*/
              
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id29', '29' , 'kim', '±¸¹Ì' , 'a29@com', 'off' , 'buyer' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id30', '30' , 'kim', '±¸¹Ì' , 'a30@com', 'off' , 'buyer' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id31', '31' , 'lee', '°æ»ê' , 'a31@com', 'off' , 'buyer' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id32', '32' , 'park', '´ë±¸' , 'a32@com', 'off' , 'buyer' , 'not_first', 'out');
/*Å»Åð»óÅÂ. Ã¹ ·Î±×ÀÎ ¾Æ´Ô. ¾Ë¶÷ OFF*/  
------------------------------------------------memberinfo±¸¸ÅÀÚ------------------------------------------------------memberinfo±¸¸ÅÀÚ
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id33', '33' , 'kim', '±¸¹Ì' , 'a33@com', 'on' , 'seller' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id34', '34' , 'kim', '±¸¹Ì' , 'a34@com', 'on' , 'seller' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id35', '35' , 'lee', '°æ»ê' , 'a35@com', 'on' , 'seller' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id36', '36' , 'park', '´ë±¸' , 'a36@com', 'on' , 'seller' , 'first', 'join');
/*°¡ÀÔ»óÅÂ. ¾Ë¶÷ ON*/            
              
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id37', '37' , 'kim', '±¸¹Ì' , 'a37@com', 'off' , 'seller' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id38', '38' , 'kim', '±¸¹Ì' , 'a38@com', 'off' , 'seller' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id39', '39' , 'lee', '°æ»ê' , 'a39@com', 'off' , 'seller' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id40', '40' , 'park', '´ë±¸' , 'a40@com', 'off' , 'seller' , 'first', 'join');
/*°¡ÀÔ»óÅÂ. ¾Ë¶÷ OFF*/

insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id41', '41' , 'kim', '±¸¹Ì' , 'a41@com', 'on' , 'seller' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id42', '42' , 'kim', '±¸¹Ì' , 'a42@com', 'on' , 'seller' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id43', '43' , 'lee', '°æ»ê' , 'a43@com', 'on' , 'seller' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id44', '44' , 'park', '´ë±¸' , 'a44@com', 'on' , 'seller' , 'not_first', 'join');
/*°¡ÀÔ»óÅÂ. Ã¹ ·Î±×ÀÎ ¾Æ´Ô. ¾Ë¶÷ ON*/
              
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id45', '45' , 'kim', '±¸¹Ì' , 'a45@com', 'on' , 'seller' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id46', '46' , 'kim', '±¸¹Ì' , 'a46@com', 'on' , 'seller' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id47', '47' , 'lee', '°æ»ê' , 'a47@com', 'on' , 'seller' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id48', '48' , 'park', '´ë±¸' , 'a48@com', 'on' , 'seller' , 'not_first', 'join');
/*°¡ÀÔ»óÅÂ. Ã¹ ·Î±×ÀÎ ¾Æ´Ô. ¾Ë¶÷ OFF*/  



insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id49', '49' , 'kim', '±¸¹Ì' , 'a49@com', 'on' , 'seller' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id50', '50' , 'kim', '±¸¹Ì' , 'a50@com', 'on' , 'seller' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id51', '51' , 'lee', '°æ»ê' , 'a51@com', 'on' , 'seller' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id52', '52' , 'park', '´ë±¸' , 'a52@com', 'on' , 'seller' , 'first', 'out');
/*Å»Åð»óÅÂ. ¾Ë¶÷ ON*/    

insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id53', '53' , 'kim', '±¸¹Ì' , 'a53@com', 'on' , 'seller' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id54', '54' , 'kim', '±¸¹Ì' , 'a54@com', 'on' , 'seller' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id55', '55' , 'lee', '°æ»ê' , 'a55@com', 'on' , 'seller' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id56', '56' , 'park', '´ë±¸' , 'a56@com', 'on' , 'seller' , 'first', 'out');
/*Å»Åð»óÅÂ. ¾Ë¶÷ OFF*/

insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id57', '57' , 'kim', '±¸¹Ì' , 'a57@com', 'on' , 'seller' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id58', '58' , 'kim', '±¸¹Ì' , 'a58@com', 'on' , 'seller' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id59', '59' , 'lee', '°æ»ê' , 'a59@com', 'on' , 'seller' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id60', '60' , 'park', '´ë±¸' , 'a60@com', 'on' , 'seller' , 'not_first', 'out');
/*Å»Åð»óÅÂ. Ã¹ ·Î±×ÀÎ ¾Æ´Ô. ¾Ë¶÷ ON*/
              
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id61', '61' , 'kim', '±¸¹Ì' , 'a61@com', 'off' , 'seller' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id62', '62' , 'kim', '±¸¹Ì' , 'a62@com', 'off' , 'seller' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id63', '63' , 'lee', '°æ»ê' , 'a63@com', 'off' , 'seller' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id64', '64' , 'park', '´ë±¸' , 'a64@com', 'off' , 'seller' , 'not_first', 'out');
/*Å»Åð»óÅÂ. Ã¹ ·Î±×ÀÎ ¾Æ´Ô. ¾Ë¶÷ OFF*/  
----------------------------------------------memberinfoÆÇ¸ÅÀÚ--------------------------------------------memberinfoÆÇ¸ÅÀÚ
create table fishCategoryList(				
fishCategoryNum number primary key,
CategoryName varchar2(500)
);
insert into fishcategorylist(fishcategorynum,categoryname)values(1,'«¤««');
insert into fishcategorylist(fishcategorynum,categoryname)values(2,'ª¹ªºª­');
insert into fishcategorylist(fishcategorynum,categoryname)values(3,'«¨«Ó');
insert into fishCategoryList(fishCategoryNum, CategoryName) values(4,'«µ«Ð');
insert into fishCategoryList(fishCategoryNum, CategoryName) values(5,'«¿«¤');
-----------------------------------------fishCategoryList-------------------------------------------------------fishCategoryList
create table fishList(
fishName varchar2(50) primary key,
fishCategoryNum number,
unit varchar2(50),
locations varchar2(200),
seasonInfo varchar2(100),
fishInfo varchar2(2000),
CONSTRAINT fk_fishList FOREIGN KEY(fishCategoryNum) REFERENCES fishCategoryList(fishCategoryNum) ON DELETE CASCADE
);

insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('«¸«ó«É«¦«¤««', 1, 'Ïààò',  'õð,õÕ,ÔÏ',  'ã¼íÞªÇªÏ«Ò«¤««ªÈª«á³«¤««ªÈû¼ªÐªìªëá³úþªÎ«¤««ªÇèâ÷ßíþªÏà÷åàªÇªâ£±£°£ã£íïïÓø¡£');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('«Û«¿«ë«¤««', 1, 'ÜØïÌ,ðèö¢,ÓöÐÆ',  'õð',  '?ñéªË?ÎÃÐïÎ¯ªòò¥ªÁ,?ÊàªËªâ?ÎÃª·ªÆÙ¥ªëª¤ú­ØüªËéÁª±?ªàªèª¦ªË«««â«Õ«é?«¸«åª·,ù»ª«ªéªªª½ªÃªÆª¯ªëîØª«ªéÌ¸ªÄª«ªêªËª¯ª¯ª·ªÆª¤ªë¡£õÌîêªÊâ©?ªÏ15¡Éîñý­¡£?ÊàªÏâ©ä¢200¢¦600£íªÎñéöµªËª¤ªÆ,å¨ÊàªËªÏøúöµÐÎª¯ªÞªÇß¾ª¬ªÃªÆª¯ªë¡£');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('«¹«ë«á«¤««', 1, 'íþÐø,ðèö¢',  'õÕ',  'ìíÜâªòÓÛøúª¹ªë«¤««ªÇåÛüòª¬õÌªâÒýª¯,ªÛªÜ÷×Ò´ªÇªÞªïªë¡£ßæãÓªËõÌîêªÊ?ÓøªÏ15¡É¡£');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('«¢«ª«ê«¤««', 1, 'ß²ñì,ûúÊ°ß£,?Óö,ÍÔò±,äñê°',  'õÕ,ÔÏ',  'ÝÁú­Ô³ÑõÝ»ì¤ÑõªÎìíÜâú­ö°,÷¼øÁåÇö°ªÎìíÜâÊÀò¢æÍäÍÝ»,÷åªËÎúñ¶,õø?ªËÒýª¯ÝÂøÖª·ªÆª¤ªÞª¹¡£');

insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('ª¹ªºª­', 2, 'ÓÞø¡,Ü²Í·,ûúÊ°ß£',  'ù¾',  'õðªÎ«Þ«À«¤ªË?ª·ªÆù¾ªÎ«¹«º«­ªÈªâéöªïªì,ù¾ªòÓÛøúª¹ªëÛÜãóåà¡£«Ö«êªä«Ü«éªÈÔÒª¸ª¯õóá¦åàªÇ,?íþ30§¯ïïÓøªÎêêåàªò«»«¤«´,45§¯ïïÓøªò«Ï«ÍªÈª««Õ«Ã«³,60cmêÈì¤ß¾ªò«¹«º«­ªÈû¼ªÖ¡£');

insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('«¯«ë«Þ«¨«Ó', 3, 'ÓÞÝÂ,ê¨Üâ,íþÐø',  'ÔÏ,ù¾',  'ã¼íÞªØªÎìýùÃªÏ÷×Ò´øÁÐ³ª·ªÆªªªê,7¢¦8ùÜªÏå×ãÖÚªª¬ï¿ªáªë¡£ô¸æÔÚªªÎùÜùêª¬Òýª¤ªÎªÏß§Õ°Ñ¢ªÎ7êÅ¢¦9êÅ¡£ô¸æÔÚªªÏÓÞÝÂ,ê¨ÜâªÊªÉª«ªéªÎìýùÃ¡£å×ãÖÚªªÏê¨Üâ,Öã?Óö,õø?ª«ªéªÎìýùÃ¡£');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('«¤«»«¨«Ó', 3, 'ô¶ç¨',  'õÕ',  'ßæãÓâ©?ªÏ20¢¦26¡É¡£å¨ú¼àõªÇ?ÊàªÏäÛõ§,ÛÁ÷îð§ªÎ?Ö®ªäúëªÎÊàÐÀªËìýªÃªÆªªªêå¨ÊàªËñ²?ªò?ª¤ªÆìÈªò÷®ª¹¡£');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('«¯«Þ«¨«Ó', 3, 'ûúÊ°ß£,?Óö',  'õð,ù¾,õÕ',  '«¯«ë«Þ«¨«ÓÎ¡ªÎú­ÖÕªÇ,«¯«ë«Þ«¨«ÓªËó­ª°ÍÔÐäú­ÖÕªÈªµªìªë¡£?ßäª¬îï?ªËîåªÃªÝª¯,÷åªË??£¨?£©ªÈÊÅª¬àØªäª«ªÊîåßäªÇ,?à¤ªÇªÎû¼Ù£ªâ«¢«·«¢««£¨ðëîå£©¡£');

insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('«Þ«µ«Ð', 4, 'íþÐø,ÜØËª,?ßµ,Ïààò,ãæà³',  'õÕ,ÔÏ',  'ìíÜâÊÀò¢ªÇåÛüòªµªì,õÌªâ«Ý«Ô«å«é?ªÊÓÞñëåàªÎªÒªÈªÄªÇñìé©ªÊâ©ß§íÀê¹¡£');

insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('«­«À«¤', 5, 'ÓöÐÆ',  'õÕ',  '«Þ«À«¤ªÈÝïªÙ?ßäª¬?ßäªÃªÝª¯,ã¼íÞªÇªÏ¡¸«ì«ó«³«À«¤¡¹ªÎ÷×?ªÇû¼ªÐªìªë¡£«Þ«À«¤ªèªêîêâ©?ª¬ÍÔª¯,Üâñ¶ªÎñéÝ»ì¤ÑõªÇüòªìªëª¿ªá,?ÔÔªèªê?à¤ì¤à¤ªÇªªªÊª¸ªßªÎåà¡£');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('«­«ó«á«À«¤', 5, 'ô¶ç¨,ãêÒ¯ô¹',  'õð,ÔÏ,õÕ',  'Ù£îñªÎë¦?ªÏ,ÙÍª¬ÓÞª­ª¯ªÆÔÚÍîª¬ÑÑßäªÊª³ªÈª«ªé¡£?ßäªÏàØªäª«ªÊîåãóªòªªªÓª¿«ª«ì«ó«¸ßäªÇ,åàè©ªÎïÁÔéªÇªâªÒªÈª­ªïÙÍØ¡ªÁªÞª¹¡£');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('«¤«Ü«À«¤', 5, 'Ü²Í·,ûúÊ°ß£,ÌÈÔ´',  'ù¾,õÕ',  'æÍäÍªÎî¸öµªËßæãÓ,å¨ÊàªÏú­ØüÐÎª¯ªÞªÇß¾ª¬ªÃªÆª¯ªë¡£ª¯ªéª²ª¬ÓÞû¿ÚªªÇ,ª¯ªéª²åàªÈû¼ªÐªìªëÞÀªâª¢ªêªÞª¹¡£ª³ªÎª¿ªá,ª¯ªéª²ªÎ?ßæª¬Òýª¤Ò´ªÏù¥åÛªÇª¹¡£');
--------------------------------------------------fishList-----------------------------------------------fishList---------------------------------------------------------fishList
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


insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(1, '«¸«ó«É«¦«¤««', 'id01', TO_DATE('2018/05/03', 'yyyy/mm/dd'), TO_DATE('2018/05/03', 'yyyy/mm/dd'),
              TO_DATE('2018/05/04', 'yyyy/mm/dd'), '1', 'onSale', 1000, 'id33', 'Ïààò');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(2, '«¸«ó«É«¦«¤««', 'id01', TO_DATE('2018/05/04', 'yyyy/mm/dd'), TO_DATE('2018/05/04', 'yyyy/mm/dd'),
              TO_DATE('2018/05/05', 'yyyy/mm/dd'), '1', 'saleComplete', 500, 'id38', 'Ïààò');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,  successSellerId, location) 
              values(3, '«¸«ó«É«¦«¤««', 'id01', TO_DATE('2018/05/05', 'yyyy/mm/dd'), TO_DATE('2018/05/05', 'yyyy/mm/dd'),
              TO_DATE('2018/05/06', 'yyyy/mm/dd'), '1', 'getComplete', 800, 'id39', 'Ïààò');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,  successSellerId, location) 
              values(4, '«¸«ó«É«¦«¤««', 'id01', TO_DATE('2018/05/06', 'yyyy/mm/dd'), TO_DATE('2018/05/06', 'yyyy/mm/dd'),
              TO_DATE('2018/05/07', 'yyyy/mm/dd'), '1', 'refund', 1000, 'id33', 'Ïààò');           
        
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(5, '«¸«ó«É«¦«¤««', 'id01', TO_DATE('2018/06/10', 'yyyy/mm/dd'), TO_DATE('2018/06/10', 'yyyy/mm/dd'),
              TO_DATE('2018/06/11', 'yyyy/mm/dd'), '2', 'onSale', 1100, 'id38', 'Ïààò');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,  successSellerId, location) 
              values(6, '«¸«ó«É«¦«¤««', 'id01', TO_DATE('2018/06/11', 'yyyy/mm/dd'), TO_DATE('2018/06/11', 'yyyy/mm/dd'),
              TO_DATE('2018/06/12', 'yyyy/mm/dd'), '2', 'saleComplete', 600, 'id39', 'Ïààò');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(7, '«¸«ó«É«¦«¤««', 'id01', TO_DATE('2018/06/12', 'yyyy/mm/dd'), TO_DATE('2018/06/12', 'yyyy/mm/dd'),
              TO_DATE('2018/06/13', 'yyyy/mm/dd'), '2', 'getComplete', 1000, 'id33', 'Ïààò');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(8, '«¸«ó«É«¦«¤««', 'id01', TO_DATE('2018/06/13', 'yyyy/mm/dd'), TO_DATE('2018/06/13', 'yyyy/mm/dd'),
              TO_DATE('2018/06/14', 'yyyy/mm/dd'), '2', 'refund', 700, 'id38' ,'Ïààò'); 
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(9, '«¸«ó«É«¦«¤««', 'id01', TO_DATE('2018/07/23', 'yyyy/mm/dd'), TO_DATE('2018/07/23', 'yyyy/mm/dd'),
              TO_DATE('2018/07/24', 'yyyy/mm/dd'), '3', 'onSale', 1500, 'id39', 'Ïààò');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(10, '«¸«ó«É«¦«¤««', 'id01', TO_DATE('2018/07/24', 'yyyy/mm/dd'), TO_DATE('2018/07/24', 'yyyy/mm/dd'),
              TO_DATE('2018/07/25', 'yyyy/mm/dd'), '3', 'saleComplete', 1000, 'id33', 'Ïààò');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(11, '«¸«ó«É«¦«¤««', 'id01', TO_DATE('2018/07/25', 'yyyy/mm/dd'), TO_DATE('2018/07/25', 'yyyy/mm/dd'),
              TO_DATE('2018/07/26', 'yyyy/mm/dd'), '3', 'getComplete', 500, 'id38', 'Ïààò');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(12, '«¸«ó«É«¦«¤««', 'id01', TO_DATE('2018/07/26', 'yyyy/mm/dd'), TO_DATE('2018/07/26', 'yyyy/mm/dd'),
              TO_DATE('2018/07/27', 'yyyy/mm/dd'), '3', 'refund', 800, 'id38', 'Ïààò');              

insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(13, '«Û«¿«ë«¤««', 'id01', TO_DATE('2018/03/10', 'yyyy/mm/dd'), TO_DATE('2018/03/10', 'yyyy/mm/dd'),
              TO_DATE('2018/03/11', 'yyyy/mm/dd'), '1', 'onSale', 500, 'id39', 'ÜØïÌ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(14, '«Û«¿«ë«¤««', 'id01', TO_DATE('2018/03/11', 'yyyy/mm/dd'), TO_DATE('2018/03/11', 'yyyy/mm/dd'),
              TO_DATE('2018/03/12', 'yyyy/mm/dd'), '1', 'saleComplete',800, 'id33', 'ðèö¢');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(15, '«Û«¿«ë«¤««', 'id01', TO_DATE('2018/03/12', 'yyyy/mm/dd'), TO_DATE('2018/03/12', 'yyyy/mm/dd'),
              TO_DATE('2018/03/13', 'yyyy/mm/dd'), '1', 'getComplete', 1000, 'id40', 'ÓöÐÆ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(16, '«Û«¿«ë«¤««', 'id01', TO_DATE('2018/03/13', 'yyyy/mm/dd'), TO_DATE('2018/03/13', 'yyyy/mm/dd'),
              TO_DATE('2018/03/14', 'yyyy/mm/dd'), '1', 'refund', 600, 'id33', 'ðèö¢');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(17, '«Û«¿«ë«¤««', 'id01', TO_DATE('2018/04/17', 'yyyy/mm/dd'), TO_DATE('2018/04/17', 'yyyy/mm/dd'),
              TO_DATE('2018/04/18', 'yyyy/mm/dd'), '2', 'onSale', 1000, 'id39','ÜØïÌ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(18, '«Û«¿«ë«¤««', 'id01', TO_DATE('2018/04/18', 'yyyy/mm/dd'), TO_DATE('2018/04/18', 'yyyy/mm/dd'),
              TO_DATE('2018/04/19', 'yyyy/mm/dd'), '2', 'saleComplete', 700, 'id40','ÓöÐÆ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(19, '«Û«¿«ë«¤««', 'id01', TO_DATE('2018/04/19', 'yyyy/mm/dd'), TO_DATE('2018/04/19', 'yyyy/mm/dd'),
              TO_DATE('2018/04/20', 'yyyy/mm/dd'), '2', 'getComplete',1500, 'id33','ðèö¢');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(20, '«Û«¿«ë«¤««', 'id01', TO_DATE('2018/04/20', 'yyyy/mm/dd'), TO_DATE('2018/04/20', 'yyyy/mm/dd'),
              TO_DATE('2018/04/21', 'yyyy/mm/dd'), '2', 'refund', 700, 'id33','ðèö¢');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(21, '«Û«¿«ë«¤««', 'id01', TO_DATE('2018/07/24', 'yyyy/mm/dd'), TO_DATE('2018/07/24', 'yyyy/mm/dd'),
              TO_DATE('2018/07/25', 'yyyy/mm/dd'), '3', 'onSale', 1000, 'id40','ÓöÐÆ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(22, '«Û«¿«ë«¤««', 'id01', TO_DATE('2018/07/25', 'yyyy/mm/dd'), TO_DATE('2018/07/25', 'yyyy/mm/dd'),
              TO_DATE('2018/07/26', 'yyyy/mm/dd'), '3', 'saleComplete', 600, 'id33','ðèö¢');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(23, '«Û«¿«ë«¤««', 'id01', TO_DATE('2018/07/26', 'yyyy/mm/dd'), TO_DATE('2018/07/26', 'yyyy/mm/dd'),
              TO_DATE('2018/07/27', 'yyyy/mm/dd'), '3', 'getComplete', 500, 'id39','ÜØïÌ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(24, '«Û«¿«ë«¤««', 'id01', TO_DATE('2018/07/27', 'yyyy/mm/dd'), TO_DATE('2018/07/27', 'yyyy/mm/dd'),
              TO_DATE('2018/07/28', 'yyyy/mm/dd'), '3', 'refund', 1000, 'id33','ðèö¢');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(25, '«¹«ë«á«¤««', 'id01', TO_DATE('2018/04/03', 'yyyy/mm/dd'), TO_DATE('2018/04/03', 'yyyy/mm/dd'),
              TO_DATE('2018/04/04', 'yyyy/mm/dd'), '1', 'onSale', 1000, 'id33', 'íþÐø');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(26, '«¹«ë«á«¤««', 'id01', TO_DATE('2018/04/04', 'yyyy/mm/dd'), TO_DATE('2018/04/04', 'yyyy/mm/dd'),
              TO_DATE('2018/04/05', 'yyyy/mm/dd'), '1', 'saleComplete', 500,'id40','ðèö¢');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(27, '«¹«ë«á«¤««', 'id01', TO_DATE('2018/04/05', 'yyyy/mm/dd'), TO_DATE('2018/04/05', 'yyyy/mm/dd'),
              TO_DATE('2018/04/06', 'yyyy/mm/dd'), '1', 'getComplete',800, 'id40','ðèö¢');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(28, '«¹«ë«á«¤««', 'id01', TO_DATE('2018/04/06', 'yyyy/mm/dd'), TO_DATE('2018/04/06', 'yyyy/mm/dd'),
              TO_DATE('2018/04/07', 'yyyy/mm/dd'), '1', 'refund', 800, 'id33','íþÐø');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(29, '«¹«ë«á«¤««', 'id01', TO_DATE('2018/02/11', 'yyyy/mm/dd'), TO_DATE('2018/02/11', 'yyyy/mm/dd'),
              TO_DATE('2018/02/12', 'yyyy/mm/dd'), '2', 'onSale',900, 'id40','ðèö¢');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(30, '«¹«ë«á«¤««', 'id01', TO_DATE('2018/02/12', 'yyyy/mm/dd'), TO_DATE('2018/02/12', 'yyyy/mm/dd'),
              TO_DATE('2018/02/13', 'yyyy/mm/dd'), '2', 'saleComplete', 1500,'id40','ðèö¢');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(31, '«¹«ë«á«¤««', 'id01', TO_DATE('2018/02/13', 'yyyy/mm/dd'), TO_DATE('2018/02/13', 'yyyy/mm/dd'),
              TO_DATE('2018/02/14', 'yyyy/mm/dd'), '2', 'getComplete', 1000, 'id33','íþÐø');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(32, '«¹«ë«á«¤««', 'id01', TO_DATE('2018/02/14', 'yyyy/mm/dd'), TO_DATE('2018/02/14', 'yyyy/mm/dd'),
              TO_DATE('2018/02/15', 'yyyy/mm/dd'), '2', 'refund',700, 'id33', 'íþÐø'); 
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(33, '«¹«ë«á«¤««', 'id01', TO_DATE('2018/08/01', 'yyyy/mm/dd'), TO_DATE('2018/08/01', 'yyyy/mm/dd'),
              TO_DATE('2018/08/02', 'yyyy/mm/dd'), '3', 'onSale', 1000, 'id33', 'íþÐø');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(34, '«¹«ë«á«¤««', 'id01', TO_DATE('2018/08/02', 'yyyy/mm/dd'), TO_DATE('2018/08/02', 'yyyy/mm/dd'),
              TO_DATE('2018/08/03', 'yyyy/mm/dd'), '3', 'saleComplete', 800,'id40', 'ðèö¢');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(35, '«¹«ë«á«¤««', 'id01', TO_DATE('2018/08/03', 'yyyy/mm/dd'), TO_DATE('2018/08/03', 'yyyy/mm/dd'),
              TO_DATE('2018/08/04', 'yyyy/mm/dd'), '3', 'getComplete',900, 'id33','íþÐø');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(36, '«¹«ë«á«¤««', 'id01', TO_DATE('2018/09/04', 'yyyy/mm/dd'), TO_DATE('2018/09/04', 'yyyy/mm/dd'),
              TO_DATE('2018/08/05', 'yyyy/mm/dd'), '3', 'refund',500, 'id33','íþÐø');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(37, 'ª¹ªºª­', 'id01', TO_DATE('2018/01/11', 'yyyy/mm/dd'), TO_DATE('2018/01/11', 'yyyy/mm/dd'),
              TO_DATE('2018/01/12', 'yyyy/mm/dd'), '1', 'onSale',1000, 'id34','ÓÞø¡');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(38, 'ª¹ªºª­', 'id01', TO_DATE('2018/01/12', 'yyyy/mm/dd'), TO_DATE('2018/01/12', 'yyyy/mm/dd'),
              TO_DATE('2018/01/13', 'yyyy/mm/dd'), '1', 'saleComplete', 900, 'id39','ÓÞø¡');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(39, 'ª¹ªºª­', 'id01', TO_DATE('2018/01/13', 'yyyy/mm/dd'), TO_DATE('2018/01/13', 'yyyy/mm/dd'),
              TO_DATE('2018/01/14', 'yyyy/mm/dd'), '1', 'getComplete', 500, 'id34', 'ÓÞø¡');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(40, 'ª¹ªºª­', 'id01', TO_DATE('2018/01/14', 'yyyy/mm/dd'), TO_DATE('2018/01/14', 'yyyy/mm/dd'),
              TO_DATE('2018/01/15', 'yyyy/mm/dd'), '1', 'refund', 800, 'id39','ÓÞø¡');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(41, 'ª¹ªºª­', 'id01', TO_DATE('2018/01/11', 'yyyy/mm/dd'), TO_DATE('2018/01/11', 'yyyy/mm/dd'),
              TO_DATE('2018/01/12', 'yyyy/mm/dd'), '2', 'onSale', 600, 'id39', 'ÓÞø¡');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(42, 'ª¹ªºª­', 'id01', TO_DATE('2018/01/12', 'yyyy/mm/dd'), TO_DATE('2018/01/12', 'yyyy/mm/dd'),
              TO_DATE('2018/01/13', 'yyyy/mm/dd'), '2', 'saleComplete',800, 'id39', 'ÓÞø¡');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(43, 'ª¹ªºª­', 'id01', TO_DATE('2018/01/13', 'yyyy/mm/dd'), TO_DATE('2018/01/13', 'yyyy/mm/dd'),
              TO_DATE('2018/01/14', 'yyyy/mm/dd'), '2', 'getComplete',1000, 'id34','ÓÞø¡');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(44, 'ª¹ªºª­', 'id01', TO_DATE('2018/01/14', 'yyyy/mm/dd'), TO_DATE('2018/01/14', 'yyyy/mm/dd'),
              TO_DATE('2018/01/15', 'yyyy/mm/dd'), '2', 'refund', 900, 'id34','ÓÞø¡');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(45, 'ª¹ªºª­', 'id01', TO_DATE('2018/07/22', 'yyyy/mm/dd'), TO_DATE('2018/07/22', 'yyyy/mm/dd'),
              TO_DATE('2018/07/23', 'yyyy/mm/dd'), '3', 'onSale',800, 'id40', 'ÓÞø¡');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(46, 'ª¹ªºª­', 'id01', TO_DATE('2018/07/23', 'yyyy/mm/dd'), TO_DATE('2018/07/23', 'yyyy/mm/dd'),
              TO_DATE('2018/07/24', 'yyyy/mm/dd'), '3', 'saleComplete', 500,'id34', 'ÓÞø¡');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(47, 'ª¹ªºª­', 'id01', TO_DATE('2018/07/24', 'yyyy/mm/dd'), TO_DATE('2018/07/24', 'yyyy/mm/dd'),
              TO_DATE('2018/07/25', 'yyyy/mm/dd'), '3', 'getComplete', 700, 'id39', 'ÓÞø¡');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(48, 'ª¹ªºª­', 'id01', TO_DATE('2018/07/25', 'yyyy/mm/dd'), TO_DATE('2018/07/25', 'yyyy/mm/dd'),
              TO_DATE('2018/07/26', 'yyyy/mm/dd'), '3', 'refund', 600, 'id39', 'ÓÞø¡'); 
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(49, '«¯«ë«Þ«¨«Ó', 'id01', TO_DATE('2018/03/11', 'yyyy/mm/dd'), TO_DATE('2018/03/11', 'yyyy/mm/dd'),
              TO_DATE('2018/03/12', 'yyyy/mm/dd'), '1', 'onSale', 1000, 'id34','ê¨Üâ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(50, '«¯«ë«Þ«¨«Ó', 'id01', TO_DATE('2018/03/12', 'yyyy/mm/dd'), TO_DATE('2018/03/12', 'yyyy/mm/dd'),
              TO_DATE('2018/03/12', 'yyyy/mm/dd'), '1', 'saleComplete', 1000, 'id35','ê¨Üâ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(51, '«¯«ë«Þ«¨«Ó', 'id01', TO_DATE('2018/03/13', 'yyyy/mm/dd'), TO_DATE('2018/03/13', 'yyyy/mm/dd'),
              TO_DATE('2018/03/14', 'yyyy/mm/dd'), '1', 'getComplete', 1000, 'id34', 'ê¨Üâ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(52, '«¯«ë«Þ«¨«Ó', 'id01', TO_DATE('2018/03/14', 'yyyy/mm/dd'), TO_DATE('2018/03/14', 'yyyy/mm/dd'),
              TO_DATE('2018/03/15', 'yyyy/mm/dd'), '1', 'refund',700, 'id35', 'ê¨Üâ'); 
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(53, '«¯«ë«Þ«¨«Ó', 'id01', TO_DATE('2018/01/11', 'yyyy/mm/dd'), TO_DATE('2018/01/11', 'yyyy/mm/dd'),
              TO_DATE('2018/01/12', 'yyyy/mm/dd'), '2', 'onSale', 800, 'id35', 'ê¨Üâ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(54, '«¯«ë«Þ«¨«Ó', 'id01', TO_DATE('2018/01/12', 'yyyy/mm/dd'), TO_DATE('2018/01/12', 'yyyy/mm/dd'),
              TO_DATE('2018/01/13', 'yyyy/mm/dd'), '2', 'saleComplete', 1000,'id34','ê¨Üâ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(55, '«¯«ë«Þ«¨«Ó', 'id01', TO_DATE('2018/01/13', 'yyyy/mm/dd'), TO_DATE('2018/01/13', 'yyyy/mm/dd'),
              TO_DATE('2018/01/14', 'yyyy/mm/dd'), '2', 'getComplete', 600, 'id35','ê¨Üâ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(56, '«¯«ë«Þ«¨«Ó', 'id01', TO_DATE('2018/01/14', 'yyyy/mm/dd'), TO_DATE('2018/01/14', 'yyyy/mm/dd'),
              TO_DATE('2018/01/15', 'yyyy/mm/dd'), '2', 'refund', 500, 'id34', 'ê¨Üâ');     
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(57, '«¯«ë«Þ«¨«Ó', 'id01', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '3', 'onSale', 1000,'id34', 'ê¨Üâ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(58, '«¯«ë«Þ«¨«Ó', 'id01', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '3', 'saleComplete',600, 'id35', 'ê¨Üâ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(59, '«¯«ë«Þ«¨«Ó', 'id01', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '3', 'getComplete', 800,'id34','ê¨Üâ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(60, '«¯«ë«Þ«¨«Ó', 'id01', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '3', 'refund', 1000, 'id35', 'ê¨Üâ');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(61, 'ª¹ªºª­', 'id02', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '1', 'onSale', 700, 'id34', 'ÓÞø¡');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(62, 'ª¹ªºª­', 'id02', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '1', 'saleComplete',1000, 'id39','ÓÞø¡');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(63, 'ª¹ªºª­', 'id02', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '1', 'getComplete', 700,'id40','ÓÞø¡');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(64, 'ª¹ªºª­', 'id02', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '1', 'refund', 800, 'id34','ÓÞø¡');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(65, 'ª¹ªºª­', 'id02', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '2', 'onSale',700, 'id39', 'ÓÞø¡');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId, location) 
              values(66, 'ª¹ªºª­', 'id02', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '2', 'saleComplete',800, 'id40','ÓÞø¡');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(67, 'ª¹ªºª­', 'id02', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '2', 'getComplete',500, 'id34','ÓÞø¡');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(68, 'ª¹ªºª­', 'id02', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '2', 'refund', 900,'id39','ÓÞø¡');    
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(69, 'ª¹ªºª­', 'id02', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '3', 'onSale',500, 'id40','ÓÞø¡');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(70, 'ª¹ªºª­', 'id02', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '3', 'saleComplete', 700,'id34','ÓÞø¡');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(71, 'ª¹ªºª­', 'id02', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '3', 'getComplete',1000, 'id39','ÓÞø¡');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(72, 'ª¹ªºª­', 'id02', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '3', 'refund', 800,'id40','ÓÞø¡');

insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(73, '«¯«ë«Þ«¨«Ó', 'id03', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '1', 'onSale', 500, 'id34', 'ê¨Üâ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(74, '«¯«ë«Þ«¨«Ó', 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '1', 'saleComplete', 1000, 'id35','ê¨Üâ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(75, '«¯«ë«Þ«¨«Ó', 'id03', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '1', 'getComplete', 600, 'id34', 'ê¨Üâ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(76, '«¯«ë«Þ«¨«Ó', 'id03', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '1', 'refund',500, 'id35', 'ê¨Üâ');

insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(77, '«¯«ë«Þ«¨«Ó', 'id03', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '2', 'onSale',1000, 'id35','ê¨Üâ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(78, '«¯«ë«Þ«¨«Ó', 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '2', 'saleComplete', 600,'id34','ê¨Üâ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(79, '«¯«ë«Þ«¨«Ó', 'id03', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '2', 'getComplete', 500, 'id35','ê¨Üâ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(80, '«¯«ë«Þ«¨«Ó', 'id03', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '2', 'refund',1000, 'id34','ê¨Üâ');

insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(81, '«¯«ë«Þ«¨«Ó', 'id03', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '3', 'onSale', 800,'id35','ê¨Üâ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(82, '«¯«ë«Þ«¨«Ó', 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '3', 'saleComplete',500, 'id34','ê¨Üâ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(83, '«¯«ë«Þ«¨«Ó', 'id03', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '3', 'getComplete',1000, 'id35','ê¨Üâ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(84, '«¯«ë«Þ«¨«Ó', 'id03', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '3', 'refund', 900, 'id34','ê¨Üâ');               

insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(85, '«¤«»«¨«Ó', 'id03', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '1', 'onSale', 1000, 'id35','ô¶ç¨');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(86, '«¤«»«¨«Ó', 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '1', 'saleComplete', 900,'id39','ô¶ç¨');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(87, '«¤«»«¨«Ó', 'id03', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '1', 'getComplete', 1000,'id35','ô¶ç¨');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(88, '«¤«»«¨«Ó', 'id03', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '1', 'refund', 900,'id39','ô¶ç¨');

insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(89, '«¤«»«¨«Ó', 'id03', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '2', 'onSale', 600, 'id39','ô¶ç¨');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(90, '«¤«»«¨«Ó', 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '2', 'saleComplete',1000, 'id35','ô¶ç¨');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(91, '«¤«»«¨«Ó', 'id03', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '2', 'getComplete', 900,'id39','ô¶ç¨');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(92, '«¤«»«¨«Ó', 'id03', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '2', 'refund',500, 'id35','ô¶ç¨');                 

insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(93, '«¤«»«¨«Ó', 'id03', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '3', 'onSale', 1000,'id35','ô¶ç¨');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(94, '«¤«»«¨«Ó', 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '3', 'saleComplete', 600,'id39','ô¶ç¨');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId,location) 
              values(95, '«¤«»«¨«Ó', 'id03', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '3', 'getComplete', 800,'id35','ô¶ç¨');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(96, '«¤«»«¨«Ó', 'id03', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '3', 'refund', 900,'id39','ô¶ç¨'); 
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId,location) 
              values(97, '«¯«Þ«¨«Ó', 'id03', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '1', 'onSale', 1000, 'id35','ûúÊ°ß£');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(98, '«¯«Þ«¨«Ó', 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '1', 'saleComplete', 800, 'id39','ûúÊ°ß£');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(99, '«¯«Þ«¨«Ó', 'id03', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '1', 'getComplete',500, 'id39','ûúÊ°ß£');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(100, '«¯«Þ«¨«Ó', 'id03', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '1', 'refund',400, 'id35','ûúÊ°ß£');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(101, '«¯«Þ«¨«Ó', 'id03', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '2', 'onSale', 1000,'id39','ûúÊ°ß£');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(102, '«¯«Þ«¨«Ó', 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '2', 'saleComplete', 700, 'id39','ûúÊ°ß£');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId,location) 
              values(103, '«¯«Þ«¨«Ó', 'id03', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '2', 'getComplete',500, 'id35','ûúÊ°ß£');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(104, '«¯«Þ«¨«Ó', 'id03', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '2', 'refund', 1000, 'id35','ûúÊ°ß£');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(105, '«¯«Þ«¨«Ó', 'id03', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '3', 'onSale', 900,'id35','ûúÊ°ß£');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(106, '«¯«Þ«¨«Ó', 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '3', 'saleComplete', 600,'id39','ûúÊ°ß£');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(107, '«¯«Þ«¨«Ó', 'id03', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '3', 'getComplete', 1000,'id35','ûúÊ°ß£');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(108, '«¯«Þ«¨«Ó', 'id03', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '3', 'refund',700, 'id39','ûúÊ°ß£');

insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price,successSellerId,location) 
              values(109, '«Þ«µ«Ð', 'id04', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '1', 'onSale', 1000, 'id36', 'ãæà³');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(110, '«Þ«µ«Ð', 'id04', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '1', 'saleComplete', 700,'id38','ãæà³');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(111, '«Þ«µ«Ð', 'id04', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '1', 'getComplete', 600, 'id40','ãæà³');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(112, '«Þ«µ«Ð', 'id04', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '1', 'refund',1000, 'id36','ãæà³');  
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(113, '«Þ«µ«Ð', 'id04', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '2', 'onSale', 700,'id38','ãæà³');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(114, '«Þ«µ«Ð', 'id04', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '2', 'saleComplete', 1000,'id40','ãæà³');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(115, '«Þ«µ«Ð', 'id04', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '2', 'getComplete', 600, 'id36','ãæà³');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(116, '«Þ«µ«Ð', 'id04', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '2', 'refund',800, 'id38','ãæà³');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(117, '«Þ«µ«Ð', 'id04', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '3', 'onSale', 1000, 'id40','ãæà³');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(118, '«Þ«µ«Ð', 'id04', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '3', 'saleComplete', 500, 'id36', 'ãæà³');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(119, '«Þ«µ«Ð', 'id04', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '3', 'getComplete', 800, 'id38', 'ãæà³');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(120, '«Þ«µ«Ð', 'id04', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '3', 'refund', 800, 'id40', 'ãæà³');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(121, '«­«À«¤', 'id05', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '1', 'onSale',1000, 'id37', 'ÓöÐÆ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(122, '«­«À«¤', 'id05', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '1', 'saleComplete', 800, 'id38','ÓöÐÆ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(123, '«­«À«¤', 'id05', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '1', 'getComplete',1000, 'id39','ÓöÐÆ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(124, '«­«À«¤', 'id05', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '1', 'refund', 800, 'id37', 'ÓöÐÆ');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(125, '«­«À«¤', 'id05', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '2', 'onSale',1000, 'id38', 'ÓöÐÆ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(126, '«­«À«¤', 'id05', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '2', 'saleComplete', 500,'id39', 'ÓöÐÆ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(127, '«­«À«¤', 'id05', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '2', 'getComplete', 800,'id37','ÓöÐÆ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(128, '«­«À«¤', 'id05', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '2', 'refund', 800,'id38','ÓöÐÆ');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(129, '«­«À«¤', 'id05', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '3', 'onSale', 1000, 'id39', 'ÓöÐÆ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(130, '«­«À«¤', 'id05', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '3', 'saleComplete', 800,'id37', 'ÓöÐÆ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(131, '«­«À«¤', 'id05', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '3', 'getComplete', 600, 'id38', 'ÓöÐÆ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(132, '«­«À«¤', 'id05', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '3', 'refund', 1000, 'id39', 'ÓöÐÆ');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(133, '«­«ó«á«À«¤', 'id05', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '1', 'onSale', 1000, 'id35','ãêÒ¯ô¹');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(134, '«­«ó«á«À«¤', 'id05', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '1', 'saleComplete', 500, 'id35','ãêÒ¯ô¹');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(135, '«­«ó«á«À«¤', 'id05', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '1', 'getComplete', 700,'id35','ãêÒ¯ô¹');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(136, '«­«ó«á«À«¤', 'id05', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '1', 'refund', 800, 'id35','ãêÒ¯ô¹');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(137, '«­«ó«á«À«¤', 'id05', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '2', 'onSale', 500, 'id35','ãêÒ¯ô¹');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(138, '«­«ó«á«À«¤', 'id05', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '2', 'saleComplete', 800, 'id35', 'ãêÒ¯ô¹');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(139, '«­«ó«á«À«¤', 'id05', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '2', 'getComplete', 1000, 'id35','ãêÒ¯ô¹');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(140, '«­«ó«á«À«¤', 'id05', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '2', 'refund', 700, 'id35', 'ãêÒ¯ô¹');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(141, '«­«ó«á«À«¤', 'id05', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '3', 'onSale', 1000,'id35', 'ãêÒ¯ô¹');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(142, '«­«ó«á«À«¤', 'id05', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '3', 'saleComplete',800, 'id35', 'ãêÒ¯ô¹');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(143, '«­«ó«á«À«¤', 'id05', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '3', 'getComplete', 900, 'id35', 'ãêÒ¯ô¹');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(144, '«­«ó«á«À«¤', 'id05', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '3', 'refund', 1000, 'id35', 'ãêÒ¯ô¹');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(145, '«¤«Ü«À«¤', 'id05', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '1', 'onSale', 500, 'id37','ÌÈÔ´');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(146, '«¤«Ü«À«¤', 'id05', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '1', 'saleComplete',800,  'id38', 'ÌÈÔ´');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(147, '«¤«Ü«À«¤', 'id05', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '1', 'getComplete', 1000,'id40', 'ÌÈÔ´');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(148, '«¤«Ü«À«¤', 'id05', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '1', 'refund', 500,'id37','ÌÈÔ´');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(149, '«¤«Ü«À«¤', 'id05', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '2', 'onSale', 700, 'id38', 'ÌÈÔ´');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(150, '«¤«Ü«À«¤', 'id05', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '2', 'saleComplete', 700, 'id40', 'ÌÈÔ´');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(151, '«¤«Ü«À«¤', 'id05', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '2', 'getComplete', 1000, 'id37', 'ÌÈÔ´');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(152, '«¤«Ü«À«¤', 'id05', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '2', 'refund', 2000, 'id38', 'ÌÈÔ´');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(153, '«¤«Ü«À«¤', 'id05', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '3', 'onSale', 1300, 'id40','ÌÈÔ´');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(154, '«¤«Ü«À«¤', 'id05', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '3', 'saleComplete', 700, 'id40', 'ÌÈÔ´');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(155, '«¤«Ü«À«¤', 'id05', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '3', 'getComplete', 2000, 'id38','ÌÈÔ´');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(156, '«¤«Ü«À«¤', 'id05', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '3', 'refund', 1000, 'id40','ÌÈÔ´');   
---------------------------------------------------------buyList-------------------------------------------------------------------------------------
create table wishList(
wishNum number primary key,
id varchar2(50),
wish varchar2(50),
CONSTRAINT fk_wishList_wish FOREIGN KEY(wish) REFERENCES fishList(fishName),
CONSTRAINT fk_wishList_id FOREIGN KEY(id) REFERENCES memberinfo(id)
);

insert into wishList(wishNum,id,wish)values(1,'id01','«¸«ó«É«¦«¤««');
insert into wishList(wishNum,id,wish)values(2,'id01','«Û«¿«ë«¤««');
insert into wishList(wishNum,id,wish)values(3,'id01','«¹«ë«á«¤««');
insert into wishList(wishNum,id,wish)values(4,'id01','ª¹ªºª­');
insert into wishList(wishNum,id,wish)values(40,'id01','«¯«ë«Þ«¨«Ó');
/*±¸¸ÅÀÚ 1*/
insert into wishList(wishNum,id,wish)values(5,'id02','ª¹ªºª­');
/*±¸¸ÅÀÚ 2*/
insert into wishList(wishNum,id,wish)values(6,'id03','«¯«ë«Þ«¨«Ó');
insert into wishList(wishNum,id,wish)values(7,'id03','«¤«»«¨«Ó');
insert into wishList(wishNum,id,wish)values(8,'id03','«¯«Þ«¨«Ó');
/*±¸¸ÅÀÚ 3*/
insert into wishList(wishNum,id,wish)values(9,'id04','«Þ«µ«Ð');
/*±¸¸ÅÀÚ 4*/
insert into wishList(wishNum,id,wish)values(10,'id05','«­«À«¤');
insert into wishList(wishNum,id,wish)values(11,'id05','«­«ó«á«À«¤');
insert into wishList(wishNum,id,wish)values(12,'id05','«¤«Ü«À«¤');
/*±¸¸ÅÀÚ 5*/



insert into wishList(wishNum,id,wish)values(13,'id33','«¸«ó«É«¦«¤««');
insert into wishList(wishNum,id,wish)values(14,'id33','«Û«¿«ë«¤««');
insert into wishList(wishNum,id,wish)values(15,'id33','«¹«ë«á«¤««');
/*ÆÇ¸ÅÀÚ 1*/
insert into wishList(wishNum,id,wish)values(16,'id34','«¯«ë«Þ«¨«Ó');
insert into wishList(wishNum,id,wish)values(17,'id34','ª¹ªºª­');
/*ÆÇ¸ÅÀÚ 2*/
insert into wishList(wishNum,id,wish)values(18,'id35','«¯«ë«Þ«¨«Ó');
insert into wishList(wishNum,id,wish)values(19,'id35','«¤«»«¨«Ó');
insert into wishList(wishNum,id,wish)values(20,'id35','«¯«Þ«¨«Ó');
insert into wishList(wishNum,id,wish)values(21,'id35','«­«ó«á«À«¤');
/*ÆÇ¸ÅÀÚ 3*/
insert into wishList(wishNum,id,wish)values(22,'id36','«Þ«µ«Ð');
/*ÆÇ¸ÅÀÚ 4*/
insert into wishList(wishNum,id,wish)values(23,'id37','«­«À«¤');
insert into wishList(wishNum,id,wish)values(24,'id37','«¤«Ü«À«¤');
/*ÆÇ¸ÅÀÚ 5*/

insert into wishList(wishNum,id,wish)values(25,'id38','«¸«ó«É«¦«¤««');
insert into wishList(wishNum,id,wish)values(26,'id38','«¯«Þ«¨«Ó');
insert into wishList(wishNum,id,wish)values(27,'id38','«Þ«µ«Ð');
insert into wishList(wishNum,id,wish)values(28,'id38','«¤«Ü«À«¤');
insert into wishList(wishNum,id,wish)values(29,'id38','«­«À«¤');
/*ÆÇ¸ÅÀÚ 6. ¿ì¼±¼øÀ§ Å×ÀÌºí ÀÛ¼ºÀ» À§ÇØ µµÁß ÆÇ¸ÅÀÚ 3¸í Ãß°¡(´Ü, ÀÔÂûÇß´Âµ¥ ÇÏ³ªµµ ÆÈÁö ¸øÇÔ)*/
insert into wishList(wishNum,id,wish)values(30,'id39','«Û«¿«ë«¤««');
insert into wishList(wishNum,id,wish)values(31,'id39','«¤«»«¨«Ó');
insert into wishList(wishNum,id,wish)values(32,'id39','«­«À«¤');
insert into wishList(wishNum,id,wish)values(33,'id39','ª¹ªºª­');
insert into wishList(wishNum,id,wish)values(34,'id39','«¸«ó«É«¦«¤««');
/*ÆÇ¸ÅÀÚ 7*/
insert into wishList(wishNum,id,wish)values(35,'id40','«¹«ë«á«¤««');
insert into wishList(wishNum,id,wish)values(36,'id40','ª¹ªºª­');
insert into wishList(wishNum,id,wish)values(37,'id40','«¤«Ü«À«¤');
insert into wishList(wishNum,id,wish)values(38,'id40','«Þ«µ«Ð');
insert into wishList(wishNum,id,wish)values(39,'id40','«Û«¿«ë«¤««');
/*ÆÇ¸ÅÀÚ 8*/
----------------------------------wishList--------------------------------------wishList-----------------------------------------------------------wishList
create table review(
reviewNum number primary key,
buyNum number,
star number,
sellerId varchar2(50),
reviewComment varchar2(1000),
CONSTRAINT fk_review_buynum FOREIGN KEY(buyNum) REFERENCES buyList(buyNum) ON DELETE CASCADE,
CONSTRAINT fk_review_sellerId FOREIGN KEY(sellerId) REFERENCES memberinfo(id) ON DELETE CASCADE
);

insert into review(reviewNum,buyNum,star,sellerId, reviewComment) 
        values(1, 1 , 5 , 'id33', 'aaa'); 
insert into review(reviewNum,buyNum,star,sellerId, reviewComment) 
        values(2, 2 , 5 , 'id33', 'bbb');  
insert into review(reviewNum,buyNum,star,sellerId, reviewComment) 
        values(3, 3 , 5 , 'id33', 'ccc');  
insert into review(reviewNum,buyNum,star,sellerId, reviewComment) 
        values(4, 4 , 5 , 'id33', 'ddd');   
insert into review(reviewNum,buyNum,star,sellerId, reviewComment) 
        values(5, 5 , 5 , 'id33', 'eee');
--------------------------review--------------------------------------review--------------------------------------------------------------review
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

insert into notice(noticeNum, id, writeBoardDate, updateBoardDate, title, content, hitcount)
            values(1,'id00', TO_DATE('2018/09/16', 'yyyy/mm/dd'), TO_DATE('2018/09/17', 'yyyy/mm/dd'), 'aaa', 'bbb', 11);
insert into notice(noticeNum, id, writeBoardDate, updateBoardDate, title, content, hitcount)
            values(2,'id00', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'), 'bbb', 'bbb', 22); 
insert into notice(noticeNum, id, writeBoardDate, updateBoardDate, title, content, hitcount)
            values(3,'id00', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'), 'ccc', 'bbb', 444); 
insert into notice(noticeNum, id, writeBoardDate, updateBoardDate, title, content, hitcount)
            values(4,'id00', TO_DATE('2018/09/15', 'yyyy/mm/dd'), TO_DATE('2018/09/16', 'yyyy/mm/dd'), 'ddd', 'bbb', 33);  
insert into notice(noticeNum, id, writeBoardDate, updateBoardDate, title, content, hitcount)
            values(5,'id00', TO_DATE('2018/09/16', 'yyyy/mm/dd'), TO_DATE('2018/09/17', 'yyyy/mm/dd'), 'aaa', 'bbb', 11);   
-----------------------------------notice-----------------------------------------notice-----------------------------------------notice
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

insert into QnA(qnaNum,id,writeBoardDate,updateBoardDate,title,content,hitcount) 
        values(1, 'id01', TO_DATE('2018/09/16', 'yyyy/mm/dd'), TO_DATE('2018/09/17', 'yyyy/mm/dd'),'bbb', 'aaa', 1); 

insert into QnA(qnaNum,id,writeBoardDate,updateBoardDate,title,content,hitcount) 
        values(2, 'id02', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/15', 'yyyy/mm/dd'),'ccc', 'aaa', 1); 
        
insert into QnA(qnaNum,id,writeBoardDate,updateBoardDate,title,content,hitcount) 
        values(3, 'id01', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),'ddd', 'aaa', 1); 
        
insert into QnA(qnaNum,id,writeBoardDate,updateBoardDate,title,content,hitcount) 
        values(4, 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),'eee', 'aaa', 1);  
        
insert into QnA(qnaNum,id,writeBoardDate,updateBoardDate,title,content,hitcount) 
        values(5, 'id01', TO_DATE('2018/09/17', 'yyyy/mm/dd'), TO_DATE('2018/09/18', 'yyyy/mm/dd'),'fff', 'aaa', 1); 
insert into QnA(qnaNum,id,writeBoardDate,updateBoardDate,title,content,hitcount) 
        values(6, 'id01', TO_DATE('2018/09/17', 'yyyy/mm/dd'), TO_DATE('2018/09/18', 'yyyy/mm/dd'),'fff', 'aaa', 1);
------------------------------QnA--------------------------------QnA---------------------------------QnA--------------------------------QnA
create table QnAreply(
replyNum number primary key,
qnaNum number,
id varchar2(50),
replyContent varchar2(100),
replyRegdate date,
CONSTRAINT fk_QnAreply_num FOREIGN KEY(qnaNum) REFERENCES QnA(qnaNum),
CONSTRAINT fk_QnAreply_id FOREIGN KEY(id) REFERENCES memberinfo(id) 
);

insert into QnAreply(replyNum, qnaNum, id, replyContent, replyRegdate) 
        values(1, 1, 'id00', 'bbb', TO_DATE('2018/09/10', 'yyyy/mm/dd') );
insert into QnAreply(replyNum, qnaNum, id, replyContent, replyRegdate) 
        values(2, 2, 'id00', 'bbb', TO_DATE('2018/09/11', 'yyyy/mm/dd') );  
insert into QnAreply(replyNum, qnaNum, id, replyContent, replyRegdate) 
        values(3, 3, 'id00', 'bbb', TO_DATE('2018/09/12', 'yyyy/mm/dd') ); 
insert into QnAreply(replyNum, qnaNum, id, replyContent, replyRegdate) 
        values(4, 4, 'id00', 'bbb', TO_DATE('2018/09/13', 'yyyy/mm/dd') ); 
insert into QnAreply(replyNum, qnaNum, id, replyContent, replyRegdate) 
        values(5, 5, 'id00', 'bbb', TO_DATE('2018/09/14', 'yyyy/mm/dd') );
----------------------------------QnAreply----------------------------------QnAreply--------------------------------------QnAreply
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

insert into FAQ(FAQNum, id, writeBoardDate, updateBoardDate, title, content, hitcount) 
        values(1, 'id00', TO_DATE('2018/09/10', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'), 'aaa', 'bbb', 11);
insert into FAQ(FAQNum, id, writeBoardDate, updateBoardDate, title, content, hitcount) 
        values(2, 'id00', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'), 'aaa', 'bbb', 22);
insert into FAQ(FAQNum, id, writeBoardDate, updateBoardDate, title, content, hitcount) 
        values(3, 'id00', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'), 'aaa', 'bbb', 44); 
insert into FAQ(FAQNum, id, writeBoardDate, updateBoardDate, title, content, hitcount) 
        values(4, 'id00', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'), 'aaa', 'bbb', 33); 
insert into FAQ(FAQNum, id, writeBoardDate, updateBoardDate, title, content, hitcount) 
        values(5, 'id00', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/15', 'yyyy/mm/dd'), 'aaa', 'bbb', 88);
-------------------------FAQ---------------------------------------FAQ----------------------------------------------------------FAQ
create table WeekAvgList(
AvgListNum varchar2(50) primary key,
fishName varchar2(50),
avgPrice int,
dates date
);

insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¸«ó«É«¦«¤««', '1000', TO_DATE('2018/09/16', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«Û«¿«ë«¤««', '800', TO_DATE('2018/09/16', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¹«ë«á«¤««', '900', TO_DATE('2018/09/16', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'ª¹ªºª­', '1000', TO_DATE('2018/09/16', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¯«ë«Þ«¨«Ó', '500', TO_DATE('2018/09/16', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¤«»«¨«Ó', '600', TO_DATE('2018/09/16', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¯«Þ«¨«Ó', '400', TO_DATE('2018/09/16', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«Þ«µ«Ð', '1000', TO_DATE('2018/09/16', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«­«À«¤', '800', TO_DATE('2018/09/16', 'yyyy/mm/dd'));  
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«­«ó«á«À«¤', '500', TO_DATE('2018/09/16', 'yyyy/mm/dd'));
    

insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¸«ó«É«¦«¤««', '1500', TO_DATE('2018/09/15', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«Û«¿«ë«¤««', '300', TO_DATE('2018/09/15', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¹«ë«á«¤««', '1400', TO_DATE('2018/09/15', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'ª¹ªºª­', '500', TO_DATE('2018/09/15', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¯«ë«Þ«¨«Ó', '1000', TO_DATE('2018/09/15', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¤«»«¨«Ó', '1100', TO_DATE('2018/09/15', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¯«Þ«¨«Ó', '900', TO_DATE('2018/09/15', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«Þ«µ«Ð', '1500', TO_DATE('2018/09/15', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«­«À«¤', '1300', TO_DATE('2018/09/15', 'yyyy/mm/dd'));  
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«­«ó«á«À«¤', '1000', TO_DATE('2018/09/15', 'yyyy/mm/dd'));
    

insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¸«ó«É«¦«¤««', '2000', TO_DATE('2018/09/14', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«Û«¿«ë«¤««', '1300', TO_DATE('2018/09/14', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¹«ë«á«¤««', '1400', TO_DATE('2018/09/14', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'ª¹ªºª­', '1500', TO_DATE('2018/09/14', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¯«ë«Þ«¨«Ó', '1000', TO_DATE('2018/09/14', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¤«»«¨«Ó', '1100', TO_DATE('2018/09/14', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¯«Þ«¨«Ó', '900', TO_DATE('2018/09/14', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«Þ«µ«Ð', '500', TO_DATE('2018/09/14', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«­«À«¤', '300', TO_DATE('2018/09/14', 'yyyy/mm/dd'));  
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«­«ó«á«À«¤', '1000', TO_DATE('2018/09/14', 'yyyy/mm/dd'));
    

insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¸«ó«É«¦«¤««', '2500', TO_DATE('2018/09/13', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«Û«¿«ë«¤««', '1800', TO_DATE('2018/09/13', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¹«ë«á«¤««', '900', TO_DATE('2018/09/13', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'ª¹ªºª­', '2000', TO_DATE('2018/09/13', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¯«ë«Þ«¨«Ó', '500', TO_DATE('2018/09/13', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¤«»«¨«Ó', '1600', TO_DATE('2018/09/13', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¯«Þ«¨«Ó', '1400', TO_DATE('2018/09/13', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«Þ«µ«Ð', '1200', TO_DATE('2018/09/13', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«­«À«¤', '800', TO_DATE('2018/09/13', 'yyyy/mm/dd'));  
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«­«ó«á«À«¤', '1400', TO_DATE('2018/09/13', 'yyyy/mm/dd'));
    

insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¸«ó«É«¦«¤««', '2000', TO_DATE('2018/09/12', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«Û«¿«ë«¤««', '1300', TO_DATE('2018/09/12', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¹«ë«á«¤««', '1400', TO_DATE('2018/09/12', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'ª¹ªºª­', '2500', TO_DATE('2018/09/12', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¯«ë«Þ«¨«Ó', '1000', TO_DATE('2018/09/12', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¤«»«¨«Ó', '2200', TO_DATE('2018/09/12', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¯«Þ«¨«Ó', '1900', TO_DATE('2018/09/12', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«Þ«µ«Ð', '1700', TO_DATE('2018/09/12', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«­«À«¤', '1300', TO_DATE('2018/09/12', 'yyyy/mm/dd'));  
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«­«ó«á«À«¤', '1900', TO_DATE('2018/09/12', 'yyyy/mm/dd'));
    

insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¸«ó«É«¦«¤««', '2500', TO_DATE('2018/09/11', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«Û«¿«ë«¤««', '1800', TO_DATE('2018/09/11', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¹«ë«á«¤««', '1900', TO_DATE('2018/09/11', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'ª¹ªºª­', '3000', TO_DATE('2018/09/11', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¯«ë«Þ«¨«Ó', '1500', TO_DATE('2018/09/11', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¤«»«¨«Ó', '2700', TO_DATE('2018/09/11', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¯«Þ«¨«Ó', '2600', TO_DATE('2018/09/11', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«Þ«µ«Ð', '2300', TO_DATE('2018/09/11', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«­«À«¤', '1800', TO_DATE('2018/09/11', 'yyyy/mm/dd'));  
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«­«ó«á«À«¤', '2400', TO_DATE('2018/09/11', 'yyyy/mm/dd'));
    

insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¸«ó«É«¦«¤««', '2000', TO_DATE('2018/09/10', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«Û«¿«ë«¤««', '1300', TO_DATE('2018/09/10', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¹«ë«á«¤««', '2400', TO_DATE('2018/09/10', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'ª¹ªºª­', '3500', TO_DATE('2018/09/10', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¯«ë«Þ«¨«Ó', '1000', TO_DATE('2018/09/10', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¤«»«¨«Ó', '2200', TO_DATE('2018/09/10', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«¯«Þ«¨«Ó', '3100', TO_DATE('2018/09/10', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«Þ«µ«Ð', '2800', TO_DATE('2018/09/10', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«­«À«¤', '1300', TO_DATE('2018/09/10', 'yyyy/mm/dd'));  
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'«­«ó«á«À«¤', '1900', TO_DATE('2018/09/10', 'yyyy/mm/dd'));
--------------------------------WEEKAVGLIST--------------------------------WEEKAVGLIST-----------------------------------------WEEKAVGLIST
create table priorityList(
priorityNum number primary key,
buyNum number,
priorityId varchar2(50),
CONSTRAINT fk_priorityList_buynum FOREIGN KEY(buyNum) REFERENCES buyList(buyNum) ON DELETE CASCADE,
CONSTRAINT fk_priorityList_id FOREIGN KEY(priorityId) REFERENCES memberinfo(id) ON DELETE CASCADE
);
/*buyNum 1¹ø ¹«°Ô1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(1,1,'id33');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(2,1,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(3,1,'id39');
/*¹«°Ô2*/                    
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(4,5,'id33');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(5,5,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(6,5,'id39');
/*¹«°Ô3*/                    
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(7,9,'id33');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(8,9,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(9,9,'id39');
                    
/*buyNum 13¹ø ¹«°Ô1*/                    
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(10,13,'id33');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(11,13,'id39');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(12,13,'id40');
/*¹«°Ô2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(13,17,'id33');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(14,17,'id39');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(15,17,'id40');
/*¹«°Ô3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(16,21,'id33');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(17,21,'id39');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(18,21,'id40');
                    
/*buyNum 25¹ø ¹«°Ô1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(19,25,'id33');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(20,25,'id40');
/*¹«°Ô2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(21,29,'id33');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(22,29,'id40');
/*¹«°Ô3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(23,33,'id33');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(24,33,'id40');

/*buyNum 37¹ø ¹«°Ô1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(25,37,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(26,37,'id39');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(27,37,'id40');
/*¹«°Ô2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(28,41,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(29,41,'id39');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(30,41,'id40');
/*¹«°Ô3*/   
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(31,45,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(32,45,'id39');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(33,45,'id40');
                    
/*buyNum 49¹ø ¹«°Ô1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(34,49,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(35,49,'id35');
/*¹«°Ô2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(36,53,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(37,53,'id35');
/*¹«°Ô3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(38,57,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(39,57,'id35');
                    
/*buyNum 61¹ø ¹«°Ô1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(40,61,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(41,61,'id39');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(42,61,'id40');
/*¹«°Ô2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(43,65,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(44,65,'id39');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(45,65,'id40');
/*¹«°Ô3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(46,69,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(47,69,'id39');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(48,69,'id40');
                    
/*buyNum 73¹ø ¹«°Ô1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(49,73,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(50,73,'id35');
/*¹«°Ô2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(51,77,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(52,77,'id35');
/*¹«°Ô3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(53,81,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(54,81,'id35');

/*buyNum 85¹ø ¹«°Ô1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(55,85,'id35');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(56,85,'id39');
/*¹«°Ô2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(57,89,'id35');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(58,89,'id39');
/*¹«°Ô3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(59,93,'id35');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(60,93,'id39');

/*buyNum 97¹ø ¹«°Ô1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(61,97,'id35');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(62,97,'id38');
/*¹«°Ô2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(63,101,'id35');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(64,101,'id38');
/*¹«°Ô3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(65,105,'id35');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(66,105,'id38');
                    
/*buyNum 109¹ø ¹«°Ô1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(67,109,'id36');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(68,109,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(69,109,'id40');
/*¹«°Ô2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(70,113,'id36');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(71,113,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(72,113,'id40');
/*¹«°Ô3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(73,117,'id36');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(74,117,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(75,117,'id40');
                    
/*buyNum 121¹ø ¹«°Ô1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(76,121,'id37');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(77,121,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(78,121,'id39');
/*¹«°Ô2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(79,125,'id37');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(80,125,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(81,125,'id39');
/*¹«°Ô3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(82,129,'id37');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(83,129,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(84,129,'id39');
                    
/*buyNum 133¹ø ¹«°Ô1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(85,133,'id35');
/*¹«°Ô2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(86,137,'id35');
/*¹«°Ô3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(87,141,'id35');

/*buyNum 145¹ø ¹«°Ô1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(88,145,'id37');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(89,145,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(90,145,'id40');
/*¹«°Ô2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(91,149,'id37');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(92,149,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(93,149,'id40');
/*¹«°Ô3*/  
----------------------------------------priorityList----------------------------------priorityList------------------------------priorityList
/*--ÆÇ¸Å¸ñ·Ï-- */
create table saleList(
saleNum number primary key,
buyNum number,
sellerId varchar2(50),
CONSTRAINT fk_saleList_buynum FOREIGN KEY(buyNum) REFERENCES buyList(buyNum) ON DELETE CASCADE,
CONSTRAINT fk_saleList_sellerId FOREIGN KEY(sellerId) REFERENCES memberinfo(id) ON DELETE CASCADE
);


insert into saleList(saleNum, buyNum, sellerId) 
              values(1,1,'id33');
insert into saleList(saleNum, buyNum, sellerId) 
              values(2,2,'id38');
insert into saleList(saleNum, buyNum, sellerId) 
              values(3,3,'id39');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(4,4,'id33');
insert into saleList(saleNum, buyNum, sellerId) 
              values(5,5,'id38');
insert into saleList(saleNum, buyNum, sellerId) 
              values(6,6,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(7,7,'id33');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(8,8,'id38');
insert into saleList(saleNum, buyNum, sellerId) 
              values(9,9,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(10,10,'id33');
insert into saleList(saleNum, buyNum, sellerId) 
              values(11,11,'id38');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(12,12,'id38');
              
insert into saleList(saleNum, buyNum, sellerId) 
              values(13,13,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(14,14,'id33');
insert into saleList(saleNum, buyNum, sellerId) 
              values(15,15,'id40');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(16,16,'id33');
insert into saleList(saleNum, buyNum, sellerId) 
              values(17,17,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(18,18,'id40');
insert into saleList(saleNum, buyNum, sellerId) 
              values(19,19,'id33');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(20,20,'id33');
insert into saleList(saleNum, buyNum, sellerId) 
              values(21,21,'id40');
insert into saleList(saleNum, buyNum, sellerId) 
              values(22,22,'id33');
insert into saleList(saleNum, buyNum, sellerId) 
              values(23,23,'id39');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(24,24,'id33'); 
              
insert into saleList(saleNum, buyNum, sellerId) 
              values(25,25,'id33');
insert into saleList(saleNum, buyNum, sellerId) 
              values(26,26,'id40');
insert into saleList(saleNum, buyNum, sellerId) 
              values(27,27,'id40');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(28,28,'id33');
insert into saleList(saleNum, buyNum, sellerId) 
              values(29,29,'id40');
insert into saleList(saleNum, buyNum, sellerId) 
              values(30,30,'id40');
insert into saleList(saleNum, buyNum, sellerId) 
              values(31,31,'id33');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(32,32,'id33');
insert into saleList(saleNum, buyNum, sellerId) 
              values(33,33,'id33');
insert into saleList(saleNum, buyNum, sellerId) 
              values(34,34,'id40');
insert into saleList(saleNum, buyNum, sellerId) 
              values(35,35,'id33');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(36,36,'id33'); 
              
insert into saleList(saleNum, buyNum, sellerId) 
              values(37,37,'id34');
insert into saleList(saleNum, buyNum, sellerId) 
              values(38,38,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(39,39,'id34');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(40,40,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(41,41,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(42,42,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(43,43,'id34');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(44,44,'id34');
insert into saleList(saleNum, buyNum, sellerId) 
              values(45,45,'id40');
insert into saleList(saleNum, buyNum, sellerId) 
              values(46,46,'id34');
insert into saleList(saleNum, buyNum, sellerId) 
              values(47,47,'id39');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(48,48,'id39');
              
insert into saleList(saleNum, buyNum, sellerId) 
              values(49,49,'id34');
insert into saleList(saleNum, buyNum, sellerId) 
              values(50,50,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(51,51,'id34');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(52,52,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(53,53,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(54,54,'id34');
insert into saleList(saleNum, buyNum, sellerId) 
              values(55,55,'id35');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(56,56,'id34');
insert into saleList(saleNum, buyNum, sellerId) 
              values(57,57,'id34');
insert into saleList(saleNum, buyNum, sellerId) 
              values(58,58,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(59,59,'id34');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(60,60,'id35');
              
insert into saleList(saleNum, buyNum, sellerId) 
              values(61,61,'id34');
insert into saleList(saleNum, buyNum, sellerId) 
              values(62,62,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(63,63,'id40');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(64,64,'id34');
insert into saleList(saleNum, buyNum, sellerId) 
              values(65,65,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(66,66,'id40');
insert into saleList(saleNum, buyNum, sellerId) 
              values(67,67,'id34');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(68,68,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(69,69,'id40');
insert into saleList(saleNum, buyNum, sellerId) 
              values(70,70,'id34');
insert into saleList(saleNum, buyNum, sellerId) 
              values(71,71,'id39');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(72,72,'id40');
              
insert into saleList(saleNum, buyNum, sellerId) 
              values(73,73,'id34');
insert into saleList(saleNum, buyNum, sellerId) 
              values(74,74,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(75,75,'id34');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(76,76,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(77,77,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(78,78,'id34');
insert into saleList(saleNum, buyNum, sellerId) 
              values(79,79,'id35');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(80,80,'id34');
insert into saleList(saleNum, buyNum, sellerId) 
              values(81,81,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(82,82,'id34');
insert into saleList(saleNum, buyNum, sellerId) 
              values(83,83,'id35');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(84,84,'id34');
              
insert into saleList(saleNum, buyNum, sellerId) 
              values(85,85,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(86,86,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(87,87,'id35');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(88,88,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(89,89,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(90,90,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(91,91,'id39');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(92,92,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(93,93,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(94,94,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(95,95,'id35');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(96,96,'id39');
              
insert into saleList(saleNum, buyNum, sellerId) 
              values(97,97,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(98,98,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(99,99,'id39');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(100,100,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(101,101,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(102,102,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(103,103,'id35');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(104,104,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(105,105,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(106,106,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(107,107,'id35');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(108,108,'id39');
              
insert into saleList(saleNum, buyNum, sellerId) 
              values(109,109,'id36');
insert into saleList(saleNum, buyNum, sellerId) 
              values(110,110,'id38');
insert into saleList(saleNum, buyNum, sellerId) 
              values(111,111,'id40');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(112,112,'id36');
insert into saleList(saleNum, buyNum, sellerId) 
              values(113,113,'id38');
insert into saleList(saleNum, buyNum, sellerId) 
              values(114,114,'id40');
insert into saleList(saleNum, buyNum, sellerId) 
              values(115,115,'id36');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(116,116,'id38');
insert into saleList(saleNum, buyNum, sellerId) 
              values(117,117,'id40');
insert into saleList(saleNum, buyNum, sellerId) 
              values(118,118,'id36');
insert into saleList(saleNum, buyNum, sellerId) 
              values(119,119,'id38');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(120,120,'id40');
              
insert into saleList(saleNum, buyNum, sellerId) 
              values(121,121,'id37');
insert into saleList(saleNum, buyNum, sellerId) 
              values(122,122,'id38');
insert into saleList(saleNum, buyNum, sellerId) 
              values(123,123,'id39');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(124,124,'id37');
insert into saleList(saleNum, buyNum, sellerId) 
              values(125,125,'id38');
insert into saleList(saleNum, buyNum, sellerId) 
              values(126,126,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(127,127,'id37');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(128,128,'id38');
insert into saleList(saleNum, buyNum, sellerId) 
              values(129,129,'id39');
insert into saleList(saleNum, buyNum, sellerId) 
              values(130,130,'id37');
insert into saleList(saleNum, buyNum, sellerId) 
              values(131,131,'id38');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(132,132,'id39');
              
insert into saleList(saleNum, buyNum, sellerId) 
              values(133,133,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(134,134,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(135,135,'id35');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(136,136,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(137,137,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(138,138,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(139,139,'id35');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(140,140,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(141,141,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(142,142,'id35');
insert into saleList(saleNum, buyNum, sellerId) 
              values(143,143,'id35');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(144,144,'id35');
              
insert into saleList(saleNum, buyNum, sellerId) 
              values(145,145,'id37');
insert into saleList(saleNum, buyNum, sellerId) 
              values(146,146,'id38');
insert into saleList(saleNum, buyNum, sellerId) 
              values(147,147,'id40');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(148,148,'id37');
insert into saleList(saleNum, buyNum, sellerId) 
              values(149,149,'id38');
insert into saleList(saleNum, buyNum, sellerId) 
              values(150,150,'id40');
insert into saleList(saleNum, buyNum, sellerId) 
              values(151,151,'id37');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(152,152,'id38');
insert into saleList(saleNum, buyNum, sellerId) 
              values(153,153,'id40');
insert into saleList(saleNum, buyNum, sellerId) 
              values(154,154,'id37');
insert into saleList(saleNum, buyNum, sellerId) 
              values(155,155,'id38');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(156,156,'id40');   
        --------------- -------------------- ------------------- ----------      
insert into saleList(saleNum, buyNum, sellerId) 
              values(157,1,'id38');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(158,1,'id39');
                 
insert into saleList(saleNum, buyNum, sellerId) 
              values(159,13,'id40');
              
insert into saleList(saleNum, buyNum, sellerId) 
              values(160,21,'id33');   
insert into saleList(saleNum, buyNum, sellerId) 
              values(161,21,'id39');              
              
/*---------------------------- saleList----------------------------------saleList-------------------------------------------saleList*/
commit; 


