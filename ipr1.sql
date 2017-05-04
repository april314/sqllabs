--SET SERVEROUTPUT ON;
--1. �������� � ��������� ������ ��������� ����.
BEGIN
  NULL;
END;
/
--2. �������� � ���� ������� ������ ������ �������� ����� � ��������.
BEGIN
  DBMS_OUTPUT.put_line('������� ����� � �������');
END;
/
--3. �������� ������������� ������ � �������� ���������� SomeNumber ��������� ����, �������� �� 512, ��� �������� �� 
--���������; �������� ��������� ���� ����, �������� �� �������� � 20 ������� 2001 ����.
DECLARE
  SomeNumber INTEGER := 512;
  CDATE CONSTANT DATE := TO_DATE('20/02/2011','dd/mm/yyyy');
BEGIN
  DBMS_OUTPUT.put_line('SomeNumber = ' || SomeNumber);
  DBMS_OUTPUT.put_line('CDATE = ' || CDATE);
END;
/
--4. �������� ���������� ClientName � ����� ������� ��� �� ������� ������, ���������� Age �� ������� ������� � 
--����������-������ ClientInfo �� ���� �� �������.
DECLARE
  ClientName1 Clients.name%TYPE;
  ClientName2 Clients.name%TYPE;
  Age1 Clients.age%TYPE;
  Age2 Clients.age%TYPE;
  ClientInfo Clients%ROWTYPE;
  --for 6th task
  AveAge NUMERIC(3,1);
BEGIN
--5. � ������� �������� ������� �������� � ���������� ClientName � ClientInfo ��������������� �������� �� ������� 
--������� ��� �������� � ID ������� 7 � 12, � ClientInfo � �������� ������ ��� ������� � ID 15.
  SELECT name, age
  INTO ClientName1, Age1
  FROM clients
  WHERE id = 7;
  
  SELECT name, age
  INTO ClientName2, Age2
  FROM clients
  WHERE id = 12;
  
  SELECT * 
  INTO ClientInfo
  FROM clients
  WHERE id = 15;
  
  DBMS_OUTPUT.put_line('Client 1: ' || ClientName1 || ', ' || Age1);
  DBMS_OUTPUT.put_line('Client 2: ' || ClientName2 || ', ' || Age2);
  DBMS_OUTPUT.put_line('Client 3: ');
  DBMS_OUTPUT.put_line('Name : ' || ClientInfo.name);
  DBMS_OUTPUT.put_line('Age : ' || ClientInfo.age);
  DBMS_OUTPUT.put_line('Soc status : ' || ClientInfo.social_status);
  
--6. �������� ������ �������� [ClientName1] � [ClientName2] ����� ������� ������� [AveAge]�, ��������� ���������� �� 
--����������� �������, � ������ AverAge �������� ������� ������� ���� ��������.
  AveAge := (Age1 + Age2) / 2;
  DBMS_OUTPUT.put_line('Client ' || ClientName1 || ' and Client ' || ClientName2 || ' have average age ' || AveAge);
END;
/
--7. ��� ����������� �������� ������� 5-6 � ������� ������ SQL-�������?
SELECT name, age FROM clients
WHERE id = 7 or id = 12;

SELECT name, age, social_status FROM clients;

SELECT AVG(age) AS "Average Age" 
FROM (SELECT name, age FROM clients
WHERE id = 7 or id = 12);

--8. ���� ��������, � ������� ������� ������ 21-�� ���� �������� ��������� �� �������/�� �������, ��������� UPDATE 
--��� ���� ��������� ������� �������.
--PL/SQL
DECLARE
  rows INTEGER := 0;
BEGIN
  FOR i IN (SELECT name, age, social_status FROM clients)
  LOOP
    IF i.age < 21 THEN
      UPDATE clients SET SOCIAL_STATUS = 'single'
      WHERE age < 21;
      rows := rows + 1;
    END IF;
  END LOOP;
  --9. �������� ���������� �����, ������������ �������� �� ������ 8.
  DBMS_OUTPUT.put_line('Rows modified: ' || rows);
END;
/
--SQL
UPDATE clients SET SOCIAL_STATUS = 'single'
WHERE age < 21;
SELECT name, age, social_status FROM clients;



--just for fun
DECLARE
  numb INTEGER;
BEGIN
  numb := &enter_a_num;
  if numb > 0 then
    DBMS_OUTPUT.put_line('numb is positive');
  else
    DBMS_OUTPUT.put_line('numb is negative');
  end if;
END;
/