object DMMain: TDMMain
  OldCreateOrder = False
  Height = 150
  Width = 215
  object IBC: TIB_Connection
    DefaultTransaction = IBT
    SQLDialect = 3
    Params.Strings = (
      'SQL DIALECT=3'
      'CHARACTER SET=WIN1251')
    Left = 8
    Top = 8
  end
  object IBT: TIB_Transaction
    Isolation = tiCommitted
    Left = 48
    Top = 8
  end
  object TempQ: TIB_Query
    IB_Connection = IBC
    Left = 8
    Top = 56
  end
end
