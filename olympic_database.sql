create table country (
country_id varchar(10) PRIMARY KEY,
country_name varchar(20)
);


create table athelete( 
olympic_id varchar(20) primary key,    
f_name varchar(20),
l_name varchar(20),
gender varchar(1) check(gender = 'M' or gender = 'F' or gender = 'T'),
DOB date,
age int,
height decimal(3,2),
weight decimal(5,2),
country_id varchar(10),
foreign key(country_id) references country(country_id) on delete cascade

);
alter table athelete add foreign key(country_id) references country(country_id) on delete cascade;

alter table athelete modify height decimal(3,2) after age;
alter table athelete drop column country_id;
alter table athelete drop column email;
alter table athelete drop  constraint athelete_ibfk_1;
alter table athelete drop column country_id;
alter table athelete add column country_id varchar(10);
alter table athelete add column age int;


create table medal(
medal_id varchar(20) primary key,
medal_name varchar(10) check(medal_name = 'GOLD' OR medal_name = 'SILVER' OR medal_name = 'BRONZE'),
event_id varchar(20),
olympic_id varchar(20),
foreign key(olympic_id) references athelete(olympic_id) on delete cascade,
foreign key(event_id) references event(event_id) on delete cascade
);

desc email;
alter table athelete add column medal_id varchar(20);
alter table athelete add foreign key(medal_id) references medal(medal_id) on delete set null;
alter table medal drop column medal_id;
alter table athelete drop constraint athelete_ibfk_2;
alter table athelete modify country_id varchar(10) not null;

describe medal;
create table email(
email varchar(30),
olympic_id varchar(20), 
foreign key(olympic_id) references athelete(olympic_id) on delete cascade,
primary key(olympic_id, email)
);
alter table email add foreign key(olympic_id) references athelete(olympic_id) on delete cascade;
alter table country modify country_name varchar(20) not null;
desc country;
desc medal;
alter table medal add foreign key(olympic_id) references athelete(olympic_id) on delete cascade;
alter table medal add foreign key(event_id) references event(event_id) on delete cascade;


create table event(
event_id varchar(20) primary key,
title varchar(20),
location varchar(30),
start_date date,
end_date date,
gender varchar(1) check(gender = 'M' or gender = 'W'),
category_id varchar(30),
olympiad_id varchar(20),
foreign key(olympiad_id) references olympic(olympiad_id) on delete cascade,
foreign key(category_id) references sports_category(category_id) on delete cascade

);

alter table event modify category_id varchar(30) after gender; 
alter table event add foreign key(olympiad_id) references olympic(olympiad_id) on delete cascade;
alter table event add foreign key(category_id) references sports_category(category_id) on delete cascade;
describe event;
alter table event drop column olympic_id;
alter table event drop constraint event_ibfk_1;
alter table event add column olympiad_id varchar(20);


create table sports_category(
category_id varchar(30) primary key,
sport_name varchar(30) not NULL,
type varchar(10) check(type = 'SINGLES' OR type = 'DOUBLES' or type = 'TEAM')

);
alter table medal modify olympic_id varchar(20) after event_id;

create table participation(
olympic_id varchar(20),
event_id varchar(20),
primary key(olympic_id, event_id),
foreign key(olympic_id) references athelete(olympic_id) on delete cascade,
foreign key(event_id) references event(event_id) on delete cascade
);


alter table participation add foreign key(olympic_id) references athelete(olympic_id) on delete cascade;
alter table participation add foreign key(event_id) references event(event_id) on delete cascade;
create table olympic(
olympiad_id varchar(20) primary key,
season varchar(20) check(season = 'SUMMER' or season = 'WINTER'),
city varchar(30),
year int,
country_id varchar(10),
foreign key(country_id) references country (country_id) on delete cascade

);

alter table olympic add foreign key(country_id) references country (country_id) on delete cascade;
desc country;
desc athelete;
desc email;
desc olympic;
desc medal;
desc sports_category;
desc event;
desc participation;


alter table country add unique(country_name);

