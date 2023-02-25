drop table repair;
drop table uses;
drop table working;
drop table job;
drop table vehicle;
drop table customer_phone;
drop table customer;
drop table employee_phone;
drop table employee;
drop table parts;



create table customer (
c_id number(6) PRIMARY KEY,
c_name varchar(20) NOT NULL,
c_adress varchar(50) NOT NULL
);

create table customer_phone(
c_id number(6) NOT NULL,
phone varchar(13) NOT NULL,
PRIMARY KEY(c_id,phone),
FOREIGN KEY (c_id) REFERENCES customer(c_id)
);

create table vehicle(
car_num number(12) PRIMARY key NOT NULL,
production_company varchar(20) NOT NULL,
production_month varchar(20) NOT NULL,
c_id number(6) NOT NULL,
FOREIGN KEY(c_id) REFERENCES customer(c_id) ON DELETE CASCADE
);



create table employee(
e_id number(6) NOT NULL,
e_name varchar(20) NOT NULL,
e_address varchar(50) NOT NULL
);
ALTER TABLE employee ADD CONSTRAINT e_id
PRIMARY KEY (e_id);

create table employee_phone(
e_id number(6) NOT NULL,
e_phone varchar(13) NOT NULL,
PRIMARY KEY(e_id,e_phone),
FOREIGN KEY (e_id) REFERENCES employee(e_id)
);



create table job(
j_num number(6) PRIMARY KEY NOT NULL,
j_date date NOT NULL,
car_num number(6) NOT NULL
);
ALTER TABLE job ADD CONSTRAINT car_num
FOREIGN KEY (car_num) REFERENCES vehicle
(car_num);

create table working(
e_id number(6) NOT NULL,
j_num  number(6) NOT NULL,
PRIMARY KEY(e_id,j_num),
FOREIGN key(e_id) REFERENCES employee(e_id) ON DELETE CASCADE,
FOREIGN KEY (j_num) REFERENCES job(j_num) ON DELETE CASCADE
);




create table parts(
parts_id number(6) PRIMARY KEY NOT NULL,
p_cost integer NOT NULL,
describtion varchar(30) NOT NULL
);

create table uses(
j_num number(6) NOT NULL,
parts_id number(6) NOT NULL,
quantity number(2)NOT NULL,
PRIMARY KEY(parts_id,j_num),
FOREIGN KEY (parts_id) REFERENCES parts(parts_id) ON DELETE CASCADE,
FOREIGN KEY (j_num) REFERENCES job(j_num) ON DELETE CASCADE
);

create table repair(
j_num number(4)  NOT NULL,
j_type varchar(20) NOT NULL,
s_charge integer,
PRIMARY KEY (j_num,j_type),
FOREIGN KEY (j_num) REFERENCES job(j_num) ON DELETE CASCADE
);
    
---Lab 02---	 
insert into customer values(1,'Momin','Kasiabari');
insert into customer values(2,'Takiul','Kalai');
insert into customer values(3,'Tanvir','Rajbari');
insert into customer values(4,'Badhon','Joypurhat');
insert into customer values(5,'Rahman','Barishal');
insert into customer values(6,'Ibrahim','Noapara');
insert into customer values(7,'Maisa','Gobindojonj');
insert into customer values(8,'Mujibur','Raniganj');
insert into customer values(9,'Khalil','Panchbibi');
select * from customer;


insert into customer_phone values(1,'01234567891');
insert into customer_phone values(1,'01234232323');
insert into customer_phone values(2,'01236323232');
insert into customer_phone values(3,'01254323469');
insert into customer_phone values(9,'01232794252');
insert into customer_phone values(7,'01238883252');
insert into customer_phone values(8,'01238993252');
insert into customer_phone values(6,'01232328972');
insert into customer_phone values(5,'01282003252');
select * from customer_phone;

INSERT INTO vehicle values (11,'bajaj','January',2);
INSERT INTO vehicle values (12,'hundai','April',3);
INSERT INTO vehicle values (13,'hero','January',1);
INSERT INTO vehicle values (14,'mahindra','may',4);
INSERT INTO vehicle values (15,'bajaj','June',5);
SELECT * from vehicle;

INSERT INTO job values(101,date'2022-04-05',11);
INSERT INTO job values(102,date'2022-11-05',12);
INSERT INTO job values(103,date'2022-02-15',14);
INSERT INTO job values(104,DATE'2022-03-23',13);
INSERT INTO job values(105,DATE'2022-05-02',12);
SELECT * from job;

