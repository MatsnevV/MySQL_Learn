


-- Добавляем внешние ключи в БД vk
-- Для таблицы профилей



-- Добавляем внешние ключи
ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;
     
ALTER TABLE profiles
  ADD CONSTRAINT profiles_city_id_fk 
    FOREIGN KEY (city_id) REFERENCES cities(id)
      ON DELETE set null;
     
ALTER TABLE cities
  ADD CONSTRAINT cities_city_id_fk 
    FOREIGN KEY (country_id) REFERENCES countries(id)
      ON DELETE set null;
     
ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_users_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;     
     
 ALTER TABLE communities_users
  ADD CONSTRAINT community_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id)
      ON DELETE CASCADE;  
     
 ALTER TABLE friendship
  ADD CONSTRAINT user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE; 
 ALTER TABLE friendship
  ADD CONSTRAINT friend_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;       
     
 ALTER TABLE friendship
  ADD CONSTRAINT friendship_statuses_id_fk 
    FOREIGN KEY (friendship_status_id) REFERENCES friendship_statuses(id)
      ON DELETE CASCADE;          

 ALTER TABLE media
  ADD CONSTRAINT media_type_id_fk 
    FOREIGN KEY (media_type_id) REFERENCES media_types(id)
      ON DELETE CASCADE;
     
 ALTER TABLE media
  ADD CONSTRAINT media_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE; 
     
 ALTER TABLE posts
  ADD CONSTRAINT posts_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;    
 ALTER TABLE posts
  ADD CONSTRAINT posts_community_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id)
      ON DELETE CASCADE; 
     
 ALTER TABLE posts
  ADD CONSTRAINT media_id_fk 
    FOREIGN KEY (media_id) REFERENCES media(id)
      ON DELETE CASCADE;    
     
  ALTER TABLE messages
  ADD CONSTRAINT from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id)
      ON DELETE CASCADE;
ALTER TABLE messages
  ADD CONSTRAINT to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id)
      ON DELETE CASCADE;
     
ALTER TABLE messages
  ADD CONSTRAINT messages_media_id_fk 
    FOREIGN KEY (media_id) REFERENCES media(id)
      ON DELETE CASCADE;      

  ALTER TABLE likes
  ADD CONSTRAINT likes_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;  
     
     
     
     
     
-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?  

SELECT
	(SELECT gender FROM profiles WHERE user_id = likes.user_id) AS gender,
	COUNT(*) AS total
    FROM likes
    GROUP BY gender
    ORDER BY total DESC
    LIMIT 2;  

-- 4. Вывести для каждого пользователя количество созданных сообщений, постов,
-- загруженных медиафайлов и поставленных лайков.
SELECT 
  CONCAT(first_name, ' ', last_name) AS user,
  (SELECT COUNT(*) FROM messages WHERE messages.from_user_id = users.id) AS total_messages,
  (SELECT COUNT(*) FROM posts WHERE posts.user_id = users.id) AS total_posts,  
	(SELECT COUNT(*) FROM media WHERE media.user_id = users.id) AS total_media, 
	(SELECT COUNT(*) FROM likes WHERE likes.user_id = users.id) AS total_likes
	  FROM users;     
     
 -- 5. (по желанию) Подсчитать количество лайков которые получили 10 самых последних сообщений.

DESC likes;

-- Выбираем последние 10 сообщений
SELECT * FROM messages ORDER BY created_at DESC LIMIT 10;

-- Выбираем количество лайков по условию
SELECT 
  (SELECT COUNT(*) FROM likes 
    WHERE target_id = messages.id AND target_type = 'messages') AS likes_total  
  FROM messages 
  ORDER BY created_at DESC 
  LIMIT 10;

-- Подбиваем сумму внешним запросом
SELECT SUM(likes_total) FROM  
  (SELECT 
    (SELECT COUNT(*) FROM likes 
      WHERE target_id = messages.id AND target_type = 'messages') AS likes_total  
    FROM messages 
    ORDER BY created_at DESC 
    LIMIT 10) AS messages_likes;  

-- Другой вариант
SELECT COUNT(*) FROM likes 
  WHERE target_type = 'messages'
    AND target_id IN (SELECT * FROM (
      SELECT id FROM messages 
        ORDER BY created_at DESC LIMIT 10) AS sorted_messages);
     	      
     
     
     
     