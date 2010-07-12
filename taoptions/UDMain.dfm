object DMMain: TDMMain
  OldCreateOrder = False
  Height = 331
  Width = 578
  object IBC: TIB_Connection
    DefaultTransaction = IBT
    SQLDialect = 3
    Params.Strings = (
      'SQL DIALECT=3'
      'SERVER=localhost'
      'PATH=C:\projects\troyaauto\db\troyaauto.fdb'
      'PROTOCOL=TCP/IP'
      'USER NAME=SYSDBA'
      'FORCED WRITES=FALSE'
      'RESERVE PAGE SPACE=FALSE')
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
  object UsersQ: TIB_Query
    DatabaseName = 'localhost:C:\projects\troyaauto\db\troyaauto.fdb'
    FieldsDisplayLabel.Strings = (
      'U.USERNAME='#1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      'G.GROUPNAME='#1043#1088#1091#1087#1087#1072)
    FieldsDisplayWidth.Strings = (
      'U.USERNAME=290'
      'G.GROUPNAME=187')
    FieldsVisible.Strings = (
      'U.USERID=FALSE'
      'U.USERNAME=TRUE'
      'U.USERPASS=FALSE'
      'U.GROUPID=FALSE'
      'U.ISACTIVE=FALSE'
      'G.GROUPNAME=TRUE')
    IB_Connection = IBC
    SQL.Strings = (
      
        'SELECT U.USERID,U.USERNAME,U.USERPASS,U.GROUPID,U.ISACTIVE,G.GRO' +
        'UPNAME FROM TA_USERS U'
      'LEFT JOIN TA_GROUPS G ON G.GROUPID = U.GROUPID')
    DeleteSQL.Strings = (
      'DELETE FROM TA_USERS U'
      'WHERE'
      '   USERID = :OLD_USERID')
    EditSQL.Strings = (
      'UPDATE TA_USERS U SET'
      '   U.USERID = :USERID, /*PK*/'
      '   U.USERNAME = :USERNAME,'
      '   U.USERPASS = :USERPASS,'
      '   U.GROUPID = :GROUPID,'
      '   U.ISACTIVE = :ISACTIVE'
      'WHERE'
      '   USERID = :OLD_USERID')
    InsertSQL.Strings = (
      'INSERT INTO TA_USERS('
      '   USERNAME,'
      '   USERPASS,'
      '   GROUPID,'
      '   ISACTIVE)'
      'VALUES ('
      '   :USERNAME,'
      '   :USERPASS,'
      '   :GROUPID,'
      '   :ISACTIVE)')
    OrderingItems.Strings = (
      #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103'=U.USERNAME;U.USERNAME DESC'
      #1043#1088#1091#1087#1087#1072'=G.GROUPNAME;G.GROUPNAME DESC')
    OrderingLinks.Strings = (
      'U.USERNAME=ITEM=1'
      'G.GROUPNAME=ITEM=2')
    Left = 80
    Top = 56
  end
  object UsersDS: TIB_DataSource
    Dataset = UsersQ
    Left = 80
    Top = 104
  end
  object GroupsQ: TIB_Query
    DatabaseName = 'localhost:C:\projects\troyaauto\db\troyaauto.fdb'
    FieldsDisplayLabel.Strings = (
      'GROUPNAME='#1043#1088#1091#1087#1087#1072' '#1076#1086#1089#1090#1091#1087#1072)
    FieldsVisible.Strings = (
      'GROUPID=FALSE'
      'GROUPNAME=TRUE')
    IB_Connection = IBC
    SQL.Strings = (
      'SELECT * FROM TA_GROUPS')
    AfterScroll = ModulesQAfterScroll
    Left = 216
    Top = 56
  end
  object GroupsDS: TIB_DataSource
    Dataset = GroupsQ
    Left = 216
    Top = 104
  end
  object ModulesQ: TIB_Query
    DatabaseName = 'localhost:C:\projects\troyaauto\db\troyaauto.fdb'
    FieldsDisplayLabel.Strings = (
      'TA_MODULEDESC='#1052#1086#1076#1091#1083#1100)
    FieldsDisplayWidth.Strings = (
      'TA_MODULEDESC=123')
    FieldsVisible.Strings = (
      'TA_MODULEID=FALSE'
      'TA_MODULE=FALSE')
    IB_Connection = IBC
    SQL.Strings = (
      'SELECT * FROM TA_MODULES')
    KeyLinks.Strings = (
      'TA_MODULES.TA_MODULEID')
    AfterScroll = ModulesQAfterScroll
    Left = 296
    Top = 56
  end
  object ModulesDS: TIB_DataSource
    Dataset = ModulesQ
    Left = 296
    Top = 104
  end
  object RightQ: TIB_Query
    ColumnAttributes.Strings = (
      
        'R.ENABLED=BOOLEAN=#208#192#199#208#197#216#197#205#206,#199#192#' +
        '207#208#197#217#197#205#206')
    DatabaseName = 'localhost:C:\projects\troyaauto\db\troyaauto.fdb'
    FieldsDisplayLabel.Strings = (
      'A.TA_ACTIONNAME='#1044#1077#1081#1089#1090#1074#1080#1077
      'R.ENABLED='#1044#1086#1089#1090#1091#1087)
    FieldsDisplayWidth.Strings = (
      'A.TA_ACTIONNAME=247'
      'R.ENABLED=101')
    FieldsVisible.Strings = (
      'R.TA_RIGHID=FALSE'
      'A.TA_ACTIONNAME=TRUE'
      'R.ENABLED=TRUE')
    IB_Connection = IBC
    SQL.Strings = (
      'SELECT R.TA_RIGHID,A.TA_ACTIONNAME,R.ENABLED FROM TA_RIGHTS R'
      'LEFT JOIN TA_ACTIONS A ON A.TA_ACTIONID = R.TA_ACTIONID'
      
        'INNER JOIN TA_GROUPS G ON G.GROUPID = R.GROUPID  AND G.GROUPID =' +
        ' :GID'
      'WHERE A.TA_MODULEID = :MID')
    EditSQL.Strings = (
      'UPDATE TA_RIGHTS R SET'
      '   R.TA_RIGHID = :TA_RIGHID, /*PK*/'
      '   R.ENABLED = :ENABLED'
      'WHERE'
      '   TA_RIGHID = :OLD_TA_RIGHID')
    Left = 368
    Top = 56
    ParamValues = (
      'GID='
      'MID=')
  end
  object RightDS: TIB_DataSource
    Dataset = RightQ
    Left = 368
    Top = 104
  end
end
