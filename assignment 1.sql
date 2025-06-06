CREATE DATABASE Assignment;

USE Assignment;



-- create Dept table script

CREATE TABLE dept (   
  deptno     TINYINT(2) NOT NULL,   
  dname      VARCHAR(14),   
  loc        VARCHAR(13),   
  CONSTRAINT pk_dept PRIMARY KEY (deptno)   
);


 -- create emp table script


CREATE TABLE emp (   
  empno    SMALLINT NOT NULL,   
  ename    VARCHAR(10),   
  job      VARCHAR(9),   
  mgr      SMALLINT,   
  hiredate DATE,   
  sal      DECIMAL(7,2),   
  comm     DECIMAL(7,2),   
  deptno   TINYINT,   
  CONSTRAINT pk_emp PRIMARY KEY (empno),   
  CONSTRAINT fk_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)   
);



-- Insert script for dept

insert into DEPT (DEPTNO, DNAME, LOC) 
values (10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

-- --------------------------------------------
 -- Insert script for emp
-- -------------------------------

INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
VALUES (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
 (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10),
 (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20),
 (7788, 'SCOTT', 'ANALYST', 7566, '1987-07-13', 3000, NULL, 20),
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20),
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30),
 (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
 (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30),
(7876, 'ADAMS', 'CLERK', 7788,'1987-07-13', 1100, NULL, 20),
 (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30),
 (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);
 
 -- assignment queries
 -- where
 -- q 1 WAQTD THE ANNUAL SALARY OF THE EMPLOYEE WHOS NAME IS SMITH

 select sal*12 as annual_salary from emp
 where ename='smith';
 
 -- q 2 .WAQTD NAME OF THE EMPLOYEES WORKING AS CLERK
 
 select ename from emp
 where job='clerk';
 
 -- q 3 WAQTD SALARY OF THE EMPLOYEES WHO ARE WORKING AS SALESMAN
 
 select sal from emp
 where job='salesman';
 
 -- q 4 WAQTD DETAILS OF THE EMP WHO EARNS MORE THAN 2000
 use assignment;
 select * from emp
 where sal>2000 or (sal+comm)>2000;
 
 -- q 5 WAQTD DETAILS OF THE EMP WHOS NAME IS JONES
 use assignment;
 select * from emp
 where ename='jones';
 
 -- q 6 WAQTD DETAILS OF THE EMP WHO WAS HIRED AFTER 01-JAN-81
 
 select * from emp
 where hiredate  > '1981-01-01';
 
 -- q 7 WAQTD NAME AND SAL ALONG WITH HIS ANNUAL SALARY IF THE ANNUAL SALARY IS MORE THAN 12000
select ename,sal,sal*12 as annual_salary from emp 
where sal*12>12000;

-- q 8 WAQTD EMPNO OF THE EMPLOYEES WHO ARE WORKING IN DEPT 30

select empno from emp
where deptno=30;

-- q 9 WAQTD ENAME AND HIREDATE IF THEY ARE HIRED BEFORE 1981

select ename,hiredate from emp
where hiredate < '1981-01-01';

-- q 10 WAQTD DETAILS OF THE EMPLOYEES WORKING AS MANAGER

select * from emp
where job='manager';

-- q 11 WAQTD NAME AND SALARY GIVEN TO AN EMPLOYEE IF EMPLOYEE EARNS A COMMISSION OF RUPEES 1400

select ename,sal from emp
where comm=1400;

-- q 12 WAQTD DETAILS OF EMPLOYEES HAVING COMMISSION MORE THAN SALARY

select * from emp
where comm>sal;

-- q 13 WAQTD EMPNO OF EMPLOYEES HIRED BEFORE THE YEAR 87

select empno from emp
where hiredate< '1987-01-01'; 

-- q 14 WAQTD DETAILS OF EMPLOYEES WORKING AS AN N ANALYST

select * from emp
where job='analyst';

-- q 15  WAQTD DETAILS OF EMPS EARNING MORE THAN 2000 RUPEES PER MONTH 

select * from emp
where sal > 2000 or (sal+comm)>2000;

-- ASSIGNMENT ON LOGICAL OPERATORS

-- q 1 WAQTD DETAILS OF THE EMPLOYEES WORKING AS CLERK AND EARNING LESS THAN 1500

 select * from emp
 where job='clerk' and sal<1500;
 
 -- q 2 WAQTD NAME AND HIREDATE OF THE EMPLOYEES WORKING AS MANAGER IN DEPT 30 
 
 select ename,hiredate from emp 
 where job='manager' and deptno=30;
 
 -- q 3 WAQTD DETAILS OF THE EMP ALONG WITH ANNUAL SALARY IF THEY ARE WORKING IN DEPT 30 AS SALESMAN 
 -- AND THEIR ANNUAL SALARY HAS TO BE GREATER THAN 14000
 
 select *,sal*12 as annual_salary from emp
 where deptno=30 and job='salesman' and sal*12 > 14000;
 
 -- q 4 WAQTD ALL THE DETAILS OF THE EMP WORKING IN DEPT 30 OR AS ANALYST
 
 select * from emp 
 where deptno=30 or job='analyst';

-- q 5 WAQTD NAMES OF THE EMPMLOYEES WHOS SALARY IS LESS THAN 1100 AND THEIR DESIGNATION IS CLERK

select ename from emp
where sal<1100 and job='clerk';

-- q 6 WAQTD NAME AND SAL, ANNUAL SAL AND 
-- DEPTNO IF DEPTNO IS 20 EARNING MORE THAN 1100 AND ANNUAL SALARY EXCEEDS 12000
 
 select ename,sal,sal*12 as annual_salary,deptno from emp
 where deptno=20 and sal>1100 and sal*12>12000;
 
 -- q 7 WAQTD EMPNO AND NAMES OF THE EMPLOYEES WORKING AS MANAGER IN DEPT 20

select empno,ename from emp 
where job='manager' and deptno=20;

-- q 8 WAQTD DETAILS OF EMPLOYEES WORKING IN DEPT 20 OR 30.

select * from emp
where deptno in (20,30);

-- q 9 WAQTD DETAILS OF EMPLOYEES WORKING AS ANALYST IN DEPT 10.

select * from emp
where job='analyst' and deptno=10;

-- q 10 WAQTD DETAILS OF EMPLOYEE WORKING AS PRESIDENT WITH SALARY OF RUPEES 4000 

select * from emp
where job='president' and sal>=4000;

-- 11.WAQTD NAMES AND DEPTNO, JOB OF EMPS WORKING AS CLERK IN DEPT 10 OR 20

select ename,deptno,job from emp
where job= 'clerk' and deptno in (10,20);

-- q 12 WAQTD DETAILS OF EMPLOYEES WORKING AS CLERK OR MANAGER IN DEPT 10

select * from emp
where job='clerk' and deptno=10;

-- q 13 WAQTD NAMES OF EMPLOYEES WORKING IN DEPT 10, 20, 30, 40.

select ename from emp
where deptno in (10,20,30,40);

-- q 14 WAQTD DETAILS OF EMPLOYEES WITH EMPNO 7902,7839.

select * from emp 
where empno in (7902,7839);

-- q 15 WAQTD DETAILS OF EMPLOYEES WORKING AS MANAGER OR SALESMAN OR CLERK

select * from emp
where job in('manager','clerk','salesman');

-- q 16 WAQTD NAMES OF EMPLOYEES HIRED AFTER 81 AND BEFORE 87

select ename,hiredate from emp
where hiredate between '1981-12-31' and '1987-01-01';

-- q 17 WAQTD DETAILS OF EMPLOYEES EARNING MORE THAN 1250 BUT LESS THAN 3000
use assignment;
select* from emp
where (sal >1250 or (sal+comm)>1250) and (sal<3000 or (sal+comm)<3000);

-- q 18 WAQTD NAMES OF EMPLOYEES HIRED AFTER 81 INTO DEPT 10 OR 30

select ename from emp
where hiredate > '1981-12-31' and deptno in (10,30);

-- q 19  WAQTD NAMES OF EMPLOYEES 
-- ALONG WITH ANNUAL SALARY FOR THE EMPLOYEES WORKING AS MANAGER OR CLERK INTO DEPT 10 OR 30 

select ename,sal*12 as annual_salary from emp
where job in ('manager','clerk') and deptno in (10,30);

-- q 20 WAQTD ALL THE DETAILS ALONG WITH ANNUAL SALARY 
-- IF SAL IS BETWEEN 1000 AND 4000 ANNUAL SALARY MORE THAN 15000

select *,sal*12 as annual_salary from emp
where sal between 1000 and 4000 and sal*12>15000;

-- ASSIGNMENT ON SEPCIAL OPERATORS:

-- q 1 LIST ALL THE EMPLOYEES WHOSE COMMISSION IS NULL

select ename from emp
where comm is null;

-- q 2  LIST ALL THE EMPLOYEES WHO DON'T HAVE A REPORTING MANAGER

select ename from emp
where mgr is null;

-- q 3 LIST ALL THE SALESMEN IN DEPT 30
use assignment;
select * from emp
where job in ('salesman') and deptno in (30);

-- q 4 LIST ALL THE SALESMEN IN DEPT NUMBER 30 AND HAVING SALARY GREATER THAN 1500

select ename from emp
where job='salesman' and deptno=30 and sal>1500;

-- q 5 LIST ALL THE EMPLOYEES WHOSE NAME STARTS WITH 'S' OR 'A'

select ename from emp
where ename like 'A%' or ename like 's%';

-- q 6 LIST ALL THE EMPLOYEES EXCEPT THOSE WHO ARE WORKING IN DEPT 10 & 20.

select * from emp
where deptno not in (10,20);

-- q 7 LIST THE EMPLOYEES WHOSE NAME DOES NOT START WITH 'S'

select ename from emp
where ename not like 's%';

-- q 8 LIST ALL THE EMPLOYEES WHO ARE HAVING
-- REPORTING MANAGERS IN DEPT 10

select ename from emp
where mgr is not null and deptno =10;

-- q 9 LIST ALL THE EMPLOYEES WHOSE COMMISSION IS NULL AND WORKING AS CLERK

select ename from emp
where comm is null and job='clerk';

-- q 10 LIST ALL THE EMPLOYEES WHO DON'T HAVE A REPORTING MANAGER IN DEPTNO 10 OR 30

select ename from emp
where mgr is null and deptno in (10,30);

-- q 11 LIST ALL THE SALESMEN IN DEPT 30 WITH SAL MORE THAN 2450

select ename,job from emp
where deptno=30 and sal>2450;

-- q 12 LIST ALL THE ANALYST IN DEPT NUMBER 20 AND HAVING SALARY GREATER THAN 2500

select * from emp
where job='analyst' and deptno=20 and sal>2500;

-- q 13 LIST ALL THE EMPLOYEES WHOSE NAME STARTS WITH 'M' OR 'J'

select ename from emp
where ename like 'm%' or ename like 'j%';

-- q 14 LIST ALL THE EMPLOYEES WITH ANNUAL SALARY EXCEPT THOSE WHO ARE WORKING IN DEPT 30

select ename,sal*12,deptno as annual_salary from emp
where deptno != 30;

-- q 15 LIST THE EMPLOYEES WHOSE NAME DOES NOT END WITH 'ES' OR 'R'
use assignment;
select * from emp
where ename not like '%es' and ename not like '%r';

-- q 16 LIST ALL THE EMPLOYEES WHO ARE HAVING REPORTING MANAGERS 
-- IN DEPT 10 ALONG WITH 10% HIKE IN SALARY
select * from emp;
select *,sal+sal*(10/100) as salary_hike from emp 
where mgr is not null and deptno=10;

-- q 17 DISPLAY ALL THE EMPLOYEE WHO ARE
-- 'SALESMAN'S HAVING 'E' AS THE LAST BUT ONE
-- CHARACTER IN ENAME BUT SALARY HAVING EXACTLY 4 CHARACTER

select ename ,job from emp 
where ename like '%E' and ename not like '%e%e%';

desc emp;

-- q 18 DISPLAY ALL THE EMPLOYEE WHO ARE JOINED AFTER YEAR 81

select ename,hiredate from emp
where hiredate > '1981-12-31';

-- q 19 DISPLAY ALL THE EMPLOYEE WHO ARE JOINED IN FEB

select ename,hiredate from emp 
where hiredate like'____-02-%';

-- 20 LIST THE EMPLOYEES 
-- WHO ARE NOT WORKING AS MANAGERS AND CLERKS IN DEPT 10 AND 20
--  WITH A SALARY IN THE RANGE OF 1000 TO 3000.
use assignment;
select ename,job,deptno,sal from emp
where deptno in (10,20) and job not in ('manager','clerk') and sal between 1000 and 3000;

--  ASSIGNEMENT ON MRF()

-- q 1 WAQTD NUMBER OF EMPLOYEES GETTING SALARY LESS THAN 2000 IN DEPTNO 10

select count(ename) from emp 
where sal <2000 and deptno=10;

-- q 2 .WAQTD TOTAL SALARY NEEDED TO PAY EMPLOYEES WORKING AS CLERK

select sum(sal) as total_salary from emp
where job='clerk';

-- q 3 WAQTD AVERAGE SALARY NEEDED TO PAY ALL EMPLOYEES

select avg(sal) as avg_sal from emp;

-- q 4 WAQTD NUMBER OF EMPLOYEES HAVING 'A' AS THEIR FIRST CHARACTER

select count(*) from emp
where ename like 'A%';

-- q 5 WAQTD NUMBER OF EMPLOYEES WORKING AS CLERK OR MANAGER

select count(*) from emp
where job in ('clerk','manager');

-- q 6 WAQTD TOTAL SALARY NEEDED TO PAY EMPLOYEES HIRED IN FEB

select sum(sal) from emp
where hiredate like '____-02-%';

-- q 7 WAQTD NUMBER OF EMPLOYEES REPORTING TO 7839 (MGR) 

select count(*) from emp
where mgr=7839;

-- q 8 WAQTD NUMBER OF EMPLOYEES GETTING COMISSION IN DEPTNO 30

select count(*) from emp
where comm is not null and deptno=30;

-- q 9 WAQTD AVG SAL, TOTAL SAL, NUMBER OF EMPS AND MAXIMUM SALARY 
-- GIVEN TO EMPLOYEES WORKING AS PERSIDENT

select avg(sal) as avg,sum(sal) as total,count(*) as employees,max(sal) as maximum 
from emp
where job='president';

-- q 10. WAQTD NUMBER OF EMPLOYEES HAVING 'A' IN THEIR NAMES

select count(*) from emp
where ename like '%A%' or ename like 'A%' or ename like '%A%A%';

-- q 11 WAQTD NUMBER OF EMPS AND TOTAL SALARY NEEDED TO PAY THE 
-- EMPLOYEES WHO HAVE 2 CONSICUTIVE L's IN THEIR NAMES

select count(*) from emp
where ename like '%LL%';

-- q 12 WAQTD NUMBER OF DEPARTMENTS PRESENT IN
-- EMPLOYEE TABLE

select  count(distinct deptno) as number_of_depts from emp;
 
 -- q 13 WAQTD NUMBER OF EMPLOYEES HAVING CHARACTER 'Z' IN THEIR NAMES

select count(*) from emp
where ename like '%z%' or ename like '%z%z%' or ename like 'Z%Z%';

-- q 14 WAQTD NUMBER OF EMPLOYEES HAVING '$' IN THEIR NAMES.

select count(*) from emp
where ename like'$';

-- q 15 WAQTD TOTAL SALARY GIVEN TO EMPLOYEES WORKING AS CLERK IN DEPT 30

select sum(sal) from emp
where job='clerk' and deptno=30;

-- q 16  WAQTD MAXIMUM SALARY GIVEN TO THE EMPLOYEES WORKING AS ANALYST

select max(sal) from emp
where job='analyst';

-- q 17 WAQTD NUMBER OF DISTINCT SALARIES PRESENT IN EMPLOYEE TABLE

select distinct sal from emp;

-- q 18 WAQTD NUMBER OF JOBS PRESENT IN EMPLOYEE TABLE 

select count(distinct job) as job from emp; 

-- q 19. WATQD AVG SALARY GIVEN TO THE CLERK

select avg(sal) from emp
where job='clerk';

-- 20 WAQTD MINIMUM SALARY GIVEN TO THE EMPLOYEES WHO WORK IN DEPT 10 AS MANAGER OR A CLERK

select min(sal) from emp
where deptno=10 and job in ('manager','clerk');

-- ASSIGNMENT QUESTIONS ON GROUP BY

-- 1 WAQTD NUMBER OF EMPLOYEES WORKING IN EACH DEPARTEMENT EXCEPT PRESIDENT.

select job,count(*) as employees from emp
where job!= 'president'
group by job;

-- 2 WAQTD TOTAL SALARY NEEDED TO PAY ALL THE EMPLOYEES IN EACH JOB.

select distinct job,sum(sal) as total_sal from emp
group by job;

-- q 3 WAQTD NUMBER OF EMPLOYEEES WORKING AS MANAGER IN EACH DEPARTMENT.

select count(distinct deptno) from emp
where job='manager'
group by deptno;

-- q 4 WAQTD AVG SALARY NEEDED TO PAY ALL THE EMPLOYEES 
-- IN EACH DEPARTMENT EXCLUDING THE EMPLOYEES OF DEPTNO 20.

select job,avg(distinct sal) from emp
where deptno=20
group by job; 

-- q 5 WAQTD NUMBER OF EMPLOYEES HAVING CHARACTER 'A' IN THEIR NAMES IN EACH JOB.

select  job,count(distinct ename) from emp
where ename like '%A%'
group by job;
use assignment;
-- q 6 WAQTD NUMBER OF EMPLOYEES AND AVG SALARY NEEDED TO PAY THE EMPLOYEES
--  WHO SALARY IN GREATER THAN 2000 IN EACH DEPT.

select distinct deptno,count(ename),avg(sal) from emp
where sal>2000
group by deptno;

-- 7.WAQDTD TOTAL SALARY NEEDED TO PAY AND NUMBER OF SALESMANS IN EACH DEPT.

select distinct deptno, sum(sal),count(job) from emp
where job='salesman'
group by deptno;

-- q 8 WAQTD NUMBER OF EMPLOYEES WITH THEIR MAXIMUM SALARIES IN EACH JOB.

select distinct job,count(*),max(sal) from emp
group by job;

-- q 9 WAQTD MAXIMUM SALARIES GIVEN TO AN EMPLOYEE WORKING IN EACH DEPT.

select distinct deptno,max(sal) from emp
group by deptno;

-- q 10 WAQTD NUMBER OF TIMES THE SALARIES PRESENT IN EMPLOYEE TABLE.

select sal ,count(sal) from emp
group by sal;

-- 10/03/2025
-- q 1 no_of employee in each job in which emp have character a.
use assignment;
select count(*) , job from emp
where ename like '%A%'
group by job;

-- q 2 sum of sam to each job

select sum(sal) from emp
group by job;

-- q 3 
select max(sal),deptno from emp
group by deptno,
having max(sal)>4000;

-- q 4 
select count(*),deptno from emp
group by deptno;

 -- q 5 
 select count(*),deptno from emp 
 group by deptno
 having count(*)<=3;
 
 -- q 6 
 select distinct sal from emp;

-- q 7
select sal,count(*) from emp
group by sal
having count(sal)>1;

-- q 8 
select ename,count(*) from emp
group by ename
having ename>1;

-- q 9 
select * from emp
order by sal;

-- q 10

use assignment;

select * from emp 
order by ename
limit 5 offset 6;

select * from emp 
order by ename
limit 2 offset 3;

-- 11/03/2025

-- q 1

select ename,sal from emp
where sal>2850;

-- sub query
-- q 2

select ename,sal from emp
where sal> (select sal from emp
			where ename='Blake');
            
-- q 3 
select * from emp
where  hiredate> (select hiredate from emp
				  where ename='Blake');

-- q 4
select ename,deptno,sal from emp
where deptno=(select deptno from emp
              where ename='smith');
              
-- q 5
select ename,sal,deptno from emp
where  sal>2000 and deptno=(select deptno from emp
              where ename='James' );   

-- q 6

select ename,sal from emp
where sal>(select sal from emp
           where ename='Smith') 
and sal< (select sal from emp 
          where ename = 'King');
          
-- q 7
select count(*) from emp
where sal>(select sal from emp 
           where ename='Smith')
and job='Manager';

-- q 8

select ename,sal,deptno,hiredate from emp
where deptno=(select deptno from emp
              where ename='James')
and sal> (select sal from emp
          where ename='Adams')
and job=(select job from emp
	     where ename='Miller')
and hiredate>(select hiredate from emp 
              where ename='Martin');


-- q 9 

select dname from dept
where deptno=(select deptno from emp
              where ename='King');
              
-- q 10

select count(*) from emp
where deptno=(select deptno from DEPT 
              where dname='RESEARCH');
           
-- q 11
select count(*) from emp 
where sal>(select sal from emp
		   where ename='SMITH')
and deptno=(select deptno from dept
            where dname='ACCOUNTING');

-- q 12

select max(sal) from emp;

-- q 13
select max(sal) from emp
where sal<(select max(sal) from emp);

-- q 14

select max(sal) from emp
where sal<(select max(sal) from emp
           where sal<(select max(sal) from emp));

-- 12/03/2025           
-- q 1
use assignment;

select dname from dept
where deptno= (select deptno from emp where ename='Allen');

-- q 2 
select dname from dept
where deptno in (select deptno from emp where ename in ('King','Blake'));

-- q 3
select ename from emp
where mgr=(select empno from emp
where ename='King');

-- q 4 need new table sir will give in assignment

-- q 5
select ename from emp
where empno = (select mgr from emp
where ename='Blake');

-- q 6
 select ename from emp 
 where empno=(select mgr from emp
               where ename='Smith');

-- q 7
select ename from emp 
where empno=(
select mgr from emp
where empno =(select mgr from emp
where ename='Smith'));

select * from emp;

use assignment;

-- q 1

select ename,dname from emp natural join dept;

-- 
create table girls(gid int,gname varchar(10));
alter table girls
add constraint pk_gid primary key (gid);
insert into girls(gid,gname) values(1,'Chinni'),(2,'Sundri'),(3,'Dummi'),(4,'Motu');

create table boys (bid int,bname varchar(10),gid int,  CONSTRAINT fk_gid FOREIGN KEY (gid)
 REFERENCES girls (gid));   
 
 insert into boys(bid,bname,gid) values (1,'Sundra',2),(2,'Chintu',1),(3,'Dumma',4),(4,'motu',3),(5,'Sonu',null);
 
 select * from girls;
 
 select gname,bname from boys natural join girls;
 
 select * from boys;
 
 select bname,gname from boys inner join girls
 on boys.gid=girls.gid;
 
 insert into girls(gid,gname) values(5,'Teena');

select bname,gname from boys left join girls
 on boys.gid=girls.gid;
 
 -- cross join
 
select bname,gname from boys cross join girls;


select bname,gname from boys cross join girls
on boys.gid=girls.gid;
 
 -- inner join 
 
select bname,gname from boys inner join girls;
  
select bname,gname from boys cross join girls
on boys.gid=girls.gid;

-- outer join
-- left outer
select bname,gname from boys left outer join girls
on boys.gid=girls.gid;

-- right outer
select bname,gname from boys right join girls
on boys.gid=girls.gid;

-- full outer

select bname,gname from boys full join girls;


-- self jon
select ename,dname from emp self join emp;

use assignment;

-- assignment 2

-- assignment on subquery

-- 1.WAQTD NAME OF THE EMPLOYEES EARNING SALARY MORE THAN THE SALESMAN
use assignment;
alter table dept 
add Loc varchar(20);
select * from dept;
select ename from emp where sal > all (select sal from emp where job='salesman');
 
-- 2. WAQTD DETAILS OF THE EMPLOYEES HIRED AFTER ALL THE CLERKS

select * from emp where hiredate > all(select hiredate from emp where job='Clerk');

-- 3. WAQTD NAME AND SALARY FOR ALL THE EMPLOYEES IF THEY ARE EARNING LESS THAN ATLEST A MANAGER 

select ename,sal from emp where sal < all(select sal from emp where job='manager');

-- 4.WAQTD NAME AND HIREDATE OF EMPLOYEES HIRED BEFORE ALL THE MANAGERS

select ename,hiredate from emp where hiredate < all(select hiredate from emp where job='Manager');

-- 5 WAQTD NAMES OF THE EMPLOYEES HIRED AFTER ALL THE MANAGERS AND EARNING SALARY
--  MORE THAN ALL THE CLERKS
use assignment;
select ename from emp where hiredate > all(select hiredate from emp 
                                           where job = 'manager') and
                                           sal> all(select sal from emp 
                                           where job='clerk');

-- 6 WAQTD DETAILS OF THE EMPLOYEES WORKING AS CLERK AND HIRED BEFORE ATLEST A SALESMAN

select * from emp where job='Clerk' and hiredate< all(select hiredate from emp where job='salesman');

-- 7 WAQTD DETAILS OF EMPLOYEES WORKING IN ACCOUNTING OR SALES DEPT

select * from emp where deptno in (select deptno from dept
                                   where job in ('Accounting','Sales'));
                                   
-- 8 WAQTD DEPARTMENT NAMES OF THE EMPOYEES WITH NAME SMITH, KING AND MILLER

select dname from dept where deptno in (select deptno from emp where ename in ('smith','king','miller'));

-- 9. WAQTD DETAILS OF EMPLOYEES WORKING NEWYORK OR CHICAGO

select * from emp 
where deptno = all (select deptno from dept
                    where loc='Chicago');
-- 10 WAQTD EMP NAMES IF EMPLOYEES ARE HIRED AFTER ALL THE EMPLOYEES OF DEPT 10

select ename from emp where hiredate > all(select hiredate from emp where deptno=10);

-- ASSIGNMENT ON CASE 1

-- 1 WAQTD NAME OF THE EMPLOYEES EARNING MORE THAN ADAMS

select ename from emp where sal > all(select sal from emp where ename='adams');

-- 2 WAQTD NAME AND SALARY OF THE EMPLOYEES EARNING LESS THAN KING

select ename,sal from emp where sal < all (select sal from emp where ename='King');

-- 3 WAQTD NAME AND DEPTNO OF THE EMPLOYEES IF THEY ARE WORKING IN THE SAME DEPT AS JONES

select ename,deptno from emp where job in ( select job from emp where ename='Jones');

-- 4 WAQTD NAME AND JOB OF ALL THE EMPLOYEES WORKING IN THE SAME DESIGNATION AS JAMES

select ename ,job from emp where job in (select job from emp where ename = 'James');

-- 5 WAQTD EMPNO AND ENAME
--  ALONG WITH ANNUAL SALARY OF ALL THE EMPLOYEES IF THEIR ANNUAL SALARY IS
-- GREATER THAN WARDS ANNUAL SALARY.
use assignment;
select empno,ename,sal*12 as Annual_Sal from emp 
where sal*12 > all (select sal*12 from emp where ename='Ward');

-- 6 WAQTD NAME AND HIREDATE OF THE EMPLOYEES IF THEY ARE HIRED BEFORE SCOTT

select ename,hiredate from emp where hiredate < all (select hiredate from emp where ename='Scott');

-- 7 WAQTD NAME AND HIREDATE OF THE EMPLOYEES IF THEY ARE HIRED AFTER THE PRESIDENT

select ename,hiredate from emp where hiredate > (select hiredate from emp where job = 'President');

-- 8 WAQTD NAME AND SAL OF THE EMPLOYEE IF THEY ARE EARNING SAL LESS THAN THE EMPLOYEE WHOS EMPNO IS 7839 

select ename,sal from emp where sal< all (select sal from emp where empno=7939);

-- 9 WAQTD ALL THE DETAILS OF THE EMPLOYEES IF THE EMPLOYEES ARE HIRED BEFORE MILLER

select * from emp where hiredate < all (select hiredate from emp where ename='Miller');

-- 10 WAQTD ENAME AND EMPNO OF THE EMPLOYEES IF EMPLOYEES ARE EARNING MORE THAN ALLEN

select ename,empno from emp where sal > all(select sal from emp where ename = 'allen');

-- 11 WAQTD ENAME AND SALARY OF ALL THE EMPLOYEES WHO ARE EARNING MORE THAN MILLER BUT LESS THAN ALLEN.

select ename,sal from emp where sal > all (select sal from emp where ename='Miller')
                                    and sal < all(select sal from emp where ename='Allen');
                                    
-- 12 WAQTD ALL THE DETAILS OF THE EMPLOYEES WORKING IN DEPT 20 AND WORKING IN THE SAME DESIGNATION 
-- AS SMITH 

select * from emp where deptno=20 and job in (select job from emp where job in (select job from emp where ename='sMITH'));

-- 13 WAQTD ALL THE DETAILS OF THE EMPLOYEES WORKING AS MANAGER IN THE SAME DEPT AS TURNER

select * from emp where job='Manager' and  deptno in (select deptno from emp where ename='turner');

-- 14 WAQTD NAME AND HIREDATE OF THE EMPLOYEES HIRED AFTER 1980 AND BEFORE KING

select ename,hiredate from emp where hiredate > '1980-12-31' and hiredate < (select hiredate from emp where ename='King');

-- 15  WAQTD NAME AND SAL ALONG WITH ANNUAL SAL FOR ALL EMPLOYEES
--  WHOS SAL IS LESS THAN BLAKE AND MORE THAN 3500

select ename,sal,sal*12 as Annual_Salary from emp 
where sal < all(select sal from emp where ename='Blake') and sal> 3500;

-- 16  WAQTD ALL THE DETAILS OF EMPLOYEES WHO EARN MORE THAN SCOTT BUT LESS THAN KING

select * from emp 
where sal > all(select sal from emp where ename='Scott' ) 
and sal < all(select sal from emp where ename='King');

-- 17 WAQTD NAME OF THE EMPLOYEES WHOS NAME STARTS WITH 'A' AND WORKS IN THE SAME DEPT AS BLAKE

select ename from emp 
where ename like 'A%' and deptno=(select deptno from emp where ename like 'blake');

-- 18 WAQTD NAME AND COMM IF EMPLOYEES EARN COMISSION AND WORK IN THE SAME DESIGNATION AS SMITH

select ename,comm from emp where comm  = (select comm from emp where ename ='Smith')
and job = all (select job from emp where ename='Smith');

-- 19 WAQTD DETAILS OF ALL THE EMPLOYEES WORKING AS
-- CLERK IN THE SAME DEPT AS TURNER.

select * from emp 
where job = 'clerk' and deptno= all (select deptno from emp where ename='Turner');

-- 20 WAQTD ENAME, SAL AND DESIGNATION
--  OF THE EMPLOYEES WHOS ANNUAL SALARY IS MORE THAN SMITH AND LESS THAN KING,

select ename,sal,job from emp 
where sal*12 > (select sal*12 from emp where ename ='Smith')
and  sal*12 < (select sal*12 from emp where ename='King');

-- ASSIGNMENT ON CASE 2:
-- 1.WAQTD DNAME OF THE EMPLOYEES WHOS NAME IS SMITH

select dname from dept where deptno = (select deptno from emp where ename='Smith');



-- 2 WAQTD DNAME AND LOC OF THE EMPLOYEE WHOS ENAME IS KING

select dname,loc from dept 
where deptno = all (select deptno from emp where ename='king'); 

-- 3 WAQTD LOC OF THE EMP WHOS EMPLOYEE NUMBER IS 7902

select loc from dept where
deptno= all (select deptno from emp where empno=7902);

-- 4 WAQTD DNAME AND LOC ALONG WITH DEPTNO OF THE EMPLOYEE WHOS NAME ENDS WITH 'R'.

select dname,loc,deptno from dept
where deptno= all (select deptno from emp 
                   where ename like '%r'); -- no  so n use

-- 5 .WAQTD DNAME OF THE EMPLOYEE WHOS DESIGNATION IS PRESIDENT
use assignment;
select dname from dept
where deptno=(select deptno from emp 
              where job='President');

-- 6  WAQTD NAMES OF THE EMPLOYEES WORKING IN ACCOUNTING DEPARTMENT

select ename from emp 
where deptno= all (select deptno from dept where dname='Accounting');

-- 7 WAQTD ENAME AND SALARIES OF THE EMPLOYEES WHO ARE WORKING IN THE LOCATION CHICAGO
select ename,sal from emp
where deptno= all (select deptno from dept
				   where loc='Chicago');
                                                  
-- 8  WAQTD DETAILS OF THE EMPLOYEES WORKING IN SALES

select * from emp 
where deptno= all (select deptno from emp
                   where dname = 'sales');
                   
-- 9 WAQTD DETAILS OF THE EMP ALONG WITH ANNUAL SALARY IF EMPLOYEES 
-- ARE WORKING IN NEW YORK

select *,sal*12 from emp 
where deptno= all (select deptno from dept 
                   where loc='New York');
                   
-- 10.WAQTD NAMES OF EMPLOYEES WORKING IN OPERATIONS DEPARTMENT

use assignment;
select ename from emp
where deptno= all(select deptno from dept
			     where dname='Operations');
                 -- 0r where dname='sales');
                 
