create table users(
   user_id INT NOT NULL AUTO_INCREMENT,
   first_name VARCHAR(100) NOT NULL,
   last_name VARCHAR(100) NOT NULL,
   username VARCHAR(100) NOT NULL,
   email VARCHAR(100) NOT NULL,
   user_password VARCHAR(100) NOT NULL,
   PRIMARY KEY ( user_id )
);

create table products(
   product_id INT NOT NULL AUTO_INCREMENT,
   product_name VARCHAR(100) NOT NULL,
   product_description VARCHAR(100) NOT NULL,
   product_price VARCHAR(100) NOT NULL,
   product_availability VARCHAR(100) NOT NULL,
   PRIMARY KEY ( product_id )
);

create table reviews(
   review_id INT NOT NULL AUTO_INCREMENT,
   review_content VARCHAR(2000) NOT NULL,
   review_from_user INT NOT NULL,
   review_for_product INT NOT NULL,
   PRIMARY KEY ( review_id ),
   CONSTRAINT FK_user FOREIGN KEY (review_from_user)
    REFERENCES users(user_id),
   CONSTRAINT FK_product FOREIGN KEY (review_for_product)
    REFERENCES products(product_id)
);

create table purchases(
   purchase_id INT NOT NULL AUTO_INCREMENT,
   purchase_from_use INT NOT NULL,
   purchase_for_product INT NOT NULL,
   PRIMARY KEY ( purchase_id ),
   CONSTRAINT FK_pur_user FOREIGN KEY (purchase_from_use)
    REFERENCES users(user_id),
   CONSTRAINT FK_pur_product FOREIGN KEY (purchase_for_product)
    REFERENCES products(product_id)
);