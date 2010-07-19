unit uclients;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, PngImageList, Grids, IB_Grid, UdcIB_Grid,
  ExtCtrls, UdcPanel,IB_Components, StdCtrls, Buttons, PngBitBtn, UdcComboBox, UdcEdit,
  ComCtrls;

type
  TFClients = class(TForm)
    gbOrders: TGroupBox;
    ActionList: TActionList;
    PngImageList: TPngImageList;
    aAddClient: TAction;
    aEditClient: TAction;
    aDelClient: TAction;
    aNewOrder: TAction;
    aEditOrder: TAction;
    aDelOrder: TAction;
    aFindClient: TAction;
    aCancel: TAction;
    aSave: TAction;
    bEditOrder: TPngBitBtn;
    bDelOrder: TPngBitBtn;
    bAddOrder: TPngBitBtn;
    pClientAndControl: TUdcPanel;
    pClient: TUdcPanel;
    lbLName: TLabel;
    lbFname: TLabel;
    lbMname: TLabel;
    lbContacts: TLabel;
    eLName: TUdcEdit;
    cbFName: TUdcComboBox;
    cbMname: TUdcComboBox;
    EContacts: TUdcEdit;
    bNewClient: TPngBitBtn;
    bFindClient: TPngBitBtn;
    bEditClient: TPngBitBtn;
    bDelClient: TPngBitBtn;
    bCancel: TPngBitBtn;
    bSave: TPngBitBtn;
    aPrintOrder: TAction;
    PngBitBtn1: TPngBitBtn;
    pUserFio: TUdcPanel;
    gOrders: TUdcIB_Grid;
    bHistory: TPngBitBtn;
    aHistory: TAction;
    procedure aAddClientExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aEditClientExecute(Sender: TObject);
    procedure aDelClientExecute(Sender: TObject);
    procedure aNewOrderExecute(Sender: TObject);
    procedure aEditOrderExecute(Sender: TObject);
    procedure aDelOrderExecute(Sender: TObject);
    procedure aFindClientExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aPrintOrderExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gOrdersDrawCellA(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState; var CellText: string);
    procedure aHistoryExecute(Sender: TObject);
  private

    procedure OrdersQAfterScroll(IB_Dataset: TIB_Dataset);
  public
    procedure LoadClient(ClientID:Integer);
  end;

var
  FClients: TFClients;
  mode:(adding,editing);
const

  clGrayM: TColor =  $00E8E8E8;
  clRedM: TColor     = $008080FF;
  clGreenM: TColor    = $00BFFFBF;
  clYellowM: TColor     = $00B9FFFF;
  
implementation

uses
  UDMain,umain, addorder, uhistory;

{$R *.dfm}
procedure TFClients.OrdersQAfterScroll(IB_Dataset: TIB_Dataset);
begin

 aEditOrder.Enabled:=(DMMain.OrdersQ.RecNo>0) and(DMMain.OrdersQ.RecordCount>0);
 aDelOrder.Enabled:=(DMMain.OrdersQ.RecNo>0) and(DMMain.OrdersQ.RecordCount>0);
 aPrintOrder.Enabled:=(DMMain.OrdersQ.RecNo>0) and(DMMain.OrdersQ.RecordCount>0);
end;
//Закрузка клиента в форму по номеру--------------------------------------------
procedure TFClients.LoadClient(ClientID:Integer);
begin
  DMMain.TempQ.SQL.Text:='SELECT * FROM CLIENTS WHERE CLIENTID=:CID';
  DMMain.TempQ.ParamByName('CID').AsInteger:=ClientID;
  DMMain.TempQ.Open;
  if DMMain.TempQ.RecordCount>0 then
  begin
    ELname.Tag:=ClientID;
    ELName.Text:=DMMain.TempQ.FieldByName('LNAME').AsString;
    cbFName.ItemIndex:=cbFName.Items.IndexOfObject(TObject(DMMain.TempQ.FieldByName('FNAMEID').AsInteger));
    cbMName.ItemIndex:=cbMName.Items.IndexOfObject(TObject(DMMain.TempQ.FieldByName('MNAMEID').AsInteger));
    EContacts.Text:=DMMain.TempQ.FieldByName('CONTACTS').AsString;
    pUserFIO.Caption:='Редактировалось: '+ DMMain.GetUserFIO(DMMain.TempQ.FieldByName('USERID').AsInteger);
    pClient.Enabled:=False;
    DMMain.OrdersQ.Close;
    DMMain.OrdersQ.ParamByName('CID').AsInteger:=ClientID;
    DMmain.OrdersQ.Open;
    aNewOrder.Enabled:=true;
    aHistory.Enabled:=true;
    aAddClient.Enabled:=True;
    aDelClient.Enabled:=True;
    aEditClient.Enabled:=True;
    aFindClient.Enabled:=True;
    aCancel.Enabled:=False;
    aSave.Enabled:=False;

  end;
   DMMain.TempQ.Close;