insert into employee values(1111,'Jami','Santinagar');
insert into employee values(1222,'Mafi','Masterpara');
insert into employee values(1122,'Murad','Masterpara');
insert into employee values(1112,'Junaid','Masterpara');
insert into employee values(2222,'Mahin','Masterpara');
insert into employee values(3333,'Roni','Iraknagar');
insert into employee values(4444,'Sourov','Sabujnagar');
insert into employee values(5555,'Iftee','Joypurhat');
select * from employee;

insert into employee_phone values (1111,'01234567891');
insert into employee_phone values(1111,'01237232323');
insert into employee_phone values(2222,'01286323232');
insert into employee_phone values(3333,'01224323469');
insert into employee_phone values(4444,'01572323252');
insert into employee_phone values(1222,'01672323252');
insert into employee_phone values(1122,'01782945252');
insert into employee_phone values(1112,'01895624252');

select * from employee_phone;

INSERT INTO working VALUES (2222,101);
INSERT INTO working VALUES (3333,101);
INSERT INTO working VALUES (4444,104);
INSERT INTO working VALUES (1111,102);
INSERT INTO working VALUES (2222,103);
SELECT * FROM working;

INSERT INTO parts VALUES (21,100,'gear');
INSERT INTO parts VALUES (22,700,'Head light');
INSERT INTO parts VALUES (23,600,'Tire');
INSERT INTO parts VALUES (24,200,'Mobil');
INSERT INTO parts VALUES (25,400,'Seat');
SELECT * from parts;

INSERT INTO uses values (101,24,1);
INSERT INTO uses values (102,24,4);
INSERT INTO uses values (103,21,11);
INSERT INTO uses values (104,22,3);
SELECT *from uses;

INSERT INTO repair values (104,'servicing',2000);
INSERT INTO repair values (102,'Buy parts',6000);
INSERT INTO repair values (103,'servicing',1000);
INSERT INTO repair values (101,'Tire buy',5000);
SELECT * from repair;


--Lab 03

describe  customer;
ALTER TABLE customer 
ADD(
father_name varchar(20),
mother_name varchar(20));
describe customer;

ALTER TABLE customer
MODIFY father_name number(10);
describe customer;

ALTER TABLE customer
DROP COLUMN father_name;

ALTER TABLE customer
DROP COLUMN mother_name;
describe customer;

select * from customer;
UPDATE customer SET c_adress='Birampur' WHERE c_id=1;
select * from customer;

select * from repair;
DELETE FROM repair WHERE j_num=’102’;
select * from repair;

INSERT INTO repair values (102,'servicing',6000);



--Lab -04
select c_id,c_name,c_adress 
from customer;

select DISTINCT(e_id) from employee_phone;
SELECT c_name,c_adress
FROM customer
WHERE c_id=3 OR c_id=5;

select (s_charge/5) from repair;
select (s_charge/5)As s_charge_divide_by_five from repair;

select j_num, s_charge from repair
where s_charge>1000;

select j_num,s_charge,j_type from repair
where s_charge BETWEEN 2000 AND 5000;

SELECT j_num,s_charge,j_type FROM repair
WHERE s_charge NOT BETWEEN 2000 AND 5000;

select j_num,s_charge,j_type from repair
where s_charge IN(2000,5000);

select j_num,s_charge,j_type from repair
where s_charge NOT IN(2000,5000);

SELECT c_id ,c_name,c_adress
FROM customer
WHERE c_name LIKE '_om__';

SELECT c_id,c_name,c_adress
FROM customer 
WHERE c_name LIKE '%m%';

SELECT j_num,s_charge,j_type FROM repair 
ORDER BY s_charge;

SELECT j_num,s_charge,j_type FROM repair 
ORDER BY s_charge DESC;

SELECT j_num,s_charge,j_type FROM repair 
ORDER BY j_num,s_charge ;

SELECT j_num,s_charge,j_type FROM repair 
ORDER BY j_num DESC,s_charge;

select DISTINCT(c_name) from customer;
SELECT MAX(p_cost)
FROM parts;
SELECT MIN(p_cost)
FROM parts;
SELECT AVG(p_cost)
FROM parts;
SELECT SUM(p_cost)
FROM parts;
SELECT COUNT(p_cost)
FROM parts;

SELECT e_id,COUNT(j_num)
FROM working
GROUP BY e_id;

SELECT e_id,COUNT(j_num)
FROM working
WHERE e_id<4444
GROUP BY e_id;

SELECT e_id,COUNT(j_num)
FROM working
GROUP BY e_id
HAVING COUNT(j_num)>1;


SELECT car_num,production_company,production_month,c_id
FROM vehicle
where c_id IN(
SELECT c_id FROM customer
where c_id<7);


