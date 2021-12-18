/*
    db_init.sql
    Keegan Jones
    11/16/2021
    Proviso MySQL DB initialization to create tables
*/

-- drop test user if exists 
DROP USER IF EXISTS 'proviso_user'@'localhost';


-- create proviso_user and grant them all privileges to the proviso_user database 
CREATE USER 'proviso_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL5IsGreat!';


-- grant all privileges to the proviso database to user proviso_user on localhost 
GRANT ALL PRIVILEGES ON proviso.* TO'proviso_user'@'localhost';


-- Drop the foreign key
ALTER TABLE reservation DROP FOREIGN KEY fk_customer;


-- drop tables if they are present
DROP TABLE IF EXISTS customer; 
DROP TABLE IF EXISTS reservation; 


-- create customer table 
CREATE TABLE customer (
	customer_id 		INT 			NOT NULL		AUTO_INCREMENT,
	first_name		VARCHAR(75)		NOT NULL,
	last_name		VARCHAR(75)		NOT NULL,
	user_name		VARCHAR(75)		NOT NULL;
	password		VARCHAR(75)		NOT NULL;
	loyalty_points  INT             NOT NULL;
	PRIMARY KEY(customer_id)
);

-- create reservation table 
CREATE TABLE reservation (
	reservation_id		INT 			NOT NULL 		AUTO_INCREMENT,
	roomSize			VARCHAR(150)	NOT NULL, 
	customer_id			INT				NOT NULL,
	amenities			VARCHAR(75)		NOT NULL,
	guests				VARCHAR(10)		NOT NULL,
	loyaltyPoints		INT(150)        NOT NULL,
	
	PRIMARY KEY(reservation_id),
	CONSTRAINT fk_customer
	FOREIGN KEY(customer_id)
		REFERENCES customer(customer_id)
); 

-- insert customer statements 
INSERT INTO customer(first_name, last_name, user_name, password, loyaltyPoints)
	VALUES('Keegan', 'Jones', 'keeganadamsjones@gmail.com', 'pass1111', '0');

INSERT INTO customer(first_name, last_name, user_name, password, loyaltyPoints)
	VALUES('Nellie', 'Brooklyn', 'nelliebrooklyns@gmail.com', 'pass1112', '150');

INSERT INTO customer(first_name, last_name, user_name, password, loyaltyPoints)
	VALUES('Olivia', 'Grace', 'oliviagrace@gmail.com', 'pass1113', '300');


INSERT INTO reservation(roomSize, customer_id, amenities, guests, loyaltyPoints)
	VALUES('King',(SELECT customer_id FROM customer WHERE last_name = 'Jones'),'wifi breakfast', '1-2', '150');
	
INSERT INTO reservation(roomSize, customer_id, amenities, guests, loyaltyPoints)
	VALUES('doubleFull',(SELECT customer_id FROM customer WHERE last_name = 'Brooklyn'),'wifi breakfast parking', '1-2', '150');
	
INSERT INTO reservation(roomSize, customer_id, amenities, guests, loyaltyPoints)
	VALUES('doubleQueen',(SELECT customer_id FROM customer WHERE last_name = 'Grace'),'wifi', '3-5', '150');
	

