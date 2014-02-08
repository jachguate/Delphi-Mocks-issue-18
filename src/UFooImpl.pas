unit UFooImpl;

interface
uses UIntf;

  function GetFoo: IFoo;

implementation
type
  TFoo = class(TInterfacedObject, IFoo)
  private
    FBar: IBar;
    procedure CheckConfigured;
    procedure SetBar({const }Value: IBar);
    function GetBar: IBar;
    procedure UseBar;
  end;

  { TFoo }

procedure TFoo.CheckConfigured;
begin
  if not Assigned(FBar) then
    raise EFooNotConfigured.Create('Foo is not properly configured!');
end;

function TFoo.GetBar: IBar;
begin
  Result := FBar;
end;

procedure TFoo.SetBar({const }Value: IBar);
begin
  FBar := Value;
end;

procedure TFoo.UseBar;
begin
  CheckConfigured;
  if FBar.GetNothing = '' then
    FBar.DoNothingWithParam(1);
end;


  function GetFoo: IFoo;
  begin
    Result := TFoo.Create;
  end;


end.