--Lab 05
--Union All Allow duplicate
SELECT car_num,production_company,production_month,c_id
FROM vehicle
WHERE c_id BETWEEN 3 AND 5
UNION ALL
SELECT c.car_num,c.production_company,c.production_month,c.c_id
FROM vehicle c
WHERE c.car_num IN(
SELECT d.car_num
FROM job d
);

--Union don't allow duplicate
SELECT car_num,production_company,production_month,c_id
FROM vehicle
WHERE c_id BETWEEN 3 AND 5
UNION 
SELECT c.car_num,c.production_company,c.production_month,c.c_id
FROM vehicle c
WHERE c.car_num IN(
SELECT d.car_num
FROM job d
);

--Intersection only allow common rows
SELECT car_num,production_company,production_month,c_id
FROM vehicle
WHERE c_id BETWEEN 3 AND 5
INTERSECT 
SELECT c.car_num,c.production_company,c.production_month,c.c_id
FROM vehicle c
WHERE c.car_num IN(
SELECT d.car_num
FROM job d
);

--Minus Only allows those rows which are not common and which in first table
SELECT car_num,production_company,production_month,c_id
FROM vehicle
WHERE c_id BETWEEN 3 AND 5
MINUS 
SELECT c.car_num,c.production_company,c.production_month,c.c_id
FROM vehicle c
WHERE c.car_num IN(
SELECT d.car_num
FROM job d
);


--Precedense check .( left to right)
SELECT e_id,e_name,e_address
FROM employee
WHERE e_id BETWEEN 1222 AND 4444
UNION 
SELECT f.e_id,f.e_name,f.e_address
FROM employee f
WHERE e_id IN(
SELECT g.e_id
FROM working g
)
INTERSECT
SELECT h.e_id,h.e_name,h.e_address
FROM employee h
where h.e_id IN(
SELECT j.e_id
FROM employee_phone j 
WHERE j.e_phone='01572323252');

SELECT e_id,e_name,e_address
FROM employee
WHERE e_id BETWEEN 1222 AND 4444
UNION (
SELECT f.e_id,f.e_name,f.e_address
FROM employee f
WHERE e_id IN(
SELECT g.e_id
FROM working g
)
INTERSECT
SELECT h.e_id,h.e_name,h.e_address
FROM employee h
where h.e_id IN(
SELECT j.e_id
FROM employee_phone j 
WHERE j.e_phone='01572323252'));

---Lab 06
-- Join
select a.parts_id,a.p_cost,a.describtion,b.j_num,b.quantity
FROM parts a join uses b
ON a.parts_id=b.parts_id;

SELECT a.j_date,a.car_num,b.parts_id,b.quantity
FROM job a join uses b
USING(j_num);

--Natural Join
SELECT a.e_name,a.e_address,b.e_phone
FROM employee a natural Join employee_phone b;

SELECT a.c_name,a.c_adress,b.phone
FROM customer a natural join customer_phone  b;

--Cross join
SELECT a.e_id,a.e_name,a.e_address,b.e_id,b.j_num
FROM employee a cross join working b;

--left out join
SELECT a.c_id,a.c_name,a.c_adress,b.car_num,b.production_company
FROM customer a left outer join vehicle b
ON a.c_id=b.c_id;

--right outer join
SELECT a.c_id,a.c_name,a.c_adress,b.car_num,b.production_company
FROM customer a right outer join vehicle b
ON a.c_id=b.c_id;

--full Outer join
SELECT a.car_num,a.production_company,a.production_month,b.j_num,b.j_date
FROM vehicle a full outer join job b
ON a.car_num=b.car_num;

--Inner Join
SELECT a.e_name,a.e_address,b.e_phone
FROM employee a inner Join employee_phone b
on a.e_id=b.e_id;

-- Non equi join and self Join
select a.j_num,a.j_type,a.s_charge,b.j_num,b.j_type,b.s_charge
from repair a join repair b
ON a.s_charge=b.s_charge; 


--Pl Sql lab-07 ,lab-08

--Showing maximum price of parts
SET SERVEROUTPUT ON
DECLARE
   max_Parts_price  parts.p_cost%type;
BEGIN
   SELECT MAX(p_cost)  INTO max_Parts_price  
   FROM parts;
   DBMS_OUTPUT.PUT_LINE('The maximum price of Parts is : ' || max_Parts_price);
 END;
/

--Showing Production month and Production company of Car number 11

SET SERVEROUTPUT ON
DECLARE 
   Production_Month vehicle.production_month%TYPE;
   Production_Company vehicle.production_company%TYPE;