end;
//Добавление нового клиента-----------------------------------------------------
procedure TFClients.aAddClientExecute(Sender: TObject);
begin
 ELName.Text:='';
 cbFName.ItemIndex:=-1;
 cbMname.ItemIndex:=-1;
 eContacts.Text:='';
 aAddClient.Enabled:=False;
 aEditClient.Enabled:=False;
 aHistory.Enabled:=False;
 aCancel.Enabled:=True;
 aSave.Enabled:=True;
 mode:=adding;
 pClient.Enabled:=True;
 ELName.SetFocus;
 DMMain.OrdersQ.Close;
 DMMain.OrdersQ.ParamByName('CID').Clear;
 DMmain.OrdersQ.Prepare;
 aNewOrder.Enabled:=False;
 aEditOrder.Enabled:=False;
 aPrintOrder.Enabled:=False;
 aDelOrder.Enabled:=False;
 ELName.Tag:=0;
end;
//Отмена добавления или редактирования------------------------------------------
procedure TFClients.aCancelExecute(Sender: TObject);
begin
 case mode of
  adding  : begin //добавления
             aAddClient.Enabled:=True;
             ELName.Text:='';
             cbFName.ItemIndex:=-1;
             cbMname.ItemIndex:=-1;
             eContacts.Text:='';

  end;
  editing : begin LoadClient(ELName.Tag); end;  // редактирования
 end;
 pClient.Enabled:=False;
 aCancel.Enabled:=False;
 aSave.Enabled:=False;
