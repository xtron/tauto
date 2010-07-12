unit uaddposition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, PngImageList, StdCtrls, Buttons, PngBitBtn,
  ExtCtrls, UdcPanel, UdcComboBox, UdcEdit, Mask, ToolEdit, CurrEdit,
  UdcCalcEdit;

type
  TFAddPosition = class(TForm)
    LPositionName: TLabel;
    EPositionName: TUdcEdit;
    LpositionNo: TLabel;
    EPositionNo: TUdcEdit;
    LPostID: TLabel;
    LPosCount: TLabel;
    LNote: TLabel;
    cbPostID: TUdcComboBox;
    EPosCount: TUdcEdit;
    ENote: TUdcEdit;
    pOrderControl: TUdcPanel;
    bSave: TPngBitBtn;
    bCancel: TPngBitBtn;
    PngImageList: TPngImageList;
    ActionList: TActionList;
    aCancel: TAction;
    aSave: TAction;
    Label1: TLabel;
    cCost: TUdcCalcEdit;
    cbStatus: TUdcComboBox;
    Label2: TLabel;
    pUserFio: TUdcPanel;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure EPosCountKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAddPosition: TFAddPosition;

implementation

{$R *.dfm}

procedure TFAddPosition.aCancelExecute(Sender: TObject);
begin
 ModalResult:=mrCancel;
end;

procedure TFAddPosition.aSaveExecute(Sender: TObject);
begin
  if Length(EPositionName.Text)=0 then
 begin
  MessageDlg('Укажите название детали', mtWarning, [mbOK], 0);
  Exit;
 end;
 if Length(EPosCount.Text)=0 then
 begin
  MessageDlg('Укажите количество деталей', mtWarning, [mbOK], 0);
  Exit;
 end;

 ModalResult:=mrOk;
end;

procedure TFAddPosition.EPosCountKeyPress(Sender: TObject; var Key: Char);
begin
 if key in ['.',','] then key:=#0;

end;

end.
