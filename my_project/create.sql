-- drop database habr;

-- create database habr;
-- use habr;


-- таблица пользователей
DROP TABLE IF EXISTS users;
CREATE TABLE users (
id serial PRIMARY KEY, 
login VARCHAR(50) NOT NULL COMMENT "login",
passwords VARCHAR(50) NOT NULL COMMENT "PASSWORD",
  created_at DATETIME DEFAULT NOW(),
  edited_at DATETIME DEFAULT NOW() ON UPDATE NOW()
 );

-- profiles

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
id serial PRIMARY KEY, 
user_id int unsigned COMMENT "cсылка на поьзователя",
company_id int unsigned COMMENT "ссылка на компанию",
email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
rating double(16,1) default 0.0 comment "рейтинг расчитывается на по карме и количество постов ",
confirmed_at datetime DEFAULT CURRENT_TIMESTAMP,
  created_at DATETIME DEFAULT NOW(),
  edited_at DATETIME DEFAULT NOW() ON UPDATE NOW());


-- Subscriptions подписки
DROP TABLE IF exists subscriptions;
CREATE TABLE subscriptions (
subscriptions_id int unsigned NOT null comment "подписчики",
subscribers_id int unsigned NOT NULL comment "подписки",
  created_at DATETIME DEFAULT NOW(),
  edited_at DATETIME DEFAULT NOW() ON UPDATE NOW());

-- сообщения
DROP TABLE IF exists messages;
CREATE TABLE messages (
  id serial PRIMARY KEY,
  from_user_id int unsigned NOT NULL ,
  to_user_id int unsigned NOT NULL ,
  body text NOT NULL ,
  media_id int unsigned DEFAULT NULL,
  is_important tinyint(1) DEFAULT NULL,
   created_at DATETIME DEFAULT NOW(),
  edited_at DATETIME DEFAULT NOW() ON UPDATE NOW()
  );
-- таблица компаний для постов 
DROP TABLE IF exists company;
CREATE TABLE company (
id serial PRIMARY KEY, 
name varchar(50)  NOT NULL COMMENT "name",  created_at DATETIME DEFAULT NOW(),
  edited_at DATETIME DEFAULT NOW() ON UPDATE NOW()
 );

-- таблицы медиа 
DROP TABLE IF EXISTS media;
CREATE TABLE media (
id serial PRIMARY KEY, 
filename varchar(255) not null comment "ссылка на хранилеще",
size int NOT NULL COMMENT "размер",
metadata json DEFAULT null comment "данные ",
media_type_id int unsigned NOT NULL COMMENT "тип данных",
  created_at DATETIME DEFAULT NOW(),
  edited_at DATETIME DEFAULT NOW() ON UPDATE NOW()
  );
 
DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  type VARCHAR(255) NOT NULL UNIQUE
);

-- таблица комментаниев
DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
id serial PRIMARY KEY, 
user_id int unsigned NOT NULL COMMENT"cсылка на узера",
media_id int unsigned COMMENT "ccылка на медиа если есть",
  created_at DATETIME DEFAULT NOW(),
  edited_at DATETIME DEFAULT NOW() ON UPDATE NOW()
 );

-- Карма она же лайки
DROP TABLE IF EXISTS carmas;
CREATE TABLE carmas (
id serial PRIMARY KEY, 
user_id int unsigned NOT NULL COMMENT"кто оценил",
target_id int unsigned NOT NULL COMMENT"чему поставлена",
target_type ENUM('comment', 'users', 'posts', 'company') NOT NULL,
target_carma int default 0 comment "оценка",
  created_at DATETIME DEFAULT NOW(),
  edited_at DATETIME DEFAULT NOW() ON UPDATE NOW()
 );


-- Table posts:
DROP TABLE IF exists posts;
create table posts(
  id serial PRIMARY KEY, 
  user_id INT UNSIGNED NOT null comment "ссыдка на пользователя",
  head varchar(255) comment"заголовок",
  body TEXT NOT NULL COMMENT "Markdown",
  media_id int unsigned COMMENT "ссылки на медиа",
  cloud_tag text comment"теги для быстрого поиска по группам постов",
  is_public BOOLEAN DEFAULT TRUE,
  is_archived BOOLEAN DEFAULT FALSE,
  created_at DATETIME DEFAULT NOW(),
  edited_at DATETIME DEFAULT NOW() ON UPDATE NOW()
 );

-- DROP TABLE IF EXISTS users;
-- CREATE TABLE users (
-- ) COMMENT = 'users';
