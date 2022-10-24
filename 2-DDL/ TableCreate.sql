DROP TABLE type CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE products_sold CASCADE CONSTRAINTS;
DROP TABLE order_receipt CASCADE CONSTRAINTS;
DROP TABLE client CASCADE CONSTRAINTS;

CREATE TABLE type (
    id NUMBER(9),
    name VARCHAR(50),
    volume NUMBER(3,1),
    description VARCHAR(100)
);

CREATE TABLE product (
    id NUMBER(9),
    name VARCHAR(50),
    type_id NUMBER(9),
    amount NUMBER(9),
    price NUMBER(9, 2),
    barcode VARCHAR(14)
);

CREATE TABLE products_sold (
    id NUMBER(9),
    product_id NUMBER(9),
    order_id NUMBER(9), -- посилання на order_receipt
    amount_sold NUMBER(9)
);

CREATE TABLE order_receipt (
    id NUMBER(9),
    order_date DATE,
    client_id NUMBER(9)
);

CREATE TABLE client (
    id NUMBER(9),
    name VARCHAR(50),
    phone_number NUMBER(12)
);