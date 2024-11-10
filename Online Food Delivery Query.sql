-- 1. Create Tables
-- 1.1. Create Customer Table
CREATE TABLE customer (
    customer_id VARCHAR2(5) NOT NULL,
    first_name VARCHAR2(20) NOT NULL,
    last_name VARCHAR2(20) NOT NULL,
    phone_number NUMBER(12) NOT NULL,
    address VARCHAR2(50) NOT NULL,
    email VARCHAR2(50) UNIQUE NOT NULL,
    CHECK (REGEXP_LIKE(email, '^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')),
    CONSTRAINT customer_id_pk PRIMARY KEY (customer_id)
)

-- 1.2. Create Orders Table
CREATE TABLE orders (
    order_id VARCHAR2(5) NOT NULL,
    customer_id VARCHAR2(5) NOT NULL,
    order_date DATE NOT NULL,
    payment_method INT NOT NULL
        CHECK (payment_method IN (1, 2)),
    CONSTRAINT order_id_pk PRIMARY KEY (order_id),
    CONSTRAINT order_customer_id_fk FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
)

-- 1.3. Create Delivery Table
CREATE TABLE delivery (
    driver_id VARCHAR2(5) NOT NULL,
    driver_name VARCHAR2(30) NOT NULL,
    phone_number NUMBER(12) NOT NULL,
    order_id VARCHAR2(5) NOT NULL,
    license_plate_number VARCHAR2(9) NOT NULL,
    CONSTRAINT driver_id_pk PRIMARY KEY (driver_id),
    CONSTRAINT driver_order_id_fk FOREIGN KEY (order_id) REFERENCES orders(order_id)
)

-- 1.4. Create Pickup Table
CREATE TABLE pickup (
    pickup_id VARCHAR2(5) NOT NULL,
    pickup_time DATE NOT NULL,
    order_id VARCHAR2(5) NOT NULL,
    CONSTRAINT pickup_id_pk PRIMARY KEY (pickup_id),
    CONSTRAINT order_pickup_id_fk FOREIGN KEY (order_id) REFERENCES orders(order_id)
)

-- 1.5. Create Restaurant Table
CREATE TABLE restaurant (
    restaurant_id VARCHAR2(5) NOT NULL,
    restaurant_name VARCHAR2(30) NOT NULL,
    address VARCHAR2(50) NOT NULL,
    phone_number NUMBER(12) NOT NULL,
    CONSTRAINT restaurant_id_pk PRIMARY KEY (restaurant_id)
)

-- 1.6. Create Menu Item Table
CREATE TABLE menu_item (
    item_id VARCHAR2(5) NOT NULL,
    item_name VARCHAR2(30) NOT NULL,
    price INT NOT NULL,
    restaurant_id VARCHAR2(5) NOT NULL,
    description_item VARCHAR2(50) NOT NULL,
    CONSTRAINT item_id_pk PRIMARY KEY (item_id),
    CONSTRAINT item_restaurant_id_fk FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
)

-- 1.7. Create Order Detail Table
CREATE TABLE order_detail (
    order_id VARCHAR2(5) NOT NULL,
    item_id VARCHAR2(5) NOT NULL,
    item_quantity INT NOT NULL,
    CONSTRAINT order_detail_order_id_fk FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT order_detail_item_id_fk FOREIGN KEY (item_id) REFERENCES menu_item(item_id)
)

-- 2. Insert Data Into Tables
-- 2.1. Insert Customer Data
INSERT INTO customer VALUES ('C0001', 'Cica', 'Carlos', '081102938475', 'Jl. Sakura No. 5', 'caca333@gmail.com')
INSERT INTO customer VALUES ('C0002', 'Maarten', 'Lubis', '081293847561', 'Jl. Melati No. 17', 'lub1s090@gmail.com')
INSERT INTO customer VALUES ('C0003', 'Stefani', 'Lina', '081384756102', 'Jl. Mawar No. 1', 'tef4ni432@gmail.com')
INSERT INTO customer VALUES ('C0004', 'Hendri', 'Saputra', '081475610293', 'Jl. Anggrek No. 9', 'h3ndri002@gmail.com')
INSERT INTO customer VALUES ('C0005', 'Putri', 'Amalia', '081561029384', 'Jl. Kamboja No. 22', 'putr1123@yahoo.com')

SELECT *
FROM customer

-- 2.2. Insert Orders Data
INSERT INTO orders VALUES ('O0001', 'C0001', TO_DATE('08-08-2024', 'dd-mm-yyyy'), 1)
INSERT INTO orders VALUES ('O0002', 'C0002', TO_DATE('08-08-2024', 'dd-mm-yyyy'), 2)
INSERT INTO orders VALUES ('O0003', 'C0003', TO_DATE('08-08-2024', 'dd-mm-yyyy'), 1)
INSERT INTO orders VALUES ('O0004', 'C0004', TO_DATE('08-08-2024', 'dd-mm-yyyy'), 2)
INSERT INTO orders VALUES ('O0005', 'C0005', TO_DATE('08-08-2024', 'dd-mm-yyyy'), 2)