-- ASSIGNMENT ON CASE 1 & 2
-- 1.WAQTD NAMES OF THE EMPLOYEES EARNING MORE THAN SCOTT IN ACCOUNTING DEPT
use assignment;
select ename from emp 
where sal > (select sal from emp 
             where ename='Scott')
			 and deptno=(select deptno from dept
						 where dname='accounting');

-- 2 WAQTD DETAILS OF THE EMPLOYEES WORKING AS MANAGER IN THE LOCATION CHICAGO
select * from emp 
where job='manager' and deptno=(select deptno from dept
                                where loc='chicago');
-- 3 WAQTD NAME AND SAL OF THE EMPLOYEES EARNING MORE THAN KING IN THE DEPT ACCOUNTING
use assignment;
select ename,sal from emp
where sal > (select sal from emp
where ename='King') and deptno=(select deptno from dept
where dname='Accounting');

-- 4 WAQTD DETAILS OF THE EMPLOYEES WORKING AS SALESMAN IN THE DEPARTEMENT SALES

select * from emp
where job = 'salesman' and deptno = (select deptno from dept
where dname='Sales');

-- 5  WAQTD NAME, SAL, JOB, HIREDATE OF THE EMPLOYEES WORKING IN OPERATIONS DEPARTMENT AND HIRED
-- BEFORE KING

