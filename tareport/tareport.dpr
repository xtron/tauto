library tareport;
uses
  SysUtils,Controls,Forms,
  Windows,
  ExcelXP,
  OleServer,
  Variants,
  OleCtrls,
  Dialogs,
  Classes,
  Graphics,
  UDMain in 'UDMain.pas' {DMMain: TDataModule},
  umain in 'umain.pas' {FMain},
  UExcelWork in 'UExcelWork.pas';

{$R *ver.res}
{$R tareport.res}

procedure ta_extractres(DllName, ResName, FExportFileName: PChar);stdcall; export;
var DllHandle, Res, ResHandle: THandle;
    P: ^AnsiChar;
    N: Integer;
    FS: TFileStream;
begin
  DllHandle := LoadLibrary(DllName);
  try
    Res := FindResource(DllHandle, ResName, RT_RCDATA);
    if Res <> 0 then begin
      ResHandle := LoadResource(DllHandle, Res);
      try
        if ResHandle <> 0 then begin
          N := SizeOfResource(DllHandle, Res);
          P := LockResource(ResHandle);
          if FileExists(FExportFileName) then DeleteFile(FExportFileName);
          FS := TFileStream.Create(FExportFileName, fmCreate);
          FS.Write(P^, N);
          FS.Free;
          UnLockResource(ResHandle);
        end;
      finally
        FreeResource(ResHandle);
      end;
    end;
  finally
    FreeLibrary(DllHandle);
  end;
end;
procedure ta_report_orders(aUID,aGID,dbHandle:Integer;Var Res:Integer);stdcall; export;
var
    TempDir: String;
    Buffer : PChar;
    Ex     : TExcel;
    Row,Col: LongInt;
     C     : Variant;
begin
  DMMain:=TDMMain.Create(nil);
  DMMain.IBC.dbHandleShared:=Pointer(dbHandle);
  FMain:=TFMain.Create(DMMain);
  Ex:=nil;
  if FMain.ShowModal = mrOk then
  begin
   try
    DMMain.TempQ.SQL.Text:='SELECT * FROM RPT$ORDERREPORT(:SDATE,:EDATE)';
    DMmain.TempQ.Prepare;
    DMMain.TempQ.ParamByName('SDATE').AsDate:=FMain.mcSDate.Date;
    DMMain.TempQ.ParamByName('EDATE').AsDate:=FMain.mcEDate.Date;
    DMMain.TempQ.Open;
    getmem(Buffer,MAX_PATH);
    GetTempPath(Max_PATH,Buffer);
    TempDir:=Buffer;
    freemem(Buffer,MAX_PATH);
    ta_extractres('tareport.dll','XLS_ORDERREPORT',PCHAR(TempDir+'Отчет по заказам.xls'));
    Ex:=TExcel.Create(TempDir+'Отчет по заказам.xls');
    Ex.ToExcelS('SDATE',DateToStr(FMain.mcSDate.Date));
    Ex.ToExcelS('EDATE',DateToStr(FMain.mcSDate.Date));
    C:=Ex.GetCoord('ORDERID');
    Row:=C.Row; Col:=C.Column;
    Ex.Insert('ORDERID',DMMain.TempQ.RecordCount-1);
    while not DMMain.TempQ.Eof do
    begin
      Ex.ToCellStr[Row,Col+00]:=string(DMMain.TempQ.FieldByName('ORDERID').AsString);
      Ex.ToCellStr[Row,Col+01]:=string(DMMain.TempQ.FieldByName('STATUS').AsString);
      Ex.ToCellData[Row,Col+02]:=DMMain.TempQ.FieldByName('POSCOUNT').AsInteger;
      Ex.ToCellData[Row,Col+03]:=DMMain.TempQ.FieldByName('POSCOUNT_ZAK').AsInteger;
      Ex.ToCellData[Row,Col+04]:=DMMain.TempQ.FieldByName('POSCOUNT_OTPR').AsInteger;
      Ex.ToCellData[Row,Col+05]:=DMMain.TempQ.FieldByName('POSCOUNT_CLIENT').AsInteger;
      Ex.ToCellData[Row,Col+06]:=DMMain.TempQ.FieldByName('ORDERSUM').AsFloat;
      Ex.ToCellData[Row,Col+07]:=DMMain.TempQ.FieldByName('ORDERAVANCE').AsFloat;
      Ex.ToCellStr[Row,Col+08]:=string(DMMain.TempQ.FieldByName('ORDERNEWUSER').AsString);
      Ex.ToCellStr[Row,Col+09]:=string(DMMain.TempQ.FieldByName('ORDERUSER').AsString);
      inc(Row);
      DMMain.TempQ.Next;
    end;
    Ex.Show;
   finally
    Ex.Free;
   end;
    DMMain.TempQ.Close;
  end;

  DMMain.Free;
  Res:=0;
