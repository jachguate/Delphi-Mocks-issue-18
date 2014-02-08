unit UBarImpl;

interface
uses UIntf;

  function GetBar: IBar;

implementation
type
  TBar = class(TInterfacedObject, IBar)
  private
    procedure DoNothing;
    procedure DoNothingWithParam(X: Integer);
    function GetNothing: string;
  end;

{ TBar }

procedure TBar.DoNothing;
begin
  if GetNothing = '' then
    Exit;
end;

procedure TBar.DoNothingWithParam(X: Integer);
begin
  if GetNothing = '' then
    Exit;
end;

function TBar.GetNothing: string;
begin
  Result := '';
end;

  function GetBar: IBar;
  begin
    Result := TBar.Create;
  end;


end.
