unit UDMain;

interface

uses
  SysUtils, Classes, IB_Components,Windows;

type
  TDMMain = class(TDataModule)
    IBC: TIB_Connection;
    IBT: TIB_Transaction;
    TempQ: TIB_Query;
    OrdersDS: TIB_DataSource;
    PositionsQ: TIB_Query;
    PositionsDS: TIB_DataSource;
    OrdersQ: TIB_Query;
    OrdersSumQ: TIB_Query;
    OrdersSumDS: TIB_DataSource;
    PositionsSumQ: TIB_Query;
    PositionsSumDS: TIB_DataSource;
    OrdersHQ: TIB_Query;
    OrdersHDS: TIB_DataSource;
    OrdersHQAdd: TIB_Query;
    OrdersHDSAdd: TIB_DataSource;
    PositionsHQ: TIB_Query;
    PositionsHDS: TIB_DataSource;
    PositionsHQAdd: TIB_Query;
    PositionsHDSAdd: TIB_DataSource;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    FNameList,MNameList,CarMarksList,PostList:TStrings;
    Function GetUserFIO(UserID:Integer): String;
    procedure ta_extractres(DllName,ResName,FExportFileName:Pchar);
    procedure ta_printorder(OrderID:Integer);
    procedure LoadGrants(const MODULE: WideString; FForm,GID: Integer);
  end;

var
  DMMain: TDMMain;

implementation

{$R *.dfm}
procedure TDMMain.LoadGrants(const MODULE: WideString; FForm,GID: Integer);
var
  Proc: procedure(const MODULE: WideString; FForm,dbHandle,GID: Integer); stdcall;
  Handle: THandle;
begin
  Handle := LoadLibrary('taoptions.dll');
  if Handle <> 0 then
  begin
    @Proc := GetProcAddress(Handle, 'LoadGrants');
    if @Proc <> nil then
      Proc(MODULE,  FForm,Integer(IBC.dbHandle),GID);
    FreeLibrary(Handle);
  end;
end;

procedure TDMMain.ta_extractres(DllName,ResName,FExportFileName:Pchar);
var
  Proc: procedure(DllName, ResName, FExportFileName: PChar); stdcall;
  Handle: THandle;
begin
  Handle := LoadLibrary('tareport.dll');
  if Handle <> 0 then
  begin
    @Proc := GetProcAddress(Handle, 'ta_extractres');
    if @Proc <> nil then
      Proc(DllName, ResName, FExportFileName);
    FreeLibrary(Handle);
  end;
end;
procedure TDMMain.ta_printorder(OrderID: Integer);
var
  Proc: procedure(orderid,dbhandle:integer); stdcall;
  Handle: THandle;
begin
  Handle := LoadLibrary('tareport.dll');
  if Handle <> 0 then
  begin
    @Proc := GetProcAddress(Handle, 'ta_printorder');
    if @Proc <> nil then
      Proc(orderid,Integer(IBC.dbHandle));
    FreeLibrary(Handle);
  end;
end;

procedure TDMMain.DataModuleDestroy(Sender: TObject);
begin
   FNameList.Free;
   MNameList.Free;
   CarMarksList.Free;
   PostList.Free;
end;
function TDMMain.GetUserFIO(UserID: Integer): String;
begin
  DMMain.TempQ.SQL.Text:='SELECT USERNAME FROM TA_USERS WHERE USERID=:UID';
  DMMain.TempQ.ParamByName('UID').AsInteger:=UserID;
  DMMain.TempQ.Open;
  if DMMain.TempQ.RecordCount>0 then
  Result:=DMMain.TempQ.FieldByName('USERNAME').AsString;
  DMMain.TempQ.Close;
end;
end.
