unit uadduser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PngBitBtn, ExtCtrls, UdcPanel, ActnList, ImgList,
  PngImageList, UdcCheckBox, UdcComboBox, UdcEdit;

type
  TFAddUser = class(TForm)
    LUserName: TLabel;
    LUserGroup: TLabel;
    LPasswd: TLabel;
    EUserName: TUdcEdit;
    cbUserGroup: TUdcComboBox;
    EPasswd: TUdcEdit;
    cbActive: TUdcCheckBox;
    PngImageList: TPngImageList;
    ActionList: TActionList;
    aOK: TAction;
    aCancel: TAction;
    PControl: TUdcPanel;
    bOk: TPngBitBtn;
    bCancel: TPngBitBtn;
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAddUser: TFAddUser;

implementation

{$R *.dfm}

procedure TFAddUser.aCancelExecute(Sender: TObject);
begin
 ModalResult:=mrCancel
end;

procedure TFAddUser.aOKExecute(Sender: TObject);
begin
 if Length(EUserName.Text)=0 then
 begin
  MessageDlg('”кажите им€ пользовател€', mtWarning, [mbOK], 0);
  EUserName.SetFocus;
  Exit;
 end;
 ModalResult:=mrOk;
end;

end.
