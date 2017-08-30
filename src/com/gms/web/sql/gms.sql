--***************
--2017.08.02
--[1]MAJOR_TAB
--[2]SUBJECT_TAB
--[3]MEMBER_TAB
--[4]PROF_TAB
--[5]STUDENT_TAB
--[6]GRADE_TAB
--[7]BOARD_TAB
--****************
CREATE SEQUENCE article_seq
START WITH 2000
INCREMENT BY 1
NOCACHE
NOCYCLE;
--drop SEQUENCE article_seq;

--*****************
-- Major TABLE
-- 2017.08.02
-- 회원관리 테이블
-- (member_id,name,password,ssn,regdate,
--  major_id,phone,email,profile)
--******************
-- DDL
CREATE TABLE Major(
major_id VARCHAR2(10),
title VARCHAR2(10),
PRIMARY KEY(major_id)
);
alter table major add subj_id  varchar2(10);
alter table major add member_id  varchar2(10);
--drop table Major;

--DML
SELECT * FROM Major;

INSERT INTO Major(major_id,title) VALUES();
UPDATE Major SET %s=''WHERE %s='';
DELETE FROM Major WHERE %s='';

INSERT INTO Major(major_id,title)
VALUES ('art','미술학');
INSERT INTO Major(major_id,title)
VALUES ('computer','컴공');
INSERT INTO Major(major_id,title)
VALUES ('economics','경제학');
INSERT INTO Major(major_id,title)
VALUES ('tourism','관광학');

--*****************
-- Subject TABLE
-- 2017.08.02
-- 회원관리 테이블
-- (member_id,name,password,ssn,regdate,
--  major_id,phone,email,profile)
--******************
-- DDL
CREATE TABLE Subject(
subj_id VARCHAR2(10),
title VARCHAR2(10),
major_id VARCHAR2(10),
PRIMARY KEY(subj_id),
FOREIGN KEY(major_id) REFERENCES Major(major_id) ON DELETE CASCADE
);
--DML
SELECT * FROM Subject;

INSERT INTO Subject(subj_id,title,major_id) VALUES();
UPDATE Subject SET %s=''WHERE %s='';
DELETE FROM Subject WHERE %s='';

INSERT INTO Subject(subj_id,title,major_id)
VALUES ('자바','자바','computer');
INSERT INTO Subject(subj_id,title,major_id)
VALUES ('HTML','HTML','computer');
INSERT INTO Subject(subj_id,title,major_id)
VALUES ('SQL','SQL','computer');
INSERT INTO Subject(subj_id,title,major_id)
VALUES ('CSS','CSS','computer');
INSERT INTO Subject(subj_id,title,major_id)
VALUES ('C언어','C언어','computer');
INSERT INTO Subject(subj_id,title,major_id)
VALUES ('javascript','자스','computer');


--*****************
-- MEMBER TABLE
-- 2017.08.02
-- 회원관리 테이블
-- (member_id,name,password,ssn,regdate,
--  major_id,phone,email,profile)
--******************
--DDL
CREATE TABLE Member(
	member_id VARCHAR2(10),
	name VARCHAR2(10),
	password VARCHAR2(10),
	ssn VARCHAR2(15),
	regdate DATE,
	major_id VARCHAR2(10),
	phone VARCHAR2(20),
	email VARCHAR2(20),
	profile VARCHAR2(20),
	PRIMARY KEY(member_id)
	FOREIGN KEY(major_id) REFERENCES Major(major_id) ON DELETE CASCADE
);
--ALTER TABLE Member ADD major_id VARCHAR2(10); --컬럼생성
--DROP TABLE Member;
--ALTER TABLE Member
--ADD CONSTRAINT member_fk_major
--FOREIGN KEY (major_id)
--REFERENCES Major (major_id) 
--ON DELETE CASCADE; --폴인키 설정
--ALTER TABLE Member
--DROP COLUMN subject; --컬럼 삭제

--DML
SELECT * from major;

SELECT COUNT(*) AS COUNT FROM MEMBER;
SELECT * FROM Member WHERE id='dsd';
INSERT INTO MEMBER(member_id,name,password,ssn,regdate,major_id,phone,email,profile)
VALUES('mankiew','멘큐','1','701201-123456',SYSDATE,'economics','010-1234-1234','mankiew@naver.com','mankiew.jpg');
UPDATE Member SET password='1'WHERE id='dsd';
DELETE FROM Member WHERE id='dsd';


--*****************
-- Prof TABLE
-- 2017.08.02
-- 회원관리 테이블
-- (member_id,name,password,ssn,regdate,
--  major_id,phone,email,profile)
--******************
--DDL
CREATE TABLE Prof(
member_id VARCHAR2(10),
salary VARCHAR2(10),
PRIMARY KEY(member_id),
FOREIGN KEY(member_id) REFERENCES Member (member_id)--식별관계이기 때문에 멤버아이디가 프라이머리키이면서 폴인키이다.
ON DELETE CASCADE
);

