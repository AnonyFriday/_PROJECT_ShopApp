create database shopapp_angular;
use shopapp_angular;
SET time_zone = '+07:00'; -- If set timezone = +07, this app support only +07
------------------
-- DDL 
------------------

-- Users: contains all users's information
create table users (
	id int primary key auto_increment,
    fullname varchar(100) default '',
    phone_number varchar(20) not null,
    address varchar(200) default '',
    password varchar(100) not null,		-- password after being hashed, sha256
    create_at datetime,
    update_at datetime,
    is_active tinyint(1),				-- dont delete user, check user's status
    date_of_birth date,
    facebook_account_id int default 0,				-- login by Facebook, FB returns a user id
    google_account_id int default 0
);

-- Tokens: a user can have multiple tokens to access the app
create table tokens (
	id int primary key auto_increment,
    token varchar(255) unique not null,
    token_type varchar(50) not null,	-- e.g. JWT token
    expiration_pk_user_tokenspk_user_tokensdate datetime,			-- time period per token's date
    is_revoked tinyint(1) not null,		-- check if the token is revoked (still valid or not)
    is_expired tinyint(1) not null,		-- check if the token expired or not
    user_id int,
    
    constraint fk_user_tokens foreign key tokens(user_id) references users(id)
);

-- Social Accounts: login by facebook and by google account
create table social_accounts (
	id int primary key auto_increment,
    provider varchar(20) not null comment 'Social Network\' Name',
    provider_id varchar(50) not null,
    email varchar(150) not null comment 'User\'s email',
    name varchar(100) not null comment 'User\'s name',
    user_id int,
    
    constraint fk_user_socialAccounts foreign key social_accounts(user_id) references users(id)
);

-- Categories: contains the categories such as: beverages, eletronics, etc.
create table categories (
	id int primary key auto_increment,
    name varchar(100) not null default '' comment 'e.g. beverages, electronics, etc.'
);

-- Products: contains products's information
create table products (
	id int primary key auto_increment,
    name varchar(300) not null comment 'product\'s name',
    price float not null check(price >= 0),		-- price must be positive
    thumbnail varchar(300) default '',			-- the url of the image
    description longtext not null,				-- cannot set default value due to memory-efficient
    created_at timestamp,		-- use 4 bytes convert automatically to timezone +07, comparing to 8-byte when use datetime
    updated_at timestamp,		-- timestamp: UTC format, https://sharelifeinjapan.com/kieu-du-lieu-thoi-gian-va-su-khac-biet-chinh-cua-data-type-datetime-voi-timestamp/
    category_id int,
    
    foreign key products(category_id) references categories(id)
);

-- Roles: a role can be admin and or normal user
create table roles (
	id int primary key auto_increment,
    name varchar(20) not null
);

alter table users 
add column role_id int,
add foreign key users(role_id) references roles(id);

-- Orders: 
	-- contains the receiver's information. (might be different then the user's infor)
    -- contains the shipping' information.
    -- contains the payment_method
create table orders (
	id int primary key auto_increment,
    fullname varchar(100) not null,
    email varchar(100) not null,
    phone_number varchar(20) not null,
    address varchar(200) not null,
    note varchar(100) default '',
    order_date datetime default current_timestamp,
    status varchar(20),
    total_money float check(total_money >= 0),
    user_id int,
    
    foreign key orders(user_id) references users(id)
);

alter table orders
add column shipping_method varchar(100),
add column shipping_address varchar(200),
add column shipping_date date,
add column tracking_number varchar(100),
add column is_active tinyint;	-- avoid hard delete, soft delete by setting is_active = false

alter table orders
modify column status enum('pending', 'processing', 'shipped', 'delivered', 'cancelled')
comment 'The current status of the order';

-- Order_detais: 
	-- contains the no of products within the order
    -- m-m relationship from orders and products
create table order_details (
	id int primary key auto_increment,
    order_id int,
    product_id int,
    quantity int check(quantity > 0),   -- quantity 0 is unrealistic
    price float check (price >= 0),     -- price per unit
    total_price double as (quantity * price) check(total_price >= 0),  -- total price = price * quantity
    color varchar(20) default '',		-- hexa color range
    
    foreign key (order_id) references orders(id),
	foreign key (product_id) references products(id)    
)