select * from country;
insert into country values ('IND', 'INDIA');
insert into country values ('AUS', 'AUSTRALIA');
insert into country values ('ARG', 'ARGENTINA');
insert into country values ('GER', 'GERMANY');
insert into country values ('AFG', 'AFGANISTAN');
insert into country values ('USA', 'UNITED STATE');
insert into country values ('BEL', 'BELGIUM');
insert into country values ('CAN', 'CANADA');
insert into country values ('COL', 'COLOMBIA');
insert into country values ('BRA', 'BRAZIL');
insert into country values ('CHN', 'CHINA');
insert into country values ('JPN', 'JAPAN');



insert into athelete values('IND_001', 'NEERAJ', 'CHOPRA', 'M', '11-09-1991', null, 1.83, 80.76, 'IND');
insert into athelete values('IND_002', 'AMAN', 'GUPTA', 'M', '12-08-1990', null, 1.82, 80.75, 'IND');
insert into athelete values('IND_003', 'MEERA', 'SHARMA', 'F', '10-05-1993', null, 1.80, 80.72, 'IND');
insert into athelete values('USA_001', 'JOHN', 'BOND', 'M', '18-09-1992', null, 1.81, 80.78, 'USA');
insert into athelete values('USA_002', 'JAMES', 'CLEAR', 'M', '18-08-1991', null, 1.83, 80.76, 'USA');
insert into athelete values('USA_003', 'ELISA', 'BETH', 'F', '16-01-1993', null, 1.79, 79.02, 'USA');
insert into athelete values('GER_001', 'JONAS', 'MORGAN', 'M', '14-05-1990', null, 1.83, 80.76, 'GER');
insert into athelete values('GER_002', 'ELIAS', 'VETTEL', 'M', '15-09-1994', null, 1.83, 80.76, 'GER');
insert into athelete values('AFG_001', 'NAJIBULLAH', 'ZADRAN', 'M', '14-04-1991', null, 1.84, 80.78, 'AFG');
insert into athelete values('AFG_002', 'FAROOQI', 'SEIKH', 'F', '01-09-1993', null, 1.40, 80.01, 'AFG');
insert into athelete values('COL_001', 'ANGELO', 'ROMAN', 'M', '11-04-1991', null, 1.83, 80.76, 'COL');
insert into athelete values('COL_002', 'ARMANDO', 'ROMANAIDIS', 'M', '11-09-1991', null, 1.83, 80.76, 'COL');
insert into athelete values('COL_003', 'ADRIEN', 'MALDONADO', 'M', '14-02-1991', null, 1.82, 80.72, 'COL');
insert into athelete values('CHN_001', 'GUANYU', 'ZHOU', 'M', '06-07-1991', null, 1.83, 80.76, 'CHN');
insert into athelete values('CHN_002', 'SUNG', 'UNN', 'M', '13-09-1991', null, 1.81, 80.76, 'CHN');
insert into athelete values('CHN_003', 'CHU', 'HUA', 'F', '01-08-1991', null, 1.80, 80.70, 'CHN');
insert into athelete values('CHN_004', 'MA', 'LONG', 'F', '14-02-1991', null, 1.83, 80.76, 'CHN');
insert into athelete values('CHN_005', 'XU', 'XIN', 'M', '15-05-1991', null, 1.82, 80.78, 'CHN');
insert into athelete values('ARG_001', 'LEONAL', 'MESSI', 'M', '11-07-1991', null, 1.84, 80.71, 'ARG');
insert into athelete values('ARG_002', 'DIEGO', 'MARADONA', 'M', '11-11-1990', null, 1.84, 80.71, 'ARG');
insert into athelete values('ARG_003', 'MARTINA', 'AUGUST', 'F', '22-07-1989', null, 1.79, 80.69, 'ARG');
insert into athelete values('JPN_001', 'MISAKA', 'MARIN', 'F', '11-01-1991', null, 1.84, 80.71, 'JPN');
insert into athelete values('AUS_001', 'SHANE', 'WATSON', 'M', '22-03-190', null, 1.79, 80.69, 'AUS');
insert into athelete values('AUS_002', 'ASHLEY', 'BARTEY', 'F', '21-11-1991', null, 1.84, 80.71, 'AUS');

