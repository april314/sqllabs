--triggers DML
CREATE OR REPLACE TRIGGER bi_applications
BEFORE INSERT ON applications
FOR EACH ROW
ENABLE
DECLARE
  v_user varchar2(20);
BEGIN
  SELECT user INTO v_user FROM dual;
  DBMS_OUTPUT.PUT_LINE('You just inserted a new application record, ' || v_user);
END;
/

INSERT INTO applications VALUES (30, 2, 8, 4, '30-09-2008');

--alert file
select * from v$diag_info;