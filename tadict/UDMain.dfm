object DMMain: TDMMain
  OldCreateOrder = False
  Height = 409
  Width = 603
  object IBT: TIB_Transaction
    Isolation = tiCommitted
    Left = 48
    Top = 8
  end
  object TempQ: TIB_Query
    Left = 8
    Top = 56
  end
  object IBC: TIB_Connection
    DefaultTransaction = IBT
    PasswordStorage = psNotSecure
    SQLDialect = 3
    Params.Strings = (
      'CHARACTER SET=WIN1251'
      'SQL DIALECT=3'
      'SERVER=192.168.101.140'
      'FORCED WRITES=TRUE'
      'RESERVE PAGE SPACE=TRUE'
      'USER NAME=SYSDBA'
      'PATH=d:\prp.fdb')
    Left = 8
    Top = 8
    SavedPassword = '.JuMbLe.01.1F'
  end
  object DataFromDictQ: TIB_Query
    DatabaseName = 'd:\prp.fdb'
    IB_Connection = IBC
    Left = 72
    Top = 112
  end
  object DataFromDictDS: TIB_DataSource
    Dataset = DataFromDictQ
    Left = 72
    Top = 160
  end
  object FieldNameQ: TIB_Query
    DatabaseName = 'd:\prp.fdb'
    IB_Connection = IBC
    SQL.Strings = (
      'SELECT'
      
        ' IIF(RDB$DESCRIPTION IS NULL,RDB$FIELD_NAME,RDB$DESCRIPTION) AS ' +
        'FIELDNAME'
      'FROM RDB$RELATION_FIELDS RLF'
      'WHERE RLF.RDB$FIELD_NAME = :TABLENAME AND'
      '      RLF.RDB$RELATION_NAME = :TABLENAME')
    Left = 144
    Top = 112
  end
  object DictTempQ: TIB_Query
    DatabaseName = 'd:\prp.fdb'
    IB_Connection = IBC
    Left = 144
    Top = 160
  end
end
