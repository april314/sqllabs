---------------Контрольная работа
---------------Коваленко Анастасии Дмитриевны
---------------студентки группы 393551
---------------Вариант 5

-- creating the tables
--MANAGERS
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

INSERT INTO managers
VALUES (6, 'Manny', 1900);

INSERT INTO managers
VALUES (7, 'Anna', 1900);

INSERT INTO managers
VALUES (8, 'Arnold', 1900);

SELECT * FROM managers;

--CLIENTS
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

--VOUCHERS
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

SELECT * FROM vouchers;

--APPLICATIONS
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

INSERT INTO applications
VALUES (17, 3, 6, 4, '20-08-2008');

INSERT INTO applications
VALUES (18, 6, 7, 2, '01-01-2009');

INSERT INTO applications
VALUES (19, 2, 8, 1, '01-01-2013');

INSERT INTO applications
VALUES (20, 5, 1, 4, '01-01-2010');

INSERT INTO applications
VALUES (21, 4, 1, 1, '01-01-2013');

INSERT INTO applications
VALUES (22, 3, 1, 2, '01-01-2012');

INSERT INTO applications
VALUES (23, 2, 2, 6, '01-01-2015');

INSERT INTO applications
VALUES (24, 6, 2, 5, '01-06-2015');

INSERT INTO applications
VALUES (25, 2, 4, 6, '12-01-2015');

INSERT INTO applications
VALUES (26, 5, 4, 2, '12-01-2009');

INSERT INTO applications
VALUES (27, 2, 6, 3, '22-06-2015');

INSERT INTO applications
VALUES (28, 7, 6, 2, '12-01-2016');

INSERT INTO applications
VALUES (29, 6, 6, 1, '12-01-2017');

SELECT * FROM applications;

-----------------------------------------------------------------------------------------------------------------------
---------------------------ЗАДАНИЯ-------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- 1. Выведите имена всех менеджеров, у которых зарплата такая же как и у Hanna.
SELECT name AS "Same salary as Hanna" FROM managers
where salary IN 
(SELECT salary FROM managers WHERE name = 'Hanna')
AND name <> 'Hanna'
ORDER BY name ASC;

-- 2. выведите названия курортов и имена менеджеров, у которых зарплата выше средней.
SELECT DISTINCT vouchers.resourt, managers.name AS "salaries above avg"
FROM managers, vouchers, applications
WHERE salary > (SELECT AVG(salary) FROM managers)
AND applications.manager_id = managers.id
AND applications.voucher_id = vouchers.id
ORDER BY name;

-- 3. Выведите список курортов, на которые не ездят bosses.
SELECT DISTINCT vouchers.resourt AS "resourts not for bosses"
FROM vouchers, clients, applications
WHERE applications.client_id = clients.id
AND applications.voucher_id = vouchers.id
AND clients.social_status <> 'boss';

-- 4. Выведите информацию о клиентах, которых обслуживали менеджеры с зарплатой больше 
-- чем у Mark и стоимостью отдыха меньше 1000 у.е.
SELECT clients.name 
FROM clients, managers, applications, vouchers
WHERE applications.client_id = clients.id
AND applications.voucher_id = vouchers.id
AND applications.manager_id = managers.id
AND managers.salary > (SELECT salary FROM managers WHERE name = 'Mark')
AND vouchers.voucher_cost < 1000;

-- 5. Выведите информацию о менеджерах и о клиентах, которые не оформляли путевок в дни, 
-- когда это делалa Jane (manager_id = 2).
SELECT managers.name AS "manager", managers.salary, clients.name AS "client", clients.age, clients.social_status 
FROM managers
INNER JOIN applications ON applications.manager_id = managers.id
INNER JOIN clients ON applications.client_id = clients.id
WHERE dep_date NOT IN (SELECT dep_date FROM applications WHERE manager_id = 2)
ORDER BY managers.name;

-- 6. Выведите списки клиентов для всех менеджеров, у которых оклад такой же как и у 
-- Mary (id = 1), и которые оформляли путевки с ним в те же дни.
SELECT clients.name AS "clients", managers.name AS "managers"
FROM clients
INNER JOIN applications ON applications.client_id = clients.id 
INNER JOIN managers ON applications.manager_id = managers.id
WHERE managers.salary = (SELECT salary FROM managers WHERE name = 'Mary')
AND dep_date IN (SELECT dep_date FROM applications WHERE manager_id = 1)
AND managers.name <> 'Mary';

-- 7. Выведите список курортов, на которых побывало больше половины клиентов (?), и стоимость
-- отдыха на которых стоит больше средней цены (подзапрос должен находиться в секции FROM).
SELECT resourt/*, count(client_id)*/ 
FROM vouchers, applications
WHERE applications.voucher_id = vouchers.id
AND count(client_id) > (SELECT count(*) from applications)
GROUP BY resourt
ORDER BY count(client_id) DESC;

--------------
SELECT count(*), client_id from applications
group by client_id
order by count(*) desc, client_id;

/*SELECT resourt AS "More than half have been to...", COUNT(client_id)
FROM vouchers
INNER JOIN applications ON applications.voucher_id = vouchers.id
INNER JOIN clients ON applications.client_id = clients.id
WHERE EXISTS (SELECT resourt FROM vouchers WHERE voucher_cost > (SELECT AVG(voucher_cost) FROM vouchers))
GROUP BY resourt
ORDER BY COUNT(client_id) DESC, resourt;*/

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
--the BIG table
SELECT * FROM managers
INNER JOIN applications ON applications.manager_id = managers.id
INNER JOIN clients ON applications.client_id = clients.id
INNER JOIN vouchers ON applications.voucher_id = vouchers.id
ORDER BY managers.id;