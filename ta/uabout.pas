unit uabout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFABout = class(TForm)
    LInfo: TLabel;
    ILogo: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FABout: TFABout;

implementation

{$R *.dfm}

end.
