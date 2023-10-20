CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR
(255) NOT NULL UNIQUE,
    password VARCHAR
(255) NOT NULL,
    full_name VARCHAR
(255),
    email VARCHAR
(255)
);

CREATE TABLE medicines (
	id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR
(50),
    price DOUBLE,
    availablity INt DEFAULT  1
);


