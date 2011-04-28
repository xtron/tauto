object DMMain: TDMMain
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 240
  Width = 773
  object IBC: TIB_Connection
    DefaultTransaction = IBT
    SQLDialect = 3
    Params.Strings = (
      'SQL DIALECT=3'
      'CHARACTER SET=WIN1251'
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
  object OrdersDS: TIB_DataSource
    Dataset = OrdersQ
    Left = 48
    Top = 104
  end
  object PositionsQ: TIB_Query
    DatabaseName = 'localhost:C:\projects\troyaauto\db\troyaauto.fdb'
    FieldsDisplayLabel.Strings = (
      'POSITION='#1044#1077#1090#1072#1083#1100
      'POSITIONNO='#1053#1086#1084#1077#1088
      'POSCOUNT='#1050#1086#1083'-'#1074#1086
      'NOTE='#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      'POSITIONNAME='#1044#1077#1090#1072#1083#1100
      'POST.POST='#1055#1086#1089#1090#1072#1074#1097#1080#1082
      'COST = '#1062#1077#1085#1072
      'COST='#1062#1077#1085#1072
      'STATUSTEXT='#1057#1090#1072#1090#1091#1089)
    FieldsDisplayWidth.Strings = (
      'POSITIONNO=97'
      'STATUS=59'
      'POSCOUNT=46'
      'NOTE=109'
      'POSITIONNAME=152'
      'POSITIONS.COST=85'
      'POST.POST=127'
      'STATUSTEXT=102')
    FieldsVisible.Strings = (
      'POSITIONID=FALSE'
      'ORDERID=FALSE'
      'POSITION=TRUE'
      'POSITIONNO=TRUE'
      'POSTID=FALSE'
      'POSCOUNT=TRUE'
      'NOTE=TRUE'
      'STATUS=FALSE'
      'USERID=FALSE'
      'POSITIONNAME=TRUE'
      'POST.POST=TRUE'
      'COST=TRUE'
      'STATUSTEXT=TRUE')
    IB_Connection = IBC
    SQL.Strings = (
      
        'SELECT POSITIONID,ORDERID,POSITIONNAME,POSITIONNO,POST.POSTID,PO' +
        'ST.POST,POSCOUNT,USERID,'
      'STATUS,'
      '(CASE STATUS'
      '     WHEN 0 THEN '#39#1053#1045' '#1054#1041#1056#1040#1041#1054#1058#1040#1053#1054#39
      '     WHEN 1 THEN '#39#1047#1040#1050#1040#1047#1040#1053#1054#39
      '     WHEN 2 THEN '#39#1054#1058#1055#1056#1040#1042#1051#1045#1053#1054#39
      '     WHEN 3 THEN '#39#1042#1067#1044#1040#1053#1054' '#1050#1051#1048#1045#1053#1058#1059#39
      ' END'
      ') STATUSTEXT,'
      'NOTE,COST FROM POSITIONS'
      'LEFT JOIN POST ON POST.POSTID = POSITIONS.POSTID')
    DeleteSQL.Strings = (
      'DELETE FROM POSITIONS POSITIONS'
      'WHERE'
      '   POSITIONID = :OLD_POSITIONID')
    EditSQL.Strings = (
      'UPDATE POSITIONS POSITIONS SET'
      '   POSITIONS.POSITIONID = :POSITIONID, /*PK*/'
      '   POSITIONS.ORDERID = :ORDERID,'
      '   POSITIONS.POSITIONNAME = :POSITIONNAME,'
      '   POSITIONS.POSITIONNO = :POSITIONNO,'
      '   POSITIONS.POSTID = :POSTID,'
      '   POSITIONS.POSCOUNT = :POSCOUNT,'
      '   POSITIONS.NOTE = :NOTE,'
      '   POSITIONS.USERID = :USERID,'
      '   POSITIONS.STATUS = :STATUS,'
      '   POSITIONS.COST = :COST'
      'WHERE'
      '   POSITIONID = :OLD_POSITIONID')
    InsertSQL.Strings = (
      'INSERT INTO POSITIONS('
      '   ORDERID,'
      '   POSITIONNAME,'
      '   POSITIONNO,'
      '   POSTID,'
      '   POSCOUNT,'
      '   NOTE,'
      '   USERID,'
      '   STATUS,'
      '   COST)'
      'VALUES ('
      '   :ORDERID,'
      '   :POSITIONNAME,'
      '   :POSITIONNO,'
      '   :POSTID,'
      '   :POSCOUNT,'
      '   :NOTE,'
      '   :USERID,'
      '   :STATUS,'
      '   :COST)')
    KeyLinks.Strings = (
      'POSITIONS.POSITIONID')
    MasterSource = OrdersDS
    MasterLinks.Strings = (
      'POSITIONS.ORDERID = ORDERS.ORDERID')
    OrderingItems.Strings = (
      
        'POSITIONS.POSITIONNAME=POSITIONS.POSITIONNAME;POSITIONS.POSITION' +
        'NAME DESC'
      
        'POSITIONS.POSITIONNO=POSITIONS.POSITIONNO;POSITIONS.POSITIONNO D' +
        'ESC'
      #1055#1086#1089#1090#1072#1074#1097#1080#1082'=POST.POST;POST.POST DESC'
      'POSITIONS.STATUS=POSITIONS.STATUS;POSITIONS.STATUS DESC'
      'POSITIONS.NOTE=POSITIONS.NOTE;POSITIONS.NOTE DESC'
      'POSITIONS.COST=POSITIONS.COST;POSITIONS.COST DESC')
    OrderingLinks.Strings = (
      'POSITIONS.POSITIONNAME=ITEM=1'
      'POSITIONS.POSITIONNO=ITEM=2'
      'POST.POST=ITEM=3'
      'POSITIONS.STATUS=ITEM=4'
      'POSITIONS.NOTE=ITEM=5'
      'POSITIONS.COST=ITEM=6')
    Left = 104
    Top = 56
    ParamValues = (
      '"MLNK_ORDERID _0"=')
  end
  object PositionsDS: TIB_DataSource
    Dataset = PositionsQ
    Left = 104
    Top = 104
  end
  object OrdersQ: TIB_Query
    DatabaseName = 'localhost:C:\projects\troyaauto\db\troyaauto.fdb'
    FieldsDisplayLabel.Strings = (
      'ORDERID='#1047#1072#1082#1072#1079' '#8470
      'ORDERDATE='#1044#1072#1090#1072
      'STATUS='#1057#1090#1072#1090#1091#1089
      'RPT$ORDERSTATUS.ORDERSTATUS='#1057#1090#1072#1090#1091#1089)
    FieldsDisplayWidth.Strings = (
      'ORDERS.ORDERDATE=126'
      'RPT$ORDERSTATUS.ORDERSTATUS=163'
      'ORDERS.ORDERID=81')
    FieldsVisible.Strings = (
      'ORDERID=TRUE'
      'ORDERDATE=TRUE'
      'CLIENTID=FALSE'
      'CARMARKSID=FALSE'
      'CARYEAR=FALSE'
      'MODEL=FALSE'
      'VIN=FALSE'
      'CARBASE=FALSE'
      'ENGINE=FALSE'
      'CLOSEDATE=FALSE'
      'TRANSMISSION=FALSE'
      'DRIVE=FALSE'
      'AVANCE=FALSE'
      'AVANCEDATE=FALSE'
      'USERID=FALSE'
      'STATUS=FALSE'
      'RPT$ORDERSTATUS.ORDERSTATUS=TRUE')
    IB_Connection = IBC
    SQL.Strings = (
      'SELECT ORDERS.*, (CASE ORDERS.STATUS'
      '                 WHEN 0 THEN '#39#1058#1045#1050#1059#1065#1048#1049#39
      '                 WHEN 1 THEN '#39#1054#1058#1052#1045#1053#1045#1053#39
      '                 WHEN 2 THEN '#39#1042#1067#1055#1054#1051#1053#1045#1053#39
      '                 END) ORDERSTATUS  FROM ORDERS'
      'WHERE CLIENTID = :CID')
    DeleteSQL.Strings = (
      'DELETE FROM ORDERS ORDERS'
      'WHERE'
      '   ORDERID = :OLD_ORDERID')
    EditSQL.Strings = (
      'UPDATE ORDERS ORDERS SET'
      '   ORDERS.ORDERID = :ORDERID, /*PK*/'
      '   ORDERS.CLIENTID = :CLIENTID,'
      '   ORDERS.CARMARKSID = :CARMARKSID,'
      '   ORDERS.CARYEAR = :CARYEAR,'
      '   ORDERS.MODEL = :MODEL,'
      '   ORDERS.VIN = :VIN,'
      '   ORDERS.CARBASE = :CARBASE,'
      '   ORDERS.ENGINE = :ENGINE,'
      '   ORDERS.TRANSMISSION = :TRANSMISSION,'
      '   ORDERS.DRIVE = :DRIVE,'
      '   ORDERS.AVANCE = :AVANCE,'
      '   ORDERS.AVANCEDATE = :AVANCEDATE,'
      '   ORDERS.USERID = :USERID,'
      '   ORDERS.STATUS = :STATUS'
      'WHERE'
      '   ORDERID = :OLD_ORDERID')
    InsertSQL.Strings = (
      'INSERT INTO ORDERS('
      '   ORDERID, /*PK*/'
      '   CLIENTID,'
      '   CARMARKSID,'
      '   CARYEAR,'
      '   MODEL,'
      '   VIN,'
      '   CARBASE,'
      '   ENGINE,'
      '   TRANSMISSION,'
      '   DRIVE,'
      '   AVANCE,'
      '   AVANCEDATE,'
      '   USERID,'
      '   STATUS)'
      'VALUES ('
      '   :ORDERID,'
      '   :CLIENTID,'
      '   :CARMARKSID,'
      '   :CARYEAR,'
      '   :MODEL,'
      '   :VIN,'
      '   :CARBASE,'
      '   :ENGINE,'
      '   :TRANSMISSION,'
      '   :DRIVE,'
      '   :AVANCE,'
      '   :AVANCEDATE,'
      '   :USERID,'
      '   :STATUS)')
    KeyLinks.Strings = (
      'ORDERS.ORDERID')
    Left = 48
    Top = 56
    ParamValues = (
      'CID=')
  end
  object OrdersSumQ: TIB_Query
    DatabaseName = 'localhost:C:\projects\troyaauto\db\troyaauto.fdb'
    FieldsDisplayLabel.Strings = (
      'O.ORDERID='#8470' '#1047#1072#1082#1072#1079#1072
      'O.ORDERDATE='#1044#1072#1090#1072
      'FIO='#1050#1083#1080#1077#1085#1090
      'CM.CARMARKS='#1052#1072#1088#1082#1072
      'O.MODEL='#1052#1086#1076#1077#1083#1100
      'O.CARYEAR='#1043'. '#1074#1099#1087#1091#1089#1082#1072
      'O.CARBASE='#1050#1091#1079#1086#1074
      'O.ENGINE='#1044#1074#1080#1075#1072#1090#1077#1083#1100
      'TRANSM='#1050#1055#1055
      'DRIVE='#1055#1088#1080#1074#1086#1076
      'RPT$ORDERSTATUS.ORDERSTATUS='#1057#1090#1072#1090#1091#1089
      'U.USERNAME='#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1083#1086#1089#1100)
    FieldsDisplayWidth.Strings = (
      'FIO=208'
      'U.USERNAME=171'
      'CM.CARMARKS=104'
      'O.MODEL=119'
      'O.CARYEAR=75'
      'O.CARBASE=116'
      'O.ENGINE=109'
      'TRANSM=44'
      'DRIVE=65'
      'RPT$ORDERSTATUS.ORDERSTATUS=155'
      'O.ORDERDATE=64')
    FieldsVisible.Strings = (
      'O.ORDERID=TRUE'
      'O.STATUS=FALSE'
      'U.USERNAME=TRUE'
      'RPT$ORDERSTATUS.ORDERSTATUS=TRUE'
      'DRIVE=TRUE'
      'TRANSM=TRUE'
      'O.ENGINE=TRUE'
      'O.CARBASE=TRUE'
      'O.CARYEAR=TRUE'
      'O.MODEL=TRUE'
      'CM.CARMARKS=TRUE'
      'FIO=TRUE'
      'O.ORDERDATE=TRUE'
      'O.CLIENTID=FALSE')
    IB_Connection = IBC
    SQL.Strings = (
      
        'SELECT O.ORDERID,O.ORDERDATE,(C.LNAME || '#39' '#39' || FNAME.FNAME || '#39 +
        ' '#39' || C.MNAME) FIO,CM.CARMARKS,O.MODEL,O.CARYEAR,O.CARBASE,O.ENG' +
        'INE,'
      '(CASE O.TRANSMISSION'
      '     WHEN 0 THEN '#39#1040#1050#1055#1055#39
      '     WHEN 1 THEN '#39#1052#1050#1055#1055#39
      '     WHEN 2 THEN '#39#1042#1040#1056#1048#1040#1058#1054#1056#39
      ' END'
      ') TRANSM,'
      '(CASE O.DRIVE'
      '     WHEN 0 THEN '#39#1055#1045#1056#1045#1044#1053#1048#1049#39
      '     WHEN 1 THEN '#39#1047#1040#1044#1053#1048#1049#39
      '     WHEN 2 THEN '#39#1055#1054#1051#1053#1067#1049#39
      ' END'
      ') DRIVE,'
      ''
      '(CASE O.STATUS'
      '                 WHEN 0 THEN '#39#1058#1045#1050#1059#1065#1048#1049#39
      '                 WHEN 1 THEN '#39#1054#1058#1052#1045#1053#1045#1053#39
      '                 WHEN 2 THEN '#39#1042#1067#1055#1054#1051#1053#1045#1053#39
      '                 END) ORDERSTATUS'
      ',U.USERNAME,O.STATUS,O.CLIENTID FROM ORDERS O'
      'LEFT JOIN CLIENTS C ON C.CLIENTID = O.CLIENTID'
      'LEFT JOIN FNAME ON FNAME.FNAMEID = C.FNAMEID'
      'LEFT JOIN CARMARKS CM ON CM.CARMARKSID = O.CARMARKSID'
      'LEFT JOIN TA_USERS U ON U.USERID = O.USERID'
      'WHERE O.ORDERDATE BETWEEN :SDATE AND :EDATE')
    OrderingItems.Strings = (
      'O.ORDERID=O.ORDERID;O.ORDERID DESC'
      'O.ORDERDATE=O.ORDERDATE;O.ORDERDATE DESC'
      'FIO=FIO;FIO DESC'
      'CM.CARMARKS=CM.CARMARKS;CM.CARMARKS DESC'
      'O.MODEL=O.MODEL;O.MODEL DESC'
      'O.CARYEAR=O.CARYEAR;O.CARYEAR DESC'
      'O.CARBASE=O.CARBASE;O.CARBASE DESC'
      'O.ENGINE=O.ENGINE;O.ENGINE DESC'
      'TRANSM=TRANSM;TRANSM DESC'
      'DRIVE=DRIVE;DRIVE DESC'
      
        'RPT$ORDERSTATUS.ORDERSTATUS=RPT$ORDERSTATUS.ORDERSTATUS;RPT$ORDE' +
        'RSTATUS.ORDERSTATUS DESC'
      'U.USERNAME=U.USERNAME;U.USERNAME DESC')
    OrderingLinks.Strings = (
      'O.ORDERID=ITEM=1'
      'O.ORDERDATE=ITEM=2'
      'FIO=ITEM=3'
      'CM.CARMARKS=ITEM=4'
      'O.MODEL=ITEM=5'
      'O.CARYEAR=ITEM=6'
      'O.CARBASE=ITEM=7'
      'O.ENGINE=ITEM=8'
      'TRANSM=ITEM=9'
      'DRIVE=ITEM=10'
      'RPT$ORDERSTATUS.ORDERSTATUS=ITEM=11'
      'U.USERNAME=ITEM=12')
    Left = 173
    Top = 55
    ParamValues = (
      'SDATE='
      'EDATE=')
  end
  object OrdersSumDS: TIB_DataSource
    Dataset = OrdersSumQ
    Left = 175
    Top = 106
  end
  object PositionsSumQ: TIB_Query
    DatabaseName = 'localhost:C:\projects\troyaauto\db\troyaauto.fdb'
    FieldsDisplayLabel.Strings = (
      'POSITION='#1044#1077#1090#1072#1083#1100
      'POSITIONNO='#1053#1086#1084#1077#1088
      'POSCOUNT='#1050#1086#1083'-'#1074#1086
      'NOTE='#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      'POSITIONNAME='#1044#1077#1090#1072#1083#1100
      'POST.POST='#1055#1086#1089#1090#1072#1074#1097#1080#1082
      'COST = '#1062#1077#1085#1072
      'COST='#1062#1077#1085#1072
      'STATUSTEXT='#1057#1090#1072#1090#1091#1089)
    FieldsDisplayWidth.Strings = (
      'POSITIONNO=97'
      'STATUS=59'
      'POSCOUNT=46'
      'NOTE=109'
      'POSITIONNAME=152'
      'POSITIONS.COST=85'
      'POST.POST=127'
      'STATUSTEXT=102')
    FieldsVisible.Strings = (
      'POSITIONID=FALSE'
      'ORDERID=FALSE'
      'POSITION=TRUE'
      'POSITIONNO=TRUE'
      'POSTID=FALSE'
      'POSCOUNT=TRUE'
      'NOTE=TRUE'
      'STATUS=FALSE'
      'USERID=FALSE'
      'POSITIONNAME=TRUE'
      'POST.POST=TRUE'
      'COST=TRUE'
      'STATUSTEXT=TRUE')
    IB_Connection = IBC
    SQL.Strings = (
      
        'SELECT POSITIONID,ORDERID,POSITIONNAME,POSITIONNO,POST.POSTID,PO' +
        'ST.POST,POSCOUNT,USERID,'
      'STATUS,'
      '(CASE STATUS'
      '     WHEN 0 THEN '#39#1053#1045' '#1054#1041#1056#1040#1041#1054#1058#1040#1053#1054#39
      '     WHEN 1 THEN '#39#1047#1040#1050#1040#1047#1040#1053#1054#39
      '     WHEN 2 THEN '#39#1054#1058#1055#1056#1040#1042#1051#1045#1053#1054#39
      '     WHEN 3 THEN '#39#1042#1067#1044#1040#1053#1054' '#1050#1051#1048#1045#1053#1058#1059#39
      ' END'
      ') STATUSTEXT,'
      'NOTE,COST FROM POSITIONS'
      'LEFT JOIN POST ON POST.POSTID = POSITIONS.POSTID')
    DeleteSQL.Strings = (
      'DELETE FROM POSITIONS POSITIONS'
      'WHERE'
      '   POSITIONID = :OLD_POSITIONID')
    EditSQL.Strings = (
      'UPDATE POSITIONS POSITIONS SET'
      '   POSITIONS.POSITIONID = :POSITIONID, /*PK*/'
      '   POSITIONS.ORDERID = :ORDERID,'
      '   POSITIONS.POSITIONNAME = :POSITIONNAME,'
      '   POSITIONS.POSITIONNO = :POSITIONNO,'
      '   POSITIONS.POSTID = :POSTID,'
      '   POSITIONS.POSCOUNT = :POSCOUNT,'
      '   POSITIONS.NOTE = :NOTE,'
      '   POSITIONS.USERID = :USERID,'
      '   POSITIONS.STATUS = :STATUS,'
      '   POSITIONS.COST = :COST'
      'WHERE'
      '   POSITIONID = :OLD_POSITIONID')
    InsertSQL.Strings = (
      'INSERT INTO POSITIONS('
      '   ORDERID,'
      '   POSITIONNAME,'
      '   POSITIONNO,'
      '   POSTID,'
      '   POSCOUNT,'
      '   NOTE,'
      '   USERID,'
      '   STATUS,'
      '   COST)'
      'VALUES ('
      '   :ORDERID,'
      '   :POSITIONNAME,'
      '   :POSITIONNO,'
      '   :POSTID,'
      '   :POSCOUNT,'
      '   :NOTE,'
      '   :USERID,'
      '   :STATUS,'
      '   :COST)')
    KeyLinks.Strings = (
      'POSITIONS.POSITIONID')
    MasterSource = OrdersSumDS
    MasterLinks.Strings = (
      'POSITIONS.ORDERID = O.ORDERID')
    OrderingItems.Strings = (
      
        'POSITIONS.POSITIONNAME=POSITIONS.POSITIONNAME;POSITIONS.POSITION' +
        'NAME DESC'
      
        'POSITIONS.POSITIONNO=POSITIONS.POSITIONNO;POSITIONS.POSITIONNO D' +
        'ESC'
      #1055#1086#1089#1090#1072#1074#1097#1080#1082'=POST.POST;POST.POST DESC'
      'POSITIONS.STATUS=POSITIONS.STATUS;POSITIONS.STATUS DESC'
      'POSITIONS.NOTE=POSITIONS.NOTE;POSITIONS.NOTE DESC'
      'POSITIONS.COST=POSITIONS.COST;POSITIONS.COST DESC')
    OrderingLinks.Strings = (
      'POSITIONS.POSITIONNAME=ITEM=1'
      'POSITIONS.POSITIONNO=ITEM=2'
      'POST.POST=ITEM=3'
      'POSITIONS.STATUS=ITEM=4'
      'POSITIONS.NOTE=ITEM=5'
      'POSITIONS.COST=ITEM=6')
    Left = 256
    Top = 56
    ParamValues = (
      '"MLNK_ORDERID _0"=')
  end
  object PositionsSumDS: TIB_DataSource
    Dataset = PositionsSumQ
    Left = 256
    Top = 104
  end
  object OrdersHQ: TIB_Query
    DatabaseName = 'localhost:C:\projects\troyaauto\db\troyaauto.fdb'
    FieldsDisplayLabel.Strings = (
      'DATETIME='#1044#1072#1090#1072
      'ORDERID='#8470' '#1047#1072#1082#1072#1079#1072)
    FieldsVisible.Strings = (
      'ORDERID=TRUE'
      'DATETIME=TRUE'
      'OPERATION=FALSE')
    IB_Connection = IBC
    SQL.Strings = (
      'SELECT OH.ORDERID FROM ORDERS_HISTORY OH'
      'WHERE OH.CLIENTID = :CID'
      'GROUP BY OH.ORDERID')
    Left = 338
    Top = 56
    ParamValues = (
      'CID=')
  end
  object OrdersHDS: TIB_DataSource
    Dataset = OrdersHQ
    Left = 339
    Top = 106
  end
  object OrdersHQAdd: TIB_Query
    DatabaseName = 'localhost:C:\projects\troyaauto\db\troyaauto.fdb'
    FieldsDisplayLabel.Strings = (
      'OHD.ORDERID='#8470' '#1047#1072#1082#1072#1079#1072
      'OHD.OPERATION='#1054#1087'.'
      'OHD.FIELDNAME='#1055#1072#1088#1072#1084#1077#1090#1088
      'OHD.FIELDVALUE='#1057#1090#1072#1088#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
      'OHD.NEWVALUE='#1053#1086#1074#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
      'U.USERNAME='#1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      'OHD.DATETIME='#1044#1072#1090#1072)
    FieldsDisplayWidth.Strings = (
      'OHD.ORDERID=62'
      'U.USERNAME=163'
      'OHD.OPERATION=33'
      'OHD.FIELDNAME=131'
      'OHD.FIELDVALUE=140'
      'OHD.NEWVALUE=118')
    FieldsVisible.Strings = (
      'OHD.ORDERID=FALSE'
      'OHD.OPERATION=TRUE'
      'OHD.FIELDNAME=TRUE'
      'OHD.FIELDVALUE=TRUE'
      'OHD.NEWVALUE=TRUE'
      'U.USERNAME=TRUE'
      'OHD.DATETIME=TRUE')
    IB_Connection = IBC
    SQL.Strings = (
      'SELECT '
      '(CASE OHD.OPERATION'
      '      WHEN 0 THEN '#39'+'#39
      '      WHEN 1 THEN '#39'*'#39
      '      WHEN 2 THEN '#39'-'#39
      
        ' END) OPERATION,OHD.ORDERID,OHD.DATETIME,OHD.FIELDNAME,OHD.FIELD' +
        'VALUE,OHD.NEWVALUE,U.USERNAME FROM ORDERS_HISTORY OHD'
      'LEFT JOIN TA_USERS U ON U.USERID = OHD.USERID'
      '')
    MasterSource = OrdersHDS
    MasterLinks.Strings = (
      'OHD.ORDERID = OH.ORDERID')
    Left = 416
    Top = 56
    ParamValues = (
      '"MLNK_ORDERID _0"=')
  end
  object OrdersHDSAdd: TIB_DataSource
    Dataset = OrdersHQAdd
    Left = 419
    Top = 106
  end
  object PositionsHQ: TIB_Query
    DatabaseName = 'localhost:C:\projects\troyaauto\db\troyaauto.fdb'
    FieldsDisplayLabel.Strings = (
      'PNAME='#1055#1086#1079#1080#1094#1080#1103)
    FieldsVisible.Strings = (
      'PNAME=TRUE'
      'POSITIONID=FALSE')
    IB_Connection = IBC
    SQL.Strings = (
      
        'SELECT PH.POSITIONID,IIF(P.POSITIONNAME IS NULL,'#39'---'#39',P.POSITION' +
        'NAME) PNAME FROM POSITIONS_HISTORY PH'
      'LEFT JOIN POSITIONS P ON P.POSITIONID = PH.POSITIONID'
      'WHERE PH.ORDERID = :OID'
      'GROUP BY PH.POSITIONID,P.POSITIONNAME')
    Left = 504
    Top = 56
  end
  object PositionsHDS: TIB_DataSource
    Dataset = PositionsHQ
    Left = 507
    Top = 106
  end
  object PositionsHQAdd: TIB_Query
    DatabaseName = 'localhost:C:\projects\troyaauto\db\troyaauto.fdb'
    FieldsDisplayLabel.Strings = (
      'OPERATION='#1054#1087'.'
      'DATETIME='#1044#1072#1090#1072
      'FIELDNAME='#1055#1072#1088#1072#1084#1077#1090#1088
      'FIELDVALUE='#1057#1090#1072#1088#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
      'NEWVALUE='#1053#1086#1074#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
      'U.USERNAME='#1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100)
    FieldsDisplayWidth.Strings = (
      'OPERATION=32'
      'PHA.FIELDNAME=134'
      'PHA.FIELDVALUE=154'
      'PHA.NEWVALUE=139')
    FieldsVisible.Strings = (
      'OPERATION=TRUE'
      'DATETIME=TRUE'
      'FIELDNAME=TRUE'
      'FIELDVALUE=TRUE'
      'NEWVALUE=TRUE'
      'U.USERNAME=TRUE'
      'PHA.POSITIONID=FALSE')
    IB_Connection = IBC
    SQL.Strings = (
      'SELECT (CASE PHA.OPERATION'
      '           WHEN 0 THEN '#39'+'#39
      '           WHEN 1 THEN '#39'*'#39
      '           WHEN 2 THEN '#39'-'#39
      
        '        END) OPERATION,PHA.DATETIME,PHA.FIELDNAME,PHA.FIELDVALUE' +
        ',PHA.NEWVALUE,U.USERNAME,PHA.POSITIONID '
      'FROM POSITIONS_HISTORY PHA'
      'LEFT JOIN TA_USERS U ON U.USERID = PHA.USERID'
      '')
    MasterSource = PositionsHDS
    MasterLinks.Strings = (
      'PHA.POSITIONID = PH.POSITIONID')
    Left = 584
    Top = 56
    ParamValues = (
      '"MLNK_POSITIONID _0"=')
  end
  object PositionsHDSAdd: TIB_DataSource
    Dataset = PositionsHQAdd
    Left = 587
    Top = 106
  end
end
