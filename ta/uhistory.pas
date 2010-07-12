unit uhistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, IB_Grid, UdcIB_Grid;

type
  TFHistory = class(TForm)
    gOrdersDateH: TUdcIB_Grid;
    gOrdersDateHAdd: TUdcIB_Grid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHistory: TFHistory;

implementation

uses
  UDMain;

{$R *.dfm}

end.