end;

procedure ta_report_users(aUID,aGID,dbHandle:Integer;Var Res:Integer);stdcall; export;
var
    TempDir: String;
    Buffer : PChar;
    Ex     : TExcel;
    Row,Col: LongInt;
     C     : Variant;
begin
  DMMain:=TDMMain.Create(nil);
  DMMain.IBC.dbHandleShared:=Pointer(dbHandle);
  FMain:=TFMain.Create(DMMain);
  Ex:=nil;
  if FMain.ShowModal = mrOk then
  begin
   try
    DMMain.TempQ.SQL.Text:='SELECT * FROM RPT$USERREPORT(:SDATE,:EDATE)';
    DMmain.TempQ.Prepare;
    DMMain.TempQ.ParamByName('SDATE').AsDate:=FMain.mcSDate.Date;
    DMMain.TempQ.ParamByName('EDATE').AsDate:=FMain.mcEDate.Date;
    DMMain.TempQ.Open;
    getmem(Buffer,MAX_PATH);
    GetTempPath(Max_PATH,Buffer);
    TempDir:=Buffer;
    freemem(Buffer,MAX_PATH);
    ta_extractres('tareport.dll','XLS_USERREPORT',PCHAR(TempDir+'Отчет по пользователям.xls'));
    Ex:=TExcel.Create(TempDir+'Отчет по пользователям.xls');
    Ex.ToExcelS('SDATE',DateToStr(FMain.mcSDate.Date));
    Ex.ToExcelS('EDATE',DateToStr(FMain.mcSDate.Date));
    C:=Ex.GetCoord('USER');
    Row:=C.Row; Col:=C.Column;
    Ex.Insert('USER',DMMain.TempQ.RecordCount-1);
    while not DMMain.TempQ.Eof do
    begin
      Ex.ToCellStr[Row,Col+00]:=string(DMMain.TempQ.FieldByName('USERNAME').AsString);   //Пользователь
      Ex.ToCellData[Row,Col+01]:=DMMain.TempQ.FieldByName('ORDERS_NEW').AsInteger;
      Ex.ToCellData[Row,Col+02]:=DMMain.TempQ.FieldByName('SUM_PREDSELF').AsInteger;
      Ex.ToCellData[Row,Col+03]:=DMMain.TempQ.FieldByName('SUM_ALLSELF_NEW').AsInteger;
      Ex.ToCellData[Row,Col+04]:=DMMain.TempQ.FieldByName('ORDERS_CANCEL').AsInteger;
      Ex.ToCellData[Row,Col+05]:=DMMain.TempQ.FieldByName('ORDERS_CANCELSELF').AsInteger;
      Ex.ToCellData[Row,Col+06]:=DMMain.TempQ.FieldByName('ORDERS_DONE').AsInteger;
      Ex.ToCellData[Row,Col+07]:=DMMain.TempQ.FieldByName('ORDERS_DONESELF').AsInteger;
      Ex.ToCellData[Row,Col+08]:=DMMain.TempQ.FieldByName('SUM_ALLSELF_DONE').AsInteger;
      Ex.ToCellData[Row,Col+09]:=DMMain.TempQ.FieldByName('POS_ZAK').AsInteger;
      Ex.ToCellData[Row,Col+10]:=DMMain.TempQ.FieldByName('POS_ZAKSELF').AsInteger;
      Ex.ToCellData[Row,Col+11]:=DMMain.TempQ.FieldByName('POS_OTPR').AsInteger;
      Ex.ToCellData[Row,Col+12]:=DMMain.TempQ.FieldByName('POS_OTPRSELF').AsInteger;
      Ex.ToCellData[Row,Col+13]:=DMMain.TempQ.FieldByName('POS_CLIENT').AsInteger;
      Ex.ToCellData[Row,Col+14]:=DMMain.TempQ.FieldByName('POS_CLIENTSELF').AsInteger;
      Ex.ToCellData[Row,Col+15]:=DMMain.TempQ.FieldByName('ORDERS_DONEDAY').AsFloat;
      inc(Row);
      DMMain.TempQ.Next;
    end;
    Ex.Show;
   finally
    Ex.Free;
   end;
    DMMain.TempQ.Close;
  end;

  DMMain.Free;
  Res:=0;
