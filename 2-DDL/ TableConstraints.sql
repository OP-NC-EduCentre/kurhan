-- Формат дати
ALTER SESSION SET NLS_DATE_FORMAT = 'dd/mm/yyyy';

-- PK та загальні обмеження
ALTER TABLE type ADD CONSTRAINT type_pk PRIMARY KEY (id);
ALTER TABLE type ADD CONSTRAINT type_name_unique UNIQUE (name);
ALTER TABLE type ADD CONSTRAINT volume_is_positive CHECK (volume > 0);

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY (id);
ALTER TABLE product ADD CONSTRAINT product_name_unique UNIQUE (name);
ALTER TABLE product ADD CONSTRAINT product_amount_is_positive CHECK (amount > 0);
ALTER TABLE product ADD CONSTRAINT product_price_is_positive CHECK (price > 0);
ALTER TABLE product ADD CONSTRAINT product_barcode_unique UNIQUE (barcode);

ALTER TABLE products_sold ADD CONSTRAINT products_sold_pk PRIMARY KEY (id);
ALTER TABLE products_sold ADD CONSTRAINT products_sold_amount_is_positive CHECK (amount_sold > 0);

ALTER TABLE order_receipt ADD CONSTRAINT order_receipt_pk PRIMARY KEY (id);

ALTER TABLE client ADD CONSTRAINT client_pk PRIMARY KEY (id);
ALTER TABLE client ADD CONSTRAINT client_phone_unique UNIQUE (phone_number);

-- FK
ALTER TABLE product ADD CONSTRAINT product_type_id_fk 
    FOREIGN KEY (type_id) REFERENCES type(id);
    
    
ALTER TABLE products_sold ADD CONSTRAINT products_sold_product_fk 
    FOREIGN KEY (product_id) REFERENCES product(id);
ALTER TABLE products_sold ADD CONSTRAINT products_sold_order_fk 
    FOREIGN KEY (order_id) REFERENCES order_receipt(id);
    
    
ALTER TABLE order_receipt ADD CONSTRAINT order_client_id_fk 
    FOREIGN KEY (client_id) REFERENCES client(id);
    
-- NOT NULL
ALTER TABLE type MODIFY (name NOT NULL);
ALTER TABLE type MODIFY (volume NOT NULL);
--ALTER TABLE type MODIFY (description NOT NULL);

ALTER TABLE product MODIFY (name NOT NULL);
ALTER TABLE product MODIFY (type_id NOT NULL);
ALTER TABLE product MODIFY (amount NOT NULL);
ALTER TABLE product MODIFY (price NOT NULL);
ALTER TABLE product MODIFY (barcode NOT NULL);

ALTER TABLE products_sold MODIFY (product_id NOT NULL);
ALTER TABLE products_sold MODIFY (order_id NOT NULL);
ALTER TABLE products_sold MODIFY (amount_sold NOT NULL);

ALTER TABLE order_receipt MODIFY (order_date NOT NULL);
-- ALTER TABLE order_receipt MODIFY (client_id NOT NULL); -- дані про клієнта не обов'язкові (можливі замовлення без реєстрації)

ALTER TABLE client MODIFY (name NOT NULL);
ALTER TABLE client MODIFY (phone_number NOT NULL);