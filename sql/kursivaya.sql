DROP schema if exists ovoshi;
CREATE schema ovoshi;
use ovoshi;

DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
	 id INT primary key auto_increment NOT NULL,
     `name` varchar(128) unique,
     
     INDEX catedorie_name_idx(`name`)
);

DROP TABLE IF EXISTS temperature;
CREATE TABLE temperature (
	id INT primary key auto_increment not null,
    max tinyint signed,
    min tinyint signed
) comment 'диапазоны температур в цельсиях';

DROP TABLE IF EXISTS sort;
CREATE TABLE sort (
	id INT primary key auto_increment NOT NULL,
    `name` varchar(128) unique,
    `price` decimal(19,2) NOT NULL,
    categorie_id INT NOT NULL,
    temp_of_storage_id INT,
    
    FOREIGN KEY (categorie_id) references categories(id) ON DELETE restrict ON UPDATE cascade,
    FOREIGN KEY (temp_of_storage_id) references temperature(id) ON UPDATE cascade ON DELETE restrict,
    
    INDEX sort_name_idx(`name`)
) comment 'сорта яблок, сорта груш и т.д.';

DROP TABLE IF EXISTS supplier;
CREATE TABLE supplier (
	id INT primary key auto_increment not null,
    `name` varchar(128) not null unique,
    tel bigint unsigned,
    created_at datetime default now(),
    updated_at datetime default now()
);

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id bigint primary key auto_increment not null,
    `fistname` varchar(50) not null,
    `lastname` varchar(50),
    tel bigint unsigned,
    email VARCHAR(120) UNIQUE,
    adress varchar(256),
    personal_disc int,
    date_of_birth date,
    fav_prod_id INT,
    created_at datetime default now(),
    updated_at datetime default now(),
    
    FOREIGN KEY (fav_prod_id) references sort(id) ON DELETE cascade ON UPDATE SET NULL 
);

DROP TABLE IF EXISTS storages;
CREATE TABLE storages (
	id INT primary key auto_increment not null,
    adress varchar(256) not null unique,
    tel bigint unsigned
);

DROP table if exists box;
CREATE TABLE box (
	id BIGINT primary key auto_increment not null,
    weight decimal(5,3) comment 'вес в кг',
    sort_id INT NOT NULL,
    supplier_id INT,
    date_of_arrival date,
    `status` varchar(50),
    storage_id int,
    
    FOREIGN KEY (sort_id) REFERENCES sort(id) ON DELETE restrict ON UPDATE cascade,
    foreign key (supplier_id) references supplier(id) ON DELETE restrict ON UPDATE cascade,
    FOREIGN KEY (storage_id) references storages(id) ON delete restrict ON UPDATE cascade
);

DROP table if exists deliveries;
CREATE TABlE deliveries (
	id INT primary key auto_increment not null,
    user_to_deliver BIGINT NOT NULL,
    `status` varchar(50) NOT NULL,
    operation_ids tinytext comment 'вычисляется, состоит из id operation',
    price decimal(19,2),
    created_at datetime default now(),
    updated_at datetime default now(),
    
    FOREIGN KEY (user_to_deliver) references users(id) ON DELETE cascade ON UPDATE cascade
) comment 'заказы';

DROP TABLE IF EXISTS operation;
CREATE TABLE operation (
	id bigint primary key auto_increment not null,
    box_id bigint not null,
    delta_M decimal(5,3) comment 'задаётся из вне или считается',
    
    FOREIGN KEY (box_id) references box(id) ON delete restrict ON UPDATE cascade
);