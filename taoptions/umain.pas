unit umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,UdcCheckBox, Buttons,
  PngBitBtn, ExtCtrls, UdcPanel, ImgList, PngImageList, ActnList;

type
  TFMain = class(TForm)
    gbPrintOrder: TGroupBox;
    cbShowExcel: TUdcCheckBox;
    gbInfo: TGroupBox;
    MInfo: TMemo;
    ActionList: TActionList;
    aCancel: TAction;
    aSave: TAction;
    PngImageList: TPngImageList;
    pOrderControl: TUdcPanel;
    bSave: TPngBitBtn;
    bCancel: TPngBitBtn;
    procedure aSaveExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

procedure TFMain.aCancelExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFMain.aSaveExecute(Sender: TObject);
begin
 Modalresult:=mrOk;
end;

end.