BEGIN
    SELECT production_month,Production_Company INTO Production_Month,Production_Company
	FROM vehicle
	WHERE car_num=11;
	 DBMS_OUTPUT.PUT_LINE('The production company and production month are : ' || Production_Company|| ', '|| Production_Month);
 END;
/


--Giving discount to  a customer on Service
SET SERVEROUTPUT ON
DECLARE
     Total_amount repair.s_charge%type;
	 Discounted_amount repair.s_charge%type;
	 Job_number repair.j_num%type;
	 Car_number vehicle.car_num%type;

BEGIN 
  Job_number:=101;
  SELECT car_num INTO Car_number
  from job
  WHERE j_num=Job_number;
  SELECT s_charge INTO Total_amount
  from repair
  WHERE j_num=Job_number;
  IF Total_amount <1000 THEN
     Discounted_amount:=Total_amount;
  ELSIF Total_amount <2000 THEN
     Discounted_amount:=Total_amount -(Total_amount*.1);
  ELSIF Total_amount <3000 THEN
     Discounted_amount:=Total_amount-(Total_amount*.15);
  ELSE
     Discounted_amount:=Total_amount-(Total_amount*.20);
  END IF;
  DBMS_OUTPUT.PUT_LINE('Actual Amount:'||Total_amount||
    ' Discounted Amount: '||Discounted_amount||
	' Car number'|| Car_number);
  END;
  /
SHOW errors;

-- Show all the employe Name and address using LOOP from employee table

SET SERVEROUTPUT ON
DECLARE
CURSOR emp_cur IS SELECT e_name, e_address FROM employee;
emp_record emp_cur%ROWTYPE;

BEGIN
OPEN emp_cur;
LOOP

EXIT WHEN emp_cur%ROWCOUNT>6;
FETCH emp_cur INTO emp_record;
DBMS_OUTPUT.PUT_LINE('Employee name: ' || emp_record.e_name ||' Employee Address: ' || emp_record.e_address);
END LOOP;
CLOSE emp_cur;
END;
/

--for loop to show all information of employee id and Job number from working table

CREATE OR REPLACE FUNCTION total_row_work RETURN NUMBER IS
t_row number(2,0);
BEGIN
SELECT COUNT(e_id) INTO t_row
FROM working;
RETURN t_row;
END;
/

SET SERVEROUTPUT ON
DECLARE

counter number(2,0);
rng number(2,0):=total_row_work;
CURSOR work_cur IS SELECT e_id, j_num FROM working;
work_record work_cur%ROWTYPE;

BEGIN
OPEN work_cur;
FOR counter IN 1..rng 
LOOP
FETCH work_cur INTO work_record;
DBMS_OUTPUT.PUT_LINE(' Employee Id: ' || work_record.e_id || ' Job number: ' || work_record.j_num);
END LOOP;
CLOSE work_cur;
END;
/


-- while loop to show all the parts and service available

CREATE OR REPLACE FUNCTION total_row RETURN NUMBER IS
t_row number(2,0);
BEGIN
SELECT COUNT(parts_id) INTO t_row
FROM parts;
RETURN t_row;
END;
/

SET SERVEROUTPUT ON
DECLARE

counter number(2,0):=1;
rng number(2,0):=total_row;
CURSOR parts_cur IS SELECT parts_id, p_cost,describtion FROM parts;
parts_record parts_cur%ROWTYPE;

BEGIN
OPEN parts_cur;
WHILE counter<=rng
LOOP
FETCH parts_cur INTO parts_record;
DBMS_OUTPUT.PUT_LINE(' Parts cost: ' || parts_record.p_cost || ' Describtion: ' || parts_record.describtion);
counter:=counter+1;
END LOOP;
CLOSE parts_cur;
END;
/

--function in pl SQLCODE

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE empNum IS
emp_id employee_phone.e_id%type;
emp_phone employee_phone.e_phone%type;
BEGIN
emp_id := 2222;
SELECT e_phone INTO emp_phone
FROM employee_phone
WHERE e_id = emp_id;
DBMS_OUTPUT.PUT_LINE('Employee phone no : '||emp_phone);
END;
/


BEGIN
  empNum;
END;
/


--Add new data in customer_phone table

CREATE OR REPLACE PROCEDURE add_Phone (
cus_id customer_phone.c_id%TYPE,
cus_num customer_phone.phone%TYPE) IS
BEGIN
INSERT INTO customer_phone (c_id, phone)
VALUES (cus_id, cus_num);
COMMIT;
END add_Phone;
/


BEGIN
  add_Phone(4,'01727463837');
END;
/

--Function that returns average price of parts

