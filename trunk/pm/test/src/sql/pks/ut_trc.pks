CREATE OR REPLACE PACKAGE ut_trc
IS
  PROCEDURE ut_setup;
  PROCEDURE ut_teardown;
  -- For each program to test...
  PROCEDURE ut_ADD_ARG1;
  PROCEDURE ut_ADD_ARG2;
  PROCEDURE ut_ADD_ARG3;
  PROCEDURE ut_ADD_ARG4;
  PROCEDURE ut_ENTER;
  PROCEDURE ut_GET_CALLS;
  PROCEDURE ut_GET_ENABLE_CALL_STACK;
  PROCEDURE ut_GET_FIRST_CALLS;
  PROCEDURE ut_GET_FIRST_ERROR_MSG;
  PROCEDURE ut_GET_FIRST_FORMAT_CALL_STACK;
  PROCEDURE ut_GET_MODULES;
  PROCEDURE ut_INIT;
  PROCEDURE ut_LEAVE;
  PROCEDURE ut_LEAVE_ON_ERROR;
  PROCEDURE ut_SET_ENABLE_CALL_STACK;
  PROCEDURE ut_VERSION;
END ut_trc;
/