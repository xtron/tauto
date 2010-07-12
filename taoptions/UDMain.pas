unit UDMain;

interface

uses
  SysUtils, Classes, IB_Components;

type
  TDMMain = class(TDataModule)
    IBC: TIB_Connection;
    IBT: TIB_Transaction;
    TempQ: TIB_Query;
    UsersQ: TIB_Query;
    UsersDS: TIB_DataSource;
    GroupsQ: TIB_Query;
    GroupsDS: TIB_DataSource;
    ModulesQ: TIB_Query;
    ModulesDS: TIB_DataSource;
    RightQ: TIB_Query;
    RightDS: TIB_DataSource;
    procedure ModulesQAfterScroll(IB_Dataset: TIB_Dataset);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMain: TDMMain;
implementation

{$R *.dfm}

procedure TDMMain.ModulesQAfterScroll(IB_Dataset: TIB_Dataset);
begin
  RIghtQ.ParamByName('GID').AsInteger:=GroupsQ.FieldByName('GROUPID').AsInteger;
  RightQ.ParamByName('MID').AsInteger:=ModulesQ.FieldByName('TA_MODULEID').AsInteger;
  if not RightQ.Active then RightQ.Active:=True;
end;

end.
