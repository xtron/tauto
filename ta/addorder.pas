unit addorder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UdcEdit, UdcComboBox, ExtCtrls, UdcPanel, Buttons,
  PngBitBtn, ToolEdit, UdcDateEdit, Mask, CurrEdit, Grids, IB_Grid, UdcIB_Grid,
  ActnList, ImgList, PngImageList,DateUtils,IB_Components, UdcCalcEdit,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDButtonControl,
  LMDCustomCheckBox, LMDCheckBox, UdcCheckBox;

type
  TFAddOrders = class(TForm)
    gbOrderInfo: TGroupBox;
    lClientInfo: TLabel;
    lOrderData: TLabel;
    lOrderNum: TLabel;
    pOrderNum: TUdcPanel;
    pOrderData: TUdcPanel;
    pClientInfo: TUdcPanel;
    lMark: TLabel;
    LYear: TLabel;
    EYear: TUdcEdit;
    LModel: TLabel;
    LEngine: TLabel;
    EEngine: TUdcEdit;
    LTransmission: TLabel;
    cbTransmission: TUdcComboBox;
    LDrive: TLabel;
    cbDrive: TUdcComboBox;
    LCarbase: TLabel;
    ECarBase: TUdcEdit;
    gbOrders: TGroupBox;
    gbOrderSummary: TGroupBox;
    pOrdersControl: TUdcPanel;
    lAvance: TLabel;
    LAvanceDate: TLabel;
    deAvance: TUdcDateEdit;
    LOrderSum: TLabel;
    gbDolg: TGroupBox;
    bAddPos: TPngBitBtn;
    bEditPos: TPngBitBtn;
    bDelPos: TPngBitBtn;
    PngImageList: TPngImageList;
    ActionList: TActionList;
    aAddPos: TAction;
    aEditPos: TAction;
    aDelPos: TAction;
    aCancel: TAction;
    aSave: TAction;
    LVin: TLabel;
    eVin: TUdcEdit;
    cbCarMarks: TUdcComboBox;
    EModel: TUdcEdit;
    POrderSum: TUdcPanel;
    pClientDolg: TUdcPanel;
    cbDisableOrder: TUdcCheckBox;
    cAvance: TUdcCalcEdit;
    bCancel: TPngBitBtn;
    bSave: TPngBitBtn;
    pUserFio: TUdcPanel;
    gOrders: TUdcIB_Grid;
    aHistory: TAction;
    bHistory: TPngBitBtn;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure gbOrderInfoClick(Sender: TObject);
    procedure aAddPosExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aEditPosExecute(Sender: TObject);
    procedure aDelPosExecute(Sender: TObject);
    procedure aPrintPosExecute(Sender: TObject);
    procedure cAvanceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cAvanceChange(Sender: TObject);
    procedure aHistoryExecute(Sender: TObject);
  private
     procedure PositionQAfterScroll(IB_Dataset: TIB_Dataset);
     procedure CalcOrderSum;
  public
    { Public declarations }
  end;

var
  FAddOrders: TFAddOrders;

implementation

uses
  UDMain, uaddposition, umain, uhistory;

{$R *.dfm}
procedure TFAddOrders.PositionQAfterScroll(IB_Dataset: TIB_Dataset);
begin

 aDelPos.Enabled:=(DMMain.PositionsQ.RecNo>0) and ( DMMain.PositionsQ.RecordCount>0 );
 aEditPos.Enabled:=(DMMain.PositionsQ.RecNo>0) and ( DMMain.PositionsQ.RecordCount>0 );
 CalcOrderSum;
