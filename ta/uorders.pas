unit uorders;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, IB_Grid, UdcIB_Grid, UdcPanel, ComCtrls, ImgList,
  PngImageList, XPStyleActnCtrls, ActnList, ActnMan, StdCtrls, Buttons,
  PngBitBtn, Mask, ToolEdit, UdcDateEdit, UdcComboBox,IB_Components;

type
  TFOrders = class(TForm)
    ActionManager: TActionManager;
    PngImageList: TPngImageList;
    StatusBar1: TStatusBar;
    pControl: TUdcPanel;
    gOrders: TUdcIB_Grid;
    Splitter1: TSplitter;
    UdcIB_Grid1: TUdcIB_Grid;
    aCurrentDay: TAction;
    aInfo: TAction;
    aPrint: TAction;
    aClose: TAction;
    LSPeriod: TLabel;
    deSDate: TUdcDateEdit;
    LEPeriod: TLabel;
    deEDate: TUdcDateEdit;
    bCurrentDay: TPngBitBtn;
    bInfo: TPngBitBtn;
    bPrint: TPngBitBtn;
    bClose: TPngBitBtn;
    cbStatus: TUdcComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure deSDateChange(Sender: TObject);
    procedure aCurrentDayExecute(Sender: TObject);
    procedure cbStatusChange(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure gOrdersDrawCellA(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState; var CellText: string);
  private
     Procedure RefreshOrders;
     procedure OrdersSumQAfterScroll(IB_Dataset: TIB_Dataset);
  public
    { Public declarations }
  end;

var
  FOrders: TFOrders;
const

  clGrayM: TColor       = $00E8E8E8;
  clRedM: TColor        = $008080FF;
  clGreenM: TColor      = $00BFFFBF;
  clYellowM: TColor     = $00B9FFFF;
implementation

uses
  umain, UDMain, uclients;

{$R *.dfm}

procedure TFOrders.aCloseExecute(Sender: TObject);
begin
 Close;
end;

procedure TFOrders.aCurrentDayExecute(Sender: TObject);
begin
 deSDate.Date:=Trunc(now);
 deEDate.Date:=Trunc(now);
 RefreshOrders;
end;

procedure TFOrders.aInfoExecute(Sender: TObject);
begin
 FClients:=TFClients.Create(self);

 FClients.cbFName.Items.Assign(DMMain.FNameList);
 FClients.cbMName.Items.Assign(DMMain.MNameList);
 FClients.LoadClient(DMMain.OrdersSumQ.FieldBYName('CLIENTID').AsInteger);
 DMMain.OrdersQ.Locate('ORDERID',DMMain.OrdersSumQ.FieldBYName('ORDERID').AsInteger,[]);
 FClients.ShowModal;
 FClients.Free;
 RefreshOrders;
end;

procedure TFOrders.aPrintExecute(Sender: TObject);
begin
  DMMain.ta_extractres(PAnsiChar('tareport.dll'), PAnsiChar('XLS_ORDER'), PAnsiChar('order.xls'));
  DMMain.ta_printorder( DMMain.OrdersSumQ.FieldByName('ORDERID').AsInteger);
end;

procedure TFOrders.cbStatusChange(Sender: TObject);
begin
 RefreshOrders;
end;

procedure TFOrders.deSDateChange(Sender: TObject);
begin
RefreshOrders;
end;

procedure TFOrders.FormCreate(Sender: TObject);
begin
 DMMain.OrdersSumQ.AfterScroll:=OrdersSumQAfterScroll;
 DMMain.OrdersSumQ.AfterOpen:=OrdersSumQAfterScroll;
 aCurrentDay.Execute;

end;

procedure TFOrders.FormShow(Sender: TObject);
begin
 FOrders.Left:=0;
 Forders.Top:=FMain.Top+FMain.Height;
 FOrders.Width:=FMain.Width;
 Forders.Height:=Screen.Height-FMain.Height-34;
end;

procedure TFOrders.gOrdersDrawCellA(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState; var CellText: string);

Var OrderDate:TDate;
    Status: Integer;
begin
  if DMMain.OrdersSumQ.RecordCount<1 then Exit;
  OrderDate:= DMMain.OrdersSumQ.BufferFieldByName('ORDERDATE').AsDate;
  Status:=DMMain.OrdersSumQ.BufferFieldByName('STATUS').AsInteger;
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

procedure TFOrders.OrdersSumQAfterScroll(IB_Dataset: TIB_Dataset);
begin
  aInfo.Enabled:=(DMMain.OrdersSumQ.RecNo>0) and(DMMain.OrdersSumQ.RecordCount>0);
  aPrint.Enabled:=aInfo.Enabled;
end;

procedure TFOrders.RefreshOrders;
Var OrderID: Integer;
begin
  OrderID:=0;
  if (DMMain.OrdersSumQ.RecNo>0) and(DMMain.OrdersSumQ.RecordCount>0) and DMMain.OrdersSumQ.Active then
  begin
    OrderID:= DMMain.OrdersSumQ.FieldByName('ORDERID').AsInteger;
  end;
  DMMain.OrdersSumQ.ParamByName('SDATE').AsDate:=deSDate.Date;
  DMMain.OrdersSumQ.ParamByName('EDATE').AsDate:=deEDate.Date;
  DMMain.OrdersSumQ.Active:=True;
  DMMain.PositionsSumQ.Active:=True;
  case cbStatus.ItemIndex of
  0: DMMain.OrdersSumQ.Filtered:=false;
  1..3: begin
          DMMain.OrdersSumQ.Filter:='O.STATUS = ' + IntToStr(cbStatus.ItemIndex-1);
          DMMain.OrdersSumQ.Filtered:=true;
        end;

  end;
  if (DMMain.OrdersSumQ.RecNo>0) and(DMMain.OrdersSumQ.RecordCount>0) and DMMain.OrdersSumQ.Active then
  begin
     try
      DMMain.OrdersSumQ.Locate('ORDERID',OrderID,[]);
     except

     end;
  end;

end;

end.
