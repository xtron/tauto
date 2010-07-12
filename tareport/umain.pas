unit umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PngBitBtn, ImgList, PngImageList, ActnList,
  XPStyleActnCtrls, ActnMan, ComCtrls;

type
  TFMain = class(TForm)
    mcSDate: TMonthCalendar;
    mcEDate: TMonthCalendar;
    ActionManager: TActionManager;
    aReport: TAction;
    aCancel: TAction;
    PngImageList: TPngImageList;
    bReport: TPngBitBtn;
    bCancel: TPngBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aReportExecute(Sender: TObject);
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
 ModalResult:=mrCancel
end;

procedure TFMain.aReportExecute(Sender: TObject);
begin
 ModalResult:=mrOk
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
 mcSdate.Date:=Now;
 mcEDate.Date:=Now;
end;

end.