end;

//{$WARN SYMBOL_PLATFORM OFF}
procedure ta_printorder(orderid,dbHandle:integer;IXLSApp: TExcelApplication);stdcall; export;
var
    ISheet: ExcelWorksheet;
    IWorkbook: ExcelWorkbook;
    IRange: ExcelRange;
    InfoList:TStringList;
    I,J:Integer;
    S:String;
    TRANSMISSION,DRIVE: Array[0..2] of String[10];
    OrderSum,Avance:Real;
    OrderVisible: Boolean;
    TempDir: String;
    Buffer : PChar;
    posno: string;
    K:integer;
procedure ShowExcel;
begin
  if Assigned(IXLSApp) then begin
    IXLSApp.Visible[0] := True;
    if IXLSApp.WindowState[0] = TOLEEnum(ExcelXP.xlMinimized) then
      IXLSApp.WindowState[0] := TOLEEnum(ExcelXP.xlMaximized);
    IXLSApp.ScreenUpdating[0] := True;

  end;
end;
begin

  TRANSMISSION[0]:= 'АКПП';
  TRANSMISSION[1]:= 'МКПП';
  TRANSMISSION[2]:= 'ВАРИАТОР';
  DRIVE[0]:= 'ПЕРЕДНИЙ';
  DRIVE[1]:= 'ЗАДНИЙ';
  DRIVE[2]:= 'ПОЛНЫЙ';

