object DMMain: TDMMain
  OldCreateOrder = False
  Height = 260
  Width = 445
  object IBC: TIB_Connection
    DefaultTransaction = IBT
    SQLDialect = 3
    Params.Strings = (
      'SQL DIALECT=3'
      'SERVER=localhost'
      'PATH=C:\projects\troyaauto\db\troyaauto.fdb'
      'PROTOCOL=TCP/IP'
      'USER NAME=SYSDBA')
    Left = 8
    Top = 8
  end
  object IBT: TIB_Transaction
    IB_Connection = IBC
    Isolation = tiCommitted
    Left = 48
    Top = 8
  end
  object TempQ: TIB_Query
    DatabaseName = 'localhost:C:\projects\troyaauto\db\troyaauto.fdb'
    IB_Connection = IBC
    Left = 8
    Top = 56
  end
  object ClientFindQ: TIB_Query
    DatabaseName = 'localhost:C:\projects\troyaauto\db\troyaauto.fdb'
    FieldsDisplayLabel.Strings = (
      'CLIENTS.LNAME='#1060#1072#1084#1080#1083#1080#1103
      'FNAME.FNAME='#1048#1084#1103
      'MNAME.MNAME='#1054#1090#1095#1077#1089#1090#1074#1086)
    FieldsVisible.Strings = (
      'MNAME.MNAME=TRUE'
      'FNAME.FNAME=TRUE'
      'CLIENTS.LNAME=TRUE'
      'CLIENTS.CLIENTID=FALSE')
    IB_Connection = IBC
    SQL.Strings = (
      'SELECT CLIENTID,LNAME,FNAME.FNAME,MNAME FROM CLIENTS '
      'LEFT JOIN FNAME ON FNAME.FNAMEID = CLIENTS.FNAMEID')
    OrderingItems.Strings = (
      #1060#1072#1084#1080#1083#1080#1103'=CLIENTS.LNAME;CLIENTS.LNAME DESC'
      #1048#1084#1103'=FNAME.FNAME;FNAME.FNAME DESC'
      #1054#1090#1095#1077#1089#1090#1074#1086'=MNAME.MNAME;MNAME.MNAME DESC')
    OrderingLinks.Strings = (
      'CLIENTS.LNAME=ITEM=1'
      'FNAME.FNAME=ITEM=2'
      'MNAME.MNAME=ITEM=3')
    Left = 56
    Top = 56
  end
  object ClientFindDS: TIB_DataSource
    Dataset = ClientFindQ
    Left = 120
    Top = 56
  end
  object OrderFindQ: TIB_Query
    DatabaseName = 'localhost:C:\projects\troyaauto\db\troyaauto.fdb'
    FieldsDisplayLabel.Strings = (
      'FIO='#1050#1083#1080#1077#1085#1090
      'O.ORDERDATE='#1044#1072#1090#1072' '#1079#1072#1082#1072#1079#1072
      'O.ORDERID='#1047#1072#1082#1072#1079' '#8470
      'O.STATUS='#1057#1090#1072#1090#1091#1089)
    FieldsDisplayWidth.Strings = (
      'FIO=245')
    FieldsVisible.Strings = (
      'FIO=TRUE'
      'O.ORDERID=TRUE'
      'O.STATUS=TRUE'
      'C.CLIENTID=FALSE')
    IB_Connection = IBC
    SQL.Strings = (
      
        'SELECT (C.LNAME || '#39' '#39' || FNAME.FNAME || '#39' '#39' || C.MNAME) FIO,O.O' +
        'RDERID,O.ORDERDATE,O.STATUS,C.CLIENTID FROM ORDERS O'
      'LEFT JOIN CLIENTS C ON C.CLIENTID = O.CLIENTID'
      'LEFT JOIN FNAME ON FNAME.FNAMEID = C.FNAMEID')
    Left = 56
    Top = 112
  end
  object OrderFindDS: TIB_DataSource
    Dataset = OrderFindQ
    Left = 120
    Top = 112
  end
end
