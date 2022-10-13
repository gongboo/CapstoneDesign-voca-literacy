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

CREATE TABLE word(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `name` CHAR(20) NOT NULL,
    mean CHAR(80) NOT NULL,
    `type` CHAR(60) NOT NULL
);

INSERT INTO word
SET regDate = NOW(),
updateDate = NOW(),
`name` = "사람",
mean = "생각을 하고 언어를 사용하며, 도구를 만들어 쓰고 사회를 이루어 사는 동물.",
`type` = "명사";

INSERT INTO word
SET regDate = NOW(),
updateDate = NOW(),
`name` = "과일",
mean = "나무 따위를 가꾸어 얻는, 사람이 먹을 수 있는 열매. 대개 수분이 많고 단맛 또는 신맛이 난다.",
`type` = "명사";

INSERT INTO word
SET regDate = NOW(),
updateDate = NOW(),
`name` = "미워하다",
mean = "밉게 여기거나 밉게 여기는 생각을 직접 행동으로 드러내다.",
`type` = "동사";

INSERT INTO word
SET regDate = NOW(),
updateDate = NOW(),
`name` = "예쁘다",
mean = "생긴 모양이 아름다워 눈으로 보기에 좋다.",
`type` = "형용사";

SELECT * FROM word;