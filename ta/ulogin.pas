unit ulogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UdcEdit, UdcComboBox, Buttons, PngBitBtn, ActnList,
  XPStyleActnCtrls, ActnMan, ImgList, PngImageList;

type
  TFLogin = class(TForm)
    LUser: TLabel;
    LPasswd: TLabel;
    ePasswd: TUdcEdit;
    cbUser: TUdcComboBox;
    PngImageList: TPngImageList;
    ActionManager: TActionManager;
    aLogin: TAction;
    aCancel: TAction;
    blogin: TPngBitBtn;
    bCancel: TPngBitBtn;
    procedure cbUserChange(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aLoginExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

uses
  UDMain, uabout;

{$R *.dfm}

procedure TFLogin.aCancelExecute(Sender: TObject);
begin
 ModalResult:=mrCancel
end;

procedure TFLogin.aLoginExecute(Sender: TObject);
begin
  if cbUser.ItemIndex=0 then     //���� �����, �� ������ ��� � ������� �� ��
  begin
    Tag:=0;
    ModalResult:=mrOk;
    Exit
  end;
  //����� ��������� ������������
  DMMain.TempQ.SQL.Text:='SELECT * FROM TA_USERS WHERE ISACTIVE=1 AND USERID=:UID AND USERPASS = :PASS';
  DMMain.TempQ.ParamByName('UID').AsInteger:=Integer(cbUser.Items.Objects[cbUser.ItemIndex]);
  DMMain.TempQ.ParamByName('PASS').AsString:=ePasswd.Text;
  DMMain.TempQ.Open;
  Tag:=Integer(cbUser.Items.Objects[cbUser.ItemIndex]);
  //���� �������������� ������, ������� �� ��, ����� ������� ������ � �������� ������ � �� ������
  if DMMain.TempQ.RecordCount>0 then ModalResult:=mrOk else
  begin
   MessageDlg('�������� ��� �������', mtInformation, [mbOK], 0);
   EPasswd.Text:='';
   EPasswd.SetFocus;
  end;
  DMMain.TempQ.Close;
end;

procedure TFLogin.cbUserChange(Sender: TObject);
begin
 LPasswd.Enabled:=cbUser.ItemIndex>0;
 EPasswd.Enabled:=cbUser.ItemIndex>0;
end;

end.
