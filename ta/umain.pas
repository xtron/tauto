unit umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, PngImageList, ActnCtrls, ToolWin, ActnMan,
  ActnMenus, XPStyleActnCtrls, XPMan,ExcelXP,OleServer;

type
  TFMain = class(TForm)
    ActionManager: TActionManager;
    ActionMainMenuBar: TActionMainMenuBar;
    ActionToolBar1: TActionToolBar;
    PngImageList: TPngImageList;
    aExit: TAction;
    aClients: TAction;
    aOrders: TAction;
    aDict: TAction;
    aOptions: TAction;
    aRights: TAction;
    aUserReport: TAction;
    aOrderReport: TAction;
    aAbout: TAction;
    XPManifest: TXPManifest;
    procedure aExitExecute(Sender: TObject);
    procedure aOptionsExecute(Sender: TObject);
    procedure aRightsExecute(Sender: TObject);
    procedure aUserReportExecute(Sender: TObject);
    procedure aOrderReportExecute(Sender: TObject);
    procedure aOrdersExecute(Sender: TObject);
    procedure aClientsExecute(Sender: TObject);
    procedure aDictExecute(Sender: TObject);
    procedure aChangeUserExecute(Sender: TObject);
    procedure aAboutExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
        XLApp:TExcelApplication;
  end;
procedure LoadTAModule(aUID,aGID,dbHandle:Integer; var Result:Integer; dllName, ProcName: PChar);

var
  FMain: TFMain;
  UID : Integer;
  GID : Integer;
  Res : Integer;

implementation

uses
  UDMain, uabout, uclients, uorders;

{$R *.dfm}
//Загрузка ДЛЛ-ок---------------------------------------------------------------
procedure LoadTAModule(aUID,aGID,dbHandle:Integer; var Result:Integer; dllName, ProcName: PChar);
var Proc: procedure(aUID,aGID,dbHandle:Integer;var Result:Integer);stdcall;
    Handle: THandle;
begin
  Handle := LoadLibrary(dllName);
  if Handle <> 0 then begin
    @Proc := GetProcAddress(Handle, ProcName);
    if @Proc <> nil then Proc(aUID,aGID,dbHandle,Result);
    FreeLibrary(Handle);
  end;
end;
//------------------------------------------------------------------------------
procedure TFMain.aAboutExecute(Sender: TObject);
begin
  FABout:=TFABout.Create(self);
  FAbout.ShowModal;
  FAbout.Free;
end;
//------------------------------------------------------------------------------
procedure TFMain.aChangeUserExecute(Sender: TObject);
begin
 //
end;
//------------------------------------------------------------------------------
procedure TFMain.aClientsExecute(Sender: TObject);
begin
 FClients:=TFClients.Create(self);

 FClients.cbFName.Items.Assign(DMMain.FNameList);
 FClients.ShowModal;
 FClients.Free;
end;
//------------------------------------------------------------------------------
procedure TFMain.aExitExecute(Sender: TObject);
begin
 Close
end;
//------------------------------------------------------------------------------
procedure TFMain.aDictExecute(Sender: TObject);
begin
 LoadTAModule(UID,GID,Integer(DMMain.IBC.dbHandle),Res,'tadict.dll','ta_dict')
end;
//------------------------------------------------------------------------------
procedure TFMain.aOptionsExecute(Sender: TObject);
begin
 LoadTAModule(UID,GID,Integer(DMMain.IBC.dbHandle),Res,'taoptions.dll','ta_options')
end;
//------------------------------------------------------------------------------
procedure TFMain.aOrderReportExecute(Sender: TObject);
begin
 LoadTAModule(UID,GID,Integer(DMMain.IBC.dbHandle),Res,'tareport.dll','ta_report_orders')
end;
//------------------------------------------------------------------------------
procedure TFMain.aOrdersExecute(Sender: TObject);
begin
 FOrders.Show;

end;
//------------------------------------------------------------------------------
procedure TFMain.aRightsExecute(Sender: TObject);
begin
 LoadTAModule(UID,GID,Integer(DMMain.IBC.dbHandle),Res,'taoptions.dll','ta_users')
end;
//------------------------------------------------------------------------------
procedure TFMain.aUserReportExecute(Sender: TObject);
begin
 LoadTAModule(UID,GID,Integer(DMMain.IBC.dbHandle),Res,'tareport.dll','ta_report_users')
end;

procedure TFMain.FormCreate(Sender: TObject);
begin

 DMMain.LoadGrants('TA',integer(self),GID);
 XLApp:=TExcelApplication.Create(self);
 XLApp.ConnectKind:=ckRunningOrNew;
 XLApp.AutoConnect:=True;
 XLApp.AutoQuit:=True;
end;

procedure TFMain.FormResize(Sender: TObject);
begin
 Height:=85
end;

end.
