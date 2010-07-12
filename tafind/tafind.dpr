library tafind;
uses
  SysUtils,Controls,
  Classes,
  UDMain in 'UDMain.pas' {DMMain: TDataModule},
  umain in 'umain.pas' {FMain};

{$R *ver.res}
procedure ta_find(aUID,aGID,dbHandle:Integer;Var Res:Integer);stdcall; export;
begin
  DMMain:=TDMMain.Create(nil);
  DMMain.IBC.dbHandleShared:=Pointer(dbHandle);
  FMain:=TFMain.Create(DMMain);
  if FMain.ShowModal = mrOk then Res:=FMain.Tag else Res:=0;
  DMMain.Free;
end;
exports ta_find;
begin
end.
