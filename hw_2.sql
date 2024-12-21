USE tsql2012

--1. Из базы данных TSQL 2012 из таблицы [Production].[Suppliers]
-- показать  все записи, где поле region равно NULL
SELECT * from production.suppliers where region is null

--2. Из базы данных TSQL 2012 из таблицы [Production].[Suppliers]
-- показать все записи где поле region не равно NULL
SELECT * from production.suppliers where region is not null

--3. Найти все фамилии в таблице [HR].Employees базы данных TSQL 2012,
--  состоящие из четырех букв (Указание - любая буква это подчеркивание)
SELECT * from hr.employees where lastname like '____'

--4. Найти все фамилии в таблице [HR].Employees базы данных TSQL 2012,
--  начинающиеся с Ca(Ка).
SELECT * from hr.employees where lastname like 'Ка%'

--5. Найти все фамилии в таблице [HR].Employees базы данных TSQL 2012,
--  заканчивающиеся на ed(ед).
SELECT * from hr.employees where lastname like '%ед'

--6. Найти все фамилии в таблице [HR].Employees базы данных TSQL 2012,
--  содержащие ele(еле).
SELECT * from hr.employees where lastname like '%еле%'

--7. Найти все фамилии в таблице [HR].Employees базы данных TSQL 2012,
--  которые не начинаются с букв ABCDE(АБВГД).
SELECT * from hr.employees where lastname not similar to '[АБВГД]%' -- postgres

CREATE TABLE Task
(
    orderid int,
    price decimal(7,2)
)

INSERT INTO Task  (orderid, price) VALUES (1,1.5)
INSERT INTO Task  (orderid, price) VALUES (2,2.5)
INSERT INTO Task  (orderid, price) VALUES (3,20.5)
INSERT INTO Task  (orderid, price) VALUES (4,2.5)
INSERT INTO Task (orderid) VALUES (5)

--8.0 Выбрать из таблицы Task значения price так, чтобы они не повторялись
SELECT DISTINCT price from Task

--8.1 Получить сумму значений в таблице task для поля price
SELECT sum(price) from Task

--8.2 Получить среднее значение в таблице task для поля price
SELECT avg(price) from Task

--8.3 Выбрать все значения из таблицы task и отсортировать их по полю price в порядке убывания
SELECT * from Task
ORDER BY price DESC

-- (база данных tsql2012)
--9 Подсчитать максимальное значение в таблице Sales.OrderDetails
-- для выражения qty * unitprice *(1-discount) для orderid = 10250
SELECT max(qty * unitprice *(1-discount)) from sales.orderdetails where orderid = 10250

-- 10. Для базы данных tsql2012 в таблице sales.orderdetails
-- посчитать сумму значений qty для orderid = 10248
SELECT sum(qty) from sales.orderdetails where orderid = 10248

-- 11. Для таблицы hr.employees определить всех работников, которые родились
-- в 1970 и 1973 годах
SELECT * from hr.employees where extract(year from birthdate) = 1970 or extract(year from birthdate) = 1973
