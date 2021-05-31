
-- Добавляем внешние ключи

-- ALTER TABLE profiles DROP FOREIGN KEY profiles_user_id_fk;
--- ALTER TABLE profiles MODIFY COLUMN photo_id INT(10) UNSIGNED;

ALTER TABLE media
  ADD CONSTRAINT media_type_id_fk 
    FOREIGN KEY (media_type_id) REFERENCES media_types(id)
      ON DELETE CASCADE;
     

desc subscriptions;     
ALTER TABLE subscriptions RENAME COLUMN subscriptions_id TO subscription_id;
ALTER TABLE subscriptions RENAME COLUMN subscribers_id TO subscriber_id;

RENAME TABLE company TO companies;

ALTER TABLE users RENAME COLUMN passwords TO password;

ALTER TABLE posts RENAME COLUMN cloud_tag TO cloud_tag_id;
update posts set cloud_tag_id =0 ;
ALTER TABLE posts MODIFY COLUMN cloud_tag_id bigINT UNSIGNED; 

ALTER TABLE profiles MODIFY COLUMN company_id bigINT UNSIGNED;     
ALTER TABLE profiles MODIFY COLUMN company_id bigINT UNSIGNED;
ALTER TABLE subscriptions MODIFY COLUMN subscriptions_id bigINT UNSIGNED;
ALTER TABLE subscriptions MODIFY COLUMN subscribers_id bigINT UNSIGNED;

ALTER TABLE carmas MODIFY COLUMN user_id bigINT UNSIGNED;
ALTER TABLE carmas MODIFY COLUMN target_id bigINT UNSIGNED;

ALTER TABLE messages MODIFY COLUMN from_user_id bigINT UNSIGNED;
ALTER TABLE messages MODIFY COLUMN to_user_id bigINT UNSIGNED;

ALTER TABLE comments MODIFY COLUMN user_id bigINT UNSIGNED;
ALTER TABLE comments MODIFY COLUMN media_id bigINT UNSIGNED;

ALTER TABLE posts MODIFY COLUMN user_id bigINT UNSIGNED;
ALTER TABLE posts MODIFY COLUMN media_id bigINT UNSIGNED;

ALTER TABLE profiles 
  ADD constraint profiles_type_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE cascade;
ALTER TABLE profiles    
  ADD constraint profiles_company_id_fk 
    FOREIGN KEY (company_id) REFERENCES company(id) 
         ON DELETE cascade;
        
ALTER TABLE subscriptions    
  ADD constraint subscriptions_subscribers_id_fk 
    FOREIGN KEY (subscribers_id) REFERENCES users(id) 
         ON DELETE cascade;
ALTER TABLE subscriptions    
  ADD constraint subscriptions_subscriptions_id_fk 
    FOREIGN KEY (subscriptions_id) REFERENCES users(id) 
         ON DELETE cascade;
        
ALTER TABLE carmas    
  ADD constraint carmas_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id) 
         ON DELETE cascade;

ALTER TABLE messages    
  ADD constraint messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id) 
         ON DELETE cascade;
ALTER TABLE messages    
  ADD constraint messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id) 
         ON DELETE cascade;
        
ALTER TABLE comments    
  ADD constraint comments_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id) 
         ON DELETE cascade;
ALTER TABLE comments    
  ADD constraint comments_media_id_fk 
    FOREIGN KEY (media_id) REFERENCES media(id) 
         ON DELETE cascade;      
        
ALTER TABLE posts    
  ADD constraint posts_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id) 
         ON DELETE cascade;
ALTER TABLE posts    
  ADD constraint posts_media_id_fk 
    FOREIGN KEY (media_id) REFERENCES media(id) 
         ON DELETE cascade;   
        
desc subscriptions;
      desc profiles;
      