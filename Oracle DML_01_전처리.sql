CREATE TABLE OLYMPIC (
	olympic_id NUMBER NOT NULL,
	host_city CHAR(15) NOT NULL,
	host_year INT NOT NULL,
	CONSTRAINT OLYMPIC_PK PRIMARY KEY (olympic_id)
);

/*
1. 올림픽 테이블에서 host_city 가 '서울' 인 데이터의 모든 정보를 조회해보세요.
2. host_city가 '평양' 데이터를 찾아 '평창'으로 수정해보세요.
3. host_year 정보가 2019인 데이터를 찾아서 삭제해보세요.
*/

INSERT INTO OLYMPIC (olympic_id, host_city, host_year) VALUES (1, '서울', 1988);
INSERT INTO OLYMPIC (olympic_id, host_city, host_year) VALUES (2, '평양', 2024);
INSERT INTO OLYMPIC (olympic_id, host_city, host_year) VALUES (3, '도쿄', 2019);

SELECT * FROM OLYMPIC ;



-- 1
select * from olympic
where host_city = '서울';

--2
update olympic set host_city = '평창'
where host_city = '평양';

--3
delete from olympic where host_year = 2019;

drop table olympic;
------------------------------------------------------------------------------
CREATE TABLE OLYMPIC (
    olympic_id  NUMBER    NOT NULL,
    host_city  VARCHAR2(50) NOT NULL,
    host_year  NUMBER  NOT NULL,
    nation VARCHAR2(50) NOT NULL,
    history VARCHAR2(50),
    CONSTRAINT OLYMPIC_PK PRIMARY KEY (olympic_id)
);
INSERT INTO OLYMPIC (olympic_id, host_city, host_year, nation, history) VALUES (1, '아테나', 2004, '그리스', NULL);
INSERT INTO OLYMPIC (olympic_id, host_city, host_year, nation, history) VALUES (2, '런던', 2012, '영국', NULL);
INSERT INTO OLYMPIC (olympic_id, host_city, host_year, nation, history) VALUES (3, '베이징', 2008, '중국', NULL);
INSERT INTO OLYMPIC (olympic_id, host_city, host_year, nation, history) VALUES (4, '모스크바', 1980, '러시아', NULL);
INSERT INTO OLYMPIC (olympic_id, host_city, host_year, nation, history) VALUES (5, '서울', 1988, '한국', NULL);

select * from olympic;

/*
1. 1980 ~ 2010 사이에 개최된 올림픽 정보를 조회해보세요.
2. 아테나, 로마, 파리, 런던에서 개최한 올림픽들의 정보를 조회해보세요.
3. host_city가 '국' 으로 끝나는 국가가 개최한 올림픽 정보를 조회해보세요.
4. 1896년 이후에 개최된 올림픽의 history를 근대 올림픽으로 수정해보세요.
5. 1889년 이전에 개최된 올림픽의 데이터를 삭제해보세요.
*/

--1
select * from olympic
    where host_year between 1980 and 2010;

--2
select * from olympic
    where host_city in ('아테나','로마','파리','런던');

--3
select * from olympic
    where NATION like '%국';

--4
update olympic set history = '근대 올림픽'
    where host_year > 1895;


--5
DELETE FROM OLYMPIC WHERE HOST_YEAR < 1890;
SELECT * FROM OLYMPIC;

drop table olympic;
------------------------------------------------------------------------------
CREATE TABLE OLYMPIC (
    olympic_id  NUMBER    NOT NULL,
    host_city  VARCHAR2(50) NOT NULL,
    host_year  NUMBER  NOT NULL,
    nation VARCHAR2(50) NOT NULL,
    season VARCHAR2(50) NOT NULL,
    history VARCHAR2(50),
    CONSTRAINT OLYMPIC_PK PRIMARY KEY (olympic_id)
);

