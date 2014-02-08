unit TestFooImpl;
interface

uses
  TestFramework, UIntf;

type
  TestIFoo = class(TTestCase)
  strict private
    FIFoo: IFoo;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  private
    procedure SetupBar;
    procedure SetupStub;
  published
    procedure TestUseBar_SetupBar_Locally;
    procedure TestUseBar_SetupBar_WithCall;
    procedure TestUseStub_SetupStub_Locally;
    procedure TestUseStub_SetupStub_WithCall;
    procedure TestUseBar_WithoutFoo;
  end;

implementation
uses UFooImpl, UBarImpl, Delphi.Mocks;

procedure TestIFoo.SetUp;
begin
  // TODO: Initialize FIFoo
  FIFoo := UFooImpl.GetFoo;
end;

procedure TestIFoo.SetupBar;
begin
  FIFoo.Bar := UBarImpl.GetBar;
end;

procedure TestIFoo.SetupStub;
begin
  FIFoo.Bar := TStub<IBar>.Create;
end;

procedure TestIFoo.TearDown;
begin
  FIFoo := nil;
end;

procedure TestIFoo.TestUseBar_SetupBar_Locally;
begin
  FIFoo.Bar := UBarImpl.GetBar;
  FIFoo.UseBar;
end;

procedure TestIFoo.TestUseBar_WithoutFoo;
begin
  StartExpectingException(EFooNotConfigured);
  FIFoo.UseBar;
  StopExpectingException('Check for foo configuration is not working');
end;

procedure TestIFoo.TestUseStub_SetupStub_Locally;
begin
  FIFoo.Bar := TStub<IBar>.Create;
  FIFoo.UseBar;
end;

procedure TestIFoo.TestUseStub_SetupStub_WithCall;
begin
  SetupStub;
  FIFoo.UseBar;
end;

procedure TestIFoo.TestUseBar_SetupBar_WithCall;
begin
  SetupBar;
  FIFoo.UseBar;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestIFoo.Suite);
end.

