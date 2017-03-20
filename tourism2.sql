---------------Контрольная работа №1-----------------

-- creating the tables
CREATE TABLE managers
(id INTEGER PRIMARY KEY,
name VARCHAR(30),
salary INTEGER CHECK (salary > 0)
);

INSERT INTO managers
VALUES (1, 'Mary', 2000);

INSERT INTO managers
VALUES (2, 'Jane', 1800);

INSERT INTO managers
VALUES (3, 'Mark', 1600);

INSERT INTO managers
VALUES (4, 'Kate', 1400);

INSERT INTO managers
VALUES (5, 'Hanna', 1900);

SELECT * FROM managers;

CREATE TABLE clients
(id INTEGER PRIMARY KEY,
name VARCHAR(30),
social_status VARCHAR(20),
age INTEGER CHECK (age > 0)
);

INSERT INTO clients
VALUES (1, 'Garry Simmons', 'boss', 56);

INSERT INTO clients
VALUES (2, 'Mary Wilkins', 'queen', 34);

INSERT INTO clients
VALUES (3, 'May Chan', 'nurse', 22);

INSERT INTO clients
VALUES (4, 'Mark Spencer', 'salesman', 40);

INSERT INTO clients
VALUES (5, 'Mark Spencer', 'boss', 41);

INSERT INTO clients
VALUES (6, 'Marilene Hap', 'angel', 300);

INSERT INTO clients
VALUES (7, 'Don Ding', 'janitor', 30);

INSERT INTO clients
VALUES (8, 'Deanna Troi', 'councellor', 37);

INSERT INTO clients
VALUES (9, 'Jean Luk Picard', 'captain', 48);

INSERT INTO clients
VALUES (10, 'Will Riker', 'commander', 41);

INSERT INTO clients
VALUES (11, 'Mr Data', 'Lt. Commander', 26);

INSERT INTO clients
VALUES (12, 'Wesley Crusher', 'Ensign', 17);

INSERT INTO clients
VALUES (13, 'Tasha Yar', 'Security Chief', 35);

INSERT INTO clients
VALUES (14, 'Warf', 'Security Chief', 67);

INSERT INTO clients
VALUES (15, 'Beverly Crusher', 'Chief Med.Officer', 35);

SELECT * FROM clients;

CREATE TABLE vouchers
(id INTEGER PRIMARY KEY,
resourt VARCHAR(30),
time INTEGER CHECK (time > 0),
voucher_cost INTEGER CHECK (voucher_cost > 0),
trip_cost INTEGER CHECK (trip_cost > 0),
num_people INTEGER CHECK (num_people > 0)
);

INSERT INTO vouchers
VALUES (1, 'Bahama island', 21, 2000, 200, 2);

INSERT INTO vouchers
VALUES (2, 'Bermudi island', 8, 300, 200, 1);

INSERT INTO vouchers
VALUES (3, 'Greece', 13, 700, 200, 3);

INSERT INTO vouchers
VALUES (4, 'Japan', 8, 2000, 400, 4);

INSERT INTO vouchers
VALUES (5, 'Bahama island', 12, 1500, 200, 2);

INSERT INTO vouchers
VALUES (6, 'Jupiter Valley', 200, 15000, 2000, 10);

INSERT INTO vouchers
VALUES (7, 'Enterprise Cruise', 99999, 1, 1, 1300);

--Выберите все столбцы из таблицы «Путевки»
SELECT * FROM vouchers;

CREATE TABLE applications
(id INTEGER PRIMARY KEY,
voucher_id INTEGER REFERENCES vouchers NOT NULL,
manager_id INTEGER REFERENCES managers NOT NULL,
client_id INTEGER REFERENCES clients NOT NULL,
dep_date DATE
);

INSERT INTO applications
VALUES (1, 1, 2, 1, '12-05-16');

INSERT INTO applications
VALUES (2, 2, 1, 2, '13-10-2016');

INSERT INTO applications
VALUES (3, 3, 2, 3, '04-10-2016');

INSERT INTO applications
VALUES (4, 4, 3, 4, '12-12-2016');

INSERT INTO applications
VALUES (5, 4, 3, 5, '04-05-2016');

INSERT INTO applications
VALUES (6, 2, 3, 5, '23-02-2016');