try
   DMMain:=TDMMain.Create(nil);
   DMMain.IBC.dbHandleShared:=Pointer(dbHandle);
   DMMain.TempQ.SQL.Add('SELECT * FROM CLIENTS C');
   DMMain.TempQ.SQL.Add('LEFT JOIN FNAME ON FNAME.FNAMEID = C.FNAMEID');
   DMMain.TempQ.SQL.Add('INNER JOIN  ORDERS O ON O.CLIENTID = C.CLIENTID AND O.ORDERID = :OID');
   DMMain.TempQ.ParamByName('OID').AsInteger:=orderid;
   DMMain.TempQ.Open;
   if DMMain.TempQ.RecordCount<=0 then
   begin
     DMMain.TempQ.Close;
     DMMain.Free;
     Exit;
   end;

   try
    getmem(Buffer,MAX_PATH*sizeOf(PChar));
    GetTempPath(Max_PATH*sizeOf(PChar),Buffer);
    TempDir:=Buffer;
    freemem(Buffer,MAX_PATH*sizeOf(PChar));
    IXLSApp.DisplayAlerts[0] := False;
    IWorkbook := IXLSApp.Workbooks.Add(TempDir+ 'order.xls', 0);
    ISheet := IWorkbook.Worksheets.Item[1] as ExcelWorksheet;
    for I := 0 to 1 do
    begin
      if I>0  then  S:='1' else S:='';
      IRange := ISheet.Range['ORDERID'+S,EmptyParam];
      IRange.FormulaR1C1:=IntToStr(OrderID);
      IRange := ISheet.Range['CLIENTFIO'+S,EmptyParam];
      IRange.FormulaR1C1:= DMMain.TempQ.FieldByName('C.LNAME').AsString+' '+
                         DMMain.TempQ.FieldByName('FNAME.FNAME').AsString+' '+
                         DMMain.TempQ.FieldByName('C.MNAME').AsString;

      IRange := ISheet.Range['CONTACTS'+S,EmptyParam];
      IRange.FormulaR1C1:= DMMain.TempQ.FieldByName('C.CONTACTS').AsString;
    end;
    DMMain.TempQ.Close;
    DMMain.TempQ.SQL.Clear;
    DMMain.TempQ.SQL.Add('SELECT * FROM ORDERS O');
    DMMain.TempQ.SQL.Add('LEFT JOIN CARMARKS CM ON CM.CARMARKSID = O.CARMARKSID');
    DMMain.TempQ.SQL.Add('WHERE O.ORDERID = :OID');
    DMMain.TempQ.ParamByName('OID').AsInteger:=orderid;
    DMMain.TempQ.Open;
    for I := 0 to 1 do
    begin
      if I>0  then  S:='1' else S:='';
      IRange := ISheet.Range['ORDERDATE'+S,EmptyParam];
      IRange.FormulaR1C1:=DMMain.TempQ.FieldByName('O.ORDERDATE').AsString;
      IRange := ISheet.Range['CARMARKS'+S,EmptyParam];
      IRange.FormulaR1C1:=DMMain.TempQ.FieldByName('CM.CARMARKS').AsString;
      IRange := ISheet.Range['MODEL'+S,EmptyParam];
      IRange.FormulaR1C1:=DMMain.TempQ.FieldByName('O.MODEL').AsString;
      IRange := ISheet.Range['ENGINE'+S,EmptyParam];
      IRange.FormulaR1C1:=DMMain.TempQ.FieldByName('O.ENGINE').AsString;
      IRange := ISheet.Range['CARYEAR'+S,EmptyParam];
      IRange.FormulaR1C1:=DMMain.TempQ.FieldByName('O.CARYEAR').AsString;
      IRange := ISheet.Range['TRANSMISSION'+S,EmptyParam];
      IRange.FormulaR1C1:=TRANSMISSION[DMMain.TempQ.FieldByName('O.TRANSMISSION').AsInteger];
      IRange := ISheet.Range['CARBASE'+S,EmptyParam];
      IRange.FormulaR1C1:=DMMain.TempQ.FieldByName('O.CARBASE').AsString;
      IRange := ISheet.Range['DRIVE'+S,EmptyParam];
      IRange.FormulaR1C1:=DRIVE[DMMain.TempQ.FieldByName('O.DRIVE').AsInteger];
      IRange := ISheet.Range['AVANCE'+S,EmptyParam];
      IRange.FormulaR1C1:=DMMain.TempQ.FieldByName('O.AVANCE').AsString;
      Avance:=DMMain.TempQ.FieldByName('O.AVANCE').AsFloat;
      if DMMain.TempQ.FieldByName('O.AVANCE').AsFloat<>0 then
      begin
        IRange := ISheet.Range['AVANCEDATE'+S,EmptyParam];
        IRange.FormulaR1C1:=DMMain.TempQ.FieldByName('O.AVANCEDATE').AsString;
      end;
    end;
    IRange := ISheet.Range['VIN',EmptyParam];
    IRange.FormulaR1C1:=DMMain.TempQ.FieldByName('O.VIN').AsString;
    IRange := ISheet.Range['VINN',EmptyParam];
    IRange.FormulaR1C1:=DMMain.TempQ.FieldByName('O.VIN').AsString;
    DMMain.TempQ.Close;
    DMMain.TempQ.SQL.Clear;
    DMMain.TempQ.SQL.Add('SELECT * FROM POSITIONS P WHERE P.ORDERID = :OID ORDER BY POSITIONID DESC');
    DMMain.TempQ.ParamByName('OID').AsInteger:=orderid;
    DMMain.TempQ.Open;
    DMMain.TempQ.First;
    OrderSum:=0;
    for I := 0 to DMMain.TempQ.RecordCount - 1 do
    begin
     if I>0 then K:=1 else K:=0;
     
     for J := 0 to  1 do
       begin
        if J>0  then  S:='1' else S:='';
        IRange := ISheet.Range['DETAIL'+S,EmptyParam];
        if I>0 then OleVariant(IRange).EntireRow.Insert(Shift := xlDown);
        IRange:=ISheet.Range['A'+IntToStr(Irange.Row-K), 'E'+IntToStr(Irange.Row-K)];
        IRange.MergeCells:=True;
        IRange.HorizontalAlignment:=xlLeft;
        IRange.Interior.Color:=clWhite;

        if (Length(DMMain.TempQ.FieldByName('P.POSITIONNO').AsString)>0)  then
        posno:= '['+string(DMMain.TempQ.FieldByName('P.POSITIONNO').AsString)+'] ' else posno:='[] ';
        if j>0 then  posno:='';
        IRange.FormulaR1C1:=  posno+string(DMMain.TempQ.FieldByName('P.POSITIONNAME').AsString);

        IRange := ISheet.Range['DETAIL'+S,EmptyParam];
        IRange:=ISheet.Range['F'+IntToStr(Irange.Row-K),EmptyParam];
        IRange.HorizontalAlignment:=xlRight;
        IRange.Interior.Color:=clWhite;
        IRange.FormulaR1C1:=DMMain.TempQ.FieldByName('P.POSCOUNT').AsString;
        IRange := ISheet.Range['DETAIL'+S,EmptyParam];
        IRange:=ISheet.Range['G'+IntToStr(Irange.Row-K), 'H'+IntToStr(Irange.Row-K)];
        IRange.MergeCells:=True;
        IRange.HorizontalAlignment:=xlRight;
        IRange.Interior.Color:=clWhite;
        IRange.FormulaR1C1:=DMMain.TempQ.FieldByName('P.COST').AsString;
       end;
     OrderSum:=OrderSum+DMMain.TempQ.FieldByName('P.COST').AsFloat*DMMain.TempQ.FieldByName('P.POSCOUNT').AsInteger;;
     DMMain.TempQ.Next;
    end;
    IRange := ISheet.Range['ORDERSUM',EmptyParam];
    IRange.FormulaR1C1:=FloatToStr(OrderSum);
    IRange := ISheet.Range['ORDERSUM1',EmptyParam];
    IRange.FormulaR1C1:=FloatToStr(OrderSum);
    IRange := ISheet.Range['DOPLATA',EmptyParam];
    IRange.FormulaR1C1:=FloatToStr(OrderSum-Avance);
    IRange := ISheet.Range['DOPLATA1',EmptyParam];
    IRange.FormulaR1C1:=FloatToStr(OrderSum-Avance);

    DMMain.TempQ.Close;
    DMMain.TempQ.SQL.Text:='SELECT * FROM OPTIONS WHERE OPTIONSID=1';
    DMMain.TempQ.Open;
    OrderVisible:=DMMain.TempQ.FieldByName('OPTIONS').AsInteger=1;
    DMMain.TempQ.Close;

    DMMain.TempQ.SQL.Text:='SELECT * FROM OPTIONS WHERE OPTIONSID=2';
    DMMain.TempQ.Open;

    IRange := ISheet.Range['INFO',EmptyParam];
    InfoList:=TStringList.Create;
    InfoList.Text:=string(DMMain.TempQ.FieldByName('OPTIONS').AsString);
    for I := 1 to InfoList.Count - 1 do  OleVariant(IRange).EntireRow.Insert(Shift := xlDown);
    IRange := ISheet.Range['INFO',EmptyParam];
    for I := 0 to InfoList.Count - 1 do
    begin
     IRange := ISheet.Range['INFO',EmptyParam];
     IRange:=ISheet.Range['A'+IntToStr(Irange.Row-InfoList.Count+I), 'H'+IntToStr(Irange.Row-InfoList.Count+I)];
     IRange.MergeCells:=True;
     IRange.FormulaR1C1:=InfoList[I];
    end;
    InfoList.Free;

    ShowExcel;
    if OrderVisible then ShowExcel else
    begin
      ISheet.PrintOut(EmptyParam, EmptyParam, 1, False, EmptyParam, EmptyParam, True, EmptyParam, 0);
      IWorkbook.Close(False, EmptyParam, EmptyParam, 0);
      IXLSApp.Visible[0]:=False;
      IRange := nil;
      ISheet := nil;
      IWorkbook := nil;
    end;
   except
    on E: Exception do MessageDlg('Ошибка печати!' + #13#10 + E.Message, mtError, [mbOK], 0);
   end;
finally
  DMMain.Free;
end;
end;
{$WARN SYMBOL_PLATFORM ON}
exports ta_report_users,ta_report_orders,ta_extractres,ta_printorder;
begin
end.
