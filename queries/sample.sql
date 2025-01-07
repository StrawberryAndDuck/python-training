-- Active: 1736246911468@@127.0.0.1@3306@mydb
CREATE TABLE table_name(  
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    create_time DATETIME COMMENT 'Create Time',
    name VARCHAR(255)
) COMMENT '';


INSERT INTO table_name (id, create_time, name) VALUES (1, "2024-09-09", "sung")

INSERT INTO table_name (id, create_time, name) VALUES (2, "2024-09-10", "suxi")

SELECT * FROM table_name