INSERT INTO applications
VALUES (7, 6, 4, 6, '23-02-2016');

INSERT INTO applications
VALUES (8, 6, 4, 7, '23-02-2016');

INSERT INTO applications
VALUES (9, 7, 5, 8, '23-02-2016');

INSERT INTO applications
VALUES (10, 7, 5, 9, '23-02-2016');

INSERT INTO applications
VALUES (11, 7, 5, 10, '23-02-2016');

INSERT INTO applications
VALUES (12, 7, 5, 11, '23-02-2016');

INSERT INTO applications
VALUES (13, 7, 5, 12, '23-02-2016');

INSERT INTO applications
VALUES (14, 7, 5, 13, '23-02-2016');

INSERT INTO applications
VALUES (15, 7, 5, 14, '23-02-2016');

INSERT INTO applications
VALUES (16, 7, 5, 15, '23-02-2016');

SELECT * FROM applications;


--Выберите все курорты и время отдыха на них
SELECT resourt, time FROM vouchers;

--Посчитайте стоимость одного дня отдыха на курорте. Стоимость дороги не учитывается
SELECT resourt, trip_cost/time AS "One day cost" FROM vouchers;

--Отобразите список клиентов в колонке «Плательщики»
SELECT name AS "Payers" FROM clients;

--Выведите имя клиента и его возраст в один столбец, разделив их дефисом
SELECT COALESCE(name, '') || COALESCE(' - ', '') || COALESCE(age, 0) as Clients FROM clients;

--Выберите все курорты из таблицы «Путевки», исключая повторы
SELECT DISTINCT resourt AS "Unique resourts" FROM vouchers;

--the next doesn't work
--Выберите все курорты и время отдыха на них из таблицы «Путевки», чтобы ни одно значение в полях не повторялось
SELECT DISTINCT resourt, time FROM vouchers;

--Выберите все столбцы из таблицы «Клиенты», отсортировав результат по фамилии , а однофамильцев по социальному статусу
SELECT name, social_status FROM clients ORDER BY name, social_status;

------------------------Контрольная работа №2----------------------------

--Добавьте в таблицу Путевки первую запись из таблицы используя команду INSERT и не перечисляя колонки
INSERT INTO vouchers
VALUES(8, 'Cyprus', 10, 600, 200, 2);

--Добавьте в таблицу Путевки вторую запись из таблицы, перечисляя колонки
INSERT INTO vouchers(id, resourt, time, voucher_cost, trip_cost, num_people)
VALUES(9, 'Madagascar', 20, 1000, 100, 5);

--Создайте таблицу П2 по примеру таблицы Путевки.
CREATE TABLE vouchers2
(id INTEGER PRIMARY KEY,
resourt VARCHAR(30),
time INTEGER CHECK (time > 0),
voucher_cost INTEGER CHECK (voucher_cost > 0),
trip_cost INTEGER CHECK (trip_cost > 0),
num_people INTEGER CHECK (num_people > 0)
);
INSERT INTO vouchers2
VALUES (1, 'Turkey', 14, 1000, 200, 3);
SELECT * from vouchers2;

--Удалите таблицу П2 (используя команду Drop).
DROP TABLE vouchers2;

--добавьте в таблицу Путевки колонку среднее_t типа NUMERIC
ALTER TABLE vouchers
ADD average_t NUMERIC;
SELECT * from vouchers;

------------------------------------ИПР1.1-----------------------------

--Выведите всех клиентов старше 20 лет, но моложе 35
SELECT name AS "Clients from 20 to 35"
FROM clients
WHERE age > 20 AND age < 35;

--Создайте список клиентов, которых обслуживали менеджеры Mary, Jane
SELECT clients.name AS "Mary and Jane worked with" 
FROM clients
INNER JOIN applications
ON applications.client_id = clients.id
INNER JOIN managers
ON managers.id = applications.manager_id
WHERE managers.name = 'Mary' OR managers.name = 'Jane';

--Выберите все курорты, в названии которых присутствует «island»
SELECT resourt AS "Island Resourts"
FROM vouchers
WHERE resourt LIKE ('%island%') GROUP BY resourt;

