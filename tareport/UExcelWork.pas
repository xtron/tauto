unit UExcelWork;

interface
Uses ComObj,Variants,Dialogs,ExcelXP;

type TExcel = class(TObject)
private
   XlApp,XLBook,XLSheet,XLSheets:Variant;
   procedure ToExcelCellStr(Row,Column:LongInt;Data:String);
   procedure ToExcelCellData(Row,Column:LongInt;Data:Variant);
   function  FromExcelCell(Row,Column:LongInt):Variant;
   procedure SetCellWidth(Row,Column:LongInt;Width:Integer);
   function  GetCellWidth(Row,Column:LongInt):Integer;
public
  constructor Create(FileName:String);
  procedure   ToExcelInt(Exc:String;data:integer);
  Procedure   Insert(Exc:String;Count:LongInt);
  procedure   Show;
  procedure   Hide;
  procedure   AutoFilter(RowIndex,Count:Integer);
  procedure   SetBorder(Row,Column:LongInt);
  procedure   SetBorderL(const C1,C2:Variant);
  procedure   SetBorderR(const C1,C2:Variant);
  procedure   SetBorderT(const C1,C2:Variant);
  procedure   SetBorderB(const C1,C2:Variant);
  Function    GetCoord(Exc:String): Variant;
  Function    GetCell(Row,Col:Integer):Variant;
  procedure   ToExcelS(Exc:String;data:String);
  property    ToCellStr [Row,Column:LongInt]:String  write ToExcelCellStr;
  property    ToCellData[Row,Column:LongInt]:Variant read FromExcelCell write ToExcelCellData;
  property    CellWidth[Row,Column:LongInt]:Integer read GetCellWidth write SetCellWidth;
  destructor  Destroy;override;

end;
implementation
//------------------------------------------------------------------------------
constructor TExcel.Create(FileName:String);
begin
 inherited Create;
  try
  XlApp  := CreateOleObject('Excel.Application');
  if(FileName<>'') then
  begin
   XlApp.WorkBooks.Open(FileName,0,false,1);
   XlBook:=XlApp.WorkBooks[1];
  end else
  begin
  XlBook := XlApp.WorkBooks.Add($FFFFEFB9);
  end;
  XlSheet  := XlApp.WorkBooks[1].Sheets[1];
  XlSheets := XlApp.Sheets;
  if VarType(XlApp) <> VarDispatch then begin
   ShowMessage('MS Excel не установлен');
   Exit;
  end;
  XlApp.Application.EnableEvents := false;
 except
  XlApp.Quit;
  ShowMessage('Ошибка открытия Excel');
 end;
end;
procedure   TExcel.Show;
begin
    XlApp.Application.EnableEvents := true;
  XlApp.Visible := True;
end;
procedure   TExcel.Hide;
begin
 XlApp.Visible := FALSE;
end;

//------------------------------------------------------------------------------
procedure   TExcel.ToExcelCellStr(Row,Column:LongInt;Data:String);
Var cell: Variant;
begin
 try
    cell:= XLSheet.Cells[Row,Column];
    cell.Value:=Data;
 except
 end
end;
procedure   TExcel.AutoFilter(RowIndex,Count:Integer);
Var C1,C2,Rng: Variant;
begin
   try
    C1:=XLSheet.Cells[RowIndex,1];
    C2:=XLSheet.Cells[RowIndex,Count];
    Rng:= XLSheet.Range[C1,C2];
    Rng.AutoFilter;
 except
 end
end;
Function  TExcel.GetCell(Row,Col:Integer):Variant;
begin
 try
    Result:= XLSheet.Cells[Row,Col];
 except
 end
end;
//------------------------------------------------------------------------------
procedure   TExcel.ToExcelCellData(Row,Column:LongInt;Data:Variant);
Var cell: Variant;
begin
 try
    cell:= XLSheet.Cells[Row,Column];
    cell.Value:=Data;
 except
 end
end;
//------------------------------------------------------------------------------
function    TExcel.FromExcelCell(Row,Column:LongInt):Variant;
Var cell: Variant;
begin
 try
    cell:= XLSheet.Cells[Row,Column];
     result:=cell.Value;
    except
 end
end;
//------------------------------------------------------------------------------
procedure   TExcel.ToExcelInt(Exc:String;data:integer);
begin
 try
    XlApp.Range[Exc].Value:=data;
 except
 end
end;
//------------------------------------------------------------------------------
procedure   TExcel.ToExcelS(Exc:String;data:String);
begin
 try
    XlApp.Range[Exc].Value:=data;
    except
 end