end;
procedure TFAddOrders.aAddPosExecute(Sender: TObject);
begin
  FAddPosition:=TFAddPosition.Create(self);
  FAddPosition.cbPostID.Items.Assign(DMMain.PostList);
  FAddPosition.cbPostID.ItemIndex:=0;

  if FAddPosition.ShowModal=mrOK then
  begin
    DMMain.PositionsQ.Insert;
    DMMain.PositionsQ.FieldByName('ORDERID').AsInteger:=DMMain.OrdersQ.FieldByName('ORDERID').AsInteger;
    DMMain.PositionsQ.FieldByName('POSITIONNAME').AsString:=FAddPosition.EPositionName.Text;
    DMMain.PositionsQ.FieldByName('POSITIONNO').AsString:=FAddPosition.EPositionNO.Text;
    DMMain.PositionsQ.FieldByName('POSTID').AsInteger:=Integer(FAddPosition.cbPostID.Items.Objects[FAddPosition.cbPostID.ItemIndex]);
    DMMain.PositionsQ.FieldByName('POSCOUNT').AsString:=FAddPosition.EPosCount.Text;
    DMMain.PositionsQ.FieldByName('NOTE').AsString:=FAddPosition.ENote.Text;
    DMMain.PositionsQ.FieldByName('USERID').AsInteger:=UID;
    DMMain.PositionsQ.FieldByName('STATUS').AsInteger:=FAddPosition.cbStatus.ItemIndex;
    DMMain.PositionsQ.FieldByName('COST').AsFloat:=FAddPosition.cCost.Value;
    DMMain.PositionsQ.Post;
    DMMain.PositionsQ.Close;
    DMMain.PositionsQ.Open;
    PositionQAfterScroll(DMMain.PositionsQ);
  end;
  FAddPosition.Free;
end;

procedure TFAddOrders.aCancelExecute(Sender: TObject);
begin
 modalResult:=mrCancel;
end;

