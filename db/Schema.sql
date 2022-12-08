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

alter table `member` add column Level int(10) not null default '0';

update `member` set level = 3 where id = 2;

SELECT * FROM `member`;

drop table if exists word;


create table word(
 id int(10) not null primary key auto_increment,
 name varchar(50) not null,
 same_num int(10),
 `type` varchar(50),
 origin varchar(50),
 pronun varchar(50),
 `usage` varchar(100),
 `level` int(10),
 topic varchar(50),
 related_word varchar(100),
 mean varchar(500),
 example varchar (1000),
 search_num int(20) not null default '0',
 test_num int(20) not null default '0'
);


insert into word
set name = "정형성",
type = "명사",
`mean` = "일정한 형식을 띠는 성질",
`example` = "작중 인물의 정형성은 곧 소설 문학이 리얼리티의 추구와 가장 밀접한 관계에 있음을 입증하는 것이기도 하다." ;

insert into word
set name = "관념적",
type = "명사",
`mean` = "	관념에만 사로잡혀 있는 것.",
`example` = "그는 매사를 관념적으로 판단한다." ;

insert into word
set name = "관념적",
type = "관형사",
`mean` = "관념에만 사로잡혀 있는.",
`example` = "관념적 사랑." ;

insert into word
set name = "유교적",
type = "관형사",
`mean` = "유교에서 행하거나 따르는 방법이나 방식의 것.",
`example` = "향약은 유교적 이념을 널리 보급하기 위한 목적으로 실시되었다." ;
           
SELECT * FROM word where name LIKE CONCAT('%', "가", '%');
select * from word ;
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

update word W inner join freq F on W.name LIKE CONCAT('%', F.name, '%')
set W.test_num = F.freq;


create table Book(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title char(30) NOT NULL,
	writer char(20),
	body varchar(2000) NOT NULL  
);

select * from Book;


create table search(
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    wordName VARCHAR(10) NOT NULL,
    memberId INT(10) NOT NULL,
    searchDate DATETIME NOT NULL
);

select * from search;

alter table MyVoca add column type SMALLINT(2) not null default '0';