--DML
INSERT INTO Prof(member_id,salary) VALUES();
SELECT * FROM Prof;
UPDATE Prof SET %s=''WHERE %s='';
DELETE FROM Prof WHERE %s='';


--*****************
-- Student TABLE
-- 2017.08.02
-- 회원관리 테이블
-- (member_id,name,password,ssn,regdate,
--  major_id,phone,email,profile)
--******************
--DDL
CREATE TABLE Student(
member_id VARCHAR2(10),
stu_no VARCHAR2(8),
PRIMARY KEY(member_id),
FOREIGN KEY(member_id) REFERENCES Member (member_id)
ON DELETE CASCADE
);

--DML
INSERT INTO Student(member_id,stu_no) VALUES();
SELECT * FROM Student;
UPDATE Student SET %s=''WHERE %s='';
DELETE FROM Student WHERE %s='';


--*****************
-- Grade TABLE
-- 2017.08.02
-- 회원관리 테이블
-- (member_id,name,password,ssn,regdate,
--  major_id,phone,email,profile)
--******************
--DDL
CREATE SEQUENCE grade_seq
START WITH 1000
INCREMENT BY 1
NOCACHE
NOCYCLE;
--DROP SEQUENCE grade_seq;
ALTER TABLE Grade
RENAME COLUMN id TO member_id; --테이블명 변경

CREATE TABLE Grade(
	grade_seq NUMBER,
	score VARCHAR2(3),
	exam_date VARCHAR2(12),
	member_id VARCHAR2(10),
	subj_id VARCHAR2(10),
	PRIMARY KEY(grade_seq),
	FOREIGN KEY(member_id) REFERENCES Member(member_id) ON DELETE CASCADE,
	FOREIGN KEY(subj_id) REFERENCES Subject(subj_id) ON DELETE CASCADE
);

--DML
INSERT INTO Grade(greade_seq,score,exam_date,subj_id,member_id) VALUES();
SELECT * FROM Grade;
UPDATE Grade SET %s=''WHERE %s='';
DELETE FROM Grade WHERE %s='';

--*****************
-- Board TABLE
-- 2017.08.02
-- 회원관리 테이블
-- (member_id,name,password,ssn,regdate,
--  major_id,phone,email,profile)
--******************
--DDL
 CREATE TABLE Board(
	article_seq NUMBER,
	member_id VARCHAR2(10),
	title VARCHAR2(50),
	content VARCHAR2(1000),
	hitcount NUMBER,
	regdate DATE,
	PRIMARY KEY(article_seq),
	FOREIGN KEY(member_id) REFERENCES Member(member_id) ON DELETE CASCADE
);
--drop table board;

--DML
INSERT INTO Board(article_seq,member_id,title,content,hitcount,regdate) VALUES(article_seq.nextval,'kia','날씨가 좋다',
'무한한 가슴이 기쁘며, 힘있다..',57,SYSDATE);
SELECT * FROM BOARD;
UPDATE Board SET %s=''WHERE %s='';
DELETE FROM Board WHERE %s='';

--***********
SELECT * FROM tab; --전체 테이블 표시


SELECT id FROM Board WHERE title LIKE '%o%'; --일부문자로 찾기

SELECT * FROM Member m,Board b WHERE m.id=b.id; --멤버아이디와 보드 아이디가 일치하는 테이블 표시

SELECT COUNT(*) FROM Student s,

<!-- ALTER TABLE Member ADD phone varchar2(13) 이미 정해져 있는 테이블 변수를 추가하는 구문 -->



SELECT * FROM test ;
select name from student;

drop table professor;
-- 뷰 1 (스튜던트) 학생목록
drop view test;

create view test(num,member_id,name,ssn,regdate,phone,email,title)
as
select rownum,t.*
from(select a.member_id,a.name,rpad(substr(a.ssn,1,8),14,'*') ssn,to_char(a.regdate,'yyyy-MM-dd') regdate, a.phone, a.email, listagg(s.title,',') within group(order by s.title) title
from member a
left join major m on a.member_id like m.member_id
left join subject s on m.subj_id like s.subj_id
group by a.member_id, a.name,a.ssn,a.regdate,a.phone,a.email
order by regdate desc) t
order by rownum desc;

select t2.*
from(select rownum seq,t.* 
from test
where name like '홍%'
order by num desc) t ) t2
where t2.seq between 1 and 5;

select t.* from (select rownum rnum, s.* from test s where name like '이길동')t where t.rnum between 1 and 5;

select count(*) from test where name like ? ;