update athelete set dob = '10-08-1991' where height = 1.83;
select * from athelete;

drop trigger ath_in_msg;
drop trigger TRIG_AGECALC;
drop trigger AGEC;

create or replace trigger ath_in_msg
after insert on athelete
for each row

begin

dbms_output.put_line('Athelete added in the database successfully');

if sql%rowcount = 0 then
dbms_output.put_line('No rows affected');
end if;

end;
/

select * from athelete;


insert into email values('neerajchopra@gmail.com', 'IND_001');
insert into email values('amangupta@gmail.com', 'IND_002');
insert into email values('meerasharma@gmail.com', 'IND_003');
insert into email values('johnbond@gmail.com', 'USA_001');
insert into email values('jamesclear@gmail.com', 'USA_002');
insert into email values('elisabeth@gmail.com', 'USA_003');
insert into email values('jonasmorgan@gmail.com', 'GER_001');
insert into email values('eliasvettel@gmail.com', 'GER_002');
insert into email values('majibullahzadran@gmail.com', 'AFG_001');
insert into email values('farooqiseikh@gmail.com', 'AFG_002');
insert into email values('angeloroman@gmail.com', 'COL_001');
insert into email values('armandoromanaidis@gmail.com', 'COL_002');
insert into email values('adrienmaldonado@gmail.com', 'COL_003');
insert into email values('guanyuzhou@gmail.com', 'CHN_001');
insert into email values('sungunn@gmail.com', 'CHN_002');
insert into email values('chuhua@gmail.com', 'CHN_003');
insert into email values('malong@gmail.com', 'CHN_004');
insert into email values('xuxin@gmail.com', 'CHN_005');
insert into email values('leonalmessi@gmail.com', 'ARG_001');
insert into email values('diegomaradona@gmail.com', 'ARG_002');
insert into email values('martinaaugust@gmail.com', 'ARG_003');
insert into email values('misakamarin@gmail.com', 'JPN_001');
insert into email values('shanewatson@gmail.com', 'AUS_001');
insert into email values('ashleybartey@gmail.com', 'AUS_002');


insert into olympic values ('OID_001', 'SUMMER', 'TOKYO', '1964', 'JPN');
insert into olympic values ('OID_002', 'WINTER', 'DELHI', '1968', 'IND');
insert into olympic values ('OID_003', 'WINTER', 'TORONTO', '1972', 'CAN');
insert into olympic values ('OID_004', 'WINTER', 'SYDENY', '1976', 'AUS');
insert into olympic values ('OID_005', 'SUMMER', 'BRUSSELS', '1980', 'COL');
insert into olympic values ('OID_006', 'SUMMER', 'BERLIN', '1984', 'GER');
insert into olympic values ('OID_007', 'WINTER', 'BUENOS', '1988', 'ARG');
insert into olympic values ('OID_008', 'SUMMER', 'KABUL', '1992', 'AFG');
insert into olympic values ('OID_009', 'WINTER', 'SHANGHAI', '1996', 'CHN');
insert into olympic values ('OID_010', 'SUMMER', 'LECASTELLAT', '2000', 'BRA');

select * from olympic;
select * from sports_category;


select * from event;

insert into sports_category values ('CID_001', 'HOCKEY', 'TEAM');
insert into sports_category values ('CID_003', 'TENNIS', 'DOUBLES');
insert into sports_category values ('CID_002', '100M_RACE', 'SINGLES');
insert into sports_category values ('CID_004', 'SHOOTING', 'SINGLES');
insert into sports_category values ('CID_005', 'SWIMMING', 'DOUBLES');
insert into sports_category values ('CID_006', 'WRESTLING', 'SINGLES');
insert into sports_category values ('CID_007', 'LONG_JUMP', 'SINGLES');


select * from sports_category;


select * from event;

insert into event values('EID_001', 'TOKYO OLYMPIC', 'TOKYO JAPAN', '11-09-1991', '20-12-1991', 'M', 'CID_001', 'OID_001');
insert into event values('EID_004', 'TOKYO OLYMPIC', 'TOKYO JAPAN', '11-11-1991', '15-01-1992', 'W', 'CID_001', 'OID_001');
insert into event values('EID_005', 'TOKYO OLYMPIC', 'TOKYO JAPAN', '15-11-1991', '20-12-1991', 'M', 'CID_002', 'OID_001');
insert into event values('EID_006', 'TOKYO OLYMPIC', 'TOKYO JAPAN', '11-11-1991', '15-01-1992', 'W', 'CID_002', 'OID_001');