select ename,job,sal,hiredate from emp
where hiredate< all (select hiredate from emp
where ename='king') and deptno=all(select deptno from dept
where dname='Operations');

-- 6 DISPLAY ALL THE EMPLOYEES WHOSE DEPARTMET NAMES ENDING 'S'.

select * from emp
where deptno in (select deptno from dept 
where dname like '%s');

-- 7 WAQTD DNAME OF THE EMPLOYEES WHOS NAMES HAS CHARACTER 'A' IN IT.

select dname from dept 
where deptno in (select deptno from emp
where ename like '%A%'); 

-- 8 WAQTD DNAME AND LOC OF THE EMPLOYEES WHOS SALARY IS RUPEES 800.
select dname,loc from dept
where deptno= all (select deptno from emp
                   where sal =800);

-- 9  WAQTD DNAME OF THE EMPLOYEES WHO EARN COMISSION
use assignment;
select dname from dept
where deptno in (select deptno from emp
where comm is not null);

-- 10 WAQTD LOC OF THE EMPLOYEES IF THEY EARN COMISSION IN DEPT 40

select loc from dept
where deptno= all (select deptno from emp
                   where deptno=40);


-- class queries

-- 1 
select ename,job,sal,dname from emp e inner join dept d
on e.deptno=d.deptno;

