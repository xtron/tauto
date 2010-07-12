object UserGrantsForm: TUserGrantsForm
  Left = 0
  Top = 0
  Caption = 'UserGrants'
  ClientHeight = 448
  ClientWidth = 693
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object UdcPanel1: TUdcPanel
    Left = 311
    Top = 0
    Width = 382
    Height = 448
    Align = alClient
    Caption = 'UdcPanel1'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object LMDLabel1: TLMDLabel
      Left = 1
      Top = 1
      Width = 380
      Height = 15
      Bevel.Mode = bmCustom
      Align = alTop
      Options = []
      Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1087#1091#1085#1082#1090
      ExplicitLeft = 150
      ExplicitTop = -1
      ExplicitWidth = 102
    end
    object chlbActions: TRxCheckListBox
      Left = 1
      Top = 39
      Width = 380
      Height = 391
      CheckKind = ckCheckMarks
      Align = alClient
      GraySelection = True
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 0
      OnClickCheck = chlbActionsClickCheck
      ExplicitLeft = 5
      ExplicitTop = 33
      InternalVersion = 202
    end
    object ActionToolBar1: TActionToolBar
      Left = 1
      Top = 16
      Width = 380
      Height = 23
      ActionManager = ActionManager1
      Caption = 'ActionToolBar1'
      ColorMap.HighlightColor = 15660791
      ColorMap.BtnSelectedColor = clBtnFace
      ColorMap.UnusedColor = 15660791
      Spacing = 0
    end
    object prBar: TProgressBar
      Left = 1
      Top = 430
      Width = 380
      Height = 17
      Align = alBottom
      TabOrder = 2
    end
  end
  object UdcPanel2: TUdcPanel
    Left = 0
    Top = 0
    Width = 311
    Height = 448
    Align = alLeft
    TabOrder = 1
    UdcPrimaryKey = 'ID'
    object LMDLabel2: TLMDLabel
      Left = 1
      Top = 1
      Width = 309
      Height = 15
      Bevel.Mode = bmCustom
      Align = alTop
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = []
      ParentFont = False
      Caption = #1043#1088#1091#1087#1087#1099' '#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      ExplicitLeft = 86
      ExplicitTop = 2
      ExplicitWidth = 144
    end
    object tvUserList: TUdcIB_TreeView
      Left = 1
      Top = 39
      Width = 309
      Height = 408
      ShowNodeHint = True
      IB_Connection = DMMain.IBC
      Table = 'UDCUSER_GROUP_LIST'
      FieldId = 'ID'
      ParentId = 'PARENTID'
      Field = 'NAME'
      SortField = 'NAME'
      OnAfterAddNode = tvUserListAfterAddNode
      OnGetFieldId = tvUserListGetFieldId
      ReadOnly = True
      HideSelection = False
      Indent = 19
      OnChange = tvUserListChange
      OnGetImageIndex = tvUserListGetImageIndex
      OnGetSelectedIndex = tvUserListGetSelectedIndex
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      Options = []
      SelectedIndex = -1
      SortType = stData
      TabOrder = 0
      OnMouseMove = tvUserListMouseMove
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object UdcPanel3: TUdcPanel
      Left = 1
      Top = 16
      Width = 309
      Height = 23
      Align = alTop
      BevelEdges = []
      BevelOuter = bvNone
      TabOrder = 1
      object cbAllGroup: TUdcCheckBox
        Left = 4
        Top = 6
        Width = 149
        Height = 17
        Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077' '#1075#1088#1091#1087#1087#1099
        Alignment.Alignment = agTopLeft
        Alignment.Spacing = 4
        TabOrder = 0
        OnChange = cbAllGroupChange
      end
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = aCheck
            ImageIndex = 50
          end
          item
            Action = aUnCheck
            ImageIndex = 57
          end
          item
            Action = aSelectAll
            ImageIndex = 52
          end
          item
            Action = aReverse
            ImageIndex = 41
          end>
        ActionBar = ActionToolBar1
      end>
    Left = 656
    Top = 56
    StyleName = 'XP Style'
    object Action1: TAction
      Caption = 'aExit'
      ShortCut = 27
      OnExecute = Action1Execute
    end
    object aSelectAll: TAction
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      ImageIndex = 52
      OnExecute = aSelectAllExecute
    end
    object aCheck: TAction
      Caption = #1054#1090#1084#1077#1090#1080#1090#1100
      ImageIndex = 50
      OnExecute = aCheckExecute
    end
    object aUnCheck: TAction
      Caption = #1057#1085#1103#1090#1100
      ImageIndex = 57
      OnExecute = aUnCheckExecute
    end
    object aReverse: TAction
      Caption = #1055#1086#1084#1077#1085#1103#1090#1100
      ImageIndex = 41
      OnExecute = aReverseExecute
    end
  end
end
