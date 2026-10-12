-- Studi Kasus 1 - DDL & Tabel Master (Tipe Data & Primary Key)
create table Categories (
	category_id SERIAL primary key, 
	category_name VARCHAR(50) not null);
create table Customers (customer_id SERIAL primary key,
	customer_name VARCHAR(100) unique not null, email 
	VARCHAR(100) unique not null,
	registration_date TIMESTAMP default CURRENT_TIMESTAMP);

-- Studi Kasus 2 - Relasi Tabel & Foreign Key
create table Products (product_id SERIAL primary key,
	product_name VARCHAR(100) not null,
	price DECIMAL (10, 2) not null check (price >= 0),
	category_id INT,
	constraint fk_category
		foreign key (category_id) references Categories(category_id));

-- Studi Kasus 3 - Tabel Transaksional (Many-to-Many Relationships)
create table Orders (order_id SERIAL primary key,
	customer_id INT,
	order_date TIMESTAMP,
	constraint fk_customer
		foreign key (customer_id) references Customers(customer_id));
create table Order_Details (order_id INT,
	product_id INT, quantity INT not null check (quantity > 0),
	unit_price DECIMAL (10,2) not null,
	primary key (order_id, product_id),
	constraint fk_order
		foreign key (order_id)
		references Orders (order_id), 
	constraint fk_product
		foreign key (product_id)
		references Products(product_id));

-- Studi Kasus 4 - DML (Insert, Update, Delete)
-- Insert Categories
insert into Categories(category_name) values 
('Fashion'), ('Beauty & Body Care'), ('Food & Groceries');
-- Insert Customers 
insert into Customers(customer_name, email) values 
('Gawin Caskey', 'gawin@gmail.com'),
('Kai Kamal', 'kai@gmail.com'),
('Joss Wayar', 'gymr@gmail.com'),
('Siti Aminah', 'siticans@gmail.com'),
('Pedro Pascal', 'pedrop@gmail.com');
-- Insert Products
insert into Products(product_name, price, category_id) values
('Jaket Gunung', 1500000.00, 1),
('Sunscreen', 100000.00, 2),
('Protein Shake', 375000.00, 3),
('Kacamata Hitam', 350000.00, 1),
('Lipbalm', 95000.00, 2),
('Beef Jerky', 100000.00, 3);
-- Insert Orders
insert into Orders(order_id, customer_id, order_date) values
(1, 1, '2026-09-22'),
(2, 2, '2026-09-24'),
(3, 3, '2026-09-29'),
(4, 5, '2026-09-30');
-- Insert Orders Details
insert into Order_Details(order_id, product_id, quantity, unit_price) values 
(1, 1, 2, 1500000.00),
(2, 2, 3, 100000.00),
(3, 3, 1, 375000.00),
(4, 6, 5, 100000.00);
-- Update
update products p 
set price = 150000.00
where product_id = 6;
-- Delete
delete from customers 
where customer_id = 4; 

-- Studi Kasus 5 - Modifikasi Tabel (Alter Table)
alter table Customers 
add column phone_number VARCHAR(15);
alter table Customers
alter column customer_name type VARCHAR(150);






