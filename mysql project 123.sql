create database libary;
use libary;

create table Branch(Branch_no int primary key,Manager_id int,
Branch_address varchar(50),Contact_no int);

insert into Branch(Branch_no,Manager_id,Branch_address,Contact_no)
values
(1,051,'rocky road,kolanhalli',980256),
(2,052,'ram nagar,otty',856452),
(3,053,'vellayani road,Aluva',980025),
(4,054,'bala street,alapuzha',526543),
(5,055,'balaji road,kollam',585627);

create table Employee(Emp_id int primary key,Emp_name varchar(50),
Position varchar(20),salary decimal(10,2));

insert into Employee(Emp_id,Emp_name,position,salary)
values
(051,'Nancy','incharge',5000),
(052,'Sherly','Manager',15000),
(053,'varun','Accountant',114000),
(054,'Anu','cashier',10000),
(055,'gopal','security',4000);

create table Customer(Customer_id int primary key,Customer_name varchar(30),
Customer_address varchar(50),Reg_date date);

insert into Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
values
(1, 'Akkif', 'nilabari villa', '2023-01-01'),
(2, 'Ponniyan', 'jaya nagar', '2023-02-01'),
(3, 'Manu', 'vazhiyoram villa', '2023-03-01'),
(4, 'Gopalan', 'crazy street', '2023-04-01'),
(5, 'Dhoni', 'csk homes', '2023-05-01');

create table IssueStatus(
Issue_id int primary key,
Issued_cust int,
Issued_book_name varchar(100),
Issue_date date,
BMSM_book varchar(20),
foreign key(Issued_cust)references Customer(Customer_id),
foreign key(BMSM_book)references Books(BMSM));
insert into IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, BMSM_book)
values
(1, 1, 'love maker', '2023-01-01', 'BMSM1'),
(2, 2, 'Odaruth Ammava All Ariyam', '2023-02-01', 'BMSM2'),
(3, 3, 'Cooking with me', '2023-03-01', 'BMSM3'),
(4, 4, 'Manasikarogi', '2023-04-01', 'BMSM4'),
(5, 5, 'One dream', '2023-05-01', 'BMSM5');

create table ReturnState(Return_id int primary key,
Return_cust int,Return_book_name varchar(100),
Return_date date,BMSM_book2 varchar(20),
foreign key(Return_cust)references Customer(Customer_id),
foreign key(BMSM_book2)references Books(BMSM));
insert into ReturnState(Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
values
(1, 1, 'love maker', '2023-01-01', 'BMSM1'),
(2, 2, 'Odaruth Ammava All Ariyam', '2023-02-01', 'BMSM2'),
(3, 3, 'Cooking with me', '2023-03-01', 'BMSM3'),
(4, 4, 'Manasikarogi', '2023-04-01', 'BMSM4'),
(5, 5, 'One dream', '2023-05-01', 'BMSM5');




create table Books(BMSM varchar(20)primary key,
Book_title varchar(100),Category Varchar(50),Rental_price decimal(10,2),
Status enum('Yes','No'),Author varchar(100),Publisher varchar(100));
insert into Books (BMSM, Book_title, Category, Rental_Price, Status, Author, Publisher)
values
('BMSM1', 'love maker', 'Novel', 8.25, 'no', 'Robert don', 'MK Publisher'),
('BMSM2', 'Odaruth Ammava All Ariyam', 'Novel', 26.99, 'no', 'Remeshan pottakuzhi', 'OMK Publisher'),
('BMSM3', 'Cooking with me', 'Funbook', 5.99, 'yes', 'Nallini', 'J&J Books'),
('BMSM4', 'Manasikarogi', 'Noval', 7.99, 'no', 'Raman Oolanpra', 'Odayil Publisher'),
('BMSM5', 'One dream', 'Autobiograpy', 13.99, 'yes', 'Willam sha', 'DMK Publisher');
select book_title ,category,rental_price from books where status ='yes';

select emp_name,salary from employee order by salary desc;

select b.book_title,c.customer_name
from issuestatus i
join books b on i. isbn_book = b.isbn
join customer c on i.issued_cust= c.customer_id;

select category,count(*)as book_count
from books
group by category;

select emp_name,position from employee
where salary > 50000;

select customer_name from customer
where reg_date<'2022-01-01'
and customer_id not in (select issued_cust from issuestatus);

select b.branch_no ,count(*) as total_count
from employee e
join branch b on e.emp_id = b.manager_id = e.emp_id
group by b.branch_no;

select c.customer_name from customer c 
join issuestatus i on c.customer_id = i.issued_cust
where i.issue_date >='2023-06-01' and i.issue_date < '2023-07-01';

select book_title from books where category = 'history';

select b.branch_no,count(*) as empolyee_count
from employee e
join branch b  on e.emp_id = b.manager_id
group by b.branch_no
having empolyee_count > 5;