-- 2 
select e.* ,dname,loc from emp e inner join dept d
on e.deptno=d.deptno
where job='Manager';

-- 3 

use hr;

select concat(first_name,' ',last_name) as Full_Name,department_name,salary from 
employees e inner join departments d
on e.department_id=d.department_id
where department_name='IT';

-- 4 
select first_name,last_name,phone_number,hire_date,salary,department_id
from employees
where department_id= 60 and salary > 2000;

-- 5

select concat(first_name,' ',last_name),department_name,city from employees e
inner join departments d on e.department_id=d.department_id
inner join locations l on l.location_id=d.location_id; 

-- 6 
select concat(first_name,' ',last_name),department_name,city,country_name from employees e
inner join departments d on e.department_id=d.department_id
inner join locations l on l.location_id=d.location_id
inner join countries c on c.country_id = l.country_id;

-- 7 
 select concat(first_name,' ',last_name),department_name,city,country_name from employees e
inner join departments d on e.department_id=d.department_id
inner join locations l on l.location_id=d.location_id
inner join countries c on c.country_id = l.country_id
inner join regions r on r.region_id= c.region_id;

-- 8 
use hr;
select count(*),department_name from
employees e inner join departments d 
on e.department_id=d.department_id
group by department_name
order by count(*) asc;

