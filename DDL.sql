select @@hostname;

-- 이창은 메모장처럼 사용됨
-- 스크립트를 1줄씩 실행하는것이 기본임(ctrl + enter)
-- 만약 더미데이터를 20개 입력한다!! (블럭설정 ctrl + shift + enter)
 use sakila; -- sakila 데이터베이스에 가서 사용할께~
 select * from actor; -- actor 테이블에 모든값을 가져와
 use world; -- world 데이터베이스에 가서 사용할께~
 select * from city; -- city 테이블에 모든값을 가져와
 
 
CREATE DATABASE DoITSQL; -- 데이터베이스 생성
DROP DATABASE doitsql;   -- 데이터베이스 삭제
CREATE DATABASE doitsql; -- 데이터베이스 생성 후
USE doitsql;  			-- 선택
CREATE TABLE doit_create_table(  -- 테이블 생성하기
col_1 int,
col_2 VARCHAR(50),
col_3 DATETIME
);
DROP TABLE doit_create_table;	-- 테이블 삭제해보기
CREATE TABLE doit_dml(			-- 테이블을 생성하고
col_1 int,  -- 정수처리
col_2 VARCHAR(50),  --  공백을 50칸 bar는 공백을 50을 쓰지않코 사용한부분만 인식
col_3 DATETIME  -- 날짜 시간
);
INSERT INTO doit_dml (col_1, col_2, col_3) VALUES (1,'DoItSQL','2026-01-01');  -- 삽입해보기
select * FROM doit_dml; -- 삽입된 내용 출력 (데이터베이스 출력)
 -- insert into doit_dml(col_1) values('문자 입력');  --오류발생 예시

insert into doit_dml values (2,'열 이름 생략', '2026-01-02'); -- 열이름 생략하고 데이터삽입
select * from doit_dml; -- 조회 출력
insert into doit_dml values (3,'테스트','2026-01-03');	-- 테스트해봄
select * from doit_dml; -- 조회 출력
insert into doit_dml values (4,'col_3 값 생략');		-- 열개수 불일치로 오류(,,,)요거 맞아야함
insert into doit_dml(col_1,col_2) values (3,'col_3 값 생략');  -- 특정열에만 데이터삽입
select * from doit_dml; -- 조회 출력
insert into doit_dml(col_1,col_3,col_2) values(4,'2026-01-04','열 순서 변경'); -- 삽입순서가 변경되도 출력될땐 변하지않는다
select * from doit_dml; -- 조회 출력
insert into doit_dml(col_1,col_2,col_3) values (5,'데이터입력5','2026-01-05'),(6,'데이터입력6','2026-01-06'),(7,'데이터입력7','2026-01-07');
-- 여러 데이터 한번에 삽입
select * from doit_dml; -- 조회 출력

set SQL_SAFE_UPDATES=0;	-- 안전모드 비활성화

 -- update doit_dml set col_2 = '데이터수정' where col_1 = 4;	-- 이건 오류값이나온다

update doit_dml set col_2 = '데이터수정' -- 데이터 수정 4열에 2행을 수정한다
where col_1 = 4;
update doit_dml set col_1 = col_1 + 10;	-- 테이블 전체 수정 1행 순번을 전부 10을 더해바
select * from doit_dml; -- 출력확인
delete from doit_dml where col_1 = 14; -- 14번 열을 전부 삭제해 열삭제
select * from doit_dml; -- 출력확인

set SQL_SAFE_UPDATES=1;	-- 안전모드 활성화

use sakila; -- 폴더 사용할꺼야~!!
select first_name from customer; -- 커스토머 파일에 첫번째이름 만 조회해~
select first_name, last_name from customer; -- 커스토머 파일에 첫번째이름 마지막이름 조회해
select * from customer; -- 모두 조회 출력
show columns from sakila.customer;
select * from customer where first_name = 'maria';  -- 커스토머 파일에 첫번째이름에 마리아 찾아
select * from customer where address_id = 200;  -- 주소 id 가 200 을 찾아
select * from customer where address_id < 200; --  주소아이디가 200미만을 찾아
select * from customer where first_name = 'maria'; -- 첫번째이름 마리아인 행을 찾아
select * from customer where first_name <'maria'; -- 첫번째 이름 마리아의 미만인 행을 찾아
select * from payment 
where payment_date = '2005-07-09 13:24:07'; -- 날짜 시간에 맞는 행을 찾아
select * from payment
where payment_date < '2005-07-09'; -- 날짜에 미만인 행을 찾아
select * from customer where address_id between 5 and 10; -- 주소가 5이상 10미만을 찾아
select * from payment where payment_date between '2005-06-17' and '2005-07-19'; -- 포함하는 날짜 가져와
select * from payment where payment_date = '2005-07-08 07:33:56'; -- 정확한 날짜 조회
select * from customer
where first_name between 'm' and 'o'; -- 첫번째이름 m~o 사이 가져와
select * from customer
where first_name not between 'm' and 'o'; -- 첫번째이름 m~o 빼고 가져와
select * from city where city = 'sunnyvale' and country_id = 103;  -- 도시가 써니밸르 이고 아이디가 103인거 가져와
select * from payment
where payment_date >= '2005-06-01' and payment_date <= '2005-07-05'; -- 6/1일~7/5일 사이값가져와
select * from customer
where first_name = 'maria' or first_name = 'linda'; -- 마리아나 린다 가져와
select * from customer
where first_name = 'maria' or first_name = 'linda' or first_name = 'nancy';  -- 마리아 린다 낸시 가져와
select * from customer
where first_name in ('maria','linda','nancy'); -- in을 쓸수도이써 간편하고 좋아
select * from city
where Country_id = 103 or country_id = 86
and city in ('cheju','sunnyvale','dallas'); -- 오류값

