--1) �������� ��������� ����, ����������� ��������� �� ��������� �������� ������, ���������� ����� ��������� ���� 
--������� Managers, �� ��������� �����:
-- ���� �������� ��������� ������ ��� ����� 1900, �������� ��� �[��������] � ��������;
-- ���� �� ������ 1900, �������� ��� �[�����] � ����� ��������;
-- �������� ���������� ����� ��������� ����� �������������� ����������;
-- ����� ���������� �������� ������.
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
      DBMS_OUTPUT.put_line(manager.name || ' - �������, ' || '��(�) ������������ ' || manager.salary);
    ELSE
      DBMS_OUTPUT.put_line(manager.name || ' - ����� �������, ' || '��(�) ������������ ' || manager.salary);
    END IF;
  ELSE
    DBMS_OUTPUT.PUT_LINE('Sorry, id out of range.');
  END IF;
END;
/

--2) ��������� ����� ������ ���������� ���� ���, ����� �������� ����������� ��������������� ��� �����. 
--����������� ����� ��������/��������/������� ������ �� �������.
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
      DBMS_OUTPUT.put_line(m_name || ' - �������, ' || '��(�) ������������ ' || m_salary);
    ELSIF m_salary < 1900 THEN
      DBMS_OUTPUT.put_line(m_name || ' - ����� �������, ' || '��(�) ������������ ' || m_salary);
    END IF;
  END LOOP;
  CLOSE get_managers;
END;

--3) ��������� ���� FOR
DECLARE
CURSOR get_managers IS
        SELECT name, salary FROM managers;
BEGIN
  FOR i IN get_managers LOOP
    IF i.salary >= 1900 THEN
      DBMS_OUTPUT.put_line(i.name || ' - �������, ' || '��(�) ������������ ' || i.salary);
    ELSIF i.salary < 1900 THEN
      DBMS_OUTPUT.put_line(i.name || ' - ����� �������, ' || '��(�) ������������ ' || i.salary);
    END IF;
  END LOOP;
END;