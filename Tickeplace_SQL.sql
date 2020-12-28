-- 스키마 추가
   CREATE TABLE WORKER
   (	WORKER_ID NUMBER NOT NULL ENABLE, 
	FIRST_NAME VARCHAR2(50 BYTE), 
	LAST_NAME VARCHAR2(50 BYTE), 
	SALARY NUMBER(10) DEFAULT 0,
  JOINING_DATE DATE, 
	DEPARTMENT VARCHAR2(50 BYTE)
   ) ;
   ALTER TABLE WORKER ADD CONSTRAINT WORKER_PK PRIMARY KEY (WORKER_ID);

   
   CREATE TABLE BONUS
   (	WORKER_REF_ID NUMBER NOT NULL ENABLE, 
	BONUS_DATE DATE,
	BONUS_AMOUNT NUMBER(10) DEFAULT 0,
        FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) 
        ON DELETE CASCADE
   ) ;

   CREATE TABLE TITLE
   (	WORKER_REF_ID NUMBER NOT NULL ENABLE, 
	WORKER_TITLE VARCHAR2(50 BYTE), 
	AFFECTED_FROM DATE,
        FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) 
        ON DELETE CASCADE
   ) ;



-- Worker
insert into worker values ('001', 'Monika', 'Arora', 100000, to_date('2014-02-20 09:00:00','YYYY-MM-DD HH24:MI:SS'), 'HR');
insert into worker values ('002', 'Niharika', 'Verma', 80000, to_date('2014-06-11 09:00:00','YYYY-MM-DD HH24:MI:SS'), 'Admin');
insert into worker values ('003', 'Vishal', 'Singhai', 300000, to_date('2014-02-20 09:00:00','YYYY-MM-DD HH24:MI:SS'), 'HR');
insert into worker values ('004', 'Amitabh', 'Singh', 500000, to_date('2014-02-20 09:00:00','YYYY-MM-DD HH24:MI:SS'), 'Admin');
insert into worker values ('005', 'Vivek', 'Bhati', 500000, to_date('2014-06-11 09:00:00','YYYY-MM-DD HH24:MI:SS'), 'Admin');
insert into worker values ('006', 'Vipul', 'Diwan', 200000, to_date('2014-06-11 09:00:00','YYYY-MM-DD HH24:MI:SS'), 'Account');
insert into worker values ('007', 'Satish', 'Kumar', 75000, to_date('2014-01-20 09:00:00','YYYY-MM-DD HH24:MI:SS'), 'Account');
insert into worker values ('008', 'Geetika', 'Chauhan', 90000, to_date('2014-04-11 09:00:00','YYYY-MM-DD HH24:MI:SS'), 'Admin');

-- Bonus
insert into bonus values ('001', to_date('2016-02-20 00:00:00','YYYY-MM-DD HH24:MI:SS'), 5000);
insert into bonus values ('002', to_date('2016-06-11 00:00:00','YYYY-MM-DD HH24:MI:SS'), 3000);
insert into bonus values ('003', to_date('2016-02-20 00:00:00','YYYY-MM-DD HH24:MI:SS'), 4000);
insert into bonus values ('001', to_date('2016-02-20 00:00:00','YYYY-MM-DD HH24:MI:SS'), 4500);
insert into bonus values ('002', to_date('2016-06-11 00:00:00','YYYY-MM-DD HH24:MI:SS'), 3500);

-- Title
insert into title values ('001', 'Manager', to_date('2016-02-20 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into title values ('002', 'Executive', to_date('2016-06-11 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into title values ('008', 'Executive', to_date('2016-06-11 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into title values ('005', 'Manager', to_date('2016-06-11 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into title values ('004', 'Asst. Manager', to_date('2016-06-11 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into title values ('007', 'Executive', to_date('2016-06-11 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into title values ('006', 'Lead', to_date('2016-06-11 00:00:00','YYYY-MM-DD HH24:MI:SS'));
insert into title values ('003', 'Lead', to_date('2016-06-11 00:00:00','YYYY-MM-DD HH24:MI:SS'));



-- 2
select a.first_name as worker_name
from worker a;


-- 3
select *
from worker
order by first_name asc;


-- 4
select w.worker_id,
       w.first_name,
       w.last_name,
       w.salary,
       w.joining_date,
       w.department,
       t.worker_title,
       t.affected_from
FROM worker w, title t
WHERE w.worker_id=t.worker_ref_id
AND t.worker_title in ('Manager');