select * from city
where Country_id = 86 or country_id = 103
and city in ('cheju','sunnyvale','dallas'); -- 오류값

select * from city
where (country_id = 103 or country_id = 86)
and city in ('cheju','sunnyvale','dallas'); -- ()이용해서 우선순위를 정한다음 조회해

select * from city
where country_id in (103,86)
and city in ('cheju','sunnyvale','dallas'); -- 이게 가장 가독성있고 좋아~!!


select * from address;
select * from address where address2 = null; -- 눌인 데이터조회 -조회오류
select * from address where address2 is null; -- 눌인 데이터 조회
select * from address where address2 is not null; -- 눌이 아닌 데이터 조회
select * from address where address2 = ''; -- null갑사 아닌 데이터 조회
select * from customer order by first_name; -- 첫이름 정렬
select * from customer order by last_name; -- 마지막이름 정렬
select * from customer order by store_id, first_name; -- 아이디 랑 첫이름 정렬
select * from customer order by first_name,store_id; -- 아이디 정렬
select * from customer order by first_name asc; -- 오름차순
select * from customer order by first_name desc; -- 내림차순
select * from customer order by store_id desc, first_name asc; -- 내림 오름차순
select * from customer order by store_id desc, first_name asc limit 10;  -- 10번째 줄까지
select * from customer order by store_id desc, first_name asc limit 100,10;  -- 100번째에서 10개 데이터조회
select * from customer order by store_id asc limit 10 offset 100; -- 100개 건너뛰고 101번째부터 10개 데이터조회
select * from customer where first_name like 'a%';    -- 첫번째 글자 A조회
select * from customer where first_name like 'aa%';    -- 첫번째 글자 AA로 시작하는문자열 조회
select * from customer where first_name like '%a';  -- a로 끝나는 문자열 조회
select * from customer where first_name like '%ra'; -- ra로 끝나는 문자열 조회
select * from customer where first_name like '%a%'; -- a를 포함한 문자열 조회
select * from customer where first_name not like 'a%'; -- aㅀ 시작하지 않는 문자열 조회
with cte (col_1) as(  -- 특수문자를 포함한 임의의 테이블 생성
select 'a%bc' union all
select 'a_bc' union all
select 'abc'           -- 공통 테이블 표현식
)
select * from cte;         -- 테이블을 조회하여 데이터확인

with cte (col_1) as(
select 'a%bc' union all
select 'a_bc' union all
select 'abc'
)
select * from cte where col_1 like '%';    -- %포함한 데이터

with cte (col_1) as(
select 'a%bc' union all
select 'a_bc' union all
select 'abc'
)
select * from cte where col_1 like '%#%%' escape '#'; -- escape 로 특수문자 %포함 데이터

with cte (col_1) as(
select 'a%bc' union all
select 'a_bc' union all
select 'abc'
)
select * from cte where col_1 like '%!%%' escape '!';    -- !로 특수문자 % 포함데이터
select * from customer where first_name like 'a_';    -- a로 시작 문자열 길이가 2인데이터
select * from customer where first_name like 'a__';		-- a로 시작 문자열길이 3인 데이터
select * from customer where first_name like '__a';		-- a로 끝나면서 문자열 3인데이터
select * from customer where first_name like 'a__a';	-- a로시작 a로 끝나면서 문자열 4인데이터
select * from customer where first_name like '_____';	-- 문자열길이 5인데이터
select * from customer where first_name like 'a_r%';	-- a_R로 시작하는 문자열
select * from customer where first_name like '__r%';	-- r 로 시작하는 문자열
select * from customer where first_name like 'a%r';		-- a로 시작 r로 끝나는 문자열
select * from customer where first_name regexp 'k[l-n]'; -- [...]를 사용해 데이터조회
select * from customer where first_name regexp 'k[^l-n]'; -- [^--]을 사용해 데이터조회
select * from customer where first_name like 's%' and first_name regexp 'a[l-n]'; -- %와 [--]을 사용해 데이터조회