-- 9 

select first_name,salary,department_name from employees e
inner join departments d
on e.department_id=d.department_id
where salary > all(select salary from employees
where first_name='neena');

select * from emp;

select * from dept;

-- 17/03/2025
-- self join
-- 1
select e1.ename,e2.ename as "manager's_name" from emp e1 join emp e2
on e1.mgr=e2.empno
where e1.ename='Smith';

-- 2

select e1.ename,e2.ename as "manager's_name",e3.ename as "manager's manager name" from emp e1 join emp e2
on e1.mgr=e2.empno join emp e3
on e2.mgr=e3.empno
where e1.ename like'Smith';

-- 3 

select e1.ename,e2.ename as "manager's_name",e1.sal,e2.sal as manager_salary,
e1.hiredate,e2.hiredate as manager_hiredate,e1.job,e2.job as manager_job
from emp e1 join emp e2
on e1.mgr=e2.empno
where e1.ename='Smith';

-- 4

select ename from emp 
where ename like '%dd%' escape 'd';

-- 18/03/2025
-- 1
-- string functions
select ename from emp
where substring(ename,1,1)='k';

-- 2 
select ename,substring(ename,1,2) from emp;

-- set functions
-- union all
select distinct deptno from emp
union all
select deptno from dept;

-- union
select deptno from emp
union
select deptno from dept;

