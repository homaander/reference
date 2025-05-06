### SQLite3 Commands

```
> sqlite3
  >> .read create_db.sql    - Выполнить скрипт создания таблицы
  >> .save infinityApp.db   - Сохранить БД
  >> .exit

  > sqlite3
  >> .open infinityApp.db   - Открыть БД
  >> .tables                - Просмотреть список таблиц
  >> select * from users;
  >> insert into users (name, age, bio) values ('Yarik', 25, 'Admin');
  >> delete from users where id = 3
```