insert into event values('EID_002', 'TORONTO OLYMPIC', 'TORONTO CANADA', '05-07-1972', '10-08-1972', 'M', 'CID_001', 'OID_003');
insert into event values('EID_003', 'TORONTO OLYMPIC', 'TORONTO CANADA', '05-08-1972', '10-11-1972', 'W', 'CID_001', 'OID_003');

insert into event values('EID_007', 'DELHI OLYMPIC', 'DELHI INDIA', '05-09-1968', '10-11-1968', 'M', 'CID_001', 'OID_002');
insert into event values('EID_008', 'DELHI OLYMPIC', 'DELHI INDIA', '11-11-1968', '15-01-1968', 'W', 'CID_001', 'OID_002');
insert into event values('EID_009', 'DELHI OLYMPIC', 'DELHI INDIA', '15-11-1968', '20-12-1968', 'M', 'CID_002', 'OID_002');
insert into event values('EID_010', 'DELHI OLYMPIC', 'DELHI INDIA', '11-11-1968', '15-01-1969', 'W', 'CID_002', 'OID_002');
insert into event values('EID_011', 'DELHI OLYMPIC', 'DELHI INDIA', '15-11-1968', '20-12-1968', 'M', 'CID_003', 'OID_002');
insert into event values('EID_013', 'DELHI OLYMPIC', 'DELHI INDIA', '18-11-1968', '20-12-1968', 'M', 'CID_005', 'OID_002');
insert into event values('EID_014', 'DELHI OLYMPIC', 'DELHI INDIA', '19-12-1968', '28-12-1968', 'W', 'CID_005', 'OID_002');
insert into event values('EID_015', 'DELHI OLYMPIC', 'DELHI INDIA', '20-11-1968', '22-12-1968', 'M', 'CID_006', 'OID_002');
insert into event values('EID_016', 'DELHI OLYMPIC', 'DELHI INDIA', '21-12-1968', '24-12-1968', 'W', 'CID_006', 'OID_002');
insert into event values('EID_012', 'DELHI OLYMPIC', 'DELHI INDIA', '11-12-1968', '18-12-1968', 'W', 'CID_003', 'OID_002');
insert into event values('EID_017', 'DELHI OLYMPIC', 'DELHI INDIA', '16-11-1968', '20-12-1968', 'M', 'CID_004', 'OID_002');
insert into event values('EID_018', 'DELHI OLYMPIC', 'DELHI INDIA', '17-12-1968', '18-12-1968', 'W', 'CID_004', 'OID_002');


insert into event values('EID_019', 'TORONTO OLYMPIC', 'TORONTO CANADA', '05-09-1972', '10-11-1972', 'M', 'CID_001', 'OID_003');
insert into event values('EID_020', 'DELHI OLYMPIC', 'DELHI INDIA', '11-11-1972', '15-01-1972', 'W', 'CID_001', 'OID_003');
insert into event values('EID_021', 'DELHI OLYMPIC', 'DELHI INDIA', '15-11-1972', '20-12-1972', 'M', 'CID_002', 'OID_003');
insert into event values('EID_023', 'DELHI OLYMPIC', 'DELHI INDIA', '15-11-1972', '20-12-1972', 'M', 'CID_003', 'OID_003');
insert into event values('EID_024', 'DELHI OLYMPIC', 'DELHI INDIA', '11-12-1972', '18-12-1972', 'W', 'CID_003', 'OID_003');
insert into event values('EID_025', 'DELHI OLYMPIC', 'DELHI INDIA', '15-11-1972', '20-12-1972', 'M', 'CID_004', 'OID_003');
insert into event values('EID_027', 'DELHI OLYMPIC', 'DELHI INDIA', '15-11-1972', '20-12-1972', 'M', 'CID_005', 'OID_003');
insert into event values('EID_029', 'DELHI OLYMPIC', 'DELHI INDIA', '15-11-1972', '20-12-1972', 'M', 'CID_006', 'OID_003');
insert into event values('EID_030', 'DELHI OLYMPIC', 'DELHI INDIA', '11-12-1972', '18-12-1972', 'W', 'CID_007', 'OID_003');

