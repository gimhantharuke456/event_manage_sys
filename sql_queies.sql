CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR (255) NOT NULL UNIQUE,
    password VARCHAR (255) NOT NULL,
    full_name VARCHAR (255),
    email VARCHAR (255)
);

CREATE TABLE medicines (
	id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR
(50),
    price DOUBLE,
    availablity INt DEFAULT  1
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ordered_by VARCHAR(100),
    ordered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE orders ADD COLUMN address varchar(200);
ALTER TABLE orders add COLUMN item_name varchar(12);

CREATE TABLE suppliers (
    email varchar(100) PRIMARY KEY ,
    name varchar(100),
    address varchar(250),
    contactNumber varchar(12));