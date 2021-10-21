--Создание базы данных
--У каждой таблицы должно быть поле id
--id автоинкрементальный и является первичным ключом
create table salary (
id serial primary key,
monthly_salary int not null
);

create table roles_salary (
id serial primary key ,
id_role int not null,
id_salary int not null,
foreign key (id_salary)
	references salary (id),
foreign key (id_role)
	references roles (id)
);

create table roles (
id serial primary key,
role_title varchar (50) not null
);

create table employees_roles (
id serial primary key,
id_role int not null,
id_employee int not null,
foreign key (id_role)
	references roles(id),
foreign key (id_employee)
	references employees (id)
);

create table employees (
id serial primary key,
employee_name varchar (50) not null
);

 create table claim (
 id serial  primary key,
 service_id int not null,
 employee_id int not null,
 material_id int not null,
 claim_date date not null,
 sales_manager int not null,
 foreign key (employee_id)
 	references employees (id),
 foreign key (sales_manager)
 	references employees (id),
 foreign key (service_id)
 	references Service (id),
 	foreign key (material_id)
 		references materials (id)
 );

create table Service (
id serial primary key,
service_title varchar (50) not null,
price int not null
);

create table materials (
id serial primary key,
material_title varchar (50) not null,
amount int not null,
price int not null
);

--Добавить таблицу Suppliers с полями id, name
create table suppliers (
id serial primary key,
name_sup varchar (50) not null
);

--Обновить таблицу Materials. Добавить поле suplier_id которое связано с полем id в таблице Suppliers
alter table materials 
add column supplier_id int,
add foreign key (supplier_id)
	references suppliers (id);

--Обновить таблицу Employees. Добавить varchar поле surname на 50 символов
alter table employees 
add column surname varchar (50);

--Обновить таблицу Salary. Добавить varchar поле currency на 7 символов
alter table salary 
add column currency varchar (7);