CREATE OR REPLACE FUNCTION avg_price RETURN NUMBER IS
avg_price parts.p_cost%type;
BEGIN
SELECT AVG(p_cost) INTO avg_price
FROM parts;
RETURN avg_price;
END;
/

SET SERVEROUTPUT ON
BEGIN
dbms_output.put_line('Average Parts Price: ' || avg_price);
END;
/

-- Show Total expense of servicing and bonus to the employee
--funtion name 'get_bonus'
CREATE OR REPLACE FUNCTION get_bonus(
expense IN repair.s_charge%TYPE)
RETURN NUMBER IS
BEGIN
RETURN (NVL(0.1,0) * NVL(expense,0) );
END get_bonus;
/

SELECT j_num,s_charge,
get_bonus(s_charge) "Annual
Compensation"
FROM repair;
/


------Lab 9-----
---------------
--View to show Customer name, car number ,Date of giving car to service and the employee id who service the car
CREATE VIEW  info_customer_employee AS
SELECT a.c_name As Customer,b.car_num As Car_no,c.j_date As Date_of_giving_car,d.e_id As Employee_id
FROM customer a inner join vehicle b
ON a.c_id=b.c_id 
inner join job c
ON b.car_num=c.car_num
inner join working d
ON c.j_num=d.j_num;

SELECT * from info_customer_employee;

----update View
CREATE or REPLACE VIEW  info_customer_employee AS
SELECT a.c_name As Customer_name,b.car_num As Car_nunber,c.j_num As Job_number,d.e_id As Employee_id
FROM customer a inner join vehicle b
ON a.c_id=b.c_id 
inner join job c
ON b.car_num=c.car_num
inner join working d
ON c.j_num=d.j_num;

select * from info_customer_employee;

--Droping VIEW
Drop VIEW info_customer_employee;

--trigger is set to parts cost insert and update in range--
CREATE OR REPLACE TRIGGER check_parts_cost BEFORE INSERT OR UPDATE ON
parts
FOR EACH ROW
DECLARE
min_cost constant INTEGER := 10;
max_cost constant INTEGER := 50000;
BEGIN
IF :new.p_cost > max_cost OR :new.p_cost < min_cost THEN
RAISE_APPLICATION_ERROR(-20000,'Cost of parts is out or range');
END IF;
END;
/
select * from parts;
INSERT INTO parts VALUES(26,8,'Glass');
select * from parts;
UPDATE parts SET p_cost=9 WHERE parts_id=24;

--Triggers Phone number check 11 digits and start with 01....   

CREATE OR REPLACE TRIGGER check_phone BEFORE INSERT OR UPDATE ON
customer_phone
FOR EACH ROW
BEGIN
IF :NEW.phone!='01_________' THEN
RAISE_APPLICATION_ERROR(-20000,'Phone no is not correct');
END IF;
END;
/

insert into customer_phone values(2,'05234232323');
select * from customer_phone;

CREATE OR REPLACE TRIGGER check_emp_phone BEFORE INSERT OR UPDATE ON
employee_phone
FOR EACH ROW
BEGIN
IF :NEW.e_phone!='01_________' THEN
RAISE_APPLICATION_ERROR(-20000,'Phone no is not correct');
END IF;
END;
/

insert into employee_phone values(2222,'014586323232');
select * from employee_phone;

--Commit ,ROLLBACK
-- Here all the rows of customer phone has been deleted after then using rollback all rows 

COMMIT;
select * from customer_phone;
DELETE from customer_phone;
SELECT* from customer_phone;
ROLLBACK;
SELECT * FROM customer_phone;

--savepoint in vehicle TABLE

INSERT INTO vehicle values (16,'Walton','December',8);
savepoint vehicle_16;
INSERT INTO vehicle values (17,'Mitshubishi','November',6);
savepoint vehicle_17;
SELECT * from vehicle;
rollback to vehicle_16;
SELECT * from vehicle;

--Working with Date

select SYSDATE from dual;
select SYSTIMESTAMP from dual;

INSERT INTO job VALUES (106,DATE'2022-07-16',11);
select * from job;
-- Showing those rows which date is 3 days earlier
select j_num,j_date,car_num
FROM job
WHERE SYSDATE-j_date>3;

-- select data adding  3 months in job TABLE

select j_num,ADD_MONTHS(j_date,3) as_three_month_extension,car_num
from job;

-- Select Last of the month
SELECT LAST_DAY (j_date)
FROM job;

select j_num,EXTRACT(Day FROM j_date) as Day,EXTRACT(month from j_date) as month,EXTRACT(year from j_date) as year
from job;

