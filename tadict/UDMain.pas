unit UDMain;

interface

uses
  SysUtils, Classes, IB_Components;

type
  TDMMain = class(TDataModule)
    IBT: TIB_Transaction;
    TempQ: TIB_Query;
    IBC: TIB_Connection;
    DataFromDictQ: TIB_Query;
    DataFromDictDS: TIB_DataSource;
    FieldNameQ: TIB_Query;
    DictTempQ: TIB_Query;
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
