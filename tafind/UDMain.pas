unit UDMain;

interface

uses
  SysUtils, Classes, IB_Components;

type
  TDMMain = class(TDataModule)
    IBC: TIB_Connection;
    IBT: TIB_Transaction;
    TempQ: TIB_Query;
    ClientFindQ: TIB_Query;
    ClientFindDS: TIB_DataSource;
    OrderFindQ: TIB_Query;
    OrderFindDS: TIB_DataSource;
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
