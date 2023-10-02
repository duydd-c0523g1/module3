DELIMITER //
CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN
SELECT users.name, users.email, users.country
FROM users
WHERE users.id = user_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insert_user(IN user_name VARCHAR(50),IN user_email VARCHAR(50),IN user_country VARCHAR(50))
BEGIN
INSERT INTO users(name, email, country)
VALUES(user_name, user_email, user_country);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE select_all_users()
BEGIN
SELECT * FROM users;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE edit_user(IN input_id INT,input_name VARCHAR(50), input_email VARCHAR(50), input_country VARCHAR(50))
BEGIN
UPDATE users
SET `name` = input_name, email = input_email, country = input_coutnry
WHERE id = input_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE delete_user(IN input_id INT)
BEGIN
DELETE FROM users
WHERE id = input_id;
END //
DELIMITER ;

CALL delete_user(?);
CALL get_user_by_id(1);
CALL insert_user("Quang", "qvn@ymail.com", "Vietnam");
CALL select_all_users();
CALL edit_user(?, ?, ?, ?);