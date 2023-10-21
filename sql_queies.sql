CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR (255) NOT NULL UNIQUE,
    password VARCHAR (255) NOT NULL,
    full_name VARCHAR (255),
    email VARCHAR (255)
);
CREATE TABLE packages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    packageName VARCHAR(255) NOT NULL,
    type VARCHAR(255),
    releasedYear INT,
    language VARCHAR(255),
    numberOfSongs INT,
    packagePrice DOUBLE,
    availableTimePeriod VARCHAR(255),
    packagePoster VARCHAR(255)
);
