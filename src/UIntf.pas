unit UIntf;

interface
uses SysUtils;

type
  EFooNotConfigured = class(exception)
  end;

  IBar = interface(IInvokable)
    procedure DoNothing;
    procedure DoNothingWithParam(X: Integer);
    function GetNothing: string;
  end;

  IFoo = interface(IInvokable)
    procedure SetBar({const }Value: IBar);
    function GetBar: IBar;
    property Bar: IBar read GetBar write SetBar;
    procedure UseBar;
  end;

implementation

end.
