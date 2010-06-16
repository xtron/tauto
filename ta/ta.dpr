program ta;

uses
  Forms,
  Controls,
  Registry,
  Windows,
  SysUtils,
  Dialogs,
  umain in 'umain.pas' {FMain},
  UDMain in 'UDMain.pas' {DMMain: TDataModule},
  ulogin in 'ulogin.pas' {FLogin},
  uabout in 'uabout.pas' {FABout};

{$R *.res}
{$R *ver.res}
//������� ������----------------------------------------------------------------
function Login: boolean;
Var reg   : Tregistry;
    dbpath: String;  //���� � ����
begin
  //������ ���� � ���� �� �������. ���� �� ������ ����� ���������
  Result:=False;
  reg:=TRegistry.Create;
  try
    reg.RootKey:=HKEY_CURRENT_USER;
    reg.OpenKey('Software\Tauto\db',True);
    if reg.ValueExists('dbpath') then dbpath:=reg.ReadString('dbpath')
    else dbpath:='localhost:tauto';
    reg.CloseKey;
  finally
    reg.Free;
  end;
  //������������� ��������� �����������
  DMMain:=TDMMain.Create(Application);
  DMMain.IBC.Username:='TAUTO';
  DMMain.IBC.Password:='troya_auto';
  DMMain.IBC.DatabaseName:=dbpath;
  //�������� �������������
  try
   DMMain.IBC.Connect;
   //���� ��������������, �������� ������ �������� �������������
   FLogin:=TFLogin.Create(DMMain);
   DMMain.TempQ.SQL.Text:='SELECT * FROM TA_USERS WHERE ISACTIVE=1';
   DMMain.TempQ.Open;
   DMmain.TempQ.First;
   //������ ������ ��������� ������������� � ����� ������
   while not DMMain.TempQ.Eof do
   begin
    FLogin.cbUser.AddItem(DMMain.TempQ.FieldByName('USERNAME').AsString,TObject(DMMain.TempQ.FieldByName('USERID').AsInteger));
    DMMain.TempQ.Next;
   end;
   DMMain.TempQ.Close;
   //���������� ����� ������
   Result:=FLogin.ShowModal=mrOk;
   //���� ������ �������������� (��� ������������ ���������� � ���� ����� ������),
   //���������� ������ ������������ (���� ����� ������ ����� 0)
   if Result then
   begin
    UID:=FLogin.Tag;
    if UID>0 then
    begin
      DMMain.TempQ.SQL.Text:='SELECT USERROLE FROM TA_USERS WHERE USERID=:UID';
      DMMain.TempQ.Open;
      GID:=DMMain.TempQ.FieldByName('USERROLE').AsInteger;
      DMMain.TempQ.Close;
    end else GID:=UID;
   end;
   Flogin.Free;
  except //���� �� ������������ - ������� ������
    on E:Exception do MessageDlg('������ �����������'+#13+E.Message , mtError, [mbOK], 0);
  end;
end;
begin
  Application.Initialize;
  if not Login then Application.Terminate else   //������� �����������, ����� ��������� ���
  begin
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TFMain, FMain);
  Application.Run;
  end;
end.
