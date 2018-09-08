CREATE  TABLE users (
  username VARCHAR(45) NOT NULL ,
  password VARCHAR(45) NOT NULL ,
  enabled TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (username));


CREATE TABLE user_roles (
  user_role_id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(45) NOT NULL,
  role varchar(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (role,username),
  KEY fk_username_idx (username),
  CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username));

INSERT INTO users(username,password,enabled)
VALUES ('mkyong','123456', true);
INSERT INTO users(username,password,enabled)
VALUES ('alex','123456', true);

INSERT INTO user_roles (username, role)
VALUES ('mkyong', 'ROLE_USER');
INSERT INTO user_roles (username, role)
VALUES ('mkyong', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role)
VALUES ('alex', 'ROLE_USER');

----------------------------------------
DROP TABLE `auth`.`users`;
DROP TABLE `auth`.`user_roles`;

CREATE TABLE USERS (
user_id INT(10) UNSIGNED NOT NULL PRIMARY KEY,
user_name VARCHAR(50) NOT NULL,
password VARCHAR(50) NOT NULL,
enabled boolean
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE USERS_ROLES (
  user_role_id INT(10) UNSIGNED NOT NULL PRIMARY KEY,
  user_id INT(10) UNSIGNED NOT NULL,
  authority VARCHAR(45) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (user_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO users (user_id, user_name, password, enabled)
VALUES (101, 'mukesh', 'mukesh123', true),
       (102, 'ravi', 'ravi123', true),
       (103, 'amit', 'amit123', true);
 
INSERT INTO user_roles (user_role_id, user_id, authority)
VALUES (101, 101, 'ROLE_ADMIN'),
       (102, 102, 'ROLE_ADMIN'),
       (103, 103, 'ROLE_ADMIN');
       
INSERT INTO `auth`.`users_roles` (`user_role_id`, `user_id`, `authority`) VALUES ('102', '102', 'ROLE_ADMIN');
INSERT INTO `auth`.`users_roles` (`user_role_id`, `user_id`, `authority`) VALUES ('103', '103', 'ROLE_USER');



---------------------------------------
-- https://github.com/spring-projects/spring-security-oauth/blob/master/spring-security-oauth2/src/test/resources/schema.sql
-- used in tests that use HSQL
create table oauth_client_details (
  client_id VARCHAR(256) PRIMARY KEY,
  resource_ids VARCHAR(256),
  client_secret VARCHAR(256),
  scope VARCHAR(256),
  authorized_grant_types VARCHAR(256),
  web_server_redirect_uri VARCHAR(256),
  authorities VARCHAR(256),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information VARCHAR(4096),
  autoapprove VARCHAR(256)
);

create table oauth_client_token (
  token_id VARCHAR(256),
  token VARBINARY(256),
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256)
);

create table oauth_access_token (
  token_id VARCHAR(256),
  token VARBINARY(256),
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256),
  authentication VARBINARY(256),
  refresh_token VARCHAR(256)
);

create table oauth_refresh_token (
  token_id VARCHAR(256),
  token VARBINARY(256),
  authentication VARBINARY(256)
);

create table oauth_code (
  code VARCHAR(256), authentication VARBINARY(256)
);

create table oauth_approvals (
	userId VARCHAR(256),
	clientId VARCHAR(256),
	scope VARCHAR(256),
	status VARCHAR(10),
	expiresAt TIMESTAMP,
	lastModifiedAt TIMESTAMP
);


-- customized oauth_client_details table
create table ClientDetails (
  appId VARCHAR(256) PRIMARY KEY,
  resourceIds VARCHAR(256),
  appSecret VARCHAR(256),
  scope VARCHAR(256),
  grantTypes VARCHAR(256),
  redirectUrl VARCHAR(256),
  authorities VARCHAR(256),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additionalInformation VARCHAR(4096),
  autoApproveScopes VARCHAR(256)
);



----------------------------------------
drop table user;
drop table authorities;
create table user(
	username varchar(50) not null primary key,
	password varchar(100) not null,
	enabled boolean not null
);

create table authorities (
	username varchar(50) not null,
	authority varchar(50) not null,
	constraint fk_authorities_users foreign key(username) references users(username)
);
create table authorities (
	username varchar(50) not null,
	authority varchar(50) not null
);
create unique index ix_auth_username on authorities (username,authority);

insert into user(username,password,enabled)
	values('admin','$2a$10$hbxecwitQQ.dDT4JOFzQAulNySFwEpaFLw38jda6Td.Y/cOiRzDFu',true);
insert into authorities(username,authority)  values('admin','ROLE_ADMIN');