--Выведите всех клиентов, которых менеджер Jane отправила в Bahama island
SELECT clients.name AS "Jane's Clients to Bahama"
FROM clients
INNER JOIN applications
ON applications.client_id = clients.id
INNER JOIN managers
ON managers.id = applications.manager_id
INNER JOIN vouchers
ON vouchers.id = applications.voucher_id
WHERE vouchers.resourt = 'Bahama island' AND  managers.name = 'Jane';

--Выведите все возможные сочетания менеджеров и клиентов
SELECT managers.name AS "Managers",
clients.name AS "Clients"
FROM managers, clients;

--Сделайте список клиентов обслуживаемых одним менеджером (HANNA)
SELECT clients.name AS "Hanna's clients:"
FROM clients
INNER JOIN applications
ON applications.client_id = clients.id
INNER JOIN managers
ON managers.id = applications.manager_id
WHERE managers.name = 'Hanna'
ORDER BY clients.name;

--Сделайте список менеджеров, отправлявших клиентов в Japan
SELECT managers.name AS "Japan managers"
FROM managers
INNER JOIN applications
ON applications.manager_id = managers.id
INNER JOIN vouchers
ON vouchers.id = applications.voucher_id
WHERE vouchers.resourt = 'Japan'
GROUP BY name;

--Выведите все данные из таблицы Клиенты и все данные из соответствующей ей таблицы Менеджеры
SELECT clients.name AS client, clients.age, clients.SOCIAL_STATUS AS "Soc. status", 
managers.name AS Manager, managers.salary 
FROM clients
INNER JOIN applications
ON applications.client_id = clients.id
INNER JOIN managers
ON applications.manager_id = managers.id;

--Выведите список курортов, на котором клиенты отдохнули благодаря работе менеджера Jane
SELECT vouchers.resourt AS "Jane's resourts"
FROM vouchers
INNER JOIN applications
ON applications.voucher_id = vouchers.id
INNER join managers
on managers.id = applications.manager_id
where managers.name = 'Jane'
GROUP BY resourt;

--Выведите даты оформления заказов для всех клиентов, не используя оператор JOIN
SELECT dep_date FROM applications;

-------------------------------ИПР2---------------------------------------------------

--Выведите информацию о всех клиентах, выделив название курорта заглавными буквами.
SELECT clients.id, clients.name, clients.social_status AS "Social status", clients.age, UPPER(vouchers.resourt) AS Resourts
FROM clients
INNER JOIN applications
ON applications.client_id = clients.id
INNER JOIN vouchers
ON vouchers.id = applications.voucher_id;

--Выведите имя менеджера и его зарплату, как количество полных сотен.
SELECT name, salary/100 AS "salary in hundreds" 
FROM managers;

--Выведите имена клиентов и названия курортов, для тех путевок, которые ещё не закончились.
SELECT clients.name AS "Still on vacation:"
, vouchers.resourt 
FROM clients
INNER JOIN applications
ON applications.client_id = clients.id
INNER JOIN vouchers
ON vouchers.id = applications.voucher_id
WHERE (applications.dep_date + vouchers.time) >= CURRENT_DATE;

--Выведите названия курортов, дату оформления путевки и имена клиентов, указав дату и день недели их возвращения.
SELECT vouchers.resourt, 
       applications.dep_date AS "departure date",
       clients.name,
       (applications.dep_date + vouchers.time) AS "arrival date",
       to_char((applications.dep_date + vouchers.time), 'Day') AS "day of week"
FROM applications
INNER JOIN vouchers
ON applications.voucher_id = vouchers.id
INNER JOIN clients
ON clients.id = applications.client_id;

--Выведите имена менеджеров, названия курортов и дату оформления заказа, отобразив число и месяц словами.
SELECT managers.name AS Managers,
vouchers.resourt AS Resourts,
to_char(applications.dep_date, 'Month') || COALESCE(extract(day FROM applications.dep_date), 0) AS "Date"
FROM managers
INNER JOIN applications
ON managers.id = applications.manager_id
INNER JOIN vouchers
ON vouchers.id = applications.voucher_id;

--Выведите информацию о всех клиентах, заменяя пустое значение в поле «СоцСтатус» на фразу «UNKNOWN».
INSERT INTO clients(id, name, age) 
VALUES(16, 'Fred Thug', 32);
SELECT id, name, age, 
COALESCE(social_status,'UNKNOWN') AS "Soc.status"
FROM clients;