insert into event values('EID_031', 'SYDNEY OLYMPIC', 'SYDNEY AUSTRALIA', '11-11-1976', '15-01-1976', 'W', 'CID_001', 'OID_004');
insert into event values('EID_032', 'SYDNEY OLYMPIC', 'SYDNEY AUSTRALIA', '15-11-1976', '20-12-1976', 'M', 'CID_002', 'OID_004');
insert into event values('EID_033', 'SYDNEY OLYMPIC', 'SYDNEY AUSTRALIA', '15-11-1976', '20-12-1976', 'M', 'CID_003', 'OID_004');
insert into event values('EID_034', 'SYDNEY OLYMPIC', 'SYDNEY AUSTRALIA', '11-12-1976', '18-12-1976', 'W', 'CID_003', 'OID_004');
insert into event values('EID_035', 'SYDNEY OLYMPIC', 'SYDNEY AUSTRALIA', '15-11-1976', '20-12-1976', 'M', 'CID_004', 'OID_004');
insert into event values('EID_036', 'SYDNEY OLYMPIC', 'SYDNEY AUSTRALIA', '15-11-1976', '20-12-1976', 'M', 'CID_005', 'OID_004');
insert into event values('EID_037', 'SYDNEY OLYMPIC', 'SYDNEY AUSTRALIA', '15-11-1976', '20-12-1976', 'M', 'CID_006', 'OID_004');
insert into event values('EID_038', 'SYDNEY OLYMPIC', 'SYDNEY AUSTRALIA', '11-12-1976', '18-12-1976', 'W', 'CID_007', 'OID_004');

UPDATE event SET TITLE = 'TORONTO OLYMPIC', LOCATION = 'TORONTO CANADA' WHERE olympiad_id = 'OID_003';
UPDATE event SET TITLE = 'TOKYO OLYMPIC', LOCATION = 'TOKYO JAPAN', olympiad_id = 'OID_001' WHERE EVENT_ID = 'EID_003' AND EVENT_ID = 'EID_002';
DELETE FROM EVENT WHERE EVENT_ID='EID_002' AND EVENT_ID='EID_003';

UPDATE EVENT SET CATEGORY_ID='CID_007' WHERE EVENT_ID='EID_002';
UPDATE EVENT SET START_DATE = '11-11-1964',END_DATE='15-12-1964' WHERE EVENT_ID='EID_006'; 





insert into medal values('MID_001', 'GOLD', 'EID_001', 'IND_001');
insert into medal values('MID_002', 'SILVER', 'EID_002', 'IND_002');
insert into medal values('MID_003', 'GOLD', 'EID_003', 'IND_003');
insert into medal values('MID_004', 'BRONZE', 'EID_004', 'CHN_001');
insert into medal values('MID_005', 'SILVER', 'EID_005', 'CHN_002');
insert into medal values('MID_006', 'GOLD', 'EID_006', 'CHN_003');
insert into medal values('MID_007', 'SILVER', 'EID_007', 'CHN_004');
insert into medal values('MID_008', 'SILVER', 'EID_008', 'CHN_005');
insert into medal values('MID_009', 'GOLD', 'EID_009', 'ARG_001');
insert into medal values('MID_010', 'GOLD', 'EID_010', 'ARG_002');
insert into medal values('MID_011', 'GOLD', 'EID_011', 'ARG_003');
insert into medal values('MID_012', 'BRONZE', 'EID_012', 'AFG_001');
insert into medal values('MID_013', 'GOLD', 'EID_013', 'AFG_002');
insert into medal values('MID_014', 'SILVER', 'EID_014', 'COL_001');
insert into medal values('MID_015', 'BRONZE', 'EID_015', 'COL_002');
insert into medal values('MID_016', 'SILVER', 'EID_016', 'JPN_001');
insert into medal values('MID_017', 'GOLD', 'EID_017', 'AUS_001');
insert into medal values('MID_018', 'SILVER', 'EID_018', 'AUS_002');
insert into medal values('MID_019', 'BRONZE', 'EID_019', 'USA_001');
insert into medal values('MID_020', 'GOLD', 'EID_020', 'USA_002');
insert into medal values('MID_021', 'BRONZE', 'EID_021', 'USA_003');
insert into medal values('MID_023', 'SILVER', 'EID_022', 'GER_001');
insert into medal values('MID_024', 'GOLD', 'EID_023', 'GER_002');

