# Базы данных
# Урок 1. Установка окружения

# Установливаем MySQL8 на Linux Ubuntu 20.04

# Обновим систему
sudo apt update
sudo apt upgrade

# Устанавливаем сервер ssh
sudo apt install openssh-server

# Устанавливаем MySQL 8
sudo apt install mysql-server

# Проверка версии клиента и сервера
mysql -V
mysqld -V

# Смотрим статус сервера
sudo systemctl status mysql

# Первоначальное подключение
sudo mysql

# Меняем пароль для пользователя root (в клиенте mysql)
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'my8sql';
FLUSH PRIVILEGES;

# Заходим в консольный клиент пользователем root с паролем
mysql -u root -p

# Подключение к удалённой машине через ssh
ssh ваш_логин@ваш_IP
mysql -u root -p
exit


# Установка MySQL Workbench отдельно
# https://dev.mysql.com/downloads/workbench/

# Установка Dbeaver
# https://dbeaver.io/download/

# После установки подключаемся консольным клиентом
# Подключаемся через Workbench
# Устанавливаем и подключаемся через DBeaver


# Установка Putty
# https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html

# Подключение к удалённой машине с помощью Putty

# Установка MySQL Workbench
# https://dev.mysql.com/downloads/workbench/

# Установка Dbeaver
# https://dbeaver.io/download/

# После установки подключаемся консольным клиентом
# Добавляем путь в Path если нужно
# Подключаемся через Workbench
# Устанавливаем и подключаемся через DBeaver

# /usr/local/mysql/bin
