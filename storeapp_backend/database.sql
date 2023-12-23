create database shopapp_angular;
use shopapp_angular;

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

-- Tokens:
create table tokens (
	
)