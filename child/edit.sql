SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS seoul2;
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
	red int(11),
	score double,
	code int(11) NOT NULL,
	PRIMARY KEY (bnum)
);


CREATE TABLE comment
(
	cnum int(11) NOT NULL,
	bnum int(11) NOT NULL,
	mnum int(11) NOT NULL,
	recomment varchar(200) COMMENT '
',
	comdate datetime,
	PRIMARY KEY (cnum)
);


CREATE TABLE seoul2
(
	code int(11) NOT NULL,
	gu varchar(50),
	score int(11),
	name varchar(100),
	type varchar(50),
	nows varchar(50),
	postno varchar(50),
	addr varchar(500),
	tel varchar(100),
	fax varchar(100),
	classcnt int(11),
	square int(11),
	playcnt int(11),
	teachercnt int(11),
	maxchild int(11),
	nowchild int(11),
	bus varchar(50),
	lat varchar(50),
	lon varchar(50),
	homepage varchar(300),
	PRIMARY KEY (code)
);


CREATE TABLE user
(
	mnum int(11) NOT NULL,
	id varchar(50),
	email varchar(100) NOT NULL,
	nickname varchar(50) NOT NULL,
	password varchar(100),
	addr1 varchar(10) NOT NULL,
	addr2 varchar(100) NOT NULL,
	addr3 varchar(50) NOT NULL,
	red int(11),
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
	ADD FOREIGN KEY (code)
	REFERENCES seoul2 (code)
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



