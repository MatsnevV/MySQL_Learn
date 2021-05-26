-- -----------1---------------------
-- Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»:

-- 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
-- Заполните их текущими датой и временем.

update users set created_at=now(), updated_at=now();


-- 2. Таблица users была неудачно спроектирована. 
-- Записи created_at и updated_at были заданы типом VARCHAR 
-- и в них долгое время помещались значения в формате 20.10.2017 8:10. 
-- Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

update users set created_at=date_format(created_at, '%d.%m.%Y %h:%m'), updated_at=date_format(updated_at, '%d.%m.%Y %h:%m');

-- 3. В таблице складских запасов storehouses_products в поле value могут 
-- встречаться самые разные цифры: 0, если товар закончился и выше нуля, 
-- если на складе имеются запасы. Необходимо отсортировать записи таким образом, 
-- чтобы они выводились в порядке увеличения значения value. 
-- Однако нулевые запасы должны выводиться в конце, после всех записей.
 
select value 
from storehouses_products 
order by value=0, value;

-- 4. Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
-- Месяцы заданы в виде списка английских названий (may, august)

select * 
from users 
where date_format(birthday_at, '%m') in ('may', 'august');

-- 5. Из таблицы catalogs извлекаются записи при помощи запроса. 
-- SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.


select * 
from catalogs 
where 
  id in (5, 1, 2)
order by 
  field(id, 5, 1, 2);

-- -----------2---------------------
-- Практическое задание теме «Агрегация данных»:

-- 1. Подсчитайте средний возраст пользователей в таблице users.

select 
  avg((year(current_date())-year(birthday_at))-(right(current_date() ,5) < right (birthday_at,5)))
from 
users;

-- 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT 
  date_format(date(concat_ws('-',year(now()), month(birthday_at),day(birthday_at))), '%W') as day,
  count(*) as total
FROM 
users
group by
  day
order by 
  total desc;

  -- 3. (по желанию) Подсчитайте произведение чисел в столбце таблицы
SELECT ROUND(EXP(SUM(LN(id)))) FROM catalogs;