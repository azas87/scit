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
              values('id00', '00' , 'kim', '����' , 'a00@com', 'on' , 'manager' , 'first', 'join');
/*������*/
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id01', '01' , 'kim', '����' , 'a01@com', 'on' , 'buyer' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id02', '02' , 'kim', '����' , 'a02@com', 'on' , 'buyer' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id03', '03' , 'lee', '���' , 'a03@com', 'on' , 'buyer' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id04', '04' , 'park', '�뱸' , 'a04@com', 'on' , 'buyer' , 'first', 'join');
/*���Ի���. �˶� ON*/              
              
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id05', '05' , 'kim', '����' , 'a05@com', 'on' , 'buyer' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id06', '06' , 'kim', '����' , 'a06@com', 'on' , 'buyer' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id07', '07' , 'lee', '���' , 'a07@com', 'on' , 'buyer' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id08', '08' , 'park', '�뱸' , 'a08@com', 'on' , 'buyer' , 'first', 'join');
/*���Ի���. �˶� OFF*/

insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id09', '09' , 'kim', '����' , 'a09@com', 'on' , 'buyer' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id10', '10' , 'kim', '����' , 'a10@com', 'on' , 'buyer' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id11', '11' , 'lee', '���' , 'a11@com', 'on' , 'buyer' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id12', '12' , 'park', '�뱸' , 'a12@com', 'on' , 'buyer' , 'not_first', 'join');
/*���Ի���. ù �α��� �ƴ�. �˶� ON*/
              
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id13', '13' , 'kim', '����' , 'a13@com', 'off' , 'buyer' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id14', '14' , 'kim', '����' , 'a14@com', 'off' , 'buyer' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id15', '15' , 'lee', '���' , 'a15@com', 'off' , 'buyer' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id16', '16' , 'park', '�뱸' , 'a16@com', 'off' , 'buyer' , 'not_first', 'join');
/*���Ի���. ù �α��� �ƴ�. �˶� OFF*/  



insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id17', '17' , 'kim', '����' , 'a17@com', 'on' , 'buyer' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id18', '18' , 'kim', '����' , 'a18@com', 'on' , 'buyer' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id19', '19' , 'lee', '���' , 'a19@com', 'on' , 'buyer' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id20', '20' , 'park', '�뱸' , 'a20@com', 'on' , 'buyer' , 'first', 'out');
/*Ż�����. �˶� ON*/    

insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id21', '21' , 'kim', '����' , 'a21@com', 'on' , 'buyer' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id22', '22' , 'kim', '����' , 'a22@com', 'on' , 'buyer' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id23', '23' , 'lee', '���' , 'a23@com', 'on' , 'buyer' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id24', '24' , 'park', '�뱸' , 'a24@com', 'on' , 'buyer' , 'first', 'out');
/*Ż�����. �˶� OFF*/

insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id25', '25' , 'kim', '����' , 'a25@com', 'on' , 'buyer' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id26', '26' , 'kim', '����' , 'a26@com', 'on' , 'buyer' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id27', '27' , 'lee', '���' , 'a27@com', 'on' , 'buyer' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id28', '28' , 'park', '�뱸' , 'a28@com', 'on' , 'buyer' , 'not_first', 'out');
/*Ż�����. ù �α��� �ƴ�. �˶� ON*/
              
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id29', '29' , 'kim', '����' , 'a29@com', 'off' , 'buyer' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id30', '30' , 'kim', '����' , 'a30@com', 'off' , 'buyer' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id31', '31' , 'lee', '���' , 'a31@com', 'off' , 'buyer' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id32', '32' , 'park', '�뱸' , 'a32@com', 'off' , 'buyer' , 'not_first', 'out');
/*Ż�����. ù �α��� �ƴ�. �˶� OFF*/  
------------------------------------------------memberinfo������------------------------------------------------------memberinfo������
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id33', '33' , 'kim', '����' , 'a33@com', 'on' , 'seller' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id34', '34' , 'kim', '����' , 'a34@com', 'on' , 'seller' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id35', '35' , 'lee', '���' , 'a35@com', 'on' , 'seller' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id36', '36' , 'park', '�뱸' , 'a36@com', 'on' , 'seller' , 'first', 'join');
/*���Ի���. �˶� ON*/            
              
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id37', '37' , 'kim', '����' , 'a37@com', 'off' , 'seller' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id38', '38' , 'kim', '����' , 'a38@com', 'off' , 'seller' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id39', '39' , 'lee', '���' , 'a39@com', 'off' , 'seller' , 'first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id40', '40' , 'park', '�뱸' , 'a40@com', 'off' , 'seller' , 'first', 'join');
/*���Ի���. �˶� OFF*/

insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id41', '41' , 'kim', '����' , 'a41@com', 'on' , 'seller' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id42', '42' , 'kim', '����' , 'a42@com', 'on' , 'seller' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id43', '43' , 'lee', '���' , 'a43@com', 'on' , 'seller' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id44', '44' , 'park', '�뱸' , 'a44@com', 'on' , 'seller' , 'not_first', 'join');
/*���Ի���. ù �α��� �ƴ�. �˶� ON*/
              
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id45', '45' , 'kim', '����' , 'a45@com', 'on' , 'seller' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id46', '46' , 'kim', '����' , 'a46@com', 'on' , 'seller' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id47', '47' , 'lee', '���' , 'a47@com', 'on' , 'seller' , 'not_first', 'join');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id48', '48' , 'park', '�뱸' , 'a48@com', 'on' , 'seller' , 'not_first', 'join');
/*���Ի���. ù �α��� �ƴ�. �˶� OFF*/  



insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id49', '49' , 'kim', '����' , 'a49@com', 'on' , 'seller' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id50', '50' , 'kim', '����' , 'a50@com', 'on' , 'seller' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id51', '51' , 'lee', '���' , 'a51@com', 'on' , 'seller' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id52', '52' , 'park', '�뱸' , 'a52@com', 'on' , 'seller' , 'first', 'out');
/*Ż�����. �˶� ON*/    

insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id53', '53' , 'kim', '����' , 'a53@com', 'on' , 'seller' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id54', '54' , 'kim', '����' , 'a54@com', 'on' , 'seller' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id55', '55' , 'lee', '���' , 'a55@com', 'on' , 'seller' , 'first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id56', '56' , 'park', '�뱸' , 'a56@com', 'on' , 'seller' , 'first', 'out');
/*Ż�����. �˶� OFF*/

insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id57', '57' , 'kim', '����' , 'a57@com', 'on' , 'seller' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id58', '58' , 'kim', '����' , 'a58@com', 'on' , 'seller' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id59', '59' , 'lee', '���' , 'a59@com', 'on' , 'seller' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id60', '60' , 'park', '�뱸' , 'a60@com', 'on' , 'seller' , 'not_first', 'out');
/*Ż�����. ù �α��� �ƴ�. �˶� ON*/
              
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id61', '61' , 'kim', '����' , 'a61@com', 'off' , 'seller' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id62', '62' , 'kim', '����' , 'a62@com', 'off' , 'seller' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id63', '63' , 'lee', '���' , 'a63@com', 'off' , 'seller' , 'not_first', 'out');
insert into memberinfo(id, password, name, address, email, alarm, grade, first, memberStatus) 
              values('id64', '64' , 'park', '�뱸' , 'a64@com', 'off' , 'seller' , 'not_first', 'out');
/*Ż�����. ù �α��� �ƴ�. �˶� OFF*/  
----------------------------------------------memberinfo�Ǹ���--------------------------------------------memberinfo�Ǹ���
create table fishCategoryList(				
fishCategoryNum number primary key,
CategoryName varchar2(500)
);
insert into fishcategorylist(fishcategorynum,categoryname)values(1,'����');
insert into fishcategorylist(fishcategorynum,categoryname)values(2,'������');
insert into fishcategorylist(fishcategorynum,categoryname)values(3,'����');
insert into fishCategoryList(fishCategoryNum, CategoryName) values(4,'����');
insert into fishCategoryList(fishCategoryNum, CategoryName) values(5,'����');
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

insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('����ɫ�����', 1, '����',  '��,��,��',  '��ުǪϫҫ����Ȫ�ᳫ��������Ъ������Ϋ�����������������Ǫ⣱�����������');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('�۫��뫤��', 1, '����,����,����',  '��',  '?���?����ί����,?��˪�?�ê���٥�몤����������?��誦�˫���ի�?���媷,�����骪���êƪ����ت���̸�Ī���˪������ƪ��롣������?��15��������?�����200��600��������˪���,���˪������Ϊ��ު�߾���êƪ��롣');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('����᫤��', 1, '����,����',  '��',  '������������뫤���������̪�����,�۪���Ҵ�Ǫު�롣���Ӫ������?����15�ɡ�');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('�����ꫤ��', 1, '߲��,��ʰߣ,?��,���,���',  '��,��',  '����Գ��ݻ�������������,���������������������ݻ,������,��?���������֪��ƪ��ު���');

insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('������', 2, '����,ܲͷ,��ʰߣ',  '��',  '��Ϋޫ�����?�������Ϋ������Ȫ������,�����������������ࡣ�֫��ܫ���Ҫ���������,?��30������������򫻫���,45��������ϫͪȪ��իë�,60cm���߾�򫹫��������֡�');

insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('����ޫ���', 3, '����,���,����',  '��,��',  '��ުت����ê���Ҵ��г���ƪ���,7��8�ܪ�����ڪ��￪�롣����ڪ�����ꪬ�����Ϊ�ߧհѢ��7�Ţ�9�š�����ڪ������,���ʪɪ�������á�����ڪ�����,��?��,��?��������á�');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('��������', 3, '���',  '��',  '�����?��20��26�ɡ��������?�������,������?֮��������������êƪ��������?��?�����Ȫ�������');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('���ޫ���', 3, '��ʰߣ,?��',  '��,��,��',  '����ޫ���Ρ�����ժ�,����ޫ��Ӫ�󭪰�������ժȪ���롣?�䪬��?����êݪ�,���??��?�����Ū��ت䪫�������,?पǪ���٣�⫢�����������壩��');

insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('�ޫ���', 4, '����,��˪,?ߵ,����,���',  '��,��',  '�����������򪵪�,�̪�ݫԫ��?��������ΪҪȪĪ���驪��ߧ��깡�');

insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('������', 5, '����',  '��',  '�ޫ��������?�䪬?��êݪ�,��ުǪϡ���󫳫���������?�����Ъ�롣�ޫ���������?���Ԫ�,������ݻ��������몿��,?�Ԫ��?��पǪ��ʪ��ߪ��ࡣ');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('��������', 5, '���,��ү��',  '��,��,��',  '٣����?��,�ͪ��ު������������ʪ��Ȫ��顣?����ت䪫������򪪪Ӫ���������,��詪�����Ǫ�ҪȪ�����ء���ު���');
insert into fishList(fishName, fishCategoryNum, locations, seasonInfo, fishInfo) values('���ܫ���', 5, 'ܲͷ,��ʰߣ,��Դ',  '��,��',  '���ͪ����������,���������Ϊ��ު�߾���êƪ��롣���骲������ڪ��,���骲������Ъ�����⪢��ު������Ϊ���,���骲��?�檬����Ҵ�����۪Ǫ���');
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
              values(1, '����ɫ�����', 'id01', TO_DATE('2018/05/03', 'yyyy/mm/dd'), TO_DATE('2018/05/03', 'yyyy/mm/dd'),
              TO_DATE('2018/05/04', 'yyyy/mm/dd'), '1', 'onSale', 1000, 'id33', '����');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(2, '����ɫ�����', 'id01', TO_DATE('2018/05/04', 'yyyy/mm/dd'), TO_DATE('2018/05/04', 'yyyy/mm/dd'),
              TO_DATE('2018/05/05', 'yyyy/mm/dd'), '1', 'saleComplete', 500, 'id38', '����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,  successSellerId, location) 
              values(3, '����ɫ�����', 'id01', TO_DATE('2018/05/05', 'yyyy/mm/dd'), TO_DATE('2018/05/05', 'yyyy/mm/dd'),
              TO_DATE('2018/05/06', 'yyyy/mm/dd'), '1', 'getComplete', 800, 'id39', '����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,  successSellerId, location) 
              values(4, '����ɫ�����', 'id01', TO_DATE('2018/05/06', 'yyyy/mm/dd'), TO_DATE('2018/05/06', 'yyyy/mm/dd'),
              TO_DATE('2018/05/07', 'yyyy/mm/dd'), '1', 'refund', 1000, 'id33', '����');           
        
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(5, '����ɫ�����', 'id01', TO_DATE('2018/06/10', 'yyyy/mm/dd'), TO_DATE('2018/06/10', 'yyyy/mm/dd'),
              TO_DATE('2018/06/11', 'yyyy/mm/dd'), '2', 'onSale', 1100, 'id38', '����');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,  successSellerId, location) 
              values(6, '����ɫ�����', 'id01', TO_DATE('2018/06/11', 'yyyy/mm/dd'), TO_DATE('2018/06/11', 'yyyy/mm/dd'),
              TO_DATE('2018/06/12', 'yyyy/mm/dd'), '2', 'saleComplete', 600, 'id39', '����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(7, '����ɫ�����', 'id01', TO_DATE('2018/06/12', 'yyyy/mm/dd'), TO_DATE('2018/06/12', 'yyyy/mm/dd'),
              TO_DATE('2018/06/13', 'yyyy/mm/dd'), '2', 'getComplete', 1000, 'id33', '����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(8, '����ɫ�����', 'id01', TO_DATE('2018/06/13', 'yyyy/mm/dd'), TO_DATE('2018/06/13', 'yyyy/mm/dd'),
              TO_DATE('2018/06/14', 'yyyy/mm/dd'), '2', 'refund', 700, 'id38' ,'����'); 
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(9, '����ɫ�����', 'id01', TO_DATE('2018/07/23', 'yyyy/mm/dd'), TO_DATE('2018/07/23', 'yyyy/mm/dd'),
              TO_DATE('2018/07/24', 'yyyy/mm/dd'), '3', 'onSale', 1500, 'id39', '����');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(10, '����ɫ�����', 'id01', TO_DATE('2018/07/24', 'yyyy/mm/dd'), TO_DATE('2018/07/24', 'yyyy/mm/dd'),
              TO_DATE('2018/07/25', 'yyyy/mm/dd'), '3', 'saleComplete', 1000, 'id33', '����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(11, '����ɫ�����', 'id01', TO_DATE('2018/07/25', 'yyyy/mm/dd'), TO_DATE('2018/07/25', 'yyyy/mm/dd'),
              TO_DATE('2018/07/26', 'yyyy/mm/dd'), '3', 'getComplete', 500, 'id38', '����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(12, '����ɫ�����', 'id01', TO_DATE('2018/07/26', 'yyyy/mm/dd'), TO_DATE('2018/07/26', 'yyyy/mm/dd'),
              TO_DATE('2018/07/27', 'yyyy/mm/dd'), '3', 'refund', 800, 'id38', '����');              

insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(13, '�۫��뫤��', 'id01', TO_DATE('2018/03/10', 'yyyy/mm/dd'), TO_DATE('2018/03/10', 'yyyy/mm/dd'),
              TO_DATE('2018/03/11', 'yyyy/mm/dd'), '1', 'onSale', 500, 'id39', '����');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(14, '�۫��뫤��', 'id01', TO_DATE('2018/03/11', 'yyyy/mm/dd'), TO_DATE('2018/03/11', 'yyyy/mm/dd'),
              TO_DATE('2018/03/12', 'yyyy/mm/dd'), '1', 'saleComplete',800, 'id33', '����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(15, '�۫��뫤��', 'id01', TO_DATE('2018/03/12', 'yyyy/mm/dd'), TO_DATE('2018/03/12', 'yyyy/mm/dd'),
              TO_DATE('2018/03/13', 'yyyy/mm/dd'), '1', 'getComplete', 1000, 'id40', '����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(16, '�۫��뫤��', 'id01', TO_DATE('2018/03/13', 'yyyy/mm/dd'), TO_DATE('2018/03/13', 'yyyy/mm/dd'),
              TO_DATE('2018/03/14', 'yyyy/mm/dd'), '1', 'refund', 600, 'id33', '����');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(17, '�۫��뫤��', 'id01', TO_DATE('2018/04/17', 'yyyy/mm/dd'), TO_DATE('2018/04/17', 'yyyy/mm/dd'),
              TO_DATE('2018/04/18', 'yyyy/mm/dd'), '2', 'onSale', 1000, 'id39','����');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(18, '�۫��뫤��', 'id01', TO_DATE('2018/04/18', 'yyyy/mm/dd'), TO_DATE('2018/04/18', 'yyyy/mm/dd'),
              TO_DATE('2018/04/19', 'yyyy/mm/dd'), '2', 'saleComplete', 700, 'id40','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(19, '�۫��뫤��', 'id01', TO_DATE('2018/04/19', 'yyyy/mm/dd'), TO_DATE('2018/04/19', 'yyyy/mm/dd'),
              TO_DATE('2018/04/20', 'yyyy/mm/dd'), '2', 'getComplete',1500, 'id33','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(20, '�۫��뫤��', 'id01', TO_DATE('2018/04/20', 'yyyy/mm/dd'), TO_DATE('2018/04/20', 'yyyy/mm/dd'),
              TO_DATE('2018/04/21', 'yyyy/mm/dd'), '2', 'refund', 700, 'id33','����');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(21, '�۫��뫤��', 'id01', TO_DATE('2018/07/24', 'yyyy/mm/dd'), TO_DATE('2018/07/24', 'yyyy/mm/dd'),
              TO_DATE('2018/07/25', 'yyyy/mm/dd'), '3', 'onSale', 1000, 'id40','����');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(22, '�۫��뫤��', 'id01', TO_DATE('2018/07/25', 'yyyy/mm/dd'), TO_DATE('2018/07/25', 'yyyy/mm/dd'),
              TO_DATE('2018/07/26', 'yyyy/mm/dd'), '3', 'saleComplete', 600, 'id33','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(23, '�۫��뫤��', 'id01', TO_DATE('2018/07/26', 'yyyy/mm/dd'), TO_DATE('2018/07/26', 'yyyy/mm/dd'),
              TO_DATE('2018/07/27', 'yyyy/mm/dd'), '3', 'getComplete', 500, 'id39','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(24, '�۫��뫤��', 'id01', TO_DATE('2018/07/27', 'yyyy/mm/dd'), TO_DATE('2018/07/27', 'yyyy/mm/dd'),
              TO_DATE('2018/07/28', 'yyyy/mm/dd'), '3', 'refund', 1000, 'id33','����');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(25, '����᫤��', 'id01', TO_DATE('2018/04/03', 'yyyy/mm/dd'), TO_DATE('2018/04/03', 'yyyy/mm/dd'),
              TO_DATE('2018/04/04', 'yyyy/mm/dd'), '1', 'onSale', 1000, 'id33', '����');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(26, '����᫤��', 'id01', TO_DATE('2018/04/04', 'yyyy/mm/dd'), TO_DATE('2018/04/04', 'yyyy/mm/dd'),
              TO_DATE('2018/04/05', 'yyyy/mm/dd'), '1', 'saleComplete', 500,'id40','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(27, '����᫤��', 'id01', TO_DATE('2018/04/05', 'yyyy/mm/dd'), TO_DATE('2018/04/05', 'yyyy/mm/dd'),
              TO_DATE('2018/04/06', 'yyyy/mm/dd'), '1', 'getComplete',800, 'id40','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(28, '����᫤��', 'id01', TO_DATE('2018/04/06', 'yyyy/mm/dd'), TO_DATE('2018/04/06', 'yyyy/mm/dd'),
              TO_DATE('2018/04/07', 'yyyy/mm/dd'), '1', 'refund', 800, 'id33','����');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(29, '����᫤��', 'id01', TO_DATE('2018/02/11', 'yyyy/mm/dd'), TO_DATE('2018/02/11', 'yyyy/mm/dd'),
              TO_DATE('2018/02/12', 'yyyy/mm/dd'), '2', 'onSale',900, 'id40','����');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(30, '����᫤��', 'id01', TO_DATE('2018/02/12', 'yyyy/mm/dd'), TO_DATE('2018/02/12', 'yyyy/mm/dd'),
              TO_DATE('2018/02/13', 'yyyy/mm/dd'), '2', 'saleComplete', 1500,'id40','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(31, '����᫤��', 'id01', TO_DATE('2018/02/13', 'yyyy/mm/dd'), TO_DATE('2018/02/13', 'yyyy/mm/dd'),
              TO_DATE('2018/02/14', 'yyyy/mm/dd'), '2', 'getComplete', 1000, 'id33','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(32, '����᫤��', 'id01', TO_DATE('2018/02/14', 'yyyy/mm/dd'), TO_DATE('2018/02/14', 'yyyy/mm/dd'),
              TO_DATE('2018/02/15', 'yyyy/mm/dd'), '2', 'refund',700, 'id33', '����'); 
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(33, '����᫤��', 'id01', TO_DATE('2018/08/01', 'yyyy/mm/dd'), TO_DATE('2018/08/01', 'yyyy/mm/dd'),
              TO_DATE('2018/08/02', 'yyyy/mm/dd'), '3', 'onSale', 1000, 'id33', '����');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(34, '����᫤��', 'id01', TO_DATE('2018/08/02', 'yyyy/mm/dd'), TO_DATE('2018/08/02', 'yyyy/mm/dd'),
              TO_DATE('2018/08/03', 'yyyy/mm/dd'), '3', 'saleComplete', 800,'id40', '����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(35, '����᫤��', 'id01', TO_DATE('2018/08/03', 'yyyy/mm/dd'), TO_DATE('2018/08/03', 'yyyy/mm/dd'),
              TO_DATE('2018/08/04', 'yyyy/mm/dd'), '3', 'getComplete',900, 'id33','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(36, '����᫤��', 'id01', TO_DATE('2018/09/04', 'yyyy/mm/dd'), TO_DATE('2018/09/04', 'yyyy/mm/dd'),
              TO_DATE('2018/08/05', 'yyyy/mm/dd'), '3', 'refund',500, 'id33','����');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(37, '������', 'id01', TO_DATE('2018/01/11', 'yyyy/mm/dd'), TO_DATE('2018/01/11', 'yyyy/mm/dd'),
              TO_DATE('2018/01/12', 'yyyy/mm/dd'), '1', 'onSale',1000, 'id34','����');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(38, '������', 'id01', TO_DATE('2018/01/12', 'yyyy/mm/dd'), TO_DATE('2018/01/12', 'yyyy/mm/dd'),
              TO_DATE('2018/01/13', 'yyyy/mm/dd'), '1', 'saleComplete', 900, 'id39','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(39, '������', 'id01', TO_DATE('2018/01/13', 'yyyy/mm/dd'), TO_DATE('2018/01/13', 'yyyy/mm/dd'),
              TO_DATE('2018/01/14', 'yyyy/mm/dd'), '1', 'getComplete', 500, 'id34', '����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(40, '������', 'id01', TO_DATE('2018/01/14', 'yyyy/mm/dd'), TO_DATE('2018/01/14', 'yyyy/mm/dd'),
              TO_DATE('2018/01/15', 'yyyy/mm/dd'), '1', 'refund', 800, 'id39','����');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(41, '������', 'id01', TO_DATE('2018/01/11', 'yyyy/mm/dd'), TO_DATE('2018/01/11', 'yyyy/mm/dd'),
              TO_DATE('2018/01/12', 'yyyy/mm/dd'), '2', 'onSale', 600, 'id39', '����');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(42, '������', 'id01', TO_DATE('2018/01/12', 'yyyy/mm/dd'), TO_DATE('2018/01/12', 'yyyy/mm/dd'),
              TO_DATE('2018/01/13', 'yyyy/mm/dd'), '2', 'saleComplete',800, 'id39', '����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(43, '������', 'id01', TO_DATE('2018/01/13', 'yyyy/mm/dd'), TO_DATE('2018/01/13', 'yyyy/mm/dd'),
              TO_DATE('2018/01/14', 'yyyy/mm/dd'), '2', 'getComplete',1000, 'id34','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(44, '������', 'id01', TO_DATE('2018/01/14', 'yyyy/mm/dd'), TO_DATE('2018/01/14', 'yyyy/mm/dd'),
              TO_DATE('2018/01/15', 'yyyy/mm/dd'), '2', 'refund', 900, 'id34','����');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(45, '������', 'id01', TO_DATE('2018/07/22', 'yyyy/mm/dd'), TO_DATE('2018/07/22', 'yyyy/mm/dd'),
              TO_DATE('2018/07/23', 'yyyy/mm/dd'), '3', 'onSale',800, 'id40', '����');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(46, '������', 'id01', TO_DATE('2018/07/23', 'yyyy/mm/dd'), TO_DATE('2018/07/23', 'yyyy/mm/dd'),
              TO_DATE('2018/07/24', 'yyyy/mm/dd'), '3', 'saleComplete', 500,'id34', '����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(47, '������', 'id01', TO_DATE('2018/07/24', 'yyyy/mm/dd'), TO_DATE('2018/07/24', 'yyyy/mm/dd'),
              TO_DATE('2018/07/25', 'yyyy/mm/dd'), '3', 'getComplete', 700, 'id39', '����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(48, '������', 'id01', TO_DATE('2018/07/25', 'yyyy/mm/dd'), TO_DATE('2018/07/25', 'yyyy/mm/dd'),
              TO_DATE('2018/07/26', 'yyyy/mm/dd'), '3', 'refund', 600, 'id39', '����'); 
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(49, '����ޫ���', 'id01', TO_DATE('2018/03/11', 'yyyy/mm/dd'), TO_DATE('2018/03/11', 'yyyy/mm/dd'),
              TO_DATE('2018/03/12', 'yyyy/mm/dd'), '1', 'onSale', 1000, 'id34','���');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(50, '����ޫ���', 'id01', TO_DATE('2018/03/12', 'yyyy/mm/dd'), TO_DATE('2018/03/12', 'yyyy/mm/dd'),
              TO_DATE('2018/03/12', 'yyyy/mm/dd'), '1', 'saleComplete', 1000, 'id35','���');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(51, '����ޫ���', 'id01', TO_DATE('2018/03/13', 'yyyy/mm/dd'), TO_DATE('2018/03/13', 'yyyy/mm/dd'),
              TO_DATE('2018/03/14', 'yyyy/mm/dd'), '1', 'getComplete', 1000, 'id34', '���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(52, '����ޫ���', 'id01', TO_DATE('2018/03/14', 'yyyy/mm/dd'), TO_DATE('2018/03/14', 'yyyy/mm/dd'),
              TO_DATE('2018/03/15', 'yyyy/mm/dd'), '1', 'refund',700, 'id35', '���'); 
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(53, '����ޫ���', 'id01', TO_DATE('2018/01/11', 'yyyy/mm/dd'), TO_DATE('2018/01/11', 'yyyy/mm/dd'),
              TO_DATE('2018/01/12', 'yyyy/mm/dd'), '2', 'onSale', 800, 'id35', '���');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(54, '����ޫ���', 'id01', TO_DATE('2018/01/12', 'yyyy/mm/dd'), TO_DATE('2018/01/12', 'yyyy/mm/dd'),
              TO_DATE('2018/01/13', 'yyyy/mm/dd'), '2', 'saleComplete', 1000,'id34','���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(55, '����ޫ���', 'id01', TO_DATE('2018/01/13', 'yyyy/mm/dd'), TO_DATE('2018/01/13', 'yyyy/mm/dd'),
              TO_DATE('2018/01/14', 'yyyy/mm/dd'), '2', 'getComplete', 600, 'id35','���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(56, '����ޫ���', 'id01', TO_DATE('2018/01/14', 'yyyy/mm/dd'), TO_DATE('2018/01/14', 'yyyy/mm/dd'),
              TO_DATE('2018/01/15', 'yyyy/mm/dd'), '2', 'refund', 500, 'id34', '���');     
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(57, '����ޫ���', 'id01', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '3', 'onSale', 1000,'id34', '���');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(58, '����ޫ���', 'id01', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '3', 'saleComplete',600, 'id35', '���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(59, '����ޫ���', 'id01', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '3', 'getComplete', 800,'id34','���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(60, '����ޫ���', 'id01', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '3', 'refund', 1000, 'id35', '���');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(61, '������', 'id02', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '1', 'onSale', 700, 'id34', '����');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(62, '������', 'id02', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '1', 'saleComplete',1000, 'id39','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(63, '������', 'id02', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '1', 'getComplete', 700,'id40','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(64, '������', 'id02', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '1', 'refund', 800, 'id34','����');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(65, '������', 'id02', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '2', 'onSale',700, 'id39', '����');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId, location) 
              values(66, '������', 'id02', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '2', 'saleComplete',800, 'id40','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(67, '������', 'id02', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '2', 'getComplete',500, 'id34','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(68, '������', 'id02', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '2', 'refund', 900,'id39','����');    
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(69, '������', 'id02', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '3', 'onSale',500, 'id40','����');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(70, '������', 'id02', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '3', 'saleComplete', 700,'id34','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(71, '������', 'id02', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '3', 'getComplete',1000, 'id39','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(72, '������', 'id02', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '3', 'refund', 800,'id40','����');

insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(73, '����ޫ���', 'id03', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '1', 'onSale', 500, 'id34', '���');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(74, '����ޫ���', 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '1', 'saleComplete', 1000, 'id35','���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(75, '����ޫ���', 'id03', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '1', 'getComplete', 600, 'id34', '���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(76, '����ޫ���', 'id03', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '1', 'refund',500, 'id35', '���');

insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(77, '����ޫ���', 'id03', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '2', 'onSale',1000, 'id35','���');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(78, '����ޫ���', 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '2', 'saleComplete', 600,'id34','���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(79, '����ޫ���', 'id03', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '2', 'getComplete', 500, 'id35','���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(80, '����ޫ���', 'id03', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '2', 'refund',1000, 'id34','���');

insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(81, '����ޫ���', 'id03', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '3', 'onSale', 800,'id35','���');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(82, '����ޫ���', 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '3', 'saleComplete',500, 'id34','���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(83, '����ޫ���', 'id03', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '3', 'getComplete',1000, 'id35','���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(84, '����ޫ���', 'id03', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '3', 'refund', 900, 'id34','���');               

insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(85, '��������', 'id03', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '1', 'onSale', 1000, 'id35','���');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(86, '��������', 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '1', 'saleComplete', 900,'id39','���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(87, '��������', 'id03', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '1', 'getComplete', 1000,'id35','���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(88, '��������', 'id03', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '1', 'refund', 900,'id39','���');

insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(89, '��������', 'id03', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '2', 'onSale', 600, 'id39','���');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(90, '��������', 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '2', 'saleComplete',1000, 'id35','���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(91, '��������', 'id03', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '2', 'getComplete', 900,'id39','���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(92, '��������', 'id03', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '2', 'refund',500, 'id35','���');                 

insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(93, '��������', 'id03', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '3', 'onSale', 1000,'id35','���');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(94, '��������', 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '3', 'saleComplete', 600,'id39','���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId,location) 
              values(95, '��������', 'id03', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '3', 'getComplete', 800,'id35','���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(96, '��������', 'id03', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '3', 'refund', 900,'id39','���'); 
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId,location) 
              values(97, '���ޫ���', 'id03', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '1', 'onSale', 1000, 'id35','��ʰߣ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(98, '���ޫ���', 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '1', 'saleComplete', 800, 'id39','��ʰߣ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(99, '���ޫ���', 'id03', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '1', 'getComplete',500, 'id39','��ʰߣ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(100, '���ޫ���', 'id03', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '1', 'refund',400, 'id35','��ʰߣ');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(101, '���ޫ���', 'id03', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '2', 'onSale', 1000,'id39','��ʰߣ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(102, '���ޫ���', 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '2', 'saleComplete', 700, 'id39','��ʰߣ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price,successSellerId,location) 
              values(103, '���ޫ���', 'id03', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '2', 'getComplete',500, 'id35','��ʰߣ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(104, '���ޫ���', 'id03', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '2', 'refund', 1000, 'id35','��ʰߣ');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(105, '���ޫ���', 'id03', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '3', 'onSale', 900,'id35','��ʰߣ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(106, '���ޫ���', 'id03', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '3', 'saleComplete', 600,'id39','��ʰߣ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(107, '���ޫ���', 'id03', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '3', 'getComplete', 1000,'id35','��ʰߣ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(108, '���ޫ���', 'id03', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '3', 'refund',700, 'id39','��ʰߣ');

insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price,successSellerId,location) 
              values(109, '�ޫ���', 'id04', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '1', 'onSale', 1000, 'id36', '���');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(110, '�ޫ���', 'id04', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '1', 'saleComplete', 700,'id38','���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(111, '�ޫ���', 'id04', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '1', 'getComplete', 600, 'id40','���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(112, '�ޫ���', 'id04', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '1', 'refund',1000, 'id36','���');  
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(113, '�ޫ���', 'id04', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '2', 'onSale', 700,'id38','���');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(114, '�ޫ���', 'id04', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '2', 'saleComplete', 1000,'id40','���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(115, '�ޫ���', 'id04', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '2', 'getComplete', 600, 'id36','���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(116, '�ޫ���', 'id04', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '2', 'refund',800, 'id38','���');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(117, '�ޫ���', 'id04', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '3', 'onSale', 1000, 'id40','���');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(118, '�ޫ���', 'id04', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '3', 'saleComplete', 500, 'id36', '���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(119, '�ޫ���', 'id04', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '3', 'getComplete', 800, 'id38', '���');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(120, '�ޫ���', 'id04', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '3', 'refund', 800, 'id40', '���');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(121, '������', 'id05', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '1', 'onSale',1000, 'id37', '����');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(122, '������', 'id05', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '1', 'saleComplete', 800, 'id38','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(123, '������', 'id05', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '1', 'getComplete',1000, 'id39','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(124, '������', 'id05', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '1', 'refund', 800, 'id37', '����');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(125, '������', 'id05', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '2', 'onSale',1000, 'id38', '����');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(126, '������', 'id05', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '2', 'saleComplete', 500,'id39', '����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus,price, successSellerId,location) 
              values(127, '������', 'id05', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '2', 'getComplete', 800,'id37','����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(128, '������', 'id05', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '2', 'refund', 800,'id38','����');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(129, '������', 'id05', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '3', 'onSale', 1000, 'id39', '����');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(130, '������', 'id05', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '3', 'saleComplete', 800,'id37', '����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(131, '������', 'id05', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '3', 'getComplete', 600, 'id38', '����');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(132, '������', 'id05', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '3', 'refund', 1000, 'id39', '����');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(133, '��������', 'id05', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '1', 'onSale', 1000, 'id35','��ү��');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(134, '��������', 'id05', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '1', 'saleComplete', 500, 'id35','��ү��');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(135, '��������', 'id05', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '1', 'getComplete', 700,'id35','��ү��');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId,location) 
              values(136, '��������', 'id05', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '1', 'refund', 800, 'id35','��ү��');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(137, '��������', 'id05', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '2', 'onSale', 500, 'id35','��ү��');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(138, '��������', 'id05', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '2', 'saleComplete', 800, 'id35', '��ү��');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(139, '��������', 'id05', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '2', 'getComplete', 1000, 'id35','��ү��');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(140, '��������', 'id05', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '2', 'refund', 700, 'id35', '��ү��');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(141, '��������', 'id05', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '3', 'onSale', 1000,'id35', '��ү��');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(142, '��������', 'id05', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '3', 'saleComplete',800, 'id35', '��ү��');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(143, '��������', 'id05', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '3', 'getComplete', 900, 'id35', '��ү��');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(144, '��������', 'id05', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '3', 'refund', 1000, 'id35', '��ү��');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(145, '���ܫ���', 'id05', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '1', 'onSale', 500, 'id37','��Դ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(146, '���ܫ���', 'id05', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '1', 'saleComplete',800,  'id38', '��Դ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(147, '���ܫ���', 'id05', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '1', 'getComplete', 1000,'id40', '��Դ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(148, '���ܫ���', 'id05', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '1', 'refund', 500,'id37','��Դ');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(149, '���ܫ���', 'id05', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '2', 'onSale', 700, 'id38', '��Դ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(150, '���ܫ���', 'id05', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '2', 'saleComplete', 700, 'id40', '��Դ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(151, '���ܫ���', 'id05', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '2', 'getComplete', 1000, 'id37', '��Դ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(152, '���ܫ���', 'id05', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '2', 'refund', 2000, 'id38', '��Դ');
              
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(153, '���ܫ���', 'id05', TO_DATE('2018/09/11', 'yyyy/mm/dd'), TO_DATE('2018/09/11', 'yyyy/mm/dd'),
              TO_DATE('2018/09/12', 'yyyy/mm/dd'), '3', 'onSale', 1300, 'id40','��Դ');
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(154, '���ܫ���', 'id05', TO_DATE('2018/09/12', 'yyyy/mm/dd'), TO_DATE('2018/09/12', 'yyyy/mm/dd'),
              TO_DATE('2018/09/13', 'yyyy/mm/dd'), '3', 'saleComplete', 700, 'id40', '��Դ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(155, '���ܫ���', 'id05', TO_DATE('2018/09/13', 'yyyy/mm/dd'), TO_DATE('2018/09/13', 'yyyy/mm/dd'),
              TO_DATE('2018/09/14', 'yyyy/mm/dd'), '3', 'getComplete', 2000, 'id38','��Դ');           
insert into buyList(buyNum, fishName, buyerId, registDate, uploadDate, deadline, weight, saleStatus, price, successSellerId, location) 
              values(156, '���ܫ���', 'id05', TO_DATE('2018/09/14', 'yyyy/mm/dd'), TO_DATE('2018/09/14', 'yyyy/mm/dd'),
              TO_DATE('2018/09/15', 'yyyy/mm/dd'), '3', 'refund', 1000, 'id40','��Դ');   
---------------------------------------------------------buyList-------------------------------------------------------------------------------------
create table wishList(
wishNum number primary key,
id varchar2(50),
wish varchar2(50),
CONSTRAINT fk_wishList_wish FOREIGN KEY(wish) REFERENCES fishList(fishName),
CONSTRAINT fk_wishList_id FOREIGN KEY(id) REFERENCES memberinfo(id)
);

insert into wishList(wishNum,id,wish)values(1,'id01','����ɫ�����');
insert into wishList(wishNum,id,wish)values(2,'id01','�۫��뫤��');
insert into wishList(wishNum,id,wish)values(3,'id01','����᫤��');
insert into wishList(wishNum,id,wish)values(4,'id01','������');
insert into wishList(wishNum,id,wish)values(40,'id01','����ޫ���');
/*������ 1*/
insert into wishList(wishNum,id,wish)values(5,'id02','������');
/*������ 2*/
insert into wishList(wishNum,id,wish)values(6,'id03','����ޫ���');
insert into wishList(wishNum,id,wish)values(7,'id03','��������');
insert into wishList(wishNum,id,wish)values(8,'id03','���ޫ���');
/*������ 3*/
insert into wishList(wishNum,id,wish)values(9,'id04','�ޫ���');
/*������ 4*/
insert into wishList(wishNum,id,wish)values(10,'id05','������');
insert into wishList(wishNum,id,wish)values(11,'id05','��������');
insert into wishList(wishNum,id,wish)values(12,'id05','���ܫ���');
/*������ 5*/



insert into wishList(wishNum,id,wish)values(13,'id33','����ɫ�����');
insert into wishList(wishNum,id,wish)values(14,'id33','�۫��뫤��');
insert into wishList(wishNum,id,wish)values(15,'id33','����᫤��');
/*�Ǹ��� 1*/
insert into wishList(wishNum,id,wish)values(16,'id34','����ޫ���');
insert into wishList(wishNum,id,wish)values(17,'id34','������');
/*�Ǹ��� 2*/
insert into wishList(wishNum,id,wish)values(18,'id35','����ޫ���');
insert into wishList(wishNum,id,wish)values(19,'id35','��������');
insert into wishList(wishNum,id,wish)values(20,'id35','���ޫ���');
insert into wishList(wishNum,id,wish)values(21,'id35','��������');
/*�Ǹ��� 3*/
insert into wishList(wishNum,id,wish)values(22,'id36','�ޫ���');
/*�Ǹ��� 4*/
insert into wishList(wishNum,id,wish)values(23,'id37','������');
insert into wishList(wishNum,id,wish)values(24,'id37','���ܫ���');
/*�Ǹ��� 5*/

insert into wishList(wishNum,id,wish)values(25,'id38','����ɫ�����');
insert into wishList(wishNum,id,wish)values(26,'id38','���ޫ���');
insert into wishList(wishNum,id,wish)values(27,'id38','�ޫ���');
insert into wishList(wishNum,id,wish)values(28,'id38','���ܫ���');
insert into wishList(wishNum,id,wish)values(29,'id38','������');
/*�Ǹ��� 6. �켱���� ���̺� �ۼ��� ���� ���� �Ǹ��� 3�� �߰�(��, �����ߴµ� �ϳ��� ���� ����)*/
insert into wishList(wishNum,id,wish)values(30,'id39','�۫��뫤��');
insert into wishList(wishNum,id,wish)values(31,'id39','��������');
insert into wishList(wishNum,id,wish)values(32,'id39','������');
insert into wishList(wishNum,id,wish)values(33,'id39','������');
insert into wishList(wishNum,id,wish)values(34,'id39','����ɫ�����');
/*�Ǹ��� 7*/
insert into wishList(wishNum,id,wish)values(35,'id40','����᫤��');
insert into wishList(wishNum,id,wish)values(36,'id40','������');
insert into wishList(wishNum,id,wish)values(37,'id40','���ܫ���');
insert into wishList(wishNum,id,wish)values(38,'id40','�ޫ���');
insert into wishList(wishNum,id,wish)values(39,'id40','�۫��뫤��');
/*�Ǹ��� 8*/
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
    values(avgListNum.nextval,'����ɫ�����', '1000', TO_DATE('2018/09/16', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'�۫��뫤��', '800', TO_DATE('2018/09/16', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����᫤��', '900', TO_DATE('2018/09/16', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'������', '1000', TO_DATE('2018/09/16', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����ޫ���', '500', TO_DATE('2018/09/16', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'��������', '600', TO_DATE('2018/09/16', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'���ޫ���', '400', TO_DATE('2018/09/16', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'�ޫ���', '1000', TO_DATE('2018/09/16', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'������', '800', TO_DATE('2018/09/16', 'yyyy/mm/dd'));  
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'��������', '500', TO_DATE('2018/09/16', 'yyyy/mm/dd'));
    

insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����ɫ�����', '1500', TO_DATE('2018/09/15', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'�۫��뫤��', '300', TO_DATE('2018/09/15', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����᫤��', '1400', TO_DATE('2018/09/15', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'������', '500', TO_DATE('2018/09/15', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����ޫ���', '1000', TO_DATE('2018/09/15', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'��������', '1100', TO_DATE('2018/09/15', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'���ޫ���', '900', TO_DATE('2018/09/15', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'�ޫ���', '1500', TO_DATE('2018/09/15', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'������', '1300', TO_DATE('2018/09/15', 'yyyy/mm/dd'));  
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'��������', '1000', TO_DATE('2018/09/15', 'yyyy/mm/dd'));
    

insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����ɫ�����', '2000', TO_DATE('2018/09/14', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'�۫��뫤��', '1300', TO_DATE('2018/09/14', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����᫤��', '1400', TO_DATE('2018/09/14', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'������', '1500', TO_DATE('2018/09/14', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����ޫ���', '1000', TO_DATE('2018/09/14', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'��������', '1100', TO_DATE('2018/09/14', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'���ޫ���', '900', TO_DATE('2018/09/14', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'�ޫ���', '500', TO_DATE('2018/09/14', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'������', '300', TO_DATE('2018/09/14', 'yyyy/mm/dd'));  
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'��������', '1000', TO_DATE('2018/09/14', 'yyyy/mm/dd'));
    

insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����ɫ�����', '2500', TO_DATE('2018/09/13', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'�۫��뫤��', '1800', TO_DATE('2018/09/13', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����᫤��', '900', TO_DATE('2018/09/13', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'������', '2000', TO_DATE('2018/09/13', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����ޫ���', '500', TO_DATE('2018/09/13', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'��������', '1600', TO_DATE('2018/09/13', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'���ޫ���', '1400', TO_DATE('2018/09/13', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'�ޫ���', '1200', TO_DATE('2018/09/13', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'������', '800', TO_DATE('2018/09/13', 'yyyy/mm/dd'));  
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'��������', '1400', TO_DATE('2018/09/13', 'yyyy/mm/dd'));
    

insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����ɫ�����', '2000', TO_DATE('2018/09/12', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'�۫��뫤��', '1300', TO_DATE('2018/09/12', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����᫤��', '1400', TO_DATE('2018/09/12', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'������', '2500', TO_DATE('2018/09/12', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����ޫ���', '1000', TO_DATE('2018/09/12', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'��������', '2200', TO_DATE('2018/09/12', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'���ޫ���', '1900', TO_DATE('2018/09/12', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'�ޫ���', '1700', TO_DATE('2018/09/12', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'������', '1300', TO_DATE('2018/09/12', 'yyyy/mm/dd'));  
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'��������', '1900', TO_DATE('2018/09/12', 'yyyy/mm/dd'));
    

insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����ɫ�����', '2500', TO_DATE('2018/09/11', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'�۫��뫤��', '1800', TO_DATE('2018/09/11', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����᫤��', '1900', TO_DATE('2018/09/11', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'������', '3000', TO_DATE('2018/09/11', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����ޫ���', '1500', TO_DATE('2018/09/11', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'��������', '2700', TO_DATE('2018/09/11', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'���ޫ���', '2600', TO_DATE('2018/09/11', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'�ޫ���', '2300', TO_DATE('2018/09/11', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'������', '1800', TO_DATE('2018/09/11', 'yyyy/mm/dd'));  
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'��������', '2400', TO_DATE('2018/09/11', 'yyyy/mm/dd'));
    

insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����ɫ�����', '2000', TO_DATE('2018/09/10', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'�۫��뫤��', '1300', TO_DATE('2018/09/10', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����᫤��', '2400', TO_DATE('2018/09/10', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'������', '3500', TO_DATE('2018/09/10', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'����ޫ���', '1000', TO_DATE('2018/09/10', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'��������', '2200', TO_DATE('2018/09/10', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'���ޫ���', '3100', TO_DATE('2018/09/10', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'�ޫ���', '2800', TO_DATE('2018/09/10', 'yyyy/mm/dd'));
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'������', '1300', TO_DATE('2018/09/10', 'yyyy/mm/dd'));  
insert into WEEKAVGLIST(AvgListNum,fishName, avgPrice, dates)
    values(avgListNum.nextval,'��������', '1900', TO_DATE('2018/09/10', 'yyyy/mm/dd'));
--------------------------------WEEKAVGLIST--------------------------------WEEKAVGLIST-----------------------------------------WEEKAVGLIST
create table priorityList(
priorityNum number primary key,
buyNum number,
priorityId varchar2(50),
CONSTRAINT fk_priorityList_buynum FOREIGN KEY(buyNum) REFERENCES buyList(buyNum) ON DELETE CASCADE,
CONSTRAINT fk_priorityList_id FOREIGN KEY(priorityId) REFERENCES memberinfo(id) ON DELETE CASCADE
);
/*buyNum 1�� ����1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(1,1,'id33');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(2,1,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(3,1,'id39');
/*����2*/                    
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(4,5,'id33');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(5,5,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(6,5,'id39');
/*����3*/                    
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(7,9,'id33');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(8,9,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(9,9,'id39');
                    
/*buyNum 13�� ����1*/                    
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(10,13,'id33');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(11,13,'id39');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(12,13,'id40');
/*����2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(13,17,'id33');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(14,17,'id39');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(15,17,'id40');
/*����3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(16,21,'id33');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(17,21,'id39');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(18,21,'id40');
                    
/*buyNum 25�� ����1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(19,25,'id33');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(20,25,'id40');
/*����2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(21,29,'id33');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(22,29,'id40');
/*����3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(23,33,'id33');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(24,33,'id40');

/*buyNum 37�� ����1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(25,37,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(26,37,'id39');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(27,37,'id40');
/*����2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(28,41,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(29,41,'id39');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(30,41,'id40');
/*����3*/   
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(31,45,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(32,45,'id39');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(33,45,'id40');
                    
/*buyNum 49�� ����1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(34,49,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(35,49,'id35');
/*����2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(36,53,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(37,53,'id35');
/*����3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(38,57,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(39,57,'id35');
                    
/*buyNum 61�� ����1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(40,61,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(41,61,'id39');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(42,61,'id40');
/*����2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(43,65,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(44,65,'id39');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(45,65,'id40');
/*����3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(46,69,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(47,69,'id39');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(48,69,'id40');
                    
/*buyNum 73�� ����1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(49,73,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(50,73,'id35');
/*����2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(51,77,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(52,77,'id35');
/*����3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(53,81,'id34');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(54,81,'id35');

/*buyNum 85�� ����1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(55,85,'id35');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(56,85,'id39');
/*����2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(57,89,'id35');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(58,89,'id39');
/*����3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(59,93,'id35');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(60,93,'id39');

/*buyNum 97�� ����1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(61,97,'id35');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(62,97,'id38');
/*����2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(63,101,'id35');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(64,101,'id38');
/*����3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(65,105,'id35');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(66,105,'id38');
                    
/*buyNum 109�� ����1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(67,109,'id36');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(68,109,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(69,109,'id40');
/*����2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(70,113,'id36');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(71,113,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(72,113,'id40');
/*����3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(73,117,'id36');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(74,117,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(75,117,'id40');
                    
/*buyNum 121�� ����1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(76,121,'id37');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(77,121,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(78,121,'id39');
/*����2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(79,125,'id37');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(80,125,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(81,125,'id39');
/*����3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(82,129,'id37');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(83,129,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(84,129,'id39');
                    
/*buyNum 133�� ����1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(85,133,'id35');
/*����2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(86,137,'id35');
/*����3*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(87,141,'id35');

/*buyNum 145�� ����1*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(88,145,'id37');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(89,145,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(90,145,'id40');
/*����2*/
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(91,149,'id37');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(92,149,'id38');
insert into priorityList(priorityNum, buyNum, priorityId)
                    values(93,149,'id40');
/*����3*/  
----------------------------------------priorityList----------------------------------priorityList------------------------------priorityList
/*--�ǸŸ��-- */
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


