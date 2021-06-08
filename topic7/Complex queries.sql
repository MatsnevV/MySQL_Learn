-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT DISTINCT name 
  FROM users 
  INNER JOIN orders  
    ON users.id = orders.user_id;

-- Выведите список товаров products и разделов catalogs, который соответствует товару.
   
  
   
SELECT products.name AS product_name, catalogs.name AS product_type 
  FROM products 
  LEFT JOIN catalogs 
    ON products.catalog_id = catalogs.id;