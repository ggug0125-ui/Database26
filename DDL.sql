select @@hostname;

-- 이창은 메모장처럼 사용됨
-- 스크립트를 1줄씩 실행하는것이 기본임(ctrl + enter)
-- 만약 더미데이터를 20개 입력한다!! (블럭설정 ctrl + shift + enter)
 use sakila; -- sakila 데이터베이스에 가서 사용할께~
 select * from actor; -- actor 테이블에 모든값을 가져와
 use world; -- world 데이터베이스에 가서 사용할께~
 select * from city; -- city 테이블에 모든값을 가져와
 
 CREATE DATABASE DoITSQL;
DROP DATABASE doitsql;
CREATE DATABASE doitsql;
USE doitsql;
CREATE TABLE doit_create_table(
col_1 int,
col_2 VARCHAR(50),
col_3 DATETIME
);
DROP TABLE doit_create_table;
CREATE TABLE doit_dml(
col_1 int,
col_2 VARCHAR(50),
col_3 DATETIME
);
INSERT INTO doit_dml (col_1, col_2, col_3) VALUES (1,'DoItSQL','2026-01-01');
select * FROM doit_dml;
insert into doit_dml(col_1) values('문자 입력');

insert into doit_dml values (2,'열 이름 생략', '2026-01-02');
select * from doit_dml;
insert into doit_dml values (3,'테스트','2026-01-03');
select * from doit_dml;
insert into doit_dml values (4,'col_3 값 생략');
insert into doit_dml(col_1,col_2) values (3,'col_3 값 생략');
select * from doit_dml;
insert into doit_dml(col_1,col_3,col_2) values(4,'2026-01-04','열 순서 변경');
select * from doit_dml;
insert into doit_dml(col_1,col_2,col_3) values (5,'데이터입력5','2026-01-05'),(6,'데이터입력6','2026-01-06'),(7,'데이터입력7','2026-01-07');
select * from doit_dml;

set SQL_SAFE_UPDATES=0;

update doit_dml set col_2 = '데이터수정' where col_1 = 4;
select * from doit_dml;
update doit_dml set col_2 = '데이터수정'
where col_1 = 4;
update doit_dml set col_1 = col_1 + 10;
select * from doit_dml;
delete from doit_dml where col_1 = 14;
select * from doit_dml;
set SQL_SAFE_UPDATES=1;

use sakila;
select first_name from customer;
select first_name, last_name from customer;
select * from customer;
show columns from sakila.customer;
select * from customer where first_name = 'maria';
select * from customer where address_id = 200;
select * from customer where address_id < 200;
select * from customer where first_name = 'maria';
select * from customer where first_name <'maria';
select * from payment
where payment_date = '2005-07-09 13:24:07';
select * from payment
where payment_date < '2005-07-09';
select * from customer where address_id between 5 and 10;
select * from payment where payment_date between '2005-06-17' and '2005-07-19';
select * from payment where payment_date = '2005-07-08 07:33:56';
select * from customer
where first_name between 'm' and 'o';
select * from customer
where first_name not between 'm' and 'o';
select * from city where city = 'sunnyvale' and country_id = 103;
select * from payment
where payment_date >= '2005-06-01' and payment_date <= '2005-07-05';
select * from customer
where first_name = 'maria' or first_name = 'linda';
select * from customer
where first_name = 'maria' or first_name = 'linda' or first_name = 'nancy';
select * from customer
where first_name in ('maria','linda','nancy');
select * from city
where Country_id = 103 or country_id = 86
and city in ('cheju','sunnyvale','dallas'); 
select * from city
where Country_id = 86 or country_id = 103
and city in ('cheju','sunnyvale','dallas');

select * from city
where (country_id = 103 or country_id = 86)
and city in ('cheju','sunnyvale','dallas');

select * from city
where country_id in (103,86)
and city in ('cheju','sunnyvale','dallas');
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

select special_features from film group by spacial_features;

select rating from group by rating;

 