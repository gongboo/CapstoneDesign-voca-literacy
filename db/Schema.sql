DROP DATABASE IF EXISTS Voca;
CREATE DATABASE Voca;
USE Voca;

CREATE TABLE `member`(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(20) NOT NULL,
    loginPw CHAR(60) NOT NULL,
    `authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한레벨(3=일반, 7=관리자)',
    `name` CHAR(20) NOT NULL,
    `nickname` CHAR(20) NOT NULL,
    cellphoneNo CHAR(20) NOT NULL,
    email CHAR(50) NOT NULL
);


INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
authLevel = 7,
`name` = "관리자",
nickname = "관리자",
cellphoneNo = "01011112222",
email = "amdin@gmail.com";

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user1',
loginPw = 'user1',
`name` = "사용자1",
nickname = "사용자1",
cellphoneNo = "01012345678",
email = "user1@gmail.com";

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user2',
loginPw = 'user2',
`name` = "사용자2",
nickname = "사용자2",
cellphoneNo = "01012345672",
email = "user2@gmail.com";

SELECT * FROM `member`;



create table word(
 id int(10) not null primary key auto_increment,
 name char(50) not null,
 same_num int(10),
 `group` char(50),
 `type` char(50),
 origin char(50),
 pronun char(50),
 `usage` char(50),
 derivatice char(50),
 `level` char(50),
 category char(50),
 topic char(50),
 full_ref char(50),
 search_type char(50),
 related_word char(50),
 ref char(50),
 mean char(100),
 example char (100),
 search_num int(20) not null default '0',
 test_num int(20) not null default '0'
);


SELECT * FROM word;

drop table if exists MyVoca;

CREATE TABLE MyVoca(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) NOT NULL,
    WordName char(40) NOT NULL
);

SELECT * FROM MyVoca;

create table freq(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` char(40) not null,
	freq int (10) default 0
);

select * from freq;

update word W inner join freq F on CONCAT('%', W.name, '%') = F.name
set W.test_num = F.freq;

create table Book(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title char(30) NOT NULL,
	writer char(20),
	body varchar(2000) NOT NULL  
);

select * from Book;