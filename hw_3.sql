USE tsql2012
-- 1. Для каждого сотрудника получить количество сделанных заказов на
--    каждую дату. Ожидается , что сотрудники делают по одному
--    заказу на каждую дату, но могут быть исключения
--    Вывести empid сотрудника , дату orderdate и количество заказов
--    на данную дату. Использовать таблицу sales.orders. 
SELECT empid, orderdate, count(orderid)
FROM sales.orders
GROUP BY empid, orderdate

-- 2. Определить сотрудников, которые на одну дату оформили
--    два или более заказов. Вывести empid сотрудников 
--    и соответствующие даты
SELECT empid, orderdate, count(orderid)
FROM sales.orders
GROUP BY empid, orderdate
HAVING count(orderid) > 1

-- 3. Для каждого сотрудника получить количество сделанных заказов на
--    каждую дату. Ожидается , что сотрудники делают по одному
--    заказу на каждую дату, но могут быть исключения
--    Вывести empid сотрудника , lastname сотрудника , дату orderdate и количество заказов
--    на данную дату. Использовать таблицу hr.employees и sales.orders. 
SELECT emp.empid, emp.lastname, ord.orderdate, count(ord.orderid)
FROM hr.employees emp JOIN sales.orders ord ON emp.empid = ord.empid
GROUP BY emp.empid, ord.orderdate

-- 4. Определить сотрудников, которые на одну дату оформили
--    два или более заказов. Вывести empid сотрудников, lastname 
--    и соответствующие даты
SELECT emp.empid, emp.lastname, ord.orderdate
FROM hr.employees emp JOIN sales.orders ord ON emp.empid = ord.empid
GROUP BY emp.empid, ord.orderdate
HAVING count(ord.orderid) > 1

-- 5. Решить задачи 1-4 при условии, что вместо сотрудника 
--    мы имеем дело с заказчиком(клиентом таблица sales.cusomers) 
SELECT custid, orderdate, count(orderid)
FROM sales.orders
GROUP BY custid, orderdate

SELECT custid, orderdate, count(orderid)
FROM sales.orders
GROUP BY custid, orderdate
HAVING count(orderid) > 1

SELECT cust.custid, cust.contactname, ord.orderdate, count(ord.orderid)
FROM sales.customers cust JOIN sales.orders ord ON cust.custid = ord.custid
GROUP BY cust.custid, ord.orderdate

SELECT cust.custid, cust.contactname, ord.orderdate
FROM sales.customers cust JOIN sales.orders ord ON cust.custid = ord.custid
GROUP BY cust.custid, ord.orderdate
HAVING count(ord.orderid) > 1

-- 6. Подсчитать среднее выражение для произведения qty * unitprice *(1-discount) в 
--    таблице Sales.OrderDetails для сотрудника по фамилии Peled (Пелед) (база tsql2012)
--    Указание: Сделать JOIN таблицы Sales.Orders Sales.OrderDetails HR.Employees
SELECT AVG((od.qty * od.unitprice * (1-od.discount))::numeric)
FROM sales.orderdetails od JOIN sales.orders ord ON od.orderid = ord.orderid
                           JOIN hr.employees emp ON ord.empid = emp.empid WHERE emp.lastname = 'Пелед'

-- 7. Найти максимальное значение выражения qty * unitprice *(1-discount)
--    в таблице Sales.OrderDetails для клиента у которого contactname = "Ray, Mike"(база tsql2012)
--    Указание: Сделать JOIN таблицы Sales.Orders Sales.OrderDetails Sales.Customers
SELECT MAX((od.qty * od.unitprice * (1-od.discount))::numeric)
FROM sales.orderdetails od JOIN sales.orders ord ON od.orderid = ord.orderid
                           JOIN sales.customers cust ON ord.custid = cust.custid WHERE cust.contactname = 'Ray, Mike'

-- 8. Определить по таблице sales.orders количество заказов ,
--    сделанных за каждый год при помощи группировки
-- SELECT YEAR(o.orderdate), COUNT(o.orderid) FROM sales.Orders o
-- GROUP BY YEAR(o.orderdate)
-- ORDER BY YEAR(o.orderdate)
SELECT EXTRACT(YEAR FROM o.orderdate), COUNT(o.orderid) from sales.orders o
GROUP BY EXTRACT(YEAR FROM o.orderdate)
ORDER BY EXTRACT(YEAR FROM o.orderdate)

-- 9. Определить по таблице sales.orders количество заказов ,
--    сделанных за каждый день 2008 года при помощи группировки
SELECT DATE_TRUNC('day', o.orderdate) as day, COUNT(o.orderid) FROM sales.orders o
WHERE EXTRACT(YEAR FROM o.orderdate) = 2008
GROUP BY day
ORDER BY day

-- 10. Определить количество клиентов для empid каждого сотрудника
-- из таблицы sales.orders
SELECT empid, COUNT(orderid) FROM sales.orders
GROUP BY empid

-- Та же самая задача, но не повторять в учете одного и того же клиента
SELECT empid, COUNT(custid) FROM sales.orders
GROUP BY empid

-- 11. Определить количество клиентов для каждого сотрудника
-- для каждого года работы
SELECT EXTRACT(YEAR FROM orderdate), empid, COUNT(orderid) FROM sales.orders
GROUP BY empid, EXTRACT(YEAR FROM orderdate)
ORDER BY empid


-- Та же самая задача, но не повторять в учете одного и того же клиента
SELECT EXTRACT(YEAR FROM orderdate), empid, COUNT(custid) FROM sales.orders
GROUP BY empid, EXTRACT(YEAR FROM orderdate)
ORDER BY empid
