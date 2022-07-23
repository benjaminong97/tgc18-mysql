



#create a new table
create table employees (
    employee_id int unsigned auto_increment primary key,
    email varchar(320), 
    gender varchar(1),
    notes text,
    employment_date date,
    designation varchar(100)
) engine = innodb;

#inserting rows
insert into employees (
    email,gender,notes,employment_date,designation
) values ('egwhrjj.com', 'm', 'newbie', curdate(), 'intern');


# see all rows in a table
select * from employees;

#update one row in a table
update employees set email="sgfgdf@gmail.com" where employee_id = 1;

# delete one row 
delete from employees where employee_id=1;

# create departments table
create table departments (
    department_id int unsigned auto_increment primary key,
    name varchar(100)
) engine = innodb;

insert into departments (
    name
) values ("Janitorial");

# add new column to an existing table 
alter table employees add column name varchar(100);

alter table employees rename column name to first_name;

insert into departments (name) values ("Accounting"), ("Human Resources"), ("IT");

# add a FK between employees and departments
alter table employees add column department_id int unsigned not null;

alter table employees add constraint fk_employees_departments
    foreign key (department_id) references departments(department_id);


create table parents (
    parent_id int unsigned auto_increment primary key,
    name varchar(100),
    contact varchar(30),
    occupation varchar(100)
)   engine = innodb;

insert into parents (name, contact, occupation) values
("Tan Ah Kow", "93182349", "Programmer"), ("Mary Sue", "92375932", "Doctor")


#method 1 - create table with foreign key column but without the foreign key 

create table addresses (
    address_id int unsigned auto_increment primary key,
    parent_id int unsigned not null,
    block_number varchar(10) not null,
   
    street_name varchar(100) not null,
    postal_code varchar(100) not null,
    unit_number varchar (100) not null
    

) engine = innodb;

#alter table to add in foreign key
alter table addresses add constraint fk_addresses_parents
    foreign key (parent_id) references parents(parent_id);

#method 2 - create table directly with foreign key 

create table students(
    student_id int unsigned auto_increment primary key,
    name varchar (100) not null,
    date_of_birth date not null,
    parent_id int unsigned not null,
    foreign key (parent_id) references parents(parent_id)
) engine = innodb;

insert into students (name, date_of_birth, parent_id) values 
    ("Cindy Tan", "2020-06-11", 1);

create table locations (
    location_id mediumint unsigned auto_increment primary key,
    name varchar(100) not null,
    address varchar(255) not null
) engine = innodb;

insert into locations (name, address) values 
("Yishun Swimming Complex", "Yishun Ave 4");

FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)

create table sessions (
    session_id int unsigned auto_increment primary key,
    datetime datetime not null,
    location_id mediumint unsigned not null,
    foreign key (location_id) references locations(location_id)
) engine = innodb;