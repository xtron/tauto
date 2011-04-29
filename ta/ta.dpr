program ta;

uses
  Forms,
  Controls,
  Registry,
  Windows,
  SysUtils,
  Dialogs,
  Classes,
  umain in 'umain.pas' {FMain},
  UDMain in 'UDMain.pas' {DMMain: TDataModule},
  ulogin in 'ulogin.pas' {FLogin},
  uabout in 'uabout.pas' {FABout},
  uclients in 'uclients.pas' {FClients},
  addorder in 'addorder.pas' {FAddOrders},
  uaddposition in 'uaddposition.pas' {FAddPosition},
  uorders in 'uorders.pas' {FOrders},
  uhistory in 'uhistory.pas' {FHistory};

{$R *.res}
{$R *ver.res}
//Функция логина----------------------------------------------------------------
function Login: boolean;
Var reg   : Tregistry;
    dbpath: String;  //Путь к базе
begin
  //Читаем путь к базе из реестра. Если не находи берем дефолтный
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
  //Устанавливаем параметры подключения
  DMMain:=TDMMain.Create(Application);
  DMMain.IBC.Username:='TAUTO';
  DMMain.IBC.Password:='troya_auto';
  DMMain.IBC.DatabaseName:=AnsiString(dbpath);
  //Пытаемся законнектится
  try
   DMMain.IBC.Connect;
   //Если законнектились, получаем список активных пользователей
   FLogin:=TFLogin.Create(DMMain);
   DMMain.TempQ.SQL.Text:='SELECT * FROM TA_USERS WHERE ISACTIVE=1 AND USERID>0';
   DMMain.TempQ.Open;
   DMmain.TempQ.First;
   //Строим список доступных пользователей в форме логина
   while not DMMain.TempQ.Eof do
   begin
    FLogin.cbUser.AddItem(string(DMMain.TempQ.FieldByName('USERNAME').AsString),TObject(DMMain.TempQ.FieldByName('USERID').AsInteger));
    DMMain.TempQ.Next;
   end;
   DMMain.TempQ.Close;
   //Показываем форму логина
   Result:=FLogin.ShowModal=mrOk;
   //Если прошла аутентификация (код пользователя передается в тэге формы логина),
   //определаем группу пользователя (если гость группа равна 0)
   if Result then
   begin
    UID:=FLogin.Tag;
    if UID>0 then
    begin
      DMMain.TempQ.SQL.Text:='SELECT GROUPID FROM TA_USERS WHERE USERID=:UID';
      DMMain.TempQ.Open;
      GID:=DMMain.TempQ.FieldByName('GROUPID').AsInteger;
      DMMain.TempQ.Close;
    end else GID:=UID;
   end;
   Flogin.Free;
   //--------Загрузка динамических справочников---------------------------------
   DMMain.FNameList:=TStringList.Create;
   DMMain.CarMarksList:=TStringList.Create;
   DMMain.PostList:=TStringList.Create;

   DMMain.TempQ.SQL.Text:='SELECT FNAMEID,FNAME FROM FNAME';
   DMMain.TempQ.Open;
   while not DMMain.TempQ.Eof do
   begin
     DMMain.FNameList.AddObject(string(DMMain.TempQ.FieldByName('FNAME').AsString),
                                TObject(DMMain.TempQ.FieldByName('FNAMEID').AsInteger)

     );
     DMMain.TempQ.Next;
   end;
   DMMain.TempQ.Close;

   DMMain.TempQ.SQL.Text:='SELECT CARMARKSID,CARMARKS FROM CARMARKS';
   DMMain.TempQ.Open;
   while not DMMain.TempQ.Eof do
   begin
     DMMain.CarMarksList.AddObject(string(DMMain.TempQ.FieldByName('CARMARKS').AsString),
                                TObject(DMMain.TempQ.FieldByName('CARMARKSID').AsInteger)

     );
     DMMain.TempQ.Next;
   end;

   DMMain.TempQ.Close;
   DMMain.TempQ.SQL.Text:='SELECT POSTID,POST FROM POST WHERE ISACTIVE=1';
   DMMain.TempQ.Open;
   while not DMMain.TempQ.Eof do
   begin
     DMMain.PostList.AddObject(string(DMMain.TempQ.FieldByName('POST').AsString),
                                TObject(DMMain.TempQ.FieldByName('POSTID').AsInteger)

     );
     DMMain.TempQ.Next;
   end;
   DMMain.TempQ.Close;

//-----------------------------------------------------------------------------


  except //Если не подключились - выводим ошибку
    on E:Exception do MessageDlg('Ошибка подключения'+#13+E.Message , mtError, [mbOK], 0);
  end;
end;
begin
  Application.Initialize;
  if not Login then Application.Terminate else   //Пробуем залогинится, иначе закрываем все
  begin
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFOrders, FOrders);
  Application.Run;
  end;
end.