select * from customer where first_name like '_______'  -- 와일드 카드 조합으로 데이터 조회
and first_name regexp 'a[L-N]'
and first_name regexp 'O$';

select special_features from film group by special_features; -- 필름파일에  special_features여기 행에 뭐가있는지 통으로 가져와

select rating from film group by rating; -- 필름 파일에 rating 행가져와
select special_features, rating from film group by special_features, rating; 
-- special_features,rating 행을 가져와 (두개 데이터에서 원하는 행을 각각가져올때)
select rating, special_features from film group by special_features, rating; 
-- 파일 순서를 바꿔바 처음 입력란부터 우선순위야

select special_features, count(*) as cnt from film group by special_features;
-- 카운트함수로 데이터 갯수 세기야~ cnt행을 만들어서 갯수를 세워줘~~~

select special_features, rating, count(*) as cnt from film
group by special_features, rating order by special_features,rating, cnt DESC;
-- 그룹화한 데이터에 정렬까지 추가한거야
-- 그릅화 기준이되는열이 필요함, select문에 사용한 열을 반드시 group by 절에도 사용해야해~!!!

select special_features, rating from film
group by special_features, rating
having rating = 'g';
-- special_features, rating 행을  그룹화하고 rating에 있는 g값만 가져와

select special_features, count(*) as cnt from film
group by special_features
having cnt > 70;
-- special_features 행에 데이터 갯수를 세바~ 갯수가 70개 이상인것만 찾아줘~

select special_features, count(*) as cnt from film
group by special_features
having rating = "g";
-- 선택한 파일에 그룹화를 하고 그룹화한 파일이 아닌 행에 필터링을 할경우 오류뜬다

select special_features, rating, count(*) as cnt from film
group by special_features, rating
having rating = 'r' and cnt > 8;
-- 두개 행을 카운트해서 세어놔, 그리고 두개행을 그룹으로 뭉쳐, 그런담에 rating행에 R이고 카운트가 8이상인걸 찾아와

select distinct special_features, rating from film;
-- 두개 행에 열의 중복을 제거한다

select distinct special_features, rating from film
group by special_features, rating;
-- 그룹바이로 두개 행을 그룹화했다 상동이다~!! 그런다고 같은게아냐~!! 구냥 저건 중복된값 없애고 넌 그룹화한거 뿐야


use doitsql;
create table doit_increment (
id int auto_increment primary key, 
uid varchar(50) not null unique,
password varchar(255) not null,
name varchar(50) not null
);					-- 파일을 만들어서 행을 만들어 객체를 만드는거야

insert into doit_increment (uid,password,name) value('kkk','0000','김기원');
insert into doit_increment (uid,password,name) value('lhj','0000','임효정'); -- 열안에 정보를 입력해
select * from doit_increment; -- 출력해보자

insert into doit_increment (uid,password,name) value('aaa','0000','김동동'); -- 열안에 추가해서 입력해
select * from doit_increment; -- 출력해바

insert into doit_increment (uid,password,name) value('ccc','1.0000 2.1111','박동동');
select * from doit_increment; -- 출력해바

insert into doit_increment (uid,password) value('hhh','1234');
select * from doit_increment; -- 출력해바 이건 오류난다...

select last_insert_id(); -- 마지막 생성데이터를 조회

alter table doit_increment auto_increment = 100;   -- 자동으로 입력되는 값을 설정할수있다 100부터~~~~
insert into doit_increment (uid,password,name) values ('시작값이 변경되었을까?', '0000','hhhh');
select * from doit_increment; -- 출력해바
 
set @@auto_increment_increment = 5;  		-- 자동으로 입력되는 값을 5씩 증가 시킬수있어~~~
insert into doit_increment (uid,password,name) values ('5씩증가?1','0000','ㅎㅎㅎ');
insert into doit_increment (uid,password,name) values ('5씩증가?2','1111','ㄱㄱㄱ');
select * from doit_increment; -- 출력해바

create table doit_insert_select_from(
col_1 int,
col_2 varchar(10)
);			-- 프롬테이블에 객체생성했어

create table doit_insert_select_to(
col_1 int,
col_2 varchar(10)
);			-- 투 테이블에 객체 동일생성했어

