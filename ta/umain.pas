unit umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, PngImageList, ActnCtrls, ToolWin, ActnMan,
  ActnMenus, XPStyleActnCtrls;

type
  TFMain = class(TForm)
    ActionManager: TActionManager;
    ActionMainMenuBar: TActionMainMenuBar;
    ActionToolBar1: TActionToolBar;
    PngImageList: TPngImageList;
    Action1: TAction;
    aClients: TAction;
    aOrders: TAction;
    aDict: TAction;
    aOptions: TAction;
    aRights: TAction;
    aFind: TAction;
    aUserReport: TAction;
    aOrderReport: TAction;
    aChangeUser: TAction;
    aAbout: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure aOptionsExecute(Sender: TObject);
    procedure aRightsExecute(Sender: TObject);
    procedure aUserReportExecute(Sender: TObject);
    procedure aOrderReportExecute(Sender: TObject);
    procedure aOrdersExecute(Sender: TObject);
    procedure aFindExecute(Sender: TObject);
    procedure aClientsExecute(Sender: TObject);
    procedure aDictExecute(Sender: TObject);
    procedure aChangeUserExecute(Sender: TObject);
    procedure aAboutExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;
  UID : Integer;
  GID : Integer;
implementation

uses
  UDMain;

{$R *.dfm}
//Загрузка ДЛЛ-ок---------------------------------------------------------------
procedure LoadTAModule(aUID,aGID,dbHandle:Integer; dllName, ProcName: PChar);
var Proc: procedure(aUID,aGID,dbHandle:Integer);stdcall;
    Handle: THandle;
begin
  Handle := LoadLibrary(dllName);
  if Handle <> 0 then begin
    @Proc := GetProcAddress(Handle, ProcName);
    if @Proc <> nil then Proc(aUID,aGID,dbHandle);
    FreeLibrary(Handle);
  end;
end;
//------------------------------------------------------------------------------
procedure TFMain.aAboutExecute(Sender: TObject);
begin
 //
end;
//------------------------------------------------------------------------------
procedure TFMain.aChangeUserExecute(Sender: TObject);
begin
 //
end;
//------------------------------------------------------------------------------
procedure TFMain.aClientsExecute(Sender: TObject);
begin
//
end;
//------------------------------------------------------------------------------
procedure TFMain.Action1Execute(Sender: TObject);
begin
 Close
end;
//------------------------------------------------------------------------------
procedure TFMain.aDictExecute(Sender: TObject);
begin
 LoadTAModule(UID,GID,Integer(DMMain.IBC.dbHandle),'tadict.dll','ta_dict')
end;
//------------------------------------------------------------------------------
procedure TFMain.aFindExecute(Sender: TObject);
begin
 LoadTAModule(UID,GID,Integer(DMMain.IBC.dbHandle),'tafind.dll','ta_find')
end;
//------------------------------------------------------------------------------
procedure TFMain.aOptionsExecute(Sender: TObject);
begin
 //
end;
//------------------------------------------------------------------------------
procedure TFMain.aOrderReportExecute(Sender: TObject);
begin
 //
end;
//------------------------------------------------------------------------------
procedure TFMain.aOrdersExecute(Sender: TObject);
begin
 //
end;
//------------------------------------------------------------------------------
procedure TFMain.aRightsExecute(Sender: TObject);
begin
 //
end;
//------------------------------------------------------------------------------
procedure TFMain.aUserReportExecute(Sender: TObject);
begin
 //
end;

end.
