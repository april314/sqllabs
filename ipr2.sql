--1) Ќапишите анонимный блок, вычисл€ющий результат на основании значений строки, задаваемой через первичный ключ 
--таблицы Managers, по следующей схеме:
-- если зарплата менеджера больше или равна 1900, записать как У[менеджер] Ц молодецФ;
-- если же меньше 1900, записать как У[јвтор] Ц почти молодецФ;
-- значение первичного ключа запросите через подстановочную переменную;
-- также отобразите зарплату автора.
SET SERVEROUTPUT ON;

DECLARE
  mid INTEGER DEFAULT 1;
  manager managers%ROWTYPE;
  id_max INTEGER DEFAULT 0;
BEGIN
  mid := &enter_the_id;
  SELECT COUNT(*) INTO id_max FROM managers;
  
  IF mid >= 1 AND mid <= id_max THEN
    SELECT * INTO manager FROM managers WHERE id = mid;
    IF manager.salary >= 1900 THEN
      DBMS_OUTPUT.put_line(manager.name || ' - молодец, ' || 'он(а) зарабатывает ' || manager.salary);
    ELSE
      DBMS_OUTPUT.put_line(manager.name || ' - почти молодец, ' || 'он(а) зарабатывает ' || manager.salary);
    END IF;
  ELSE
    DBMS_OUTPUT.PUT_LINE('Sorry, id out of range.');
  END IF;
END;
/

--2) »спользу€ €вный курсор перепишите блок так, чтобы значение вычисл€лось последовательно дл€ строк. 
--»спользуйте €вное открытие/закрытие/выборку данных из курсора.
DECLARE
  m_name managers.name%TYPE;
  m_salary managers.salary%TYPE;
  CURSOR get_managers IS
          SELECT name, salary FROM managers;
BEGIN
  OPEN get_managers;
  LOOP
    FETCH get_managers INTO m_name, m_salary;
    EXIT WHEN get_managers%NOTFOUND;
    IF m_salary >= 1900 THEN
      DBMS_OUTPUT.put_line(m_name || ' - молодец, ' || 'он(а) зарабатывает ' || m_salary);
    ELSIF m_salary < 1900 THEN
      DBMS_OUTPUT.put_line(m_name || ' - почти молодец, ' || 'он(а) зарабатывает ' || m_salary);
    END IF;
  END LOOP;
  CLOSE get_managers;
END;

--3) курсорный цикл FOR
DECLARE
CURSOR get_managers IS
        SELECT name, salary FROM managers;
BEGIN
  FOR i IN get_managers LOOP
    IF i.salary >= 1900 THEN
      DBMS_OUTPUT.put_line(i.name || ' - молодец, ' || 'он(а) зарабатывает ' || i.salary);
    ELSIF i.salary < 1900 THEN
      DBMS_OUTPUT.put_line(i.name || ' - почти молодец, ' || 'он(а) зарабатывает ' || i.salary);
    END IF;
  END LOOP;
END;