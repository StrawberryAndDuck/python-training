-- Active: 1736246911468@@127.0.0.1@3306@mydb
CREATE TABLE table_name(  
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    create_time DATETIME COMMENT 'Create Time',
    name VARCHAR(255)
) COMMENT '';



INSERT INTO table_name (id, create_time, name) VALUES (1, "2024-09-09", "sung")

INSERT INTO table_name (id, create_time, name) VALUES (2, "2024-09-10", "suxi")

INSERT INTO table_name (id, create_time, name) VALUES (3, "2024-09-11", "suxi2")

INSERT INTO table_name (id, create_time, name) VALUES (10, "2024-09-12", "suxi3")

INSERT INTO table_name (id, create_time, name) VALUES (5, "2024-09-13", "suxi4")

SELECT * FROM table_name

SELECT * FROM table_name WHERE create_time BETWEEN '2024-09-09' and '2024-09-12' LIMIT 100

DESCRIBE table_name

ALTER TABLE table_name COMMENT 'hello world';

SHOW TABLE STATUS WHERE Name = 'table_name';

SELECT DATABASE();