-- intersection

select deptno from emp
intersect 
select deptno from dept;

-- string function 
-- length
select length('banana');
select ename,length(ename) from emp;
-- concat
select concat(ename,' ',job) from emp;

-- concat_ws
select concat_ws('_',ename,job,hiredate,sal) from emp;

-- reverse

select ename,reverse(ename) from emp;

-- upper

select upper(ename) from emp;
select upper('kowshika');

-- lower
select lower(ename) from emp;
select lower('ARCHANA');

-- substring

select ename,substring(ename,1,2) from emp;

select substring('Kowshika',1,6);

select substring('Kowshika',1,1)='K';

-- replace

select replace("Kowshika is pretty","pretty","Sweet");

-- trim
select trim('    HII GUYS   ');

-- ltrim
select ltrim('   HII GUYS   ');
-- HII GUYS  

-- rtrim

select rtrim('      HIII GUYS               '); 

-- REPEAT
select repeat('Kowshika ',4);

select repeat(concat(ename,' '),5) as "repeated" from emp;

-- lpad

select lpad('Kowshi',10,'Attu'); -- it means totally 10 characters that is kowshi is 6 and attu is 4

-- rpad

select rpad('Kowshi',12,'Attu');

-- task  banana a's present

select len('banana')-len(replace('banana','a',null);

-- numeric functions

select mod(10,4);

-- q 4
select ename,sal from emp
where mod(sal,2)=0;

-- sqrt

select sqrt(625);

-- power
select power(10,4);

-- pi

select pi();

-- DATE functions

-- current date

select current_date();

-- sys_date

select sysdate();

-- extract

select extract(year from hiredate) from emp;

select extract(month from current_date);

select extract(day from current_date);

-- 20/03/2025
-- q1
select dname from dept
where deptno in (select deptno from emp);
-- or 
select dname from dept
where exists(select deptno from emp
             where emp.deptno=dept.deptno);
-- q2
-- windows function
use assignment;
-- select ename,sal,sum(sal),deptno
-- over(partition by deptno order by deptno) as deptno from emp;

-- q4

select ename,sal,rank() over(order by sal desc) as Ranks from emp;

-- q5
select ename,sal,dense_rank() over(order by sal desc) as Ranks from emp;

-- q 6

select ename,sal,lead(sal) over(order by sal desc) as Leadd from emp;

-- q7


select ename,sal,lag(sal) over(order by sal desc) as Lagg from emp;

-- q8

select ename,sal,ntile(5) over(order by sal desc) as ntilee from emp;

-- q 9

with cte_salesman as (select * from emp where job ='salesman')
select ename,sal,dname from cte_salesman c inner join dept d on c.deptno=d.deptno;

use assignment;
-- ASSIGNMENT ON INNER JOIN :
-- 1.NAME OF THE EMPLOYEE AND HIS LOCATION OF ALL THE EMPLOYEES.
select e.ename,d.loc from emp e inner join dept d
on e.deptno=d.deptno;

-- 2. WAQTD DNAME AND SALARY FOR ALL THE EMPLOYEE WORKING IN ACCOUNTING.
select d.dname,e.sal from emp e inner join dept d
on e.deptno=d.deptno
where d.dname='accounting';

-- 3.WAQTD DNAME AND ANNUAL SALARY FOR ALL EMPLOYEES WHOS SALARY IS MORE THAN 2340

select d.dname,e.sal*12 as annual_salary from emp e inner join dept d
 on e.deptno=d.deptno where e.sal>2340;
 
 -- 4.WAQTD ENAME AND DNAME FOR EMPLOYEES HAVING CAHARACTER 'A' IN THEIR DNAME

select e.ename,d.dname from emp e inner join dept d 
on e.deptno=d.deptno where dname like '%A%';

-- 5.WAQTD ENAME AND DNAME FOR ALL THE EMPLOYEES WORKING AS SALESMAN
select ename,dname from emp e inner join dept d
on e.deptno=d.deptno
where job='manager';

-- 5.WAQTD ENAME AND DNAME FOR ALL THE EMPLOYEES WORKING AS SALESMAN

select e.ename,d.dname from emp e inner join dept d
on e.deptno=d.deptno
where job='salesman';

-- 6.WADTD DNAME AND JOB FOR ALL THE EMPLOYEES WHOS JOB AND DNAME STARTS WITH CHARACTER 'S'

select d.dname,e.job from emp e inner join dept d
on e.deptno=d.deptno
where dname like '%s%';

use assignment;

-- 7 .WAQTD DNAME AND MGR NO FOR EMPLOYEES
-- REPORTING TO 7839

select dname,ename,mgr from emp e inner join dept d
on e.deptno=d.deptno
where mgr=7839;

-- 8. WAQTD DNAME AND HIREDATE FOR EMPLOYEES HIRED AFTER 83 INTO ACCOUNTING OR RESEARCH DEPT

select dname,hiredate from emp e inner join dept d
on e.deptno = d.deptno
where hiredate> '1983-12-31'  and dname in ('accounting','research');

-- 9.WAQTD ENAME AND DNAME OF THE EMPLOYEES WHO ARE GETTING COMM IN DEPT 10 OR 30

select ename,dname,e.deptno,comm from emp e inner join dept d
on e.deptno=d.deptno 
where comm is not null and e.deptno in (10,30);

-- 10.WAQTD DNAME AND EMPNO FOR ALL THE EMPLOYEES WHO'S EMPNO ARE (7839,7902) AND ARE WORKING IN LOC NEW YORK.
select dname,empno,loc from emp e inner join dept d
on e.deptno=d.deptno
where empno in (7839,7902) and loc='new york';

-- SELF JOIN
-- 1.WAQTD NAME OF THE EMPLOYEE AND HIS MANAGER'S NAME IF EMPLOYEE IS WORKING AS CLERK
select e1.ename,e1.job,e2.ename,e2.job as mgr_name from emp e1 join emp e2
on e1.mgr=e2.empno
where e1.job='clerk';

-- 2.WAQTD NAME OF THE EMPLOYEE AND MANAGER'S DESIGNATION IF MANAGER WORKS IN DEPT 10 OR 20

select e1.ename,e2.job as mgr_designation from emp e1 join emp e2
on e1.mgr=e2.empno
where e2.deptno in (10,20);

-- 3.WAQTD NAME OF THE EMP AND MANAGERS SALARY IF EMPLOYEE AND MANAGER BOTH EARN MORE THAN 2300

select e1.ename,e2.sal as mgr_sal from emp e1 join emp e2
on e1.mgr=e2.empno
where e1.sal>2300 and e2.sal>2300;

-- 4.WAQTD EMP NAME AND MANAGER'S HIREDATE IF EMPLOYEE WAS HIRED BEFORE 1982

select e1.ename,e2.ename as mgr_name,e2.hiredate as mgr_hiredate from emp e1 join emp e2 on e1.mgr=e2.empno
where e1.hiredate<'1982-01-01';

-- 5.WAQTD EMP NAME AND MANAGER'S COMM IF EMPLOYEE WORKS AS SALESMAN AND MANAGER WORKS IN DEPT 30

select e1.ename,e2.ename as mgr_name,e2.comm as mgr_comm,e2.job as mgr_job from emp e1 join emp e2
on e1.mgr=e2.empno
where e1.job in ('salesman','manager') and e1.deptno=30;

-- 6.WAQTD EMP NAME AND MANAGER NAME AND THEIR SALARIES IF EMPLOYEE EARNS MORE THAN MANAGER

select e1.ename,e1.sal,e2.ename as mgr_name ,e2.sal as mgr_sal
from emp e1 join emp e2 
on e1.mgr=e2.empno
where e1.sal > e2.sal;

-- 7.WAQTD EMP NAME AND HIREDATE, MANAGER NAME AND HIREDATE IF
-- MANAGER WAS HIRED BEFORE EMPLOYEE

select e1.ename,e1.hiredate,e2.ename,e2.hiredate from emp e1 join emp e2
on e1.mgr=e2.empno
where e1.hiredate>e2.hiredate;

-- 8.WAQTD EMP NAME AND MANAGER NAME IF BOTH ARE WORKING IN SAME JOB

select e1.ename,e2.ename as mgr_name from emp e1 join emp e2
on e1.mgr=e2.empno
where e1.job=e2.job;

-- 9.WAQTD EMP NAME AND MANAGER NAME IF MANAGER IS WORKING AS ACTUAL MANAGER

select e1.ename,e2.ename as mgr_name from emp e1 join emp e2
on e1.mgr=e2.empno
where e2.job='manager';
-- 10.WAQTD EMP NAME AND MANAGER NAME ALONG WITH THEIR ANNUAL SALARIES 
-- IF EMPLOYEE WORKS IN DEPT 10, 20 AND MANAGER'S SAL IS GREATER THAN EMPLOYEES SALARY.
select e1.ename,e1.sal as emp_sal,e2.ename as mgr_name,e2.sal as mgr_sal from emp e1 join emp e2
on e1.mgr=e2.empno
where e1.deptno in (10,20) and e2.sal>e1.sal;

-- 11.WAQTD EMPLOYEE'S NAME AND MANAGER'S DESIGNATION FOR ALL THE EMPLOYEES

select e1.ename ,e2.job as mgr_job from emp e1 join emp e2
on e1.mgr=e2.empno;

-- 12.WAQTD EMPLOYEE'S NAME AND MANAGER'S SALARY FOR ALL THE EMPLOYEES IF MANAGER'S SALARY ENDS WITH 50

select e1.ename,e2.ename as mgr_name,e2.sal as mgr_sal from emp e1 join emp e2
on e1.mgr=e2.empno
where  (e2.sal%100)=50;