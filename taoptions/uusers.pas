unit uusers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PngBitBtn, ActnList, ImgList, PngImageList,
  ComCtrls, ExtCtrls, UdcPanel, Grids, IB_Grid, UdcIB_Grid,IB_Components;

type
  TFUsers = class(TForm)
    PControl: TUdcPanel;
    PageControl: TPageControl;
    tsUsers: TTabSheet;
    tsRights: TTabSheet;
    PngImageList: TPngImageList;
    ActionList: TActionList;
    aCancel: TAction;
    aSave: TAction;
    bSave: TPngBitBtn;
    bCancel: TPngBitBtn;
    gUsers: TUdcIB_Grid;
    aAddUser: TAction;
    aEditUser: TAction;
    aDelUser: TAction;
    bAddUser: TPngBitBtn;
    bEditUser: TPngBitBtn;
    bDelUser: TPngBitBtn;
    gGroups: TUdcIB_Grid;
    pright: TUdcPanel;
    gActions: TUdcIB_Grid;
    gModules: TUdcIB_Grid;
    aEditRights: TAction;
    procedure aAddUserExecute(Sender: TObject);
    procedure aEditUserExecute(Sender: TObject);
    procedure aDelUserExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure gUsersDrawCellA(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState; var CellText: string);
    procedure gActionsCellDblClick(Sender: TObject; ACol, ARow: Integer;
      AButton: TMouseButton; AShift: TShiftState);
    procedure aEditRightsExecute(Sender: TObject);
    procedure gActionsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private

  public
   procedure UsersQAfterScroll(IB_Dataset: TIB_Dataset);
  end;

var
  FUsers: TFUsers;

implementation

uses
  UDMain, uadduser;

{$R *.dfm}

procedure TFUsers.aAddUserExecute(Sender: TObject);
begin
 FAddUser:=TFAddUser.Create(self);
 FAddUser.Caption:='Добавление пользователя';
 if FAddUser.ShowModal=mrOk then
 begin
    DMMain.UsersQ.Insert;
    DMMain.UsersQ.FieldByName('USERNAME').AsString:=AnsiString(FAddUser.EUserName.Text);
    DMMain.UsersQ.FieldByName('USERPASS').AsString:=AnsiString(FAddUser.EPasswd.Text);
    DMMain.UsersQ.FieldByName('GROUPID').AsInteger:=FAddUser.cbUserGroup.ItemIndex+1;
    DMMain.UsersQ.FieldByName('ISACTIVE').AsInteger:=Integer(FAddUser.cbActive.Checked);
    DMMain.UsersQ.Post;
    DMMain.UsersQ.Close;
    DMMain.UsersQ.Open;
 end;
 FAddUser.Free;
end;

procedure TFUsers.aCancelExecute(Sender: TObject);
begin
 ModalResult:=mrCancel;
end;

procedure TFUsers.aDelUserExecute(Sender: TObject);
begin
 if (MessageDlg('Удалить пользователя', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
 begin
   try
    DMMain.UsersQ.Delete;
   except
     MessageDlg('Невозможно удалить пользователя. Возможно имеются заказы оформленные этим пользователем', mtWarning, [mbOK], 0);
   end;
 end;
end;

procedure TFUsers.aEditRightsExecute(Sender: TObject);
begin
 if DMMain.RightQ.RecNo>0 then
 begin
   DMMain.RightQ.Edit;
   DMMain.RightQ.FieldByName('ENABLED').AsInteger:=Integer(not Boolean(DMMain.RightQ.FieldByName('ENABLED').AsInteger));
   DMMain.RightQ.Post;
end;
end;

procedure TFUsers.aEditUserExecute(Sender: TObject);
Var Guest,IDX:Integer;

begin
 Guest:=0;
 FAddUser:=TFAddUser.Create(self);
 FAddUser.Caption:='Изменение пользователя';
 FAddUser.EUserName.Text:=string(DMMain.UsersQ.FieldByName('USERNAME').AsString);
 FAddUser.EPasswd.Text:=string(DMMain.UsersQ.FieldByName('USERPASS').AsString);
 IDX:=DMMain.UsersQ.FieldByName('USERID').AsInteger;
 if DMMain.UsersQ.FieldByName('GROUPID').AsInteger=0 then
 begin
  FAddUser.EUserName.Enabled:=False;
  FAdduser.EPasswd.Enabled:=False;
  FAddUser.cbUserGroup.Clear;
  FAddUser.cbUserGroup.Items.Add('ГОСТЬ');
  FAddUser.cbUserGroup.ItemIndex:=0;
  Guest:=1;
 end else
 FAddUser.cbUserGroup.ItemIndex:=DMMain.UsersQ.FieldByName('GROUPID').AsInteger-1;
 FAddUser.cbActive.Checked:=DMMain.UsersQ.FieldByName('ISACTIVE').AsInteger=1;
 if FAddUser.ShowModal=mrOk then
 begin
    DMMain.UsersQ.Edit;
    DMMain.UsersQ.FieldByName('USERNAME').AsString:=AnsiString(FAddUser.EUserName.Text);
    DMMain.UsersQ.FieldByName('USERPASS').AsString:=AnsiString(FAddUser.EPasswd.Text);
    DMMain.UsersQ.FieldByName('GROUPID').AsInteger:=FAddUser.cbUserGroup.ItemIndex+1-Guest;
    DMMain.UsersQ.FieldByName('ISACTIVE').AsInteger:=Integer(FAddUser.cbActive.Checked);
    DMMain.UsersQ.Post;
    DMMain.UsersQ.Close;
    DMMain.UsersQ.Open;
 end;
 FAddUser.Free;
 DMMain.UsersQ.Locate('USERID',IDX,[])
end;

procedure TFUsers.aSaveExecute(Sender: TObject);
begin
 ModalResult:=mrOk
end;

procedure TFUsers.gActionsCellDblClick(Sender: TObject; ACol, ARow: Integer;
  AButton: TMouseButton; AShift: TShiftState);
begin
 aEditRights.Execute;
end;

procedure TFUsers.gActionsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key= VK_SPACE then  aEditRights.Execute;
 
end;

procedure TFUsers.gUsersDrawCellA(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState; var CellText: string);
begin
 if DMMain.UsersQ.RecordCount<1 then Exit;
  if DMMain.UsersQ.BufferFieldByName('ISACTIVE').AsInteger = 0 then
  gUsers.Canvas.Font.Color:=clSilver else
  gUsers.Canvas.Font.Color:=clBlack;
  gUsers.DefaultDrawCell(ACol, ARow, Rect, State, gUsers.GetCellDisplayText(ACol, ARow), gUsers.GetCellAlignment(ACol, ARow));

end;

procedure TFUsers.UsersQAfterScroll(IB_Dataset: TIB_Dataset);
begin
 aEditUser.Enabled:=(DMMain.UsersQ.RecNo>0) and(DMMain.UsersQ.RecordCount>0);
 aDelUser.Enabled:=(DMMain.UsersQ.RecNo>0) and(DMMain.UsersQ.RecordCount>0);
 if aEDitUser.Enabled then
 begin
   aDelUser.Enabled:=DMMain.UsersQ.FieldByName('GROUPID').AsInteger<>0;
 end;
end;

end.
