library tadict;
uses
  SysUtils,
  Classes,
  UDMain in 'UDMain.pas' {DMMain: TDataModule},
  umain in 'umain.pas' {FMain},
  udictinfo in 'udictinfo.pas' {FDictInfo};

{$R *ver.res}
procedure ta_dict(aUID,aGID,dbHandle:Integer;Var Res:Integer);stdcall; export;
begin
  DMMain:=TDMMain.Create(nil);
  DMMain.IBC.dbHandleShared:=Pointer(dbHandle);
  FMain:=TFMain.Create(DMMain);
  FMain.ShowModal;
  DMMain.Free;
  Res:=0;
end;
exports ta_dict;
begin
end.
