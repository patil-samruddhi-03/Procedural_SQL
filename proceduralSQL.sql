-- create database

CREATE DATABASE demoDB;
USE demoDB;

-- create table
CREATE TABLE user_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    is_active BOOLEAN NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL
);

-- create procedure
DELIMITER $$
CREATE PROCEDURE InsertUserData(
    IN p_name VARCHAR(100),
    IN p_age INT,
    IN p_is_active BOOLEAN,
    IN p_email VARCHAR(100),
    IN p_created_at DATE,
    IN p_updated_at DATE
)
BEGIN
    INSERT INTO user_data (name, age, is_active, email, created_at, updated_at)
    VALUES (p_name, p_age, p_is_active, p_email, p_created_at, p_updated_at);
END $$
DELIMITER ;

-- insert data
CALL InsertUserData('John Doe', 30, TRUE, 'johndoe@example.com', '2025-01-01', '2025-01-01');

-- reading data
DELIMITER $$
CREATE PROCEDURE GetUserData()
BEGIN
    SELECT * FROM user_data;
END $$
DELIMITER ;

CALL GetUserData();

-- stored procedure for updating data 
DELIMITER $$
CREATE PROCEDURE UpdateUserData(
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_age INT,
    IN p_is_active BOOLEAN,
    IN p_email VARCHAR(100),
    IN p_updated_at DATE
)
BEGIN
    UPDATE user_data
    SET name = p_name,
        age = p_age,
        is_active = p_is_active,
        email = p_email,
        updated_at = p_updated_at
    WHERE id = p_id;
END $$
DELIMITER ;

CALL UpdateUserData(11, 'John Doey', 32, TRUE, 'johnnyd@bexample.com', '2025-01-15');


DELIMITER $$
CREATE PROCEDURE DeleteUserData(IN p_id INT)
BEGIN
    DELETE FROM user_data WHERE id = p_id;
END $$
DELIMITER ;

CALL DeleteUserData(1);

CALL InsertUserData('Alice Smith', 25, TRUE, 'alice.smith@example.com', '2025-01-01', '2025-01-01');
CALL InsertUserData('Bob Brown', 35, FALSE, 'bob.brown@example.com', '2025-01-02', '2025-01-02');

CALL GetUserData();

CALL UpdateUserData(2, 'Bob Brown', 36, TRUE, 'bob.brown@updated.com', '2025-01-20');

CALL DeleteUserData(1);