INSERT INTO OLYMPIC (olympic_id, host_city, host_year, nation, season, history) VALUES (1, '밴쿠버', 2010, '캐나다', 'winter', NULL);
INSERT INTO OLYMPIC (olympic_id, host_city, host_year, nation, season, history) VALUES (2, '나가노', 1998, '일본', 'winter', NULL);
INSERT INTO OLYMPIC (olympic_id, host_city, host_year, nation, season, history) VALUES (3, '소치', 2014, '러시아', 'winter', NULL);
INSERT INTO OLYMPIC (olympic_id, host_city, host_year, nation, season, history) VALUES (4, '서울', 1988, '대한민국', 'summer', NULL);
INSERT INTO OLYMPIC (olympic_id, host_city, host_year, nation, season, history) VALUES (5, '바르셀로나', 1992, '스페인', 'summer', NULL);
SELECT * FROM OLYMPIC;

/*
- 2001년 이후에 열린 season이 'winter'인 olympic 을 조회해보세요.
- nation 이 '국'으로 끝나거나 1980~2000 에 개최한 올림픽의 정보를
   조회해보세요.
- nation 에 '아' 가 들어가고 1990 년 이후에 개최된 올림픽의 정보를 조회하세요
*/

--1
select * from olympic
    where (season = 'winter') and (host_year > 2000);

--2
select * from olympic
    where (nation like'%국') or (host_year between 1980 and 2000);

--3
select * from olympic
    where (nation like '%아%') and (host_year > 1990);


drop table olympic;
------------------------------------------------------------------------------
CREATE TABLE OLYMPIC (
    olympic_id  NUMBER    NOT NULL,
    host_city  VARCHAR2(50) NOT NULL,
    host_year  NUMBER  NOT NULL,
    nation VARCHAR2(50) NOT NULL,
    season VARCHAR2(50) NOT NULL,
    history VARCHAR2(50),
    CONSTRAINT OLYMPIC_PK PRIMARY KEY (olympic_id)
);
INSERT INTO OLYMPIC (olympic_id, host_city, host_year, nation, season, history) VALUES (1, '도쿄', 2020, '일본', 'summer', '근대 올림픽');
INSERT INTO OLYMPIC (olympic_id, host_city, host_year, nation, season, history) VALUES (2, '베이징', 2008, '중국', 'summer', NULL);
INSERT INTO OLYMPIC (olympic_id, host_city, host_year, nation, season, history) VALUES (3, '런던', 2012, '영국', 'summer', '근대 올림픽');
INSERT INTO OLYMPIC (olympic_id, host_city, host_year, nation, season, history) VALUES (4, '밴쿠버', 2010, '캐나다', 'winter', NULL);
INSERT INTO OLYMPIC (olympic_id, host_city, host_year, nation, season, history) VALUES (5, '리우데자네이루', 2016, '브라질', 'summer', '근대 올림픽');
INSERT INTO OLYMPIC (olympic_id, host_city, host_year, nation, season, history) VALUES (6, '바르셀로나', 1992, '스페인', 'summer', NULL);
INSERT INTO OLYMPIC (olympic_id, host_city, host_year, nation, season, history) VALUES (7, '서울', 1988, '대한민국', 'summer', NULL);
SELECT * FROM OLYMPIC;


/*
위 테이블을 참고하여 다음을 SQL문으로 작성해 보세요.
1. season이 winter가 아닌 올림픽의 정보를 조회해 보세요.
2. nation이 미국, 브라질, 독일, 중국 제외하고 모든 올림픽 정보를 조회해 보세요.
3. history가 비어있지 않은 올림픽 정보만 조회해 보세요.
4. nation에 '아' 가 들어가 있지 않은 올림픽 정보를 조회해 보세요.
*/

--1
select * from olympic
    where season != 'winter';

--2
select * from olympic
    where nation not in ('미국', '브라질', '독일', '중국');

--3
select * from olympic
    where history is not null;

--4
select * from olympic
    where nation not like ('%아%');
------------------------------------------------------------------------------
CREATE TABLE TEAM (
TEAM_NO CHAR(4) ,
TEAM_NM VARCHAR2(50) NOT NULL ,
CONSTRAINT TEAM_PK PRIMARY KEY (TEAM_NO) );

select * from team;
INSERT INTO TEAM (TEAM_NO, TEAM_NM) VALUES ('D001', '마케팅팀');
INSERT INTO TEAM (TEAM_NO, TEAM_NM) VALUES ('D002', '개발팀'); 
commit;

SELECT COUNT(TEAM_NO)
FROM TEAM
WHERE TEAM_NO = 1001 ;