end;
Function  Texcel.GetCoord(Exc:String): Variant;
Var C:Variant;
Begin
    // вставляем в шаблон нужное количество строк
    XlSheet.Select;
    C:=XlApp.Range[Exc];
    Result:=XlApp.Rows[Integer(C.Row)];
End;
Procedure TExcel.Insert(Exc:String;Count:LongInt);
Var C:Variant;
    I:Integer;
Begin
    // вставляем в шаблон нужное количество строк
    XlSheet.Select;
    C:=XlApp.Range[Exc];
    C:=XlApp.Rows[Integer(C.Row+1)];
    For I:=1 to Count do C.Insert;
End;
//------------------------------------------------------------------------------
procedure TExcel.SetCellWidth(Row,Column:LongInt;Width:Integer);
Var cell: Variant;
begin
 try
    cell:= XLSheet.Cells[Row,Column];
    cell.ColumnWidth:=Width;
    except
 end
end;
procedure   TExcel.SetBorder(Row,Column:LongInt);
Var cell: Variant;
begin
 try
    cell:= XLSheet.Cells[Row,Column];
    cell.Borders[xlDiagonalDown].LineStyle:= xlNone;
    cell.Borders[xlDiagonalUp].LineStyle:= xlNone;

    cell.Borders[xlEdgeLeft].LineStyle:=xlContinuous;
    cell.Borders[xlEdgeLeft].Weight:=xlThin;
    cell.Borders[xlEdgeLeft].ColorIndex:=xlAutomatic;

    cell.Borders[xlEdgeTop].LineStyle:=xlContinuous;
    cell.Borders[xlEdgeTop].Weight:=xlThin;
    cell.Borders[xlEdgeTop].ColorIndex:=xlAutomatic;

    cell.Borders[xlEdgeBottom].LineStyle:=xlContinuous;
    cell.Borders[xlEdgeBottom].Weight:=xlThin;
    cell.Borders[xlEdgeBottom].ColorIndex:=xlAutomatic;

    cell.Borders[xlEdgeRight].LineStyle:=xlContinuous;
    cell.Borders[xlEdgeRight].Weight:=xlThin;
    cell.Borders[xlEdgeRight].ColorIndex:=xlAutomatic;
    except
 end
end;
procedure   TExcel.SetBorderL;
Var rng  :Variant;
begin
 try
    rng:= XLSheet.Range[C1,C2];
    rng.Borders[xlEdgeLeft].LineStyle:=xlContinuous;
    rng.Borders[xlEdgeLeft].Weight:=xlThin;
    rng.Borders[xlEdgeLeft].ColorIndex:=xlAutomatic;
    except
 end
end;
procedure   TExcel.SetBorderR;
Var rng  :Variant;
begin
 try
    rng:= XLSheet.Range[C1,C2];
    rng.Borders[xlEdgeRight].LineStyle:=xlContinuous;
    rng.Borders[xlEdgeRight].Weight:=xlThin;
    rng.Borders[xlEdgeRight].ColorIndex:=xlAutomatic;
    except
 end
end;
procedure TExcel.SetBorderT;
Var rng  :Variant;
begin
 try
    rng:= XLSheet.Range[C1,C2];
    rng.Borders[xlEdgeTop].LineStyle:=xlContinuous;
    rng.Borders[xlEdgeTop].Weight:=xlThin;
    rng.Borders[xlEdgeTop].ColorIndex:=xlAutomatic;
    except
 end
end;
procedure   TExcel.SetBorderB;
Var rng  :Variant;
begin
 try
    rng:= XLSheet.Range[C1,C2];
    rng.Borders[xlEdgeBottom].LineStyle:=xlContinuous;
    rng.Borders[xlEdgeBottom].Weight:=xlThin;
    rng.Borders[xlEdgeBottom].ColorIndex:=xlAutomatic;
    except
 end
end;
//------------------------------------------------------------------------------
function  TExcel.GetCellWidth(Row,Column:LongInt):Integer;
Var cell: Variant;
begin
 Result:=0;
 try
    cell:= XLSheet.Cells[Row,Column];
    Result:=cell.ColumnWidth;
    except
 end
end;
//------------------------------------------------------------------------------
destructor  TExcel.Destroy;
begin
try
  if not VarIsEmpty(XlApp) then begin
  // XlApp.DisplayAlerts := False;
  // XlApp.Quit;
  end;
 except
 inherited Destroy;
 Exit;
 end;
inherited Destroy;
end;
end.
