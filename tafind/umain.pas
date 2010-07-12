unit umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, IB_Grid, UdcIB_Grid, StdCtrls, UdcEdit, ComCtrls, ExtCtrls,
  Mask, ToolEdit, UdcDateEdit, ActnList, ImgList, PngImageList, Buttons,
  PngBitBtn;

type
  TFMain = class(TForm)
    pcFind: TPageControl;
    pControl: TPanel;
    tsClientFind: TTabSheet;
    tsOrderFind: TTabSheet;
    pFindClientParam: TPanel;
    gbLName: TGroupBox;
    gbFname: TGroupBox;
    gbMname: TGroupBox;
    ELname: TUdcEdit;
    EFName: TUdcEdit;
    EMname: TUdcEdit;
    gFindClientResult: TUdcIB_Grid;
    Panel1: TPanel;
    gbOrderNum: TGroupBox;
    gbOrderPeriod: TGroupBox;
    deSDate: TUdcDateEdit;
    deEDate: TUdcDateEdit;
    LSPeriod: TLabel;
    LEPeriod: TLabel;
    gFindOrderResult: TUdcIB_Grid;
    EOrderNum: TUdcEdit;
    bFind: TPngBitBtn;
    bClear: TPngBitBtn;
    bExit: TPngBitBtn;
    ActionList: TActionList;
    PngImageList: TPngImageList;
    aClear: TAction;
    aFind: TAction;
    aExit: TAction;
    aSelect: TAction;
    procedure FormShow(Sender: TObject);
    procedure aClearExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aFindExecute(Sender: TObject);
    procedure gFindClientResultCellDblClick(Sender: TObject; ACol,
      ARow: Integer; AButton: TMouseButton; AShift: TShiftState);
    procedure gFindClientResultKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aExitExecute(Sender: TObject);
    procedure aSelectExecute(Sender: TObject);
    procedure EMnameExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

uses
  UDMain;

{$R *.dfm}

procedure TFMain.aClearExecute(Sender: TObject);
begin
 case pcFind.ActivePageIndex of
 0: begin
      ELName.Text:='';
      EFName.Text:='';
      EMname.Text:='';
      ELName.SetFocus;

    end;
 1: begin
      EOrderNum.Text:='';
      deSDate.Date:=Now;
      deEDate.Date:=Now;
      EOrderNum.SetFocus;
    end;
 end;
end;

procedure TFMain.aExitExecute(Sender: TObject);
begin
  Tag:=0;
  ModalResult:=mrCancel;
end;

procedure TFMain.aFindExecute(Sender: TObject);
begin
 case pcFind.ActivePageIndex of
 0: begin
       if  Length(ELName.Text+EFName.Text+EMName.Text)=0 then Exit;
       DMMain.ClientFindQ.Close;
       DMMain.ClientFindQ.SQLWhere.Clear;
       if Length(ELName.Text)>0 then DMMain.ClientFindQ.SQLWhere.Add('WHERE LNAME LIKE '''+ELName.Text+'%''');
       if Length(EFName.Text)>0 then
       begin
        if DMMain.ClientFindQ.SQLWhere.Count>0 then
        DMMain.ClientFindQ.SQLWhere.Add('AND FNAME.FNAME LIKE '''+EFName.Text+'%''') else
        DMMain.ClientFindQ.SQLWhere.Add('WHERE FNAME.FNAME LIKE '''+EFName.Text+'%''');
       end;
       if Length(EMName.Text)>0 then
       begin
        if DMMain.ClientFindQ.SQLWhere.Count>0 then
        DMMain.ClientFindQ.SQLWhere.Add('AND MNAME.MNAME LIKE '''+EMName.Text+'%''') else
        DMMain.ClientFindQ.SQLWhere.Add('WHERE MNAME.MNAME LIKE '''+EMName.Text+'%''');
       end;
       DMMain.ClientFindQ.Open;
       if DMMain.ClientFindQ.RecordCount>0 then
       begin
         if DMMain.ClientFindQ.RecordCount=1 then aSelect.Execute else gFindClientResult.SetFocus
       end else
       ELName.SetFocus;
    end;
 1: begin
       DMMain.OrderFindQ.Close;
       DMMain.OrderFindQ.SQLWhere.Clear;
       if Length(EOrderNUM.Text)>0 then
       begin
         DMMain.OrderFindQ.SQLWhere.Add('WHERE O.ORDERID = :OID');
         DMMain.OrderFindQ.Prepare;
         DMMain.OrderFindQ.ParamByName('OID').AsInteger:=StrToInt(EOrderNUM.Text);
       end
       else
       begin

         DMMain.OrderFindQ.SQLWhere.Add('WHERE O.ORDERDATE BETWEEN :SD AND :ED');
         DMMain.OrderFindQ.Prepare;
         DMMain.OrderFindQ.ParamByName('SD').AsDate:=Trunc(deSDate.Date);
         DMMain.OrderFindQ.ParamByName('ED').AsDate:=Trunc(deEDate.Date);

       end;
       DMMain.OrderFindQ.Open;
       if DMMain.OrderFindQ.RecordCount>0 then
       begin
         if DMMain.OrderFindQ.RecordCount=1 then aSelect.Execute else gFindOrderResult.SetFocus
       end else
       EOrderNum.SetFocus;
    end;
 end;

end;

procedure TFMain.aSelectExecute(Sender: TObject);
begin
 case pcFind.ActivePageIndex of
 0: begin
       if (DMMain.ClientFindQ.Active) and (DMMain.ClientFindQ.RecordCount>0)  and (DMMain.ClientFindQ.RecNo>0) then
       begin
         Tag:= DMMain.ClientFindQ.FieldByName('CLIENTID').AsInteger;
         ModalResult:=mrOk;
         Exit;
       end;
    end;
 1: begin
     if (DMMain.OrderFindQ.Active) and (DMMain.OrderFindQ.RecordCount>0)  and (DMMain.OrderFindQ.RecNo>0) then
       begin
         Tag:= DMMain.OrderFindQ.FieldByName('CLIENTID').AsInteger;
         ModalResult:=mrOk;
         Exit;
       end;
    end;
 end;
 
end;

procedure TFMain.EMnameExit(Sender: TObject);
begin
 bFind.SetFocus
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
 deSDate.Date:=Now;
 deEDate.Date:=Now;
 DMMain.ClientFindQ.Prepare;
 DMMain.OrderFindQ.Prepare;
end;

procedure TFMain.FormShow(Sender: TObject);
begin
 ELName.SetFocus
end;

procedure TFMain.gFindClientResultCellDblClick(Sender: TObject; ACol,
  ARow: Integer; AButton: TMouseButton; AShift: TShiftState);
begin
 aSelect.Execute;
end;

procedure TFMain.gFindClientResultKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_Return then  aSelect.Execute;

end;

end.
