CREATE TABLE Students
(
    st_id int,
    gr_id int,
    LastName VARCHAR(60),
    FirstName VARCHAR(60),
    Patronimic VARCHAR(60),
    StTicketNumber VARCHAR(40)
);

INSERT INTO Students (st_id, gr_id, LastName, FirstName, Patronimic, StTicketNumber  )
VALUES (1,1,'Дубровский','Владимир','Андреевич','H201');

INSERT INTO Students (st_id, gr_id, LastName, FirstName, Patronimic, StTicketNumber  )
VALUES (2,1,'Гринев','Петр','Андреевич','Н202');

INSERT INTO Students (st_id, gr_id, LastName, FirstName, Patronimic, StTicketNumber  )
VALUES (3,1,'Карамазов','Алексей','Федорович','Н203');

INSERT INTO Students (st_id, gr_id, LastName, FirstName, Patronimic, StTicketNumber  )
VALUES (4,1,'Ларина','Татьяна','Дмитриевна','Н204');

INSERT INTO Students (st_id, gr_id, LastName, FirstName, Patronimic, StTicketNumber  )
VALUES (5,2,'Ленский','Владимир','Без отчества','Н205');

INSERT INTO Students (st_id, gr_id, LastName, FirstName, Patronimic, StTicketNumber  )
VALUES (6,2,'Раскольников','Родион','Романович','Н206');

INSERT INTO Students (st_id, gr_id, LastName, FirstName, Patronimic, StTicketNumber  )
VALUES (7,2,'Ростова','Наталья','Ильинична','Н207');



-- 1. Удалить все записи из таблицы [dbo].Students
--     DELETE FROM Students;
-- 2. Удалить одну запись из таблицы [dbo].Students , где st_id = 2
DELETE FROM Students WHERE st_id = 2;

-- 3. Удалить две записи из таблицы [dbo].Students где  st_id = 2 и st_id = 3
DELETE FROM Students WHERE st_id IN (2, 3);

-- 4. Обновить одно поле в таблице [dbo].Students вместо Ленский написать Онегин
UPDATE Students SET LastName = 'Онегин' WHERE LastName = 'Ленский';

-- 5. Обновить два поля в таблице [dbo].Students вместо Владимир Ленский написать Евгений Онегин
UPDATE Students SET LastName = 'Онегин', FirstName = 'Евгений' WHERE LastName = 'Ленский' AND FirstName = 'Владимир';

-- 6. Выбрать из таблицы [dbo].Students запись, где фамилия Раскольников.
SELECT * FROM Students WHERE LastName = 'Раскольников';
-- 7. Напишите скрипт создания таблицы test с тремя переменными типа
-- int, char(20), varchar(50).Наименования переменных могут быть любыми.
CREATE TABLE test (
                      id int,
                      LastName VARCHAR(50),
                      FirstName CHAR(20)
);

-- 8. Заполните таблицу test данными, хотя бы три записи.
INSERT INTO test (id, LastName, FirstName) VALUES (1, 'Meme', 'Name');
INSERT INTO test (id, LastName, FirstName) VALUES (2, 'Meme', 'Name2');
INSERT INTO test (id, LastName, FirstName) VALUES (3, 'Meme', 'Name3');

-- 9. Выберите инструкцией SELECT все поля(колонки) из таблицы test
SELECT * FROM test;

-- 10. Для чего используется инструкция USE?
-- Переключение базы данных, с которой будет работать пользователь







