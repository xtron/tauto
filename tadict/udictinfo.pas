unit udictinfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UdcEdit,  UdcButton, ExtCtrls,
  UdcPanel, ActnList, Buttons, PngBitBtn, ImgList, PngImageList, UdcCheckBox;

type
  TFDictInfo = class(TForm)
    pClient: TUdcPanel;
    pActive: TUdcPanel;
    editValue: TUdcEdit;
    lblValue: TLabel;
    ActionList1: TActionList;
    aOk: TAction;
    aCancel: TAction;
    PngImageList: TPngImageList;
    pControl: TUdcPanel;
    PngBitBtn1: TPngBitBtn;
    PngBitBtn2: TPngBitBtn;
    cbActive: TUdcCheckBox;
    procedure aCancelExecute(Sender: TObject);
    procedure aOkExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDictInfo: TFDictInfo;

implementation

{$R *.dfm}
uses UDMain,umain;

procedure TFDictInfo.aCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TFDictInfo.aOkExecute(Sender: TObject);
Var isactivestr:String;
begin
 try
  DMMain.DictTempQ.Close;
  DMMain.DictTempQ.SQL.Text:='SELECT * FROM '+string(FMain.cbDictName.Items.Objects[FMain.cbDictName.ItemIndex])+
                             ' WHERE '+string(FMain.cbDictName.Items.Objects[FMain.cbDictName.ItemIndex])+'='''+editValue.Text+'''';
  DMMain.DictTempQ.Open;
  if (not DMMain.DictTempQ.IsEmpty) and (self.Tag=mfInsert) then
   begin
     MessageDlg('Такое значение уже есть!',mtError,[mbOK],0);
     exit;
   end;
  if self.Tag=mfInsert then
    begin
      DMMain.DictTempQ.Close;
      DMMain.DictTempQ.SQL.Text:='INSERT INTO '+string(FMain.cbDictName.Items.Objects[FMain.cbDictName.ItemIndex])+
                                 '('+string(FMain.cbDictName.Items.Objects[FMain.cbDictName.ItemIndex])+') VALUES('''+
                                 editValue.Text+''')';
      DMMain.DictTempQ.Execute;
      DMMain.IBT.CommitRetaining;
    end
   else
    begin
      if pActive.Visible then isactivestr:=' ,ISACTIVE='''+IntToStr(Integer(cbActive.Checked))+'''' else isactivestr:='';

      DMMain.DictTempQ.Close;
      DMMain.DictTempQ.SQL.Text:='UPDATE '+
      string(FMain.cbDictName.Items.Objects[FMain.cbDictName.ItemIndex])+
      ' SET '+
      string(FMain.cbDictName.Items.Objects[FMain.cbDictName.ItemIndex])+
      '='''+
      editValue.Text+''''+isactivestr+' WHERE '+
      string(FMain.cbDictName.Items.Objects[FMain.cbDictName.ItemIndex])+'ID='+
      string(DMMain.DataFromDictQ.FieldByName(AnsiString(string(FMain.cbDictName.Items.Objects[FMain.cbDictName.ItemIndex]))+'ID').AsString);
      DMMain.DictTempQ.Execute;
      DMMain.IBT.CommitRetaining;
    end;
  DMMain.DataFromDictQ.Refresh;
  if self.Tag=mfInsert then DMMain.DataFromDictQ.Last;
  Close;
 except
   DMMain.IBT.RollbackRetaining;
   MessageDlg('Ошибка записи в базу данных!',mtError,[mbOK],0);
 end;
end;

procedure TFDictInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TFDictInfo.FormShow(Sender: TObject);
begin
  if self.Tag=mfInsert then editValue.Text:=''
  else
  begin
   editValue.Text:=string(
   DMMain.DataFromDictQ.FieldByName(AnsiString(string(string(FMain.cbDictName.Items.Objects[FMain.cbDictName.ItemIndex])))).AsString);

  end;
  if editValue.CanFocus then editValue.SetFocus;
end;

end.
