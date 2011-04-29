unit UDMain;

interface

uses
  SysUtils, Classes, IB_Components,IB_ACCESS;

type
  TDMMain = class(TDataModule)
    IBC: TIB_Connection;
    IBT: TIB_Transaction;
    TempQ: TIB_Query;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMain: TDMMain;

implementation

{$R *.dfm}

end.
