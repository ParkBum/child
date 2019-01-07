SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS user;




/* Create Tables */

CREATE TABLE board
(
   `bnum` INT(11) NOT NULL,
   `mnum` INT(11) NOT NULL,
   `btype` INT(11) NOT NULL,
   `head` INT(11) NULL DEFAULT NULL,
   `subject` VARCHAR(100) NULL DEFAULT NULL,
   `content` VARCHAR(500) NULL DEFAULT NULL,
   `regdate` DATETIME NULL DEFAULT NULL,
   `readcnt` INT(11) NULL DEFAULT NULL,
   `file1` VARCHAR(200) NULL DEFAULT NULL,
   `file2` VARCHAR(200) NULL DEFAULT NULL,
   `file3` VARCHAR(200) NULL DEFAULT NULL,
   `red` INT(11) NULL DEFAULT NULL,
   `score` DOUBLE NULL DEFAULT NULL,
   PRIMARY KEY (`bnum`),
   INDEX `mnum` (`mnum`),
   CONSTRAINT `board_ibfk_1` FOREIGN KEY (`mnum`) REFERENCES `user` (`mnum`)
)



CREATE TABLE comment
(
	cnum int(11) NOT NULL,
	bnum int(11) NOT NULL,
	mnum int(11) NOT NULL,
	comment varchar(200) COMMENT '
',
	comdate datetime,
	PRIMARY KEY (cnum)
);


CREATE TABLE user
(
	mnum int(11) NOT NULL,
	id varchar(50) NOT NULL,
	email varchar(100) NOT NULL,
	nickname varchar(50) NOT NULL,
	password varchar(100) NOT NULL,
	addr1 varchar(10),
	addr2 varchar(100),
	addr3 varchar(50),
	PRIMARY KEY (mnum)
);



/* Create Foreign Keys */

ALTER TABLE comment
	ADD FOREIGN KEY (bnum)
	REFERENCES board (bnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (mnum)
	REFERENCES user (mnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE comment
	ADD FOREIGN KEY (mnum)
	REFERENCES user (mnum)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



