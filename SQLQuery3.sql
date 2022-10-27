create database salesmanAndCustomers;
use salesmanAndCustomers;

create table salesman(salesman_id int primary key,name varchar(20),city varchar(20),commission decimal(7,2));
select * from salesman;
insert into salesman
	values
	(5001,'James Hoog','New York',0.15),
	(5002,'Nail Knite','Paris',0.13),
	(5005,'Pit Alex','London',0.11),
	(5006,'Mc Lyon','Paris',0.14),
	(5007,'Paul Adam','Rome',0.13),
	(5003,'Lauson Hen','San Jose',0.12);
update salesman set name='James Hoog' where salesman_id =5001;
create table customers(customer_id int primary key,cust_name varchar(20),city varchar(20),grade int,salesman_id int,
			foreign key(salesman_id) references  salesman(salesman_id));
select * from customer;

insert into customer(customer_id,cust_name,city,grade,salesman_id)
values 
(3002,'Nick Rimando','New York',100,5001),
(3007,'Brade Davis','New York',200,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green','London',300,5002),
(3004,'Fabian Johnson','Paris',300,5006),
(3009,'Geoff Cameron','Berlin',100,5003);

select * from customer;

--1st question

SELECT customer.cust_name,salesman.name, salesman.city FROM salesman, customer WHERE salesman.city = customer.city;

--2nd question
SELECT customer.cust_name,salesman.name FROM salesman, customer WHERE salesman.salesman_id = customer.salesman_id;


create table foods(
ITEM_ID INT,
ITEM_NAME VARCHAR(25),
ITEM_UNIT VARCHAR(25),
COMPANY_ID INT
);

INSERT INTO foods(ITEM_ID,ITEM_NAME,ITEM_UNIT,COMPANY_ID)
VALUES
(1,'Chex Mix','Pcs',16),
(6,'Cheez-It','Pcs',15),
(2,'BN Biscuit','Pcs',15),
(3,'Mighty Munch','Pcs',17),
(4,'Pot Rice','Pcs',15),
(5,'Jaffa Cakes','Pcs',18),
(7,'salt n Shake','Pcs',null);

select * from foods

create table company(
COMPANY_ID INT,
COMPANY_NAME VARCHAR(25),
COMPANY_CITY VARCHAR (20)
)

INSERT INTO company (COMPANY_ID,COMPANY_NAME,COMPANY_CITY )
values
(18,'Order All','Boston'),
(15,'Jack Hill Ltd','London'),
(16,'Akas Foods','Delhi'),
(17,'Foodies','London'),
(19,'sip-n-Bite','New York');

select * from company;

--3rd question

select company.COMPANY_ID,company.COMPANY_NAME,foods.COMPANY_ID,foods.ITEM_NAME,foods.ITEM_UNIT from company left join foods on company.COMPANY_ID = foods.COMPANY_ID;

create table counter_sale(
BILL_NO int,ITEMS_ID int,SL_QTY int,SL_RATE int,BILL_AMT int );

insert into counter_sale(BILL_NO ,ITEMS_ID ,SL_QTY ,SL_RATE ,BILL_AMT)
values
(1003,6,15,20,300),
(1004,4,18,30,540),
(1005,7,10,60,600),
(1006,3,25,25,625),
(1001,4,20,30,600),
(1002,1,40,50,2000);

select * from counter_sale;

--4th question

select bill.BILL_NO,food.ITEM_NAME,bill.BILL_AMT from foods food, counter_sale bill
where bill.BILL_AMT > 500 and food.ITEM_ID=bill.ITEMS_ID;

--5th question

select  bill.BILL_NO, food.ITEM_NAME, comp.COMPANY_NAME, comp.COMPANY_CITY, bill.BILL_AMT from counter_sale bill left join foods food on bill.ITEMS_ID=food.ITEM_ID left join company comp on food.COMPANY_ID=comp.COMPANY_ID 
where  comp.COMPANY_NAME is not null order by bill.BILL_NO;

--6th question

select comp.COMPANY_ID, comp.COMPANY_NAME, comp.COMPANY_CITY, food.COMPANY_ID, food.ITEM_NAME from company comp right join foods food on comp.COMPANY_ID=food.COMPANY_ID;

--7th question
select a.COMPANY_NAME,b.COMPANY_NAME,a.COMPANY_CITY FROM company a,company b
where a.COMPANY_CITY=b.COMPANY_CITY;

create table agents(
AGENT_CODE varchar(15),
AGENT_NAME VARCHAR(20),
WORKING_AREA VARCHAR(25),
COMMISSIN DECIMAL(6,2),
PHONE_NO INT,
COUNTRY VARCHAR(20)
);

INSERT INTO agents(AGENT_CODE,AGENT_NAME,WORKING_AREA,COMMISSIN,PHONE_NO,COUNTRY)
VALUES
('A007','Ramasundar','Bangalore',0.15,077-25814763,null),
('A003','Alex','London',0.13,075-12458969,null),
('A008','Alford','New York',0.12,044-25874365,null),
('A011','Ravi Kumar','Bangalore',0.15,077-45625874,null),
('A010','Santakumar','Chennai',0.14,007-22388644,null),
('A012','Lucida','San Jose',0.12,045-21447739,null),
('A005','Anderson','Brisban',0.13,045-21447739,null),
('A001','Subbarao','Bangalore',0.14,077-12346674,null);

select * from agents;

create table orders(
ORD_num int,
ORD_AMOUNT INT,
ADVANCE_AMOUNT INT,
ORD_DATE DATE,
CUST_CODE VARCHAR(20),
AGENT_CODE VARCHAR(20),
ORD_DESCRIPTION VARCHAR(20)
);

INSERT INTO orders(ORD_num,ORD_AMOUNT,ADVANCE_AMOUNT,ORD_DATE,CUST_CODE,AGENT_CODE,ORD_DESCRIPTION)
VALUES
(200114,3500,2000,'15-AUG-08','C00002','A008',NULL),
(200122,2500,400,'16-SEP-08','C00003','A004',NULL),
(200118,500,100,'20-JUL-08','C00023','A006',NULL),
(200119,4000,700,'16-SEP-08','C00007','A010',NULL),
(200121,1500,600,'23-SEP-08','C00008','A004',NULL),
(200130,2500,400,'30-JUL-08','C00025','A011',NULL),
(200134,4200,1800,'25-SEP-08','C00004','A005',NULL),
(200108,4000,600,'15-FEB-08','C00008','A004',NULL),
(200103,1500,700,'15-MAY-08','C00021','A005',NULL);

SELECT * FROM orders

--8th question

SELECT agents.AGENT_CODE,agents.AGENT_NAME,
      SUM(orders.ADVANCE_AMOUNT) AS "SUM"
      FROM agents,orders
      WHERE agents.AGENT_CODE=orders.AGENT_CODE
      GROUP BY agents.AGENT_CODE,agents.AGENT_NAME
      ORDER BY agents.AGENT_CODE;

--9th question

SELECT f.ITEM_NAME,f.ITEM_UNIT,c.COMPANY_NAME,c.COMPANY_CITY from foods f left join company c on c.COMPANY_ID=f.COMPANY_ID 
WHERE c.COMPANY_CITY='London';


create table despatch(DES_NUM VARCHAR(20) primary key,DES_DATE varchar(30),
			DES_AMOUNT INT,ORD_NUM INT,ORD_DATE varchar(30),ORD_AMOUNT INT,
			AGENT_CODE VARCHAR(20));
SELECT * FROM despatch;
insert into despatch
	    values
			('D002','10-JUN-08',2000,200112,'30-MAY-08',2000,'A007'),
			('D005','19-OCT-08',4000,200119,'16-SEP-08',4000,'A010'),
			('D001','12-JAN-08',3800,200113,'10-JUN-08',4000,'A002'),
			('D003','25-OCT-08',900,200117,'20-OCT-08',800,'A001'),
			('D004','20-AUG-08',450,200120,'20-JUL-08',500,'A002'),
			('D006','24-JUL-08',4500,200128,'20-JUL-08',3500,'A002');

--10th question

SELECT A.DES_NUM,A.DES_DATE,SUM(B.ORD_AMOUNT) AS "SUM(B.ORD_AMOUNT)" 
		FROM despatch A LEFT JOIN orders B ON A.ORD_AMOUNT=B.ORD_AMOUNT 
		GROUP BY A.DES_NUM,A.DES_DATE;

--11th 
		
SELECT A.DES_NUM,A.DES_DATE,
SUM(B.ORD_AMOUNT) AS "SUM(B.ORD_AMOUNT)" 
FROM despatch A, orders B
WHERE A.ORD_AMOUNT=B.ORD_AMOUNT
GROUP BY A.DES_NUM,A.DES_DATE;

--12th question

SELECT ORD_NUM,ORD_AMOUNT,ORD_DATE,CUST_CODE,AGENT_CODE FROM orders  WHERE AGENT_CODE IN 
		(SELECT AGENT_CODE FROM agents  WHERE WORKING_AREA ='Bangalore');

create table customer2(cust_code varchar(20)primary key,cust_name varchar(20),cust_city varchar(20),
			working_area varchar(20),cust_country varchar(20),grade int,
			opening_amt decimal(7,2),receive_amt decimal(7,2));

insert into customer2
	values
		('C00013','Holmes','London','London','UK',2,6000.00,5000.00),
		('C00001','Micheal','New York','New York','USA',2,3000.00,5000.00),
		('C00020','Albert','New York','New York','USA',3,5000.00,7000.00),
		('C00025','Ravindran','Bangalore','Bangalore','INDIA',2,5000.00,7000.00),
		('C00024','Cook','London','London','UK',2,4000.00,9000.00),
		('C00015','Stuart','London','London','UK',1,6000.00,8000.00),
		('C00002','Bolt','New York','New York','USA',3,5000.00,7000.00);

SELECT * FROM customer2;

--13th question

SELECT cust_country,COUNT(grade) AS"COUNT(GRADE)"
FROM customer2 
GROUP BY cust_country 
HAVING COUNT(grade)>2; 
