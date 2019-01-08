SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS user;




/* Create Tables */

CREATE TABLE board
(
	bnum int(11) NOT NULL,
	mnum int(11) NOT NULL,
	btype int(11) NOT NULL,
	head int(11) NOT NULL,
	subject varchar(100),
	content varchar(500),
	regdate datetime,
	readcnt int(11),
	file1 varchar(200),
	file2 varchar(200),
	file3 varchar(200),
	score int(11),
	PRIMARY KEY (bnum)
);


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
	email varchar(100) NOT NULL,
	nickname varchar(50) NOT NULL,
	password varchar(100) NOT NULL,
	addr1 varchar(10),
	addr2 varchar(100),
	addr3 varchar(50),
	red int,
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



