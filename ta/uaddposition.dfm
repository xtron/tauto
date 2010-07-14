object FAddPosition: TFAddPosition
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 250
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LPositionName: TLabel
    Left = 8
    Top = 11
    Width = 88
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1077#1090#1072#1083#1080
  end
  object LpositionNo: TLabel
    Left = 8
    Top = 38
    Width = 60
    Height = 13
    Caption = #1050#1086#1076' '#1076#1077#1090#1072#1083#1080
  end
  object LPostID: TLabel
    Left = 7
    Top = 119
    Width = 61
    Height = 13
    Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082':'
  end
  object LPosCount: TLabel
    Left = 8
    Top = 65
    Width = 64
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
  end
  object LNote: TLabel
    Left = 8
    Top = 173
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object Label1: TLabel
    Left = 8
    Top = 92
    Width = 78
    Height = 13
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1077#1076'.:'
  end
  object Label2: TLabel
    Left = 7
    Top = 146
    Width = 36
    Height = 13
    Caption = #1057#1090#1072#1090#1091#1089
  end
  object EPositionName: TUdcEdit
    Left = 102
    Top = 8
    Width = 427
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 0
  end
  object EPositionNo: TUdcEdit
    Left = 103
    Top = 35
    Width = 426
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 1
  end
  object cbPostID: TUdcComboBox
    Left = 102
    Top = 116
    Width = 427
    Height = 21
    AutoCompleteDelay = 1500
    Style = csDropDownList
    CharCase = ecUpperCase
    ItemHeight = 13
    MaxLength = 100
    TabOrder = 4
  end
  object EPosCount: TUdcEdit
    Left = 103
    Top = 62
    Width = 426
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    Text = '1'
    OnKeyPress = EPosCountKeyPress
    IsNumerical = True
  end
  object ENote: TUdcEdit
    Left = 102
    Top = 170
    Width = 427
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 6
  end
  object pOrderControl: TUdcPanel
    Left = 0
    Top = 197
    Width = 535
    Height = 33
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 7
    object bSave: TPngBitBtn
      Left = 344
      Top = 5
      Width = 90
      Height = 25
      Action = aSave
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
    end
    object bCancel: TPngBitBtn
      Left = 440
      Top = 5
      Width = 90
      Height = 25
      Action = aCancel
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
    end
  end
  object cCost: TUdcCalcEdit
    Left = 103
    Top = 89
    Width = 426
    Height = 21
    Margins.Left = 4
    Margins.Top = 1
    AutoSize = False
    CheckOnExit = True
    DisplayFormat = ',0.00'#1088#39'.'#39';-,0.00'#1088#39'.'#39
    NumGlyphs = 2
    TabOrder = 3
  end
  object cbStatus: TUdcComboBox
    Left = 103
    Top = 143
    Width = 426
    Height = 21
    AutoCompleteDelay = 1500
    Style = csDropDownList
    CharCase = ecUpperCase
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 5
    Text = #1053#1045' '#1054#1041#1056#1040#1041#1054#1058#1040#1053#1054
    Items.Strings = (
      #1053#1045' '#1054#1041#1056#1040#1041#1054#1058#1040#1053#1054
      #1047#1040#1050#1040#1047#1040#1053#1054
      #1054#1058#1055#1056#1040#1042#1051#1045#1053#1054
      #1042#1067#1044#1040#1053#1054' '#1050#1051#1048#1045#1053#1058#1059)
  end
  object pUserFio: TUdcPanel
    Left = 0
    Top = 230
    Width = 535
    Height = 20
    Align = alBottom
    Alignment = taLeftJustify
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 8
  end
  object PngImageList: TPngImageList
    PngImages = <
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000002524944415478DA95934D48625114C78FF999961FB49016CECE858BE0
          392D0417BA1304157221410B752511630C08312EA28D300B1B1823425AA92B45
          9144501C5A18048AE07D41AE441793602DD4B23063FC9877EFC36086C999F9C3
          7DEFBECBBBBF73CEFFDEC301460A8542BBB8B8F80EFE4193C964707B7BFB6DF6
          CDC18F402050B55AADDA7C3E0F5B5B5B2012895E373C3C3CC0743A05B95C0E8D
          4603F87C3E1C1C1C1C9D9D9D795F01FBFBFBC8683452C56211363737412291CC
          A241341A256F87C301AD560B783C1E0804021CF43313F01301F8FD7EA4D7EBA9
          CBCB4B9201FE61341A91914C26613C1E83DD6E87BBBB3B32C72A954A3403D112
          80CFE7433A9D8E2A97CBE076BB616161E1B584582C4636B95C2E68369BF0F4F4
          44D62B950A1D0C065980D7EB45EBEBEB54B55AC57392E64CF1789C648233BBBE
          BE06C640B27E75754587422116E0F178D0DADA1A856BD46834C0E572FF7802C3
          E11006830199D76A353A1C0EB300A7D389D46A3585CDC28EE3F1BB381CCE2FA3
          5EAFD391488405300E23954A458999DAF96F449FE907E3C78009747373432712
          0916B0B1B181565757A90F261348C5E2B980EEE3239C9C9F43BBDDA6D3E9340B
          B0D96C48A954527B8C8132A9742EA0D3E9C0E1C9093E523A93C9B0008BC58256
          5656A8BDDD5D90FE0DD0EDC297E3630CA2B3D92C0B309BCD88E907CAB7B303D2
          E5E5F9805E0FBE86C3D0EBF5E85C2EC7024C261392C964D4C7ED6D902E2DCDF7
          E0FE1E8E4E4F718FD085428105180C86AA5028D4E2FB3EEB83B7D4EFF721954A
          C1CBCB0BBAB8B8784F00FFD3CE333D3F3F7F67CA403F0160C50A20A9EE050D00
          00000049454E44AE426082}
        Name = 'PngImage8'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000002604944415478DAA5914F68D36018C6DF2F694C62D535B09E320FAB5D
          C1FD91597611C16D8A73322F1E442F3AC15D06828E75874D85C2D08B1DBD4CF0
          50C5B98328E2F030904C4399820AB68CC910B5876D6E320589FD9BB66B12BF2F
          5D6AAA3DE90739244F9EDFF7BECF83E03F0FB2BF3421E818EE3A149A88CE073E
          1BF0EE0FCD77B6AD657CFAFDD235AC7DFA0B40CCD35747A4E6EE0E6161664EB9
          3019E9B120C47CF7E280DC7EFA84F836F2707D70EAC1610B822CF39DC17EC9DB
          DE2830A002B76B07C49FC59581A9991E2CA722FD27657FAF5F2CA43350625C10
          7BFC7CFDF2EC0B136202C21E317AFCCCB14E962E02C701B0F8A1581E3EBC4EFC
          D401365B0E78DD464185421120AF0214911366EF3D958756368E5426B8B1B741
          6A3DD824F03C008F010E86CCB7B5A16140492B9BD53CC0F2E2D7CC95371FFB62
          06CC576570DD2348ADFBDD02C7216059009A2EEFA861B3793B36AF269299B185
          0DD35CB3858966F7DC6E57CAB5CDA18383D2CDEF9A86A058A2E07B8A57479792
          BD96B916C017EEF4BFAAFB1677334C7902727412C4264EB37E5FF6D2CBC52E7B
          C5F6157C416F83EC426991529366063465039470147C1D28FA4E259858AB546C
          85E80B3839994786481B0520B73B1CB809AAFC03019010C9141A6221A7232594
          CD1FC590980918A2E1511B05A72A63A1F2ED3A0215FB74CC731288AEFF5E77D5
          8068B004DD95093044C6E18BD60F9A0199DB1AF4A500725893B026585ADE0025
          AC81B9465506C33C23BB3D7BC4D4DA97CC64325BA98AB41370B2527DA347F8B1
          B2ACDC4CABD519D821E79DDCAD27D9FCB8BDAA2DCD7F6E3B1BBA9F2B8C90DD6B
          D6F82FE717F6720120E939C7B90000000049454E44AE426082}
        Name = 'PngImage4'
        Background = clWindow
      end>
    Left = 16
    Top = 72
    Bitmap = {}
  end
  object ActionList: TActionList
    Images = PngImageList
    Left = 8
    Top = 8
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 1
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 0
      OnExecute = aSaveExecute
    end
  end
end
