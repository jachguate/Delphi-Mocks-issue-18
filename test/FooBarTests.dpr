program FooBarTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  UIntf in '..\src\UIntf.pas',
  TestFooImpl in 'TestFooImpl.pas',
  UFooImpl in '..\src\UFooImpl.pas',
  UBarImpl in '..\src\UBarImpl.pas';

{R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

