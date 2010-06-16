library taoptions;
uses
  SysUtils,
  Classes,
  UDMain in 'UDMain.pas' {DMMain: TDataModule},
  umain in 'umain.pas' {FMain};

{$R *ver.res}
procedure ta_options(aUID,aGID,dbHandle:Integer;Var Res:Integer);stdcall; export;
begin
  DMMain:=TDMMain.Create(nil);
  DMMain.IBC.dbHandleShared:=Pointer(dbHandle);
  FMain:=TFMain.Create(DMMain);
  FMain.ShowModal;
  DMMain.Free;
  Res:=0;
end;
procedure ta_users(aUID,aGID,dbHandle:Integer;Var Res:Integer);stdcall; export;
begin
  DMMain:=TDMMain.Create(nil);
  DMMain.IBC.dbHandleShared:=Pointer(dbHandle);
  FMain:=TFMain.Create(DMMain);
  FMain.ShowModal;
  DMMain.Free;
  Res:=0;
end;
exports ta_options,ta_users;
begin
end.