SELECT *
FROM orders

-- 2.3. Insert Delivery Data
INSERT INTO delivery VALUES ('D0002', 'Nadia Safira', '081345678901', 'O0002', 'D 456 FGH')
INSERT INTO delivery VALUES ('D0004', 'Fajar Setiawan', '081567890123', 'O0004', 'D 012 LMN')
INSERT INTO delivery VALUES ('D0005', 'Reza Santoso', '081678901234', 'O0005', 'F 345 OPQ')

SELECT *
FROM delivery

-- 2.4. Insert Pickup Data
INSERT INTO pickup VALUES ('P0001', TO_DATE('08-08-2024', 'dd-mm-yyyy'), 'O0001')
INSERT INTO pickup VALUES ('P0002', TO_DATE('08-08-2024', 'dd-mm-yyyy'), 'O0003')

SELECT *
FROM pickup

-- 2.5. Insert Restaurant Data
INSERT INTO restaurant VALUES ('R0001', 'Ayam Geprek Delicious', 'Jl. Bandung No. 2', '081098765432')
INSERT INTO restaurant VALUES ('R0002', 'Ramen Hot Yum', 'Jl. Jakarta No. 10', '081987654321')
INSERT INTO restaurant VALUES ('R0003', 'Mie Ayam Bakso TOP', 'Jl. Jakarta No. 5', '081876543210')
INSERT INTO restaurant VALUES ('R0004', 'Nasi Goreng 77', 'Jl. Malang No. 23', '081765432109')
INSERT INTO restaurant VALUES ('R0005', 'Seafood House', 'Jl. Jakarta No. 7', '081654321098')

SELECT *
FROM restaurant

-- 2.6. Insert Menu Item Data
INSERT INTO menu_item VALUES ('I0001', 'Ayam Geprek Barbeque', 25000, 'R0001', 'Nasi + Ayam Geprek + Sambal Matah')
INSERT INTO menu_item VALUES ('I0002', 'Shio Ramen', 27000, 'R0002', 'Ramen + Ayam + Telur + Sayuran')
INSERT INTO menu_item VALUES ('I0003', 'Mie Ayam Bakso Urat', 22000, 'R0003', 'Mie Ayam + Bakso Urat')
INSERT INTO menu_item VALUES ('I0004', 'Nasi Goreng Kampung', 19000, 'R0004', 'Nasi Goreng + Bakso + Sosis')
INSERT INTO menu_item VALUES ('I0005', 'Cumi Goreng Tepung', 26000, 'R0005', 'Cumi Goreng + Mayonnaise')

SELECT *
FROM menu_item

-- 2.7. Insert Order Detail Data
INSERT INTO order_detail VALUES ('O0001', 'I0001', 2)
INSERT INTO order_detail VALUES ('O0002', 'I0002', 5)
INSERT INTO order_detail VALUES ('O0003', 'I0003', 1)
INSERT INTO order_detail VALUES ('O0004', 'I0004', 8)
INSERT INTO order_detail VALUES ('O0005', 'I0005', 5)

SELECT *
FROM order_detail

-- 3. Add View
-- 3.1. Create a simple view that displays a list of restaurants in Jl Jakarta
CREATE VIEW view_list_restaurants AS
    SELECT *
    FROM restaurant
    WHERE address LIKE 'Jl. Jakarta%'

SELECT * 
FROM view_list_restaurants

-- 3.2. Insert data in simple view
INSERT INTO view_list_restaurants VALUES ('R0006', 'Rumah Makan Sunda', 'Jl. Jakarta No. 13', '081543210987')

SELECT * 
FROM view_list_restaurants

-- 3.3. View the customer's order summary by creating a complex view
CREATE VIEW stefani_order AS
    SELECT 
        c.first_name,
        c.last_name,
        c.address,
        o.order_id,
        o.order_date,
        o.payment_method
    FROM customer c
    INNER JOIN orders o 
    ON c.customer_id = o.customer_id
    WHERE c.first_name = 'Stefani'

SELECT * 
FROM stefani_order

-- 4. Synonyms
-- Create synonyms from view_resto_jakarta to resto_jakarta
CREATE SYNONYM restaurants_jakarta
FOR view_list_restaurants

SELECT * FROM restaurants_jakarta

-- 5. Sequences
-- Create sequences for order number
CREATE SEQUENCE order_id_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 5000
    NOCACHE
    NOCYCLE

SELECT *
FROM orders
ORDER BY order_date DESC

-- 6. Index
-- Create index for customer_address
CREATE INDEX idx_customer_address
ON customer(address)

SELECT *
FROM user_indexes