end;
//Удаление клиента--------------------------------------------------------------
procedure TFClients.aDelClientExecute(Sender: TObject);
begin
 if DMMain.OrdersQ.RecordCount>0 then
 begin
 MessageDlg('Невозможно удалить клиента, так как у него имеются заказы', mtWarning, [mbOK], 0);
 Exit;
 end;
 if (MessageDlg('Действительно удалить клиента?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
 begin
  DMMain.TempQ.SQL.Text:='DELETE FROM CLIENTS WHERE CLIENTID=:CID';
  DMmain.TempQ.ParamByName('CID').AsInteger:=ELName.Tag;
  DMmain.TempQ.ExecSQL;
  DMMain.IBT.CommitRetaining;
  DMmain.TempQ.Close;
  aAddClient.Enabled:=True;
  ELName.Text:='';
  cbFName.ItemIndex:=-1;
  cbMname.ItemIndex:=-1;
  eContacts.Text:='';
  pClient.Enabled:=False;
  aSave.Enabled:=False;
  aEditClient.Enabled:=False;
  aHistory.Enabled:=False;
  aDelClient.Enabled:=False;
  aNewOrder.Enabled:=False;
 end;

end;
//Удаление заказа клиента-------------------------------------------------------
procedure TFClients.aDelOrderExecute(Sender: TObject);
begin
if (MessageDlg('Действительно удалить заказ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
begin
  DMMain.OrdersQ.Delete;
  DMMain.IBT.CommitRetaining;
end;

end;
//Редактирвание клиента---------------------------------------------------------
procedure TFClients.aEditClientExecute(Sender: TObject);
begin
 aAddClient.Enabled:=False;
 aDelClient.Enabled:=False;
 aEditClient.Enabled:=False;
 aHistory.Enabled:=False;
 aFindClient.Enabled:=False;
 aCancel.Enabled:=True;
 aSave.Enabled:=True;
 mode:=editing;
 pClient.Enabled:=True;
 ELName.SetFocus;
end;
//Изменение заказа клиента------------------------------------------------------
procedure TFClients.aEditOrderExecute(Sender: TObject);
Var OrderID:Integer;
begin
 OrderID:=DMMain.OrdersQ.FieldByName('ORDERID').AsInteger;
 FAddOrders:=TFAddOrders.Create(self);
 FAddOrders.Caption:='Изменение заказа';
 FAddOrders.pOrderNum.Caption:=DMMain.OrdersQ.FieldByName('ORDERID').AsString;
 FAddOrders.pOrderData.Caption:=DMMain.OrdersQ.FieldByName('ORDERDATE').AsString;
 FAddOrders.pClientInfo.Caption:=eLName.Text+' '+cbFName.Text+' '+cbMName.Text;
 FAddOrders.cbCarMarks.Items.Assign(DMMain.CarMarksList);
 FAddOrders.cbCarMarks.ItemIndex:=FaddOrders.cbCarMarks.Items.IndexOfObject(TObject(DMMain.OrdersQ.FieldByName('CARMARKSID').AsInteger));
 FAddOrders.EYear.Text:=DMMain.OrdersQ.FieldByName('CARYEAR').AsString;
 FAddOrders.EModel.Text:=DMMain.OrdersQ.FieldByName('MODEL').AsString;
 FAddOrders.pUserFIO.Caption:='Редактировалось: '+ DMMain.GetUserFIO(DMMain.OrdersQ.FieldByName('USERID').AsInteger);
 FAddOrders.EVin.Text:=DMMain.OrdersQ.FieldByName('VIN').AsString;
 FAddOrders.ECarBase.Text:=DMMain.OrdersQ.FieldByName('CARBASE').AsString;
 FAddOrders.EEngine.Text:=DMMain.OrdersQ.FieldByName('ENGINE').AsString;
 FAddOrders.cbTransmission.ItemIndex:=DMMain.OrdersQ.FieldByName('TRANSMISSION').AsInteger;
 FAddOrders.cbDrive.ItemIndex:=DMMain.OrdersQ.FieldByName('DRIVE').AsInteger;
 FAddOrders.cAvance.Value:=DMMain.OrdersQ.FieldByName('AVANCE').AsFloat;
 if FAddOrders.cAvance.Value>0 then  FAddOrders.deAvance.Date:=DMMain.OrdersQ.FieldByName('AVANCEDATE').AsDate;
 FAddOrders.cbDisableOrder.Checked:=DMMain.OrdersQ.FieldByName('STATUS').AsInteger=1;
 if DMMain.IBT.InTransaction then DMMain.IBT.CommitRetaining;
 DMMain.PositionsQ.Close;
 DMMain.PositionsQ.Open;

 if FAddOrders.ShowModal= mrOk then
 begin
  DMMain.OrdersQ.Edit;
  DMMain.OrdersQ.FieldByName('CLIENTID').AsInteger:=ELName.Tag;
  DMMain.OrdersQ.FieldByName('USERID').AsInteger:=UID;
  DMMain.OrdersQ.FieldByName('STATUS').AsInteger:=0;
  DMMain.OrdersQ.FieldByName('CARMARKSID').AsInteger:=Integer(FAddOrders.cbCarMarks.Items.Objects[FAddOrders.cbCarMarks.ItemIndex]);
  if Length(FAddOrders.EYear.Text)>0    then  DMMain.OrdersQ.FieldByName('CARYEAR').AsString:=FAddOrders.EYear.Text     else DMMain.OrdersQ.FieldByName('CARYEAR').Clear;
  if Length(FAddOrders.EModel.Text)>0   then  DMMain.OrdersQ.FieldByName('MODEL').AsString:=FAddOrders.EModel.Text       else DMMain.OrdersQ.FieldByName('MODEL').Clear;
  if Length(FAddOrders.EVin.Text)>0     then  DMMain.OrdersQ.FieldByName('VIN').AsString:=FAddOrders.EVin.Text          else DMMain.OrdersQ.FieldByName('VIN').Clear;
  if Length(FAddOrders.ECarBase.Text)>0 then  DMMain.OrdersQ.FieldByName('CARBASE').AsString:=FAddOrders.ECarBase.Text  else DMMain.OrdersQ.FieldByName('CARBASE').Clear;
  if Length(FAddOrders.EEngine.Text)>0  then  DMMain.OrdersQ.FieldByName('ENGINE').AsString:=FAddOrders.EEngine.Text    else DMMain.OrdersQ.FieldByName('ENGINE').Clear;
  DMMain.OrdersQ.FieldByName('TRANSMISSION').AsInteger:=FAddOrders.cbTransmission.ItemIndex;
  DMMain.OrdersQ.FieldByName('DRIVE').AsInteger:=FAddOrders.cbDrive.ItemIndex;
  if FAddOrders.cAvance.Value>0 then
  begin
    DMMain.OrdersQ.FieldByName('AVANCE').AsFloat:=FAddOrders.cAvance.Value;
    DMMain.OrdersQ.FieldByName('AVANCEDATE').AsDate:=FAddOrders.deAvance.Date;
  end else
  begin
    DMMain.OrdersQ.FieldByName('AVANCE').Clear;
    DMMain.OrdersQ.FieldByName('AVANCEDATE').Clear;
  end;
  if FAddOrders.cbDisableOrder.Checked then DMMain.OrdersQ.FieldByName('STATUS').AsInteger:=1 else DMMain.OrdersQ.FieldByName('STATUS').AsInteger:=0;
  FAddOrders.cbDisableOrder.OnClick(FAddOrders.cbDisableOrder);
  DMMain.OrdersQ.Post;
  DMMain.IBT.CommitRetaining;
  LoadClient(ELName.Tag);
  end else
  begin
   DMMain.IBT.RollbackRetaining;
   LoadClient(ELName.Tag);
  end;
  FAddorders.Free;
  DMMain.OrdersQ.Locate('ORDERID',OrderID,[]);
end;
//Поиск клиента-----------------------------------------------------------------
procedure TFClients.aFindClientExecute(Sender: TObject);
Var ClientID: Integer;
begin
  LoadTAModule(UID,GID,Integer(DMMain.IBC.dbHandle),ClientID,'tafind.dll','ta_find');
  if ClientID>0 then LoadClient(ClientID);
end;
procedure TFClients.aHistoryExecute(Sender: TObject);
begin
 FHistory:=TFHistory.Create(self);
 DMMain.OrdersHQ.ParamByName('CID').AsInteger:=eLName.Tag;
 DMMain.OrdersHQ.Open;
 DMMain.OrdersHQAdd.Open;
 FHistory.ShowModal;
 FHistory.Free;
 DMMain.OrdersHQ.Close;
 DMMain.OrdersHQAdd.Close;
end;

//Добавление нового заказа------------------------------------------------------
procedure TFClients.aNewOrderExecute(Sender: TObject);
Var OrderID: Integer;
begin
 FAddOrders:=TFAddOrders.Create(self);

 DMMain.TempQ.SQL.Text:='SELECT GEN_ID(GEN_ORDERS_ID,1) ORDERID from rdb$database';
 DMmain.TempQ.Open;
 OrderID:=DMmain.TempQ.FieldByName('ORDERID').AsInteger;
 DMmain.TempQ.Close;
 FAddOrders.pOrderNum.Caption:=IntToStr(OrderID);
 FAddOrders.pOrderData.Caption:=DateToStr(Trunc(Now));
 FAddOrders.pClientInfo.Caption:=eLName.Text+' '+cbFName.Text+' '+cbMName.Text;
 FAddOrders.cbCarMarks.Items.Assign(DMMain.CarMarksList);
 if FAddOrders.cbCarMarks.Items.Count>0 then FAddOrders.cbCarMarks.ItemIndex:=0;
 if DMMain.IBT.InTransaction then DMMain.IBT.CommitRetaining;

 DMMain.OrdersQ.Insert;
 DMMain.OrdersQ.FieldByName('ORDERID').AsInteger:=OrderID;
 DMMain.OrdersQ.FieldByName('CLIENTID').AsInteger:=ELName.Tag;
 DMMain.OrdersQ.FieldByName('USERID').AsInteger:=UID;
 DMMain.OrdersQ.FieldByName('STATUS').AsInteger:=0;
 DMMain.OrdersQ.Post;
 DMMain.OrdersQ.Locate('ORDERID',OrderID,[]);
 DMMain.PositionsQ.Close;
 DMMain.PositionsQ.Open;
 if FAddOrders.ShowModal= mrOk then
 begin
 DMMain.OrdersQ.Edit;
 DMMain.OrdersQ.FieldByName('CARMARKSID').AsInteger:=Integer(FAddOrders.cbCarMarks.Items.Objects[FAddOrders.cbCarMarks.ItemIndex]);
 if Length(FAddOrders.EYear.Text)>0    then  DMMain.OrdersQ.FieldByName('CARYEAR').AsString:=FAddOrders.EYear.Text     else DMMain.OrdersQ.FieldByName('CARYEAR').Clear;
 if Length(FAddOrders.EModel.Text)>0   then  DMMain.OrdersQ.FieldByName('MODEL').AsString:=FAddOrders.EModel.Text       else DMMain.OrdersQ.FieldByName('MODEL').Clear;
 if Length(FAddOrders.EVin.Text)>0     then  DMMain.OrdersQ.FieldByName('VIN').AsString:=FAddOrders.EVin.Text          else DMMain.OrdersQ.FieldByName('VIN').Clear;
 if Length(FAddOrders.ECarBase.Text)>0 then  DMMain.OrdersQ.FieldByName('CARBASE').AsString:=FAddOrders.ECarBase.Text  else DMMain.OrdersQ.FieldByName('CARBASE').Clear;
 if Length(FAddOrders.EEngine.Text)>0  then  DMMain.OrdersQ.FieldByName('ENGINE').AsString:=FAddOrders.EEngine.Text    else DMMain.OrdersQ.FieldByName('ENGINE').Clear;
 DMMain.OrdersQ.FieldByName('TRANSMISSION').AsInteger:=FAddOrders.cbTransmission.ItemIndex;
 DMMain.OrdersQ.FieldByName('DRIVE').AsInteger:=FAddOrders.cbDrive.ItemIndex;
 if FAddOrders.cAvance.Value>0 then
 begin
  DMMain.OrdersQ.FieldByName('AVANCE').AsFloat:=FAddOrders.cAvance.Value;
  DMMain.OrdersQ.FieldByName('AVANCEDATE').AsDate:=FAddOrders.deAvance.Date;
 end else
 begin
  DMMain.OrdersQ.FieldByName('AVANCE').Clear;
  DMMain.OrdersQ.FieldByName('AVANCEDATE').Clear;
 end;
 if FAddOrders.cbDisableOrder.Checked then DMMain.OrdersQ.FieldByName('STATUS').AsInteger:=1 else DMMain.OrdersQ.FieldByName('STATUS').AsInteger:=0;
 DMMain.OrdersQ.Post;
 DMMain.IBT.CommitRetaining;
 LoadClient(ELName.Tag);
 end else
 begin
   DMMain.IBT.RollbackRetaining;
    LoadClient(ELName.Tag);
 end;
 FAddorders.Free;
end;
procedure TFClients.aPrintOrderExecute(Sender: TObject);
var
    TempDir: String;
    Buffer : PChar;
begin
    getmem(Buffer,MAX_PATH);
    GetTempPath(Max_PATH,Buffer);
    TempDir:=Buffer;
    freemem(Buffer,MAX_PATH);
    DeleteFile(PansiChar(TempDir+ 'order.xls'));
    DMMain.ta_extractres(PAnsiChar('tareport.dll'), PAnsiChar('XLS_ORDER'), PAnsiChar(TempDir+ 'order.xls'));
    DMMain.ta_printorder( DMMain.OrdersQ.FieldByName('ORDERID').AsInteger);
end;

//Сохранение редактирования либо добавления клиента-----------------------------
procedure TFClients.aSaveExecute(Sender: TObject);
Var ClientID: Integer;
begin
  //Проверяем все ли введено
  if Length(ELName.Text)=0 then begin MessageDlg('Введите фамилию клиента', mtWarning, [mbOK], 0);ELName.SetFocus; exit end;
  if cbFname.ItemIndex<0   then begin MessageDlg('Введите имя клиента', mtWarning, [mbOK], 0);cbFName.SetFocus; exit end;
  if cbMname.ItemIndex<0   then begin MessageDlg('Введите отчество клиента', mtWarning, [mbOK], 0); cbMName.SetFocus; exit end;
  if Length(ECONTACTS.Text)<0 then begin MessageDlg('Введите контакную информацию клиента', mtWarning, [mbOK], 0);ELName.SetFocus; exit end;
  ClientID:=ELName.Tag; //Получаем номер клиента из тэга
  case mode of
   adding  : begin  //Добавляем клиента
               DMMain.TempQ.SQL.Text:='SELECT GEN_ID(gen_clients_id,1) clientid from rdb$database';
               DMmain.TempQ.Open;
               ClientID:=DMmain.TempQ.FieldByName('CLIENTID').AsInteger;
               DMmain.TempQ.Close;
               DMMain.TempQ.SQL.Text:='INSERT INTO CLIENTS(CLIENTID,LNAME,FNAMEID,MNAMEID,CONTACTS,USERID) VALUES(:CID,:LNAME,:FNAMEID,:MNAMEID,:CONTACTS,:UID)';
              end;  //Редактируем клиента
   editing : DMMain.TempQ.SQL.Text:='UPDATE CLIENTS SET LNAME=:LNAME,FNAMEID=:FNAMEID,MNAMEID=:MNAMEID,CONTACTS=:CONTACTS,USERID=:UID WHERE CLIENTID=:CID';
  end;
  DMMain.TempQ.ParamByName('CID').AsInteger:=ClientID;
  DMMain.TempQ.ParamByName('UID').AsInteger:=UID;
  DMMain.TempQ.ParamByName('LNAME').AsString:=ELName.Text;
  DMMain.TempQ.ParamByName('FNAMEID').AsInteger:=Integer(cbFname.Items.Objects[cbFname.ItemIndex]);
  DMMain.TempQ.ParamByName('MNAMEID').AsInteger:=Integer(cbMname.Items.Objects[cbMname.ItemIndex]);
  DMMain.TempQ.ParamByName('CONTACTS').AsString:=EContacts.Text;
  DMMain.TempQ.ExecSQL;
  DMMain.TempQ.Close;
  DMMain.IBT.Commit;
  LoadClient(ClientID); //Считываем добавленные/измененные данные
end;

procedure TFClients.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMMain.OrdersQ.ParamByName('CID').Clear;

end;

procedure TFClients.FormCreate(Sender: TObject);
begin
  DMMain.LoadGrants('CLIENTS',integer(self),gid);
  DMMain.OrdersQ.Open;
  DMMain.OrdersQ.AfterScroll:=OrdersQAfterScroll;
  DMMain.PositionsQ.Open;
end;

procedure TFClients.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if aAddClient.Enabled and (Key=VK_ESCAPE) then Close;
end;

procedure TFClients.gOrdersDrawCellA(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState; var CellText: string);
Var OrderDate:TDate;
    Status: Integer;
begin
  if DMMain.OrdersQ.RecordCount<1 then Exit;
  OrderDate:= DMMain.OrdersQ.BufferFieldByName('ORDERDATE').AsDate;
  Status:=DMMain.OrdersQ.BufferFieldByName('STATUS').AsInteger;
  if Status=0 then
  begin
    if (Trunc(Now-OrderDate) < 7) then gOrders.Canvas.Brush.Color:=clGreenM else
    if (Trunc(Now-OrderDate) >= 7) and (Trunc(Now-OrderDate) < 14) then gOrders.Canvas.Brush.Color:=clYellowM else
    gOrders.Canvas.Brush.Color:=clRedM;
  end else
  if Status=1 then
  gOrders.Canvas.Brush.Color:=clGrayM else
  if Status=2 then  gOrders.Canvas.Brush.Color:=clWhite;



 gOrders.DefaultDrawCell(ACol, ARow, Rect, State, gOrders.GetCellDisplayText(ACol, ARow), gOrders.GetCellAlignment(ACol, ARow));

end;

end.
