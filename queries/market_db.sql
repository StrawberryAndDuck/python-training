DROP DATABASE IF EXISTS market_db; -- 만약 market_db가 존재하면 우선 삭제
CREATE DATABASE market_db; -- DB 생성

USE market_db; -- DB market_db 데이터베이스 사용

-- 1. 회원 테이블 생성
CREATE TABLE member -- 회원 테이블
(
    mem_id CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
    mem_name VARCHAR(10) NOT NULL, -- 이름
    mem_number INT NOT NULL,  -- 인원수
    addr CHAR(2) NOT NULL, -- 지역(경기, 서울, 경남 등 2글자로 입력)
    phone1 CHAR(3), -- 연락처의 국번(02, 031, 055 등)
    phone2 CHAR(8), -- 연락처의 나머지 전화번호(하이픈 제외)
    height SMALLINT, -- 평균 키
    debut_date DATE -- 데뷔 일자
);

-- 2. 구매 테이블 생성
CREATE TABLE buy -- 구매 테이블
(
    num INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
    mem_id CHAR(8) NOT NULL, -- 아이디(FK)
    prod_name CHAR(6) NOT NULL, -- 제품 이름
    group_name CHAR(4), -- 분류
    price INT NOT NULL, -- 가격
    amount SMALLINT NOT NULL, -- 수량
    FOREIGN KEY (mem_id) REFERENCES member(mem_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

ALTER TABLE member
ADD COLUMN mem_name VARCHAR(10) NOT NULL, -- 이름
ADD COLUMN mem_number INT NOT NULL,  -- 인원수
ADD COLUMN addr CHAR(2) NOT NULL, -- 지역(경기, 서울, 경남 등 2글자로 입력)
ADD COLUMN phone1 CHAR(3), -- 연락처의 국번(02, 031, 055 등)
ADD COLUMN phone2 CHAR(8), -- 연락처의 나머지 전화번호(하이픈 제외)
ADD COLUMN height SMALLINT, -- 평균 키
ADD COLUMN debut_date DATE; -- 데뷔 일자

3. 데이터 삽입
- 회원 데이터 삽입
INSERT INTO member (mem_id, mem_name, mem_number, addr, phone1, phone2, height, debut_date)
VALUES
    ('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015-10-19'),
    ('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, '2016-08-08'),
    ('WMN', '여자친구', 6, '경기', '031', '33333333', 166, '2015-01-15'),
    ('OMY', '오마이걸', 7, '서울', NULL, NULL, 160, '2015-04-21'),
    ('GRL', '소녀시대', 8, '서울', '02', '44444444', 168, '2007-08-02'),
    ('ITZ', '잇지', 5, '경남', NULL, NULL, 167, '2019-02-12'),
    ('RED', '레드벨벳', 4, '경북', '054', '55555555', 161, '2014-08-01'),
    ('APN', '에이핑크', 6, '경기', '031', '77777777', 164, '2011-02-10'),
    ('MMU', '마마무', 4, '전남', '061', '99999999', 165, '2014.06.19'),
    ('SPC', '우주소녀', 13, '서울', '02', '88888888', 162, '2016-02-25');

-- 구매 데이터 삽입
INSERT INTO buy VALUES(NULL, 'BLK', '지갑', NULL, 30, 2);
INSERT INTO buy VALUES(NULL, 'BLK', '맥북프로', '디지털', 1000, 1);
INSERT INTO buy VALUES(NULL, 'APN', '아이폰', '디지털', 200, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '아이폰', '디지털', 200, 5);
INSERT INTO buy VALUES(NULL, 'BLK', '청바지', '패션', 50, 3);
INSERT INTO buy VALUES(NULL, 'MMU', '에어팟', '디지털', 80, 10);
INSERT INTO buy VALUES(NULL, 'GRL', '혼공SQL', '서적', 15, 5);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 2);
INSERT INTO buy VALUES(NULL, 'APN', '청바지', '패션', 50, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 1);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 4);

DESCRIBE member;
DESCRIBE buy;

SELECT mem_id FROM member;
SELECT * FROM member WHERE mem_id = 'SPC';
SELECT * FROM member;
SELECT * FROM buy;

SHOW DATABASES;
SHOW TABLES;
SHOW DATABASES LIKE 'my%';
SHOW DATABASES LIKE 'market_db';

SELECT SCHEMA_NAME AS 'Database'
FROM information_schema.SCHEMATA
WHERE SCHEMA_NAME = 'market_db'

SELECT *
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'market_db';

SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'market_db';

SELECT addr, debut_date "데뷔 일자", mem_name
FROM member;

SELECT * FROM member WHERE mem_number = 4;

SELECT mem_id, mem_name, mem_number, height
    FROM member
    WHERE height >= 165 AND mem_number > 6;

SELECT mem_name, addr
    FROM member
    WHERE addr  IN('경기', '전남', '경남');

SELECT height FROM member WHERE mem_name = '에이핑크'
SELECT mem_name, height FROM member WHERE height > (SELECT height FROM member WHERE mem_name = '에이핑크');

SELECT mem_id, mem_name, debut_date, height
    FROM member
    WHERE height >= 164
    ORDER BY height DESC, debut_date ASC;

SELECT *
    FROM member
    ORDER BY debut_date
    LIMIT 3, 2;

SELECT DISTINCT addr 
    FROM member
    ORDER BY addr;

SELECT mem_id, amount
    FROM buy
    ORDER BY mem_id;

SELECT mem_id "회원 아이디", SUM(amount)"총 구매 개수"
    FROM buy
    GROUP BY mem_id;

SELECT mem_id "회원 아이디", SUM(amount*price)"총 구매 금액"
    FROM buy
    GROUP BY mem_id;

SELECT AVG(amount) "평균 구매 개수" 
    FROM buy
    GROUP BY mem_id;

SELECT COUNT(phone1)"연락처가 있는 회원"
    FROM member;

SELECT
    COUNT(CASE WHEN phone1 IS NOT NULL THEN 1 END) AS "연락처가 있는 회원",
    COUNT(CASE WHEN Phone1 IS NULL THEN 1 END) AS "연락처가 없는 회원"
    FROM member;

SELECT
    SUM(phone1 IS NOT NULL) AS "연락처가 있는 회원",
    SUM(phone1 IS NULL) AS "연락처가 없는 회원"
    FROM member;

SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액"
    FROM buy
    GROUP BY mem_id
    HAVING SUM(price*amount) > 1000
    ORDER BY SUM(price*amount) DESC;

SELECT * FROM member;
SELECT * FROM member LIMIT 5 OFFSET 3;

SELECT DISTINCT phone1 FROM member;