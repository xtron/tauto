library tadict;
uses
  SysUtils,
  Classes,
  UDMain in 'UDMain.pas' {DMMain: TDataModule},
  umain in 'umain.pas' {FMain};

{$R *ver.res}
procedure ta_dict(aUID,aGID,dbHandle:Integer);stdcall; export;
begin
  DMMain:=TDMMain.Create(nil);
  DMMain.IBC.dbHandleShared:=Pointer(dbHandle);
  FMain:=TFMain.Create(DMMain);
  FMain.ShowModal;
  DMMain.Free;
end;
exports ta_dict;
begin
end.