insert into participation values('IND_001', 'EID_001');
insert into participation values('IND_002', 'EID_002');
insert into participation values('IND_003', 'EID_003');
insert into participation values('CHN_001', 'EID_004');
insert into participation values('CHN_002', 'EID_005');
insert into participation values('CHN_003', 'EID_006');
insert into participation values('CHN_004', 'EID_007');
insert into participation values('CHN_005', 'EID_008');
insert into participation values('ARG_001', 'EID_009');
insert into participation values('ARG_002', 'EID_010');
insert into participation values('ARG_003', 'EID_011');
insert into participation values('AFG_001', 'EID_012');
insert into participation values('AFG_002', 'EID_013');
insert into participation values('COL_001', 'EID_014');
insert into participation values('COL_002', 'EID_015');
insert into participation values('JPN_001', 'EID_016');
insert into participation values('AUS_001', 'EID_017');
insert into participation values('AUS_002', 'EID_018');
insert into participation values('USA_001', 'EID_019');
insert into participation values('USA_002', 'EID_020');
insert into participation values('USA_003', 'EID_021');
insert into participation values('GER_001', 'EID_022');
insert into participation values('GER_002', 'EID_023');


select * from country;
select * from athelete;
select * from email;
select * from olympic;
select * from sports_category;
select * from event;
select * from medal;
select * from participation;

desc country;
desc athelete;
desc email;
desc olympic;
desc medal;
desc sports_category;
desc event;
desc participation;

select * from event;

create or replace trigger ath_in_msg
after insert on athelete
for each row
--trigger athelete
begin

dbms_output.put_line('Athelete added in the database successfully');

if sql%rowcount = 0 then
dbms_output.put_line('No rows affected');
end if;

end;
/

create or replace  trigger c_in_msg
after insert on country
for each row

begin

dbms_output.put_line('=> Country added in the database successfully');

if sql%rowcount = 0 then
dbms_output.put_line('No rows affected');
end if;

end;
/

create or replace  trigger em_in_msg
after insert on email
for each row

begin

dbms_output.put_line('=> Email added in the database successfully');

if sql%rowcount = 0 then
dbms_output.put_line('No rows affected');
end if;

end;
/

create or replace  trigger oly_in_msg
after insert on olympic
for each row

begin

dbms_output.put_line('=> Olympic added in the database successfully');

if sql%rowcount = 0 then
dbms_output.put_line('No rows affected');
end if;

end;
/

create or replace  trigger me_in_msg
after insert on medal
for each row

begin

dbms_output.put_line('=> Medal added in the database successfully');

if sql%rowcount = 0 then
dbms_output.put_line('No rows affected');
end if;

end;
/

create or replace  trigger sp_in_msg
after insert on sports_category
for each row

begin

dbms_output.put_line('=> sports_category added in the database successfully');

if sql%rowcount = 0 then
dbms_output.put_line('No rows affected');
end if;

end;
/

create or replace  trigger eve_in_msg
after insert on event
for each row

begin

dbms_output.put_line('=> Event added in the database successfully');

if sql%rowcount = 0 then
dbms_output.put_line('No rows affected');
end if;

end;
/

create or replace  trigger pa_in_msg
after insert on participation
for each row

begin

dbms_output.put_line('=> Participation added in the database successfully');

if sql%rowcount = 0 then
dbms_output.put_line('No rows affected');
end if;

end;
/
select * from country;
insert into country values('NKR', 'NORTH KOREA');

select olympic_id, country_name from athelete a, country c where a.country_id = c.country_id ;

commit