/* 
Отладочне
  Показать базу данных
    SHOW DATABASE shop;
    SHOW TABLES;

  Показать структуру таблицы
    DESCRIBE users;

  Зайти в базу
    USE data
*/


/* Создать базу данных shop */
  CREATE DATABASE shop;
/* Удалить базу данных shop */
  DROP DATABASE shop;

/* Создать таблицу users */
  CREATE TABLE users(
    id   INT NOT NULL AUTO_INCREMENT,
    name   VARCHAR(30),
    status   TEXT,
    birth   DATE,

    PRIMARY KEY(id)
  );
/* Удалить таблицу users */
  DROP TABLE users;

/* Добавить новый столбец в таблицу после|до name */
  ALTER TABLE users ADD pass VARCHAR(32) AFTER name;
  ALTER TABLE users ADD pass VARCHAR(32) FIRST name;
/* Изменить столбец */
  ALTER TABLE users CHANGE pass new_pass VARCHAR(32) NOT NULL;
/* Удалить столбец в таблице */
  ALTER TABLE users DROP pass VARCHAR(32);

/* Добавить в `table` строку с name = Andrew и a = 17 */
  INSERT INTO `table` VALUES (1, "Andrew", 16, DEFAULT), (NULL, "Andrew", 17, DEFAULT);
/* Игнорировать ошибку primary key */
  INSERT IGNORE INTO `table` VALUES (1, "Andrew", 16, DEFAULT);
/* Добавить, изменив порядок */
  INSERT INTO `table` (`age`,`name`,`date`) VALUES (16, "Andrew", NOW() - INTERVAL 3 WEEK);

/* Вернуть всё из `table`s */
  SELECT * FROM `table`
  /* где a > 10 и b = text */
    WHERE `a` > 10 AND `b` = 'text'
  /* где id находится между 1 и 10 */
    WHERE `id` [NOT] BETWEEN 1 AND 10
  /* где id есть [нет] в заданом списке */
    WHERE `id` [NOT] IN (1,3,4,6,10)
  /* где результат анологичен шаблону _-один сим. %-любое кло симв.*/
    WHERE `id` LIKE '%A_'

  /* сортировать по id [наоборот] */
    ORDER BY `id` [DESC]
    
  /* выбрать первые 10 результатов */
    LIMIT 0,10;


/* Выбрать уникальные имена */
  SELECT DISTINCT `name` FROM `table`
/* Вернуть 2 столбца */
  SELECT `name`,`age` FROM `TABLE`;
/* вернуть имя и вазраст на 1 больше переименованный в new_age */
  SELECT `name`, `age`+1 AS `new_age`;

/* Вернуть соединение строк */
  SELECT CONCAT(`name`, ', ', `sity`) AS `new_col`;
/* Вернуть количество id в `table` */
  SELECT COUNT(`id`) FROM `TABLE`;

/* Вернуть в верхнем регистре */
  SELECT UPPER(`name`) FROM `TABLE`;
/* Вернуть в нижнем регистре */
  SELECT LOWER(`name`) FROM `TABLE`;

/* Вернуть минимальное значение */
  SELECT MIN(`name`) FROM `TABLE`;
/* Вернуть максимальное значение */
  SELECT MAX(`name`) FROM `TABLE`;
/* Вернуть сумму результатов */
  SELECT SUM(`age`) FROM `TABLE`;
/* Вернуть таблицу корней */
  SELECT SQRT(`age`) FROM `TABLE`;
/* Вернуть среднее значение */
  SELECT AVG(`name`) FROM `TABLE`;

/* Изменить таблицу 'table', где id = 1 , установить name = Yarik так-же к а прибавить 1 */
  UPDATE `table` SET `name` = 'Yarik', `a` = `a` + 1 WHERE `id` = 1;
/* Удалить таблицу 'table' где (id = 1) или (id = 2) */
  DELETE FROM `table` [WHERE `id` = 1 [OR `id` = 2]] [LIMIT 3];
/* Очистить таблицу */
  TRUNCATE TABLE `table`;
