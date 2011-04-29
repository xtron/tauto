unit umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, IB_Grid, UdcIB_Grid, StdCtrls,
  UdcButton, ActnList, UdcComboBox, ExtCtrls, UdcPanel, ComCtrls, ToolWin,
  ImgList, PngImageList,IB_Components;

type
  TFMain = class(TForm)
    ActionList: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aExit: TAction;
    aSelect: TAction;
    aUnion: TAction;
    gridDict: TUdcIB_Grid;
    PngImageList: TPngImageList;
    ToolBar1: TToolBar;
    Panel1: TPanel;
    cbDictName: TUdcComboBox;
    Label1: TLabel;
    tbAdd: TToolButton;
    tbEdit: TToolButton;
    tbDelete: TToolButton;
    tbSelect: TToolButton;
    tbUnion: TToolButton;
    tbExit: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbDictNameChange(Sender: TObject);
    procedure gridDictDrawCellA(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState; var CellText: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
    procedure aSelectExecute(Sender: TObject);
    procedure aUnionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;
  SL,SS:TStringList;
const
  mfInsert = 0;
  mfEdit   = 1;
  
implementation

uses
  UDMain, udictinfo;


{$R *.dfm}

procedure TFMain.aAddExecute(Sender: TObject);
begin
  FDictInfo:=TFDictInfo.Create(self);
  FDictInfo.Tag:=mfInsert;
  FDictInfo.lblValue.Caption:=Trim(string(DMMain.FieldNameQ.FieldByName('FIELDNAME').AsString));
  FDictInfo.ShowModal;
end;

procedure TFMain.aDeleteExecute(Sender: TObject);
begin
 try
  if not DMMain.DataFromDictQ.IsEmpty then
   if MessageDlg('Вы действительно хотите удалить запись?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      DMMain.DictTempQ.Close;
      DMMain.DictTempQ.SQL.Text:='DELETE FROM '+string(cbDictName.Items.Objects[cbDictName.ItemIndex])+' WHERE '+
                                 string(cbDictName.Items.Objects[cbDictName.ItemIndex])+'ID='+
                                 string(DMMain.DataFromDictQ.FieldByName(AnsiString(string(cbDictName.Items.Objects[cbDictName.ItemIndex]))+'ID').AsString);
      DMMain.DictTempQ.Execute;
      DMMain.IBT.CommitRetaining;
      DMMain.DataFromDictQ.Refresh;
    end;
 except
   DMMain.IBT.RollbackRetaining;
   MessageDlg('Ошибка удаления записи. Возможно, есть зависимые данные.',mtError,[mbOK],0);
 end;
end;

procedure TFMain.aEditExecute(Sender: TObject);
Var fld: TIB_Column;
begin
 if not DMMain.DataFromDictQ.IsEmpty then
   begin
    FDictInfo:=TFDictInfo.Create(self);
    FDictInfo.Tag:=mfEdit;
    FDictInfo.lblValue.Caption:=Trim(string(DMMain.FieldNameQ.FieldByName('FIELDNAME').AsString));
    fld:=nil;
    DMMain.DataFromDictQ.Fields.GetByName('ISACTIVE',fld);
    if Assigned(fld) then
    begin
     FDictInfo.pActive.Visible:=True;
     FDictInfo.cbActive.Checked:=fld.AsInteger=1;
    end;
    FDictInfo.ShowModal;

   end;
end;

procedure TFMain.aExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TFMain.aSelectExecute(Sender: TObject);
begin
 if not DMMain.DataFromDictQ.IsEmpty then
   begin
       if SS.IndexOf(IntToStr(cbDictName.ItemIndex)+':'+string(DMMain.DataFromDictQ.FieldByName(AnsiString(string(cbDictName.Items.Objects[cbDictName.ItemIndex]))+'ID').AsString))>=0 then
       SS.Delete(SS.IndexOf(IntToStr(cbDictName.ItemIndex)+':'+string(DMMain.DataFromDictQ.FieldByName(AnsiString(string(cbDictName.Items.Objects[cbDictName.ItemIndex]))+'ID').AsString)))
       else
       SS.Add(IntToStr(cbDictName.ItemIndex)+':'+string(DMMain.DataFromDictQ.FieldByName(AnsiString(string(cbDictName.Items.Objects[cbDictName.ItemIndex]))+'ID').AsString));
       aUnion.Enabled:=False;
       gridDict.Repaint
      end;
end;

procedure TFMain.aUnionExecute(Sender: TObject);
Var I,ID: Integer;
    SqlStr:String;
begin
 if DMMain.DataFromDictQ.IsEmpty then  Exit;
try
 ID:=DMMain.DataFromDictQ.FieldByName(AnsiString(string(cbDictName.Items.Objects[cbDictName.ItemIndex]))+'ID').AsInteger;
 //In-Часть запроса на обновление
 SqlStr:=' IN(';
 for I := 0 to SS.Count - 1 do
  if (Copy(SS.Strings[I],1,Pos(':',SS.Strings[I])-1)=IntToStr(cbDictName.ItemIndex)) and
     (Copy(SS.Strings[I],Pos(':',SS.Strings[I])+1,Length(SS.Strings[I]))<>IntToStr(ID))
  then
 SqlStr:=SqlStr+Copy(SS.Strings[I],Pos(':',SS.Strings[I])+1,Length(SS.Strings[I]))+',';
 SqlStr[Length(SqlStr)]:=')';
 //Получаем список зависимых таблиц с полями
 DMMain.DictTempQ.Close;
 DMMain.DictTempQ.SQL.Text:='SELECT DTABLE,DFIELD FROM RPT$GET_DTABLES(:TNAME)';
 DMMain.DictTempQ.ParamByName('TNAME').AsString:=Ansistring(cbDictName.Items.Objects[cbDictName.ItemIndex]);
 DMMain.DictTempQ.Open;
 DMMain.DictTempQ.First;
 while not DMMain.DictTempQ.Eof do
 begin
   DMMain.TempQ.Close;
   DMMain.TempQ.SQL.Text:=
   'UPDATE '+
   string(DMMain.DictTempQ.FieldByName('DTABLE').AsString)+
   ' SET '+
   string(DMMain.DictTempQ.FieldByName('DFIELD').AsString)+
   ' = '+
   string(DMMain.DataFromDictQ.FieldByName(AnsiString(string(cbDictName.Items.Objects[cbDictName.ItemIndex]))+'ID').AsString)+' WHERE '+
   string(DMMain.DictTempQ.FieldByName('DFIELD').AsString)+SqlStr;
   DMMain.TempQ.ExecSQL;
   DMMain.DictTempQ.Next;
 end;
 DMMain.DictTempQ.Close;
 DMMain.TempQ.Close;
 DMMain.TempQ.SQL.Text:='DELETE FROM  '+ string(cbDictName.Items.Objects[cbDictName.ItemIndex])+
                        ' WHERE '+string(cbDictName.Items.Objects[cbDictName.ItemIndex])+'ID'+SqlStr;
 DMMain.TempQ.ExecSQL;
 cbDictName.OnChange(cbDictName);
 DMMain.IBT.CommitRetaining;
 i:=0;
 while I< SS.Count do
 if Copy(SS.Strings[I],1,Pos(':',SS.Strings[I])-1)=IntToStr(cbDictName.ItemIndex) then SS.Delete(I) else inc(i);
 gridDict.Repaint;
except
  MessageDlg('Невозможно объединить запись', mtError, [mbOK], 0)
end;
end;

procedure TFMain.cbDictNameChange(Sender: TObject);
begin
  aUnion.Enabled:=False;
  DMMain.DataFromDictQ.Close;
  DMMain.DataFromDictQ.SQL.Text:='SELECT * FROM '+string(cbDictName.Items.Objects[cbDictName.ItemIndex]) + ' ORDER BY ' + string(cbDictName.Items.Objects[cbDictName.ItemIndex]) ;
  DMMain.DataFromDictQ.OrderingItems.Text:=string(cbDictName.Items.Objects[cbDictName.ItemIndex])+'='+string(cbDictName.Items.Objects[cbDictName.ItemIndex])+';'+string(cbDictName.Items.Objects[cbDictName.ItemIndex])+' DESC';
  DMMain.DataFromDictQ.OrderingLinks.Text:=string(cbDictName.Items.Objects[cbDictName.ItemIndex])+'=ITEM=1';
  gridDict.StretchColumn:=string(cbDictName.Items.Objects[cbDictName.ItemIndex]);
  DMMain.DataFromDictQ.FieldsVisible.Clear;
  DMMain.DataFromDictQ.FieldsVisible.Add(string(cbDictName.Items.Objects[cbDictName.ItemIndex])+'ID=FALSE');
  DMMain.DataFromDictQ.FieldsVisible.Add(string(cbDictName.Items.Objects[cbDictName.ItemIndex])+'=TRUE');
  DMMain.DataFromDictQ.FieldsVisible.Add('ISACTIVE=FALSE');
  DMMain.FieldNameQ.ParamByName('TABLENAME').AsString:=Ansistring(cbDictName.Items.Objects[cbDictName.ItemIndex]);
  DMMain.FieldNameQ.Open;
  DMMain.DataFromDictQ.FieldsGridLabel.Clear;
  DMMain.DataFromDictQ.FieldsGridLabel.Add(string(cbDictName.Items.Objects[cbDictName.ItemIndex])+'='+string(DMMain.FieldNameQ.FieldByName('FIELDNAME').AsString));
  DMMain.DataFromDictQ.Open;
end;

procedure TFMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
 SS.Free;
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
 SS:=TStringList.Create;
end;

procedure TFMain.FormShow(Sender: TObject);
begin
  cbDictName.Clear;
  DMMain.TempQ.Close;
  DMMain.TempQ.SQL.Text:='SELECT COMMONDICT.DICTNAME,RDB$RELATIONS.RDB$DESCRIPTION '+
                         'FROM COMMONDICT '+
                         'LEFT JOIN RDB$RELATIONS ON RDB$RELATIONS.RDB$RELATION_NAME=COMMONDICT.DICTNAME '+
                         'AND RDB$RELATIONS.RDB$SYSTEM_FLAG=0';
  DMMain.TempQ.Open;
  SL:=TStringList.Create;
  while not DMMain.TempQ.Eof do
    begin
      SL.Add(string(DMMain.TempQ.FieldByName('DICTNAME').AsString));
      cbDictName.AddItem(AnsiUpperCase(string(DMMain.TempQ.FieldByName('RDB$DESCRIPTION').AsString)),TObject(SL.Strings[SL.Count-1]));
      DMMain.TempQ.Next;
    end;
  cbDictName.ItemIndex:=0;
  cbDictName.OnChange(cbDictName);
end;

procedure TFMain.gridDictDrawCellA(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState; var CellText: string);
Var fld: TIB_Column;
begin
 if not DMMain.DataFromDictQ.IsEmpty then
 begin
    fld:=nil;
    DMMain.DataFromDictQ.Fields.GetByName('ISACTIVE',fld);
    if Assigned(fld) then
    if (not DMMain.DataFromDictQ.IsEmpty ) and ((Sender as TUdcIb_grid).DataSource.Dataset.BufferFieldByName('ISACTIVE').AsInteger = 0) then
    gridDict.Canvas.Font.Color:=clGray else  gridDict.Canvas.Font.Color:=clBlack;
 end;
  if not DMMain.DataFromDictQ.IsEmpty and Assigned(SS) and (SS.Count>0)  then
  begin
    if SS.IndexOf(IntToStr(cbDictName.ItemIndex)+':'+string(gridDict.DataSource.Dataset.BufferFieldByName(AnsiString(string(cbDictName.Items.Objects[cbDictName.ItemIndex]))+'ID').AsString))>=0 then
    begin gridDict.Canvas.Brush.Color:=clLime;aUnion.Enabled:=True end else
    gridDict.Canvas.Brush.Color:=clWindow;
   end;
  gridDict.DefaultDrawCell(Acol,Arow,Rect,state,gridDict.GetCellDisplayText(Acol,Arow), gridDict.GetCellAlignment(ACol,Arow));
end;

end.
