CREATE OR REPLACE PACKAGE BODY ut_trc
IS

  PROCEDURE ut_setup
  IS
  BEGIN
    NULL;
  END;

  PROCEDURE ut_teardown
  IS
  BEGIN
    NULL;
  END;

  -- For each program to test...
  PROCEDURE ut_ADD_ARG1
  IS
    v_value NUMBER := NULL;
  BEGIN
    -- Execute test code
    TRC.SET_ENABLE_CALL_STACK(TRUE);
    TRC.ENTER( 'ut_trc.ut_ADD_ARG1' );
    TRC.ADD_ARG (
      I_DESCR => 'Number1',
      I_VALUE => v_value
    );
    TRC.ADD_ARG (
      I_DESCR => 'Number2',
      I_VALUE => -1
    );
    -- Assert success
    utAssert.eq (
      'Test of ADD_ARG(NUMBER)',
      trc.get_calls,
      'ut_trc.ut_ADD_ARG1(NULL,-1);'
    );
    TRC.LEAVE;
    -- End of test
  END ut_ADD_ARG1;

  PROCEDURE ut_ADD_ARG2
  IS
    v_value VARCHAR2(10) := NULL;
  BEGIN
    -- Execute test code
    TRC.SET_ENABLE_CALL_STACK(TRUE);
    TRC.ENTER( 'ut_trc.ut_ADD_ARG2' );
    TRC.ADD_ARG (
      I_DESCR => 'String1',
      I_VALUE => v_value
    );
    TRC.ADD_ARG (
      I_DESCR => 'String2',
      I_VALUE => 'abcd''abcd'
    );
    -- Assert success
    utAssert.eq (
      'Test of ADD_ARG(STRING)',
      trc.get_calls,
      'ut_trc.ut_ADD_ARG2(NULL,''abcd''''abcd'');'
    );
    TRC.LEAVE;
    -- End of test
  END ut_ADD_ARG2;

  PROCEDURE ut_ADD_ARG3
  IS
    v_value DATE := NULL;
  BEGIN
    -- Execute test code
    TRC.SET_ENABLE_CALL_STACK(TRUE);
    TRC.ENTER( 'ut_trc.ut_ADD_ARG3' );
    TRC.ADD_ARG (
      I_DESCR => 'Date1',
      I_VALUE => v_value
    );
    TRC.ADD_ARG (
      I_DESCR => 'Date2',
      I_VALUE => TO_DATE('20001231235959', 'YYYYMMDDHH24MISS')
    );
    -- Assert success
    utAssert.eq (
      'Test of ADD_ARG(DATE)',
      trc.get_calls,
      'ut_trc.ut_ADD_ARG3(NULL,''2000-12-31 23:59:59'');'
    );
    TRC.LEAVE;
    -- End of test
  END ut_ADD_ARG3;

  PROCEDURE ut_ADD_ARG4
  IS
    v_value BOOLEAN := NULL;
  BEGIN
    -- Execute test code
    TRC.SET_ENABLE_CALL_STACK(TRUE);
    TRC.ENTER( 'ut_trc.ut_ADD_ARG4' );
    TRC.ADD_ARG (
      I_DESCR => 'Bool1',
      I_VALUE => v_value
    );
    TRC.ADD_ARG (
      I_DESCR => 'Bool2',
      I_VALUE => TRUE
    );
    -- Assert success
    utAssert.eq (
      'Test of ADD_ARG(BOOLEAN)',
      trc.get_calls,
      'ut_trc.ut_ADD_ARG4(NULL,TRUE);'
    );
    TRC.LEAVE;
    -- End of test
  END ut_ADD_ARG4;

  PROCEDURE ut_ENTER
  IS
  BEGIN
    -- Execute test code
    TRC.SET_ENABLE_CALL_STACK(TRUE);
    TRC.ENTER (
      I_PROC_NAME => 'ut_test.ut_ENTER'
    );
    utAssert.eq(
      'Test of ENTER',
      TRC.GET_CALLS,
      'ut_test.ut_ENTER;'
    );
    TRC.LEAVE;
    -- End of test
  END ut_ENTER;

  PROCEDURE ut_GET_CALLS
  IS
  -- Verify and complete data types.
  against_this VARCHAR2(2000);
  check_this VARCHAR2(2000);
  BEGIN
    TRC.SET_ENABLE_CALL_STACK(TRUE);
    FOR nr IN 1..3
    LOOP
      TRC.ENTER('ut_test.ut_GET_CALLS');
      TRC.ADD_ARG('nr', nr);
    END LOOP;

    -- Assert success
    -- Compare the two values.
    utAssert.eq (
      'Test of GET_CALLS(1)',
      TRC.GET_CALLS(1),
      'ut_test.ut_GET_CALLS(1);'||chr(10)||'ut_test.ut_GET_CALLS(2);'||chr(10)||'ut_test.ut_GET_CALLS(3);');
    FOR nr IN 1..3
    LOOP
      TRC.LEAVE;
    END LOOP;
    -- End of test
  END ut_GET_CALLS;

  PROCEDURE ut_GET_ENABLE_CALL_STACK
  IS
  BEGIN
    TRC.SET_ENABLE_CALL_STACK (
      I_VALUE => NULL
    );
    -- Assert success
    utAssert.isnull (
      'Test of GET_ENABLE_CALL_STACK after SET_ENABLE_CALL_STACK(NULL)',
      TRC.GET_ENABLE_CALL_STACK
    );
    TRC.SET_ENABLE_CALL_STACK (
      I_VALUE => TRUE
    );
    -- Assert success
    utAssert.eq (
      'Test of GET_ENABLE_CALL_STACK after SET_ENABLE_CALL_STACK(TRUE)',
      TRC.GET_ENABLE_CALL_STACK,
      TRUE
    );
    TRC.SET_ENABLE_CALL_STACK (
      I_VALUE => FALSE
    );
    -- Assert success
    utAssert.eq (
      'Test of GET_ENABLE_CALL_STACK after SET_ENABLE_CALL_STACK(FALSE)',
      TRC.GET_ENABLE_CALL_STACK,
      FALSE
    );
    -- End of test
  END ut_GET_ENABLE_CALL_STACK;

  PROCEDURE ut_FIRST
  IS
    FUNCTION divide (i_a IN INTEGER, i_b IN INTEGER)
    RETURN INTEGER
    IS
      v_value INTEGER;
    BEGIN
      trc.enter( 'divide' );
      trc.add_arg( 'i_a', i_a );
      trc.add_arg( 'i_b', i_b );
      v_value := i_a / i_b;
      trc.leave;
      RETURN (v_value);
    EXCEPTION
      WHEN OTHERS
      THEN
        trc.leave_on_error;
        RAISE;
    END;
  BEGIN
    trc.enter( 'main' );
    dbms_output.put_line( divide( 10, 5 ) );
    dbms_output.put_line( divide( 10, 0 ) );
    trc.leave;
  END;


  PROCEDURE ut_GET_FIRST_CALLS
  IS
    -- Verify and complete data types.
    against_this VARCHAR2(2000);
    check_this VARCHAR2(2000);
  BEGIN
    trc.set_enable_call_stack(true);
    ut_FIRST;
  EXCEPTION
    WHEN OTHERS
    THEN
      trc.leave_on_error;

      -- Define "control" operation
      against_this := 
  'main;
divide(10,0);';
      -- Execute test code
      check_this := TRC.GET_FIRST_CALLS;
      -- Assert success
      -- Compare the two values.
      utAssert.eq (
        'Test of GET_FIRST_CALLS',
        check_this,
        against_this
      );
      trc.leave;
      trc.leave;
      trc.leave;
      -- End of test
  END ut_GET_FIRST_CALLS;

  PROCEDURE ut_GET_FIRST_ERROR_MSG
  IS
    -- Verify and complete data types.
    against_this VARCHAR2(2000);
    check_this VARCHAR2(2000);
  BEGIN
    ut_FIRST;
  EXCEPTION
    WHEN OTHERS
    THEN
      trc.leave_on_error;

      -- Define "control" operation
      against_this := 'ORA-01476: divisor is equal to zero';
      -- Execute test code
      check_this := TRC.GET_FIRST_ERROR_MSG;
      -- Assert success
      -- Compare the two values.
      utAssert.eq (
      'Test of GET_FIRST_ERROR_MSG',
      check_this,
      against_this
      );
      trc.leave;
      trc.leave;
      trc.leave;
      -- End of test
  END ut_GET_FIRST_ERROR_MSG;

  PROCEDURE ut_GET_FIRST_FORMAT_CALL_STACK
  IS
    check_this VARCHAR2(2000);
  BEGIN
    ut_FIRST;
  EXCEPTION
    WHEN OTHERS
    THEN
      trc.leave_on_error;

      -- Execute test code
      check_this := TRC.GET_FIRST_FORMAT_CALL_STACK;
      -- Assert success
      -- Compare the two values.
      utAssert.isnotnull (
        'Test of GET_FIRST_FORMAT_CALL_STACK',
        check_this
      );
      -- End of test
  END ut_GET_FIRST_FORMAT_CALL_STACK;

  PROCEDURE ut_GET_MODULES
  IS
    -- Verify and complete data types.
    against_this VARCHAR2(2000);
    check_this VARCHAR2(2000);
  BEGIN
    -- Define "control" operation
    against_this := NULL;
    -- Execute test code
    check_this :=
    TRC.GET_MODULES (
    I_POS => ''
    ,
    I_LENGTH => ''
    );
    -- Assert success
    -- Compare the two values.
    utAssert.eq (
    'Test of GET_MODULES',
    check_this,
    against_this,
    true
    );
    -- End of test
  END ut_GET_MODULES;

  PROCEDURE ut_INIT
  IS
  BEGIN
    -- Define "control" operation
    -- Execute test code
    TRC.INIT;
    -- Assert success
    utAssert.this (
      'Test of INIT',
      FALSE /*'<boolean expression>'*/
    );
    -- End of test
  END ut_INIT;

  PROCEDURE ut_LEAVE
  IS
  BEGIN
    -- Define "control" operation
    -- Execute test code
    TRC.LEAVE;
    -- Assert success
    utAssert.this (
      'Test of LEAVE',
      FALSE /*'<boolean expression>'*/
    );
    -- End of test
  END ut_LEAVE;

  PROCEDURE ut_LEAVE_ON_ERROR
  IS
  BEGIN
    -- Define "control" operation
    -- Execute test code
    TRC.LEAVE_ON_ERROR (
    I_ERROR_MSG => ''
    ,
    I_FORMAT_CALL_STACK => ''
    ,
    I_CALLS => ''
    );
    -- Assert success
    utAssert.this (
      'Test of LEAVE_ON_ERROR',
      FALSE /*'<boolean expression>'*/
    );
    -- End of test
  END ut_LEAVE_ON_ERROR;

  PROCEDURE ut_SET_ENABLE_CALL_STACK
  IS
  BEGIN
    -- Define "control" operation
    -- Execute test code
    TRC.SET_ENABLE_CALL_STACK (
      I_VALUE => NULL
    );
    -- Assert success
    utAssert.this (
      'Test of SET_ENABLE_CALL_STACK(NULL)',
      TRC.GET_ENABLE_CALL_STACK IS NULL
    );
    TRC.SET_ENABLE_CALL_STACK (
      I_VALUE => TRUE
    );
    -- Assert success
    utAssert.this (
      'Test of SET_ENABLE_CALL_STACK(TRUE)',
      TRC.GET_ENABLE_CALL_STACK = TRUE
    );
    TRC.SET_ENABLE_CALL_STACK (
      I_VALUE => FALSE
    );
    -- Assert success
    utAssert.this (
      'Test of SET_ENABLE_CALL_STACK(FALSE)',
      TRC.GET_ENABLE_CALL_STACK = FALSE
    );
    -- End of test
  END ut_SET_ENABLE_CALL_STACK;

  PROCEDURE ut_VERSION
  IS
  BEGIN
    -- Execute test code
    utAssert.isnotnull(
      'Test of VERSION is not NULL',
      trc.version
    );
    utAssert.eqqueryvalue(
      'Test of VERSION used in a query',
      'select trc.version from dual',
      trc.version
    );
    -- End of test
  END ut_VERSION;

END ut_trc;
/