--Выведите имена клиентов, их возраст, имя менеджера, его зарплату, дату оформления путевки и название курорта, 
--добавив к зарплате менеджеров у которых клиенты моложе 25 лет 10%.
SELECT clients.name, clients.age, managers.name, 
case when clients.age < 25 then managers.salary*1.1
else managers.salary
end AS "Managers' salary", 
applications.dep_date, vouchers.resourt
FROM clients
INNER JOIN applications
ON applications.client_id = clients.id
INNER JOIN vouchers
ON applications.voucher_id = vouchers.id
INNER JOIN managers
ON applications.manager_id = managers.id;

--Создайте диаграмму популярности курортов, в качестве индикаторов используйте символ «*» (функция rpad).
--первый способ
SELECT vouchers.resourt, 
rpad(' ', COUNT(resourt)+1, '*') AS popularity 
FROM vouchers
INNER JOIN applications
ON applications.voucher_id = vouchers.id
GROUP BY resourt;
--другой способ
SELECT vouchers.resourt, 
SUBSTR('***********', 1, COUNT(resourt)) AS popularity 
FROM vouchers
INNER JOIN applications
ON applications.voucher_id = vouchers.id
GROUP BY resourt;

--Для определенного менеджера выведите количество клиентов, указавших свой социальный статус.
SELECT managers.name, 
COUNT(social_status) AS "Number of Clients with status"
FROM managers
INNER JOIN applications
ON applications.manager_id = managers.id
INNER JOIN clients
ON applications.client_id = clients.id
WHERE social_status IS NOT NULL
GROUP BY managers.name;

-- Выведите количество клиентов фирмы.
SELECT COUNT(name) AS "Number of clients" FROM clients;

--Подсчитайте среднюю стоимость дороги для всех курортов, заменяя пустые значения нолем.
SELECT AVG(COALESCE(trip_cost, 0)) AS "Average trip cost" FROM vouchers;

--Выведите количество клиентов каждого менеджера.
SELECT managers.name, COUNT(clients.name) AS "Number of Clients"
FROM managers
INNER JOIN applications
ON applications.manager_id = managers.id
INNER JOIN clients
ON applications.client_id = clients.id
GROUP BY managers.name;

--Для каждого менеджера выведите имя менеджера, имя и возраст самого младшего клиента
SELECT managers.name AS Managers, 
--clients.name AS "Youngest clients",
MIN(clients.age) AS "age"
FROM managers
INNER JOIN applications
ON applications.manager_id = managers.id
INNER JOIN clients
ON applications.client_id = clients.id
GROUP BY managers.name;

--Выведите градацию менеджеров в зависимости от их зарплаты: от 2000 до 1850, от 1800 до 1650, от 1600 до 1200.
SELECT name,
case 
when salary > 1850 then 'from 1850 to 2050'
when salary > 1650 then 'from 1650 to 1800'
when salary > 1200 then 'from 1200 to 1600'
end AS "Salaries"
FROM managers;

--Выведите название курорта и стоимость отдыха, где средний возраст отдыхающих меньше 30 лет.
SELECT vouchers.resourt AS "Resourts for ppl <30 years",
vouchers.voucher_cost
FROM vouchers
INNER JOIN applications
ON applications.voucher_id = vouchers.id
INNER JOIN clients
ON applications.client_id = clients.id
GROUP BY resourt, vouchers.resourt, vouchers.voucher_cost HAVING AVG(age)<30;

--Для менеджера Hanna выведите список всех курортов, на которые он отправлял людей и самых старых клиентов, 
--побывавших на каждом курорте.
SELECT vouchers.resourt, 
--clients.name AS "Oldest Hanna's client",
MAX(clients.age)
FROM vouchers
INNER JOIN applications
ON applications.voucher_id = vouchers.id
INNER JOIN clients
ON applications.client_id = clients.id
INNER JOIN managers
ON applications.manager_id = managers.id
WHERE managers.name = 'Hanna'
GROUP BY vouchers.resourt;

--Выведите минимальный средний возраст клиента для всех менеджеров.
SELECT MIN(avg_age) AS "Min avg age" FROM 
(SELECT managers.name, AVG(clients.age) AS avg_age
FROM managers
INNER JOIN applications
ON applications.manager_id = managers.id
INNER JOIN clients
ON applications.client_id = clients.id
GROUP BY managers.name);