procedure TFAddOrders.aDelPosExecute(Sender: TObject);
begin
if (MessageDlg('Действительно удалить деталь?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
begin
  DMMain.PositionsQ.Delete;
  PositionQAfterScroll(DMMain.PositionsQ);
end;
end;

procedure TFAddOrders.aEditPosExecute(Sender: TObject);
Var idx:Integer;
    posidx:integer;
begin
  posidx:=DMMain.PositionsQ.FieldByName('POSITIONID').AsInteger;
  FAddPosition:=TFAddPosition.Create(self);
  FAddPosition.cbPostID.Items.Assign(DMMain.PostList);
  idx:=FAddPosition.cbPostID.Items.IndexOfObject(Tobject(DMMain.PositionsQ.FieldByName('POSTID').AsInteger));
  if idx<0 then idx:=0;
  FAddPosition.cbPostID.ItemIndex:=idx;
  FAddPosition.EPositionName.Text:=DMMain.PositionsQ.FieldByName('POSITIONNAME').AsString;
  FAddPosition.EPositionNO.Text:=DMMain.PositionsQ.FieldByName('POSITIONNO').AsString;
  FAddPosition.EPosCount.Text:=DMMain.PositionsQ.FieldByName('POSCOUNT').AsString;
  FAddPosition.ENote.Text:=DMMain.PositionsQ.FieldByName('NOTE').AsString;
  FAddPosition.cbStatus.ItemIndex:=DMMain.PositionsQ.FieldByName('STATUS').AsInteger;
  FAddPosition.cCost.Value:=DMMain.PositionsQ.FieldByName('COST').AsFloat;
  FAddPosition.pUserFIO.Caption:='Редактировалось: '+ DMMain.GetUserFIO(DMMain.PositionsQ.FieldByName('USERID').AsInteger);
  if FAddPosition.ShowModal=mrOK then
  begin
    DMMain.PositionsQ.Edit;
    DMMain.PositionsQ.FieldByName('ORDERID').AsInteger:=DMMain.OrdersQ.FieldByName('ORDERID').AsInteger;
    DMMain.PositionsQ.FieldByName('POSITIONNAME').AsString:=FAddPosition.EPositionName.Text;
    DMMain.PositionsQ.FieldByName('POSITIONNO').AsString:=FAddPosition.EPositionNO.Text;
    DMMain.PositionsQ.FieldByName('POSTID').AsInteger:=Integer(FAddPosition.cbPostID.Items.Objects[FAddPosition.cbPostID.ItemIndex]);
    DMMain.PositionsQ.FieldByName('POSCOUNT').AsString:=FAddPosition.EPosCount.Text;
    DMMain.PositionsQ.FieldByName('NOTE').AsString:=FAddPosition.ENote.Text;
    DMMain.PositionsQ.FieldByName('USERID').AsInteger:=UID;
    DMMain.PositionsQ.FieldByName('STATUS').AsInteger:=FAddPosition.cbStatus.ItemIndex;
    DMMain.PositionsQ.FieldByName('COST').AsFloat:=FAddPosition.cCost.Value;
    DMMain.PositionsQ.Post;
    DMMain.PositionsQ.Close;
    DMMain.PositionsQ.Open;
    DMMain.PositionsQ.Locate('POSITIONID',posidx,[]);
    PositionQAfterScroll(DMMain.PositionsQ);
  end;
  FAddPosition.Free;
end;

procedure TFAddOrders.aHistoryExecute(Sender: TObject);
begin
 FHistory:=TFHistory.Create(self);
 DMMain.PositionsHQ.ParamByName('OID').AsInteger:=StrToInt(FAddOrders.pOrderNum.Caption);
 DMMain.PositionsHQ.Open;
 DMMain.PositionsHQAdd.Open;
 FHistory.gOrdersDateH.DataSource:=DMMain.PositionsHDS;
 FHistory.gOrdersDateHAdd.DataSource:=DMMain.PositionsHDSAdd;
 FHistory.ShowModal;
 FHistory.Free;
 DMMain.PositionsHQ.Close;
 DMMain.PositionsHQAdd.Close;
end;

procedure TFAddOrders.aPrintPosExecute(Sender: TObject);
begin
 ///
end;

procedure TFAddOrders.aSaveExecute(Sender: TObject);
begin
 if Length(EYear.Text)>0 then
 if (StrToInt(EYear.Text)<1950) or  (StrToInt(EYear.Text) > YearOf(Now)) then
 begin
  MessageDlg('Недопустимый год выпуска автомобиля', mtWarning, [mbOK], 0);
  Exit;
 end;
 if (cAvance.Value>0) and (DeAvance.Date<(Trunc(Now)-30)) then
 begin
  MessageDlg('Недопустимая дата аванса', mtWarning, [mbOK], 0);
  Exit;
 end;
 ModalResult:=mrOk;
end;

procedure TFAddOrders.CalcOrderSum;
begin
  if DMMain.PositionsQ.RecordCount=0 then
  begin
     pOrderSum.Caption:='0';
     pClientDolg.Caption:='0';
     Exit;
  end;
  DMMain.TempQ.SQL.Text:='SELECT SUM(P.COST*P.POSCOUNT) ORDERSUM FROM POSITIONS P WHERE P.ORDERID = :OID';
  DMMain.TempQ.ParamByName('OID').AsInteger:=DMMain.OrdersQ.FieldByName('ORDERID').AsInteger;
  DMMain.TempQ.Open;
  pOrderSum.Caption:=DMMain.TempQ.FieldByName('ORDERSUM').AsString;
  pClientDolg.Caption:=FloatToStr(StrToFloat(pOrderSum.Caption)-cAvance.Value);
  DMMain.TempQ.Close;
end;

procedure TFAddOrders.cAvanceChange(Sender: TObject);
begin
CalcOrderSum;
end;

procedure TFAddOrders.cAvanceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then  deavance.SetFocus;

end;

procedure TFAddOrders.FormCreate(Sender: TObject);
begin
 DMMain.PositionsQ.AfterScroll:=PositionQAfterScroll;
end;

procedure TFAddOrders.FormDestroy(Sender: TObject);
begin
 DMMain.PositionsQ.AfterScroll:=nil;
end;

procedure TFAddOrders.gbOrderInfoClick(Sender: TObject);
begin
 gbOrderInfo.Enabled :=not cbDisableOrder.Checked;
 gbOrders.Enabled    :=not cbDisableOrder.Checked;
 cAvance.Enabled     :=not cbDisableOrder.Checked;
 deAvance.Enabled    :=not cbDisableOrder.Checked;
end;

end.
