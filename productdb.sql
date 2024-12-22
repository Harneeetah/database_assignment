-- create table items
CREATE TABLE items (
    id INT AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    description varchar(255),
    item_category ENUM('general', 'household', 'office'),
    quantity INT,
    price INT,
    item_size ENUM('small','medium','large'),
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

-- create table users
CREATE TABLE users (
    id int,
    name varchar(255),
    email varchar(255),
    password varchar(255),
    gender ENUM('male', 'female'),
    contact varchar(255),
    country_code varchar(255),
    phone_number varchar(255),
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
)

-- create table orders
CREATE TABLE orders (
    id int,
    status ENUM('approved', 'disapproved'),
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    user_id int,
    item_id int,
    order_price int,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (item_id) REFERENCES items(id),
    PRIMARY KEY (id)
)

-- create table admin
CREATE TABLE admin (
    id int,
    name varchar(255),
    role varchar(255),
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    user_id int,
    FOREIGN KEY (user_id) REFERENCES users(id),
    PRIMARY KEY (id)
)

-- insert into items
insert into items
(id,name, description,item_category,quantity,price,item_size) 
values (1,'Soap', 'washing soap','general',15,10, 'medium');
insert into items
(id,name, description,item_category,quantity,price,item_size) 
values (id,'plates', 'kitchen plates','household',20,16, 'medium');

--insert into users
insert into users
(id,name,email,password,gender,country_code,phone_number) 
values (1,'Annie', 'annie@gmail.com','Random12','female','234','1023456749');
insert into users
(id,name,email,password,gender,country_code,phone_number) 
values (id,'Amaka', 'ab@gmail.com','Random16','female','234','4023456649');

-- insert into orders
insert into orders
(id,status,user_id,item_id,order_price)values
(1,'approved',1,1,10);
insert into orders
(id,status,user_id,item_id,order_price)values
(2,'approved',1,2,10);

-- insert into admin
insert into admin
(id,name,role,user_id)
values(1,'Anita','admin',1);

-- select all items
select * from items

-- update an item
update items 
set name = 'Bag' 
where id = 1

-- delete an item
delete from items
where id = 2

-- select all items based on item size
select id, name, description from items 
where item_size = 'medium';


-- select all items based on orders join
select * from items join orders on items.id = orders.item_id

--select all users based on orders join
select * from users join orders on users.id = orders.user_id;