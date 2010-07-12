library taoptions;
uses
  SysUtils,Dialogs,
  Controls,
  Forms,
  TypInfo,
  Windows,
  IB_Components,
  Classes,
  ActnMan,
  ActnList,
  UDMain in 'UDMain.pas' {DMMain: TDataModule},
  umain in 'umain.pas' {FMain},
  uusers in 'uusers.pas' {FUsers},
  uadduser in 'uadduser.pas' {FAddUser};

{$R *ver.res}
procedure ta_options(aUID,aGID,dbHandle:Integer;Var Res:Integer);stdcall; export;
begin
  DMMain:=TDMMain.Create(nil);
  DMMain.IBC.dbHandleShared:=Pointer(dbHandle);
  FMain:=TFMain.Create(DMMain);
  DMMain.TempQ.SQL.Text:='SELECT * FROM OPTIONS WHERE OPTIONSID=1';
  DMMain.TempQ.Open;
  FMain.cbShowExcel.Checked:=DMMain.TempQ.FieldByName('OPTIONS').AsInteger=1;
  DMMain.TempQ.Close;
  DMMain.TempQ.SQL.Text:='SELECT * FROM OPTIONS WHERE OPTIONSID=2';
  DMMain.TempQ.Open;
  FMain.MInfo.Text:=DMMain.TempQ.FieldByName('OPTIONS').AsString;
  DMMain.TempQ.Close;
  if FMain.ShowModal = mrOk then
  begin
    DMMain.TempQ.SQL.Text:='UPDATE OPTIONS SET OPTIONS=:O WHERE OPTIONSID=:OID';
    DMMain.TempQ.ParamByName('OID').AsInteger:=1;
    DMMain.TempQ.ParamByName('O').AsInteger:=Integer(FMain.cbShowExcel.Checked);
    DMMain.TempQ.ExecSQL;
    DMMain.TempQ.ParamByName('OID').AsInteger:=2;
    DMMain.TempQ.ParamByName('O').AsString:=FMain.MInfo.Text;
    DMMain.TempQ.ExecSQL;
    DMMain.TempQ.Close;
    DMMain.IBT.CommitRetaining;
  end;
  DMMain.Free;
  Res:=0;
end;
procedure ta_users(aUID,aGID,dbHandle:Integer;Var Res:Integer);stdcall; export;
begin
  DMMain:=TDMMain.Create(nil);
  DMMain.IBC.dbHandleShared:=Pointer(dbHandle);
  FUsers:=TFUsers.Create(DMMain);
  DMMain.UsersQ.Active:=True;
  DMMain.UsersQ.AfterScroll:=FUsers.UsersQAfterScroll;
  DMMain.UsersQ.AfterOpen:=FUsers.UsersQAfterScroll;
  DMMain.UsersQ.Locate('USERID',0,[]);
  DMMain.GroupsQ.Active:=True;
  DMMain.ModulesQ.Active:=True;
  if FUsers.ShowModal= mrOk then
  DMMain.IBT.CommitRetaining else
  DMMain.IBT.RollbackRetaining;
  DMMain.Free;
  Res:=0;
end;
procedure LoadGrants(const MODULE: WideString; FForm,dbHandle,GID: Integer);stdcall; export;
var AForm       : TForm;
    I,J,K,N     :Integer;
    tInfo       : PTypeInfo;
    tData       : PTypeData;
    PropList    : PPropList;

begin
    DMMain:=TDMMain.Create(nil);
    DMMain.IBC.dbHandleShared:=Pointer(dbHandle);
    DMMain.TempQ.SQL.Clear;
    DMMain.TempQ.SQL.Add('SELECT A.TA_ACTIONINTNAME FROM TA_RIGHTS R');
    DMMain.TempQ.SQL.Add('LEFT JOIN TA_ACTIONS A ON A.TA_ACTIONID = R.TA_ACTIONID');
    DMMain.TempQ.SQL.Add('INNER JOIN TA_MODULES M ON M.TA_MODULEID = A.TA_MODULEID AND M.TA_MODULE = :MODNAME');
    DMMain.TempQ.SQL.Add('WHERE R.GROUPID = :GID AND R.ENABLED=1');
    DMMain.TempQ.Prepare;
    DMMain.TempQ.ParamByName('GID').AsInteger:=GID;
    DMMain.TempQ.ParamByName('MODNAME').AsString:=MODULE;
    DMMain.TempQ.Open;
    AForm := TForm(FForm);
    with AForm do
    begin
        for I := 0 to Pred(ComponentCount) do
        begin
            //----------
            if Components[I].ClassNameIs('TActionManager') then
            begin
                for j := 0 to TActionManager(Components[I]).ActionCount - 1 do
                begin
                    if not DMMain.TempQ.Locate('TA_ACTIONINTNAME',UpperCase(TActionManager(Components[I]).Actions[j].Name),[lopFindNearest]) then
                    begin
                        TActionManager(Components[I]).Actions[j].OnExecute := nil;
                        for K := 0 to AForm.ComponentCount - 1 do
                        begin
                            tInfo := Components[K].ClassInfo;
                            tData := GetTypeData(tInfo);
                            GetMem(PropList, SizeOf(TPropInfo)*tData.PropCount);
                            try
                                GetPropInfos(tInfo, PropList);
                                for N:=0 to tData.PropCount-1 do
                                if UpperCase(String(TypInfo.GetPropValue(Components[K],'Name'))) = UpperCase(TActionList(Components[I]).Actions[j].Name) then TypInfo.SetPropValue(Components[K],'Enabled',false);
                            finally
                                FreeMem(PropList)
                            end;
                        end;
                    end;
                end;
            end;
            if Components[I].ClassNameIs('TActionList') then
            begin
                for j := 0 to TActionList(Components[I]).ActionCount - 1 do
                begin
                    if not DMMain.TempQ.Locate('TA_ACTIONINTNAME',UpperCase(TActionList(Components[I]).Actions[j].Name),[lopFindNearest]) then
                    begin
                        TActionList(Components[I]).Actions[j].OnExecute := nil;
                        //*****
                        for K := 0 to AForm.ComponentCount - 1 do
                        begin
                            tInfo := Components[K].ClassInfo;
                            tData := GetTypeData(tInfo);
                            GetMem(PropList, SizeOf(TPropInfo)*tData.PropCount);
                            try
                                GetPropInfos(tInfo, PropList);
                                for N:=0 to tData.PropCount-1 do
                                if UpperCase(String(TypInfo.GetPropValue(Components[K],'Name'))) = UpperCase(TActionList(Components[I]).Actions[j].Name) then
                                TypInfo.SetPropValue(Components[K],'Enabled',false);
                            finally
                                FreeMem(PropList)
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    DMMain.TempQ.Close;
end;

exports ta_options,ta_users,LoadGrants;
begin
end.
