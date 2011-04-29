object FAddUser: TFAddUser
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FAddUser'
  ClientHeight = 140
  ClientWidth = 320
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
  object LUserName: TLabel
    Left = 8
    Top = 8
    Width = 97
    Height = 13
    Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103':'
  end
  object LUserGroup: TLabel
    Left = 8
    Top = 32
    Width = 85
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072' '#1076#1086#1089#1090#1091#1087#1072':'
  end
  object LPasswd: TLabel
    Left = 8
    Top = 59
    Width = 86
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100' '#1076#1086#1089#1090#1091#1087#1072':'
  end
  object EUserName: TUdcEdit
    Left = 111
    Top = 5
    Width = 202
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 0
  end
  object cbUserGroup: TUdcComboBox
    Left = 111
    Top = 32
    Width = 202
    Height = 21
    Style = csDropDownList
    CharCase = ecUpperCase
    ItemIndex = 0
    TabOrder = 1
    Text = #1055#1054#1051#1068#1047#1054#1042#1040#1058#1045#1051#1068
    Items.Strings = (
      #1055#1054#1051#1068#1047#1054#1042#1040#1058#1045#1051#1068
      #1040#1044#1052#1048#1053#1048#1057#1058#1056#1040#1058#1054#1056)
  end
  object EPasswd: TUdcEdit
    Left = 111
    Top = 56
    Width = 202
    Height = 21
    MaxLength = 50
    PasswordChar = '*'
    TabOrder = 2
  end
  object cbActive: TUdcCheckBox
    Left = 111
    Top = 83
    Width = 203
    Height = 17
    Caption = #1040#1082#1090#1080#1074#1077#1085
    Color = clBtnFace
    ParentColor = False
    TabOrder = 3
  end
  object PControl: TUdcPanel
    Left = 0
    Top = 107
    Width = 320
    Height = 33
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 4
    DesignSize = (
      320
      33)
    object bOk: TPngBitBtn
      Left = 130
      Top = 6
      Width = 90
      Height = 25
      Action = aOK
      Anchors = [akTop, akRight]
      Caption = #1054#1050
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object bCancel: TPngBitBtn
      Left = 226
      Top = 6
      Width = 90
      Height = 25
      Action = aCancel
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
    end
  end
  object PngImageList: TPngImageList
    PngImages = <
      item
        Background = clWindow
        Name = 'PngImage4'
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
      end
      item
        Background = clWindow
        Name = 'PngImage5'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000002114944415478DA6364A0103092AA81898581E9DF1F867F6419C021C0
          201557E1BAEFFEDD0757F7CEBF1D0134E837D106803427567BEC8BF3CB55FFF0
          E91D43E7B49A7587163F8C801BA06CC395262229A0737AFDB342A0C97FD13527
          D5B8EF0BF28C51FFF6FD1BC3CF1FBF183E7C7CC7306FD9B4E5600394ED3972CA
          6AF326494BC831F64FEA5BB37FDEBD08982120CDC9F59EFB7C3C7CD53F7EFEC0
          F0EDEB7720FEC1F0F1D307864D5BD62F6754B061C98EC9F69B2C2B23CBC8CDCB
          C5C0CB2ECC30B97FDA8A7DF3EEC5B0F1308827D7BBED73F174507FFFE92DC3B7
          CFDF19BE7CFEC6F0FEC307867DBB0EAC3BBBEA4304A37DB6C859532B03233E7E
          1E066E5E4E06766E16063E3651866533376F51549553337156517BF1EE11C3C7
          0F9F19BE7EFACEF0F5E32F864B47EEAFBBB0E60B2410814E94B54C143AA06E20
          A7C4037401C8159C5C1C0C223CD20C3F7E7F63F8F8F50DD8D99F3F7D6178FFEE
          13C3C5830FD65D59FB0BAC191E8D604392040EA8EBCB2B71F1005DC1CEC6C0C2
          C2CCF0FFFF7F865FBFFE30FCF8FE83E1D3C72F0CE7F7DF5F7779CD4FB8669474
          0032C42251E080B2B6B4121B3B2B033333C4803F7FFE8003EDD2A187189A3112
          12C810D338BE0332CA224ACCCC4C400318802EF8CD70F3D4731467E34DCA2043
          8CA2B80FC82A4829FDF9FB87E1E6B927EBAEADFF8D5533CEA40C32C43A4E72DF
          87D7DF2E9E5FFD31129766BC79013DD3906C00B100001BF5F2C3BD831BBB0000
          000049454E44AE426082}
      end>
    Left = 9
    Top = 34
    Bitmap = {}
  end
  object ActionList: TActionList
    Images = PngImageList
    Left = 40
    Top = 33
    object aOK: TAction
      Caption = #1054#1050
      ImageIndex = 1
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 0
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