insert into doit_insert_select_from values (1,'do');
insert into doit_insert_select_from values (2,'it');
insert into doit_insert_select_from values (3,'mysql'); -- 프롬 테이블에 생성했어 3개만든거야
select * from doit_insert_select_from; -- 출력해바

insert into doit_insert_select_to
select * from doit_insert_select_from;  -- 프롬파일을 조회해서 투 테이블에 입력해~~ 복사하기개념인가???

select * from doit_insert_select_to; -- 투 테이블 조회해바~ 

create table doit_select_new as (select * from doit_insert_select_from);   -- 새테이블에 프롬테이블 자료를 가져와~~ 새파일 복사하기???
select * from doit_select_new; -- 출력해바

create table doit_parent(col_1 int primary key);  -- 부모 파일
create table doit_child(col_1 int);      -- 자식파일
select * from doit_parent; -- 출력해바


alter table doit_child
add foreign key (col_1) references doit_perent(col_1); -- 부모파일 키를 자식파일에 입력해??? 이거맞나?
select * from doit_child; -- 출력해바
 
insert into doit_child values(1);  -- 자식파일에 1값을 입력해
select * from doit_child;

insert into doit_parent values (1); -- 부모파일에 1값입력
insert into doit_child values (1); -- 자식파일에 1값입력
select * from doit_parent;
select * from doit_child;

delete from doit_parent where col_1 = 1;
select * from doit_parent;

delete from doit_child where col_1 = 1;
delete from doit_parent where col_1 = 1;
select * from doit_child;
select * from doit_parent;

drop table doit_parent; -- 부모 삭제
drop table doit_child; -- 자식삭제

create table doit_parent (col_1 int primary key);   -- 부모테이블 제약조건 확인
create table doit_child (col_1 int);
alter table doit_child add foreign key (col_1) references doit_parent(col_1); -- 외래키 생성했어
show create table doit_child; -- 출력하니 키생성이 됨  --> CREATE TABLE `doit_child` ( ..........

alter table doit_child -- 수정해보자 자식아
drop constraint doit_child_ibfk_1;  -- 외래키를 없앨꺼야
#                          외래키
drop table doit_perent;  -- 부모한테도 없앨꺼야
show create table doit_parent;  -- 부모가 없어졌나?? 에러뜨더라.. 몰라..

use doitsql;
create table doit_float (col_1 float);
insert into doit_float values (0.7);
select * from doit_float where col_1 = 0.7;  -- 0.7은 소수점숫자라 정확한 값을 가지고 있지않어 그래서 빈결과를 가져오는거여

select 10/3;

use doitsql;  -- 새로만들자
create table doit_char_varchar(            -- 테이블 만들어~~~문자열 배울꺼야~~~
col_1 char(5),
col_2 varchar(5)
);
insert into doit_char_varchar values ('12345','12345');
insert into doit_char_varchar values ('ABCDE','ABCDE');
insert into doit_char_varchar values ('가나다라마','가나다라마');
insert into doit_char_varchar values ('hello','안녕하세요');
insert into doit_char_varchar values ('安寧安寧安','安寧安寧安');
select
col_1, char_length(col_1) as char_length, length(col_1) as char_byte,
col_2, char_length(col_2) as char_length, length(col_2) as char_byte
from doit_char_varchar;

show character set;  -- 문자 집합확인

create table doit_collation(
col_latin1_general_ci varchar(10) collate latin1_general_ci,
col_latin1_general_cs varchar(10) collate latin1_general_cs,
col_latin1_bin varchar(10) collate latin1_bin,
col_latin7_general_ci varchar(10) collate latin7_general_ci
);

insert into doit_collation values ('a','a','a','a');
insert into doit_collation values ('b','b','b','b');
insert into doit_collation values ('A','A','A','A');
insert into doit_collation values ('B','B','B','B');
insert into doit_collation values ('*','*','*','*');
insert into doit_collation values ('_','_','_','_');
insert into doit_collation values ('!','!','!','!');
insert into doit_collation values ('1','1','1','1');
insert into doit_collation values ('2','2','2','2');

select col_latin1_general_ci from doit_collation order by col_latin1_general_ci;
select col_latin1_general_cs from doit_collation order by col_latin1_general_cs;
select col_latin1_bin from doit_collation order by col_latin1_bin;
select col_latin7_general_ci from doit_collation order by col_latin7_general_ci;

create table date_table(    -- 날짜랑 시간알아보자
justdate date,  -- 날짜
justtime time,	-- 시간
justdatetime datetime,	 -- 날짜 시간
justtimestamp timestamp); -- 날짜시간 접속시간 스탬프~~~~

insert into date_table values (now(),now(),now(),now()); -- 현재시간조회
select * from date_table; -- 출력해봐









