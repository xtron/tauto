object FAddOrders: TFAddOrders
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1082#1072#1079#1072
  ClientHeight = 425
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object gbOrderInfo: TGroupBox
    Left = 0
    Top = 0
    Width = 794
    Height = 121
    Align = alTop
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1079#1072#1082#1072#1079#1091
    TabOrder = 0
    OnClick = gbOrderInfoClick
    object lClientInfo: TLabel
      Left = 8
      Top = 42
      Width = 41
      Height = 13
      Caption = #1050#1083#1080#1077#1085#1090':'
    end
    object lOrderData: TLabel
      Left = 235
      Top = 19
      Width = 30
      Height = 13
      Caption = #1044#1072#1090#1072':'
    end
    object lOrderNum: TLabel
      Left = 8
      Top = 18
      Width = 72
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1072':'
    end
    object lMark: TLabel
      Left = 8
      Top = 64
      Width = 55
      Height = 13
      Caption = #1052#1072#1088#1082#1072' '#1072'/'#1084':'
    end
    object LYear: TLabel
      Left = 692
      Top = 65
      Width = 20
      Height = 13
      Caption = #1043'.'#1074'.'
    end
    object LModel: TLabel
      Left = 270
      Top = 65
      Width = 43
      Height = 13
      Caption = #1052#1086#1076#1077#1083#1100':'
    end
    object LEngine: TLabel
      Left = 7
      Top = 91
      Width = 75
      Height = 13
      Caption = #1044#1074#1080#1075#1072#1090#1077#1083#1100' '#8470':'
    end
    object LTransmission: TLabel
      Left = 270
      Top = 91
      Width = 25
      Height = 13
      Caption = #1050#1055#1055':'
    end
    object LDrive: TLabel
      Left = 374
      Top = 91
      Width = 42
      Height = 13
      Caption = #1055#1088#1080#1074#1086#1076':'
    end
    object LCarbase: TLabel
      Left = 579
      Top = 91
      Width = 50
      Height = 13
      Caption = #1050#1091#1079#1086#1074' '#8470':'
    end
    object LVin: TLabel
      Left = 579
      Top = 65
      Width = 21
      Height = 13
      Caption = 'VIN:'
    end
    object pOrderNum: TUdcPanel
      Left = 86
      Top = 15
      Width = 124
      Height = 21
      BevelOuter = bvLowered
      Caption = '000'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 8
    end
    object cbCarMarks: TUdcComboBox
      Left = 86
      Top = 61
      Width = 178
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      MaxLength = 50
      TabOrder = 0
    end
    object pOrderData: TUdcPanel
      Left = 282
      Top = 14
      Width = 159
      Height = 21
      BevelOuter = bvLowered
      Caption = '000'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 9
    end
    object pClientInfo: TUdcPanel
      Left = 86
      Top = 38
      Width = 702
      Height = 21
      BevelOuter = bvLowered
      Caption = '000'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 10
    end
    object EYear: TUdcEdit
      Left = 719
      Top = 61
      Width = 69
      Height = 21
      MaxLength = 4
      TabOrder = 3
      IsNumerical = True
    end
    object EEngine: TUdcEdit
      Left = 85
      Top = 88
      Width = 179
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 4
    end
    object cbTransmission: TUdcComboBox
      Left = 301
      Top = 88
      Width = 67
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = #1040#1050#1055#1055
      Items.Strings = (
        #1040#1050#1055#1055
        #1052#1050#1055#1055
        #1042#1040#1056#1048#1040#1058#1054#1056)
    end
    object cbDrive: TUdcComboBox
      Left = 422
      Top = 88
      Width = 151
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 6
      Text = #1055#1045#1056#1045#1044#1053#1048#1049
      Items.Strings = (
        #1055#1045#1056#1045#1044#1053#1048#1049
        #1047#1040#1044#1053#1048#1049
        #1055#1054#1051#1053#1067#1049)
    end
    object ECarBase: TUdcEdit
      Left = 648
      Top = 88
      Width = 140
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 7
    end
    object eVin: TUdcEdit
      Left = 606
      Top = 61
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 2
    end
    object EModel: TUdcEdit
      Left = 319
      Top = 61
      Width = 254
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 1
    end
  end
  object gbOrders: TGroupBox
    Left = 0
    Top = 121
    Width = 794
    Height = 205
    Align = alClient
    Caption = #1047#1072#1082#1072#1079#1099#1074#1072#1077#1084#1099#1077' '#1079#1072#1087#1095#1072#1089#1090#1080
    TabOrder = 1
    object pOrdersControl: TUdcPanel
      Left = 2
      Top = 169
      Width = 790
      Height = 34
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 0
      object bAddPos: TPngBitBtn
        Left = 504
        Top = 5
        Width = 90
        Height = 25
        Action = aAddPos
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 0
      end
      object bEditPos: TPngBitBtn
        Left = 600
        Top = 5
        Width = 90
        Height = 25
        Action = aEditPos
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 1
      end
      object bDelPos: TPngBitBtn
        Left = 696
        Top = 5
        Width = 90
        Height = 25
        Action = aDelPos
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 2
      end
    end
    object gOrders: TUdcIB_Grid
      Left = 2
      Top = 15
      Width = 790
      Height = 154
      CustomGlyphsSupplied = []
      DataSource = DMMain.PositionsDS
      Align = alClient
      ReadOnly = True
      TabOrder = 1
      RowSelect = True
      ListBoxStyle = True
      IndicateRow = False
      StretchColumn = 'POSITIONS.POSITIONNAME'
    end
  end
  object gbOrderSummary: TGroupBox
    Left = 0
    Top = 326
    Width = 794
    Height = 79
    Align = alBottom
    TabOrder = 2
    object lAvance: TLabel
      Left = 8
      Top = 35
      Width = 101
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1087#1088#1077#1076#1086#1087#1083#1072#1090#1099':'
    end
    object LAvanceDate: TLabel
      Left = 8
      Top = 57
      Width = 96
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1088#1077#1076#1086#1087#1083#1072#1090#1099':'
    end
    object LOrderSum: TLabel
      Left = 7
      Top = 16
      Width = 67
      Height = 13
      Caption = #1057#1091#1084#1084#1072' '#1080#1090#1086#1075#1086':'
    end
    object deAvance: TUdcDateEdit
      Left = 110
      Top = 54
      Width = 131
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 1
    end
    object gbDolg: TGroupBox
      Left = 270
      Top = 33
      Width = 142
      Height = 43
      Caption = #1044#1086#1083#1075' '#1082#1083#1080#1077#1085#1090#1072':'
      TabOrder = 3
      object pClientDolg: TUdcPanel
        Left = 4
        Top = 17
        Width = 130
        Height = 21
        BevelOuter = bvLowered
        Caption = '000'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
    end
    object POrderSum: TUdcPanel
      Left = 110
      Top = 10
      Width = 131
      Height = 21
      BevelOuter = bvLowered
      Caption = '000'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
    end
    object cbDisableOrder: TUdcCheckBox
      Left = 271
      Top = 12
      Width = 97
      Height = 17
      Caption = #1047#1072#1082#1072#1079' '#1086#1090#1084#1077#1085#1077#1085
      Alignment.Alignment = agTopLeft
      Alignment.Spacing = 4
      TabOrder = 2
      OnClick = gbOrderInfoClick
    end
    object cAvance: TUdcCalcEdit
      Left = 110
      Top = 32
      Width = 131
      Height = 21
      AutoSize = False
      CheckOnExit = True
      DisplayFormat = ',0.00'#1088#39'.'#39';-,0.00'#1088#39'.'#39
      NumGlyphs = 2
      TabOrder = 0
      OnChange = cAvanceChange
      OnKeyDown = cAvanceKeyDown
    end
    object bCancel: TPngBitBtn
      Left = 698
      Top = 48
      Width = 90
      Height = 25
      Action = aCancel
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 7
    end
    object bSave: TPngBitBtn
      Left = 602
      Top = 48
      Width = 90
      Height = 25
      Action = aSave
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 5
    end
    object bHistory: TPngBitBtn
      Left = 506
      Top = 48
      Width = 90
      Height = 25
      Action = aHistory
      Caption = #1048#1089#1090#1086#1088#1080#1103
      TabOrder = 6
    end
  end
  object pUserFio: TUdcPanel
    Left = 0
    Top = 405
    Width = 794
    Height = 20
    Align = alBottom
    Alignment = taLeftJustify
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
  end
  object PngImageList: TPngImageList
    PngImages = <
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000022C4944415478DA8D93CF6B134114C7DFECECCF48450CB5D254458954
          4B4B3C1822B42AADD87F2027A1206245848207299ECA8EB9089E3CA9875296AA
          012F42408A44522B785390A2696DA5060429AD45EA4137BBB333E3EC6E0A4573
          D819866186379F79EFFBDE43D06698FBA0A7ABD7282284A2B39073EBAB57FDBD
          09CBFFDAA2768093E7D353D5B95A09E1F8CC1987CBD7C6665E9797AE26020C8C
          1CB49F556609D6A481F4C2F729DCBC31E9D49ED4AF2406CC3E7F40142D36F029
          85DB137724602939E061F92E01CC228B206050BA75DF997FBAFC3F20D5097DFD
          439971142916F3F2674E0D8F1607738A121B31C6E0DDC2E7C6ABB9850AB464E5
          4288FADBEFD3E8C4B9FDF6F5C94BD25D018669C8A503573C60C80305A3C89831
          0188ABA08B3DE07914BCA6079C227874AF4C5076A8C3BE3896230253C0BA8050
          38555740D355C018474E8559A07E00BE7CCC7C881E2BDC80EAE345820E1774BB
          6F742F312C0DAC9409A6F442373450B51010C7C0B9808006F2775FFEEE83FBA7
          29770AF597BF08EA3E8DEC63674D62A50C30AD38044D97005502941D008F84A4
          329D21A4E97AE0CAB5F6C625918807FA613C1414B5443CD49B1EEE3C9ACA09C4
          63C924405661E3CB87F5CA4E6586DBE627986E9BC6EC60877D7CC42201F75B00
          013F3E6267F1C5CF647570A460D89902225C04314008D85ED59D95AA9B0C9091
          BA74E781ECBEDB5A414E639E2703F4E4F1D4C085AE521C6A3C56DF6FCCACD558
          B2660ADB399D558ABBEFB6BFF1B6EDFC176E40E92E76BAF6550000000049454E
          44AE426082}
        Name = 'PngImage0'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000001F74944415478DAA592DF8B616118C79F718529931F372E14DA0BA5B6
          569AA9BD51265CCA859CA9BD91F207504271853AB3F66AFE036BF6FC01DCDA72
          43519BE3D7054A1429D40AF9CDBCEF5B47ABCECC6EB34FBD9DB7E73CDFCFF3EB
          BD82775822917852281473AFD71BBEFA5791C964BA369BCD3683C140AB54AA0F
          E974FA6B32990C1080DFEFB78742A1EFABD56AC927160804B0DD6E4FA3D1E846
          229188699A3EA452A95BF4EB170120F1433C1EFFF1560593C904C46231148B45
          F0783CC17EBF4F633F010483410AF5C5BC265E2C16301C0E0165874020D06659
          F663AD565BFF15703A9D60BFDFC36EB7236D300C0383C1A0188D463F7331AF02
          38F1F178845EAF07E3F1189ACD26A8D5EAB2CD66BB7D13C089B1A15EA15C2E03
          2A19DC6E3786B1168BE5130EE30570E2C3E1404ACFE7F3D0ED7649FF688D50A9
          5458BBDDCE0FF8538C0D676DB55A309D4E41AFD7834C268376BB5DA228EAEEA2
          8570384CC562310667C40703369B0D743A1D28140A20128940A3D18056AB05B4
          8192CBE5BAE39DC17ABD3E0396CB2554AB5568341A44A8D3E9C83BC00087C3C1
          0F98CFE7E7E1D5EB75D282D16804A9544AFC4AA51272B9DC4FA7D379CF0B98CD
          66A4021C8CABC1BBC76B44CF18E4723939E8C53E4722912F17009FCF4759AD56
          4628149E878885DC17FBD17D8B56FA3B93C97CCB66B38F1780FFB117B2203D20
          0B2CAB330000000049454E44AE426082}
        Name = 'PngImage1'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C1800000A4D694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53775893F7163EDF
          F7650F5642D8F0B1976C81002223AC08C81059A21092006184101240C585880A
          561415119C4855C482D50A489D88E2A028B867418A885A8B555C38EE1FDCA7B5
          7D7AEFEDEDFBD7FBBCE79CE7FCCE79CF0F8011122691E6A26A003952853C3AD8
          1F8F4F48C4C9BD80021548E0042010E6CBC26705C50000F00379787E74B03FFC
          01AF6F00020070D52E2412C7E1FF83BA50265700209100E02212E70B01905200
          C82E54C81400C81800B053B3640A009400006C797C422200AA0D00ECF4493E05
          00D8A993DC1700D8A21CA908008D0100992847240240BB00605581522C02C0C2
          00A0AC40222E04C0AE018059B632470280BD0500768E58900F4060008099422C
          CC0020380200431E13CD03204C03A030D2BFE0A95F7085B8480100C0CB95CD97
          4BD23314B895D01A77F2F0E0E221E2C26CB142611729106609E4229C979B2313
          48E7034CCE0C00001AF9D1C1FE383F90E7E6E4E1E666E76CEFF4C5A2FE6BF06F
          223E21F1DFFEBC8C020400104ECFEFDA5FE5E5D60370C701B075BF6BA95B00DA
          560068DFF95D33DB09A05A0AD07AF98B7938FC401E9EA150C83C1D1C0A0B0BED
          2562A1BD30E38B3EFF33E16FE08B7EF6FC401EFEDB7AF000719A4099ADC0A383
          FD71616E76AE528EE7CB0442316EF7E723FEC7857FFD8E29D1E234B15C2C158A
          F15889B850224DC779B952914421C995E212E97F32F11F96FD0993770D00AC86
          4FC04EB607B5CB6CC07EEE01028B0E58D27600407EF32D8C1A0B910010673432
          79F7000093BFF98F402B0100CD97A4E30000BCE8185CA894174CC608000044A0
          812AB041070CC114ACC00E9CC11DBCC01702610644400C24C03C104206E4801C
          0AA11896411954C03AD804B5B0031AA0119AE110B4C131380DE7E0125C81EB70
          170660189EC218BC86090441C8081361213A8811628ED822CE0817998E042261
          48349280A420E988145122C5C872A402A9426A915D4823F22D7214398D5C40FA
          90DBC820328AFC8ABC47319481B25103D4027540B9A81F1A8AC6A073D174340F
          5D8096A26BD11AB41E3D80B6A2A7D14BE87574007D8A8E6380D1310E668CD961
          5C8C87456089581A26C71663E55835568F35631D583776151BC09E61EF082402
          8B8013EC085E8410C26C82909047584C5843A825EC23B412BA085709838431C2
          272293A84FB4257A12F9C478623AB1905846AC26EE211E219E255E270E135F93
          48240EC992E44E0A21259032490B496B48DB482DA453A43ED210699C4C26EB90
          6DC9DEE408B280AC209791B7900F904F92FBC9C3E4B7143AC588E24C09A22452
          A494124A35653FE504A59F324299A0AA51CDA99ED408AA883A9F5A496DA07650
          2F5387A91334759A25CD9B1643CBA42DA3D5D09A696769F7682FE974BA09DD83
          1E4597D097D26BE807E9E7E983F4770C0D860D83C7486228196B197B19A718B7
          192F994CA605D39799C85430D7321B9967980F986F55582AF62A7C1591CA1295
          3A9556957E95E7AA545573553FD579AA0B54AB550FAB5E567DA64655B350E3A9
          09D416ABD5A91D55BBA936AECE5277528F50CF515FA3BE5FFD82FA630DB28685
          46A08648A35463B7C6198D2116C63265F15842D6725603EB2C6B984D625BB2F9
          EC4C7605FB1B762F7B4C534373AA66AC6691669DE671CD010EC6B1E0F039D99C
          4ACE21CE0DCE7B2D032D3F2DB1D66AAD66AD7EAD37DA7ADABEDA62ED72ED16ED
          EBDAEF75709D409D2C9DF53A6D3AF77509BA36BA51BA85BADB75CFEA3ED363EB
          79E909F5CAF50EE9DDD147F56DF4A3F517EAEFD6EFD11F373034083690196C31
          3863F0CC9063E86B9869B8D1F084E1A811CB68BA91C468A3D149A327B826EE87
          67E33578173E66AC6F1C62AC34DE65DC6B3C61626932DBA4C4A4C5E4BE29CD94
          6B9A66BAD1B4D374CCCCC82CDCACD8ACC9EC8E39D59C6B9E61BED9BCDBFC8D85
          A5459CC54A8B368BC796DA967CCB05964D96F7AC98563E567956F556D7AC49D6
          5CEB2CEB6DD6576C501B579B0C9B3A9BCBB6A8AD9BADC4769B6DDF14E2148F29
          D229F5536EDA31ECFCEC0AEC9AEC06ED39F661F625F66DF6CF1DCC1C121DD63B
          743B7C727475CC766C70BCEBA4E134C3A9C4A9C3E957671B67A1739DF33517A6
          4B90CB1297769717536DA78AA76E9F7ACB95E51AEEBAD2B5D3F5A39BBB9BDCAD
          D96DD4DDCC3DC57DABFB4D2E9B1BC95DC33DEF41F4F0F758E271CCE39DA79BA7
          C2F390E72F5E765E595EFBBD1E4FB39C269ED6306DC8DBC45BE0BDCB7B603A3E
          3D65FACEE9033EC63E029F7A9F87BEA6BE22DF3DBE237ED67E997E07FC9EFB3B
          FACBFD8FF8BFE179F216F14E056001C101E501BD811A81B3036B031F049904A5
          0735058D05BB062F0C3E15420C090D591F72936FC017F21BF96333DC672C9AD1
          15CA089D155A1BFA30CC264C1ED6118E86CF08DF107E6FA6F94CE9CCB60888E0
          476C88B81F69199917F97D14292A32AA2EEA51B453747174F72CD6ACE459FB67
          BD8EF18FA98CB93BDB6AB6727667AC6A6C526C63EC9BB880B8AAB8817887F845
          F1971274132409ED89E4C4D8C43D89E37302E76C9A339CE49A54967463AEE5DC
          A2B917E6E9CECB9E773C593559907C3885981297B23FE5832042502F184FE5A7
          6E4D1D13F2849B854F45BEA28DA251B1B7B84A3C92E69D5695F638DD3B7D43FA
          68864F4675C633094F522B79911992B923F34D5644D6DEACCFD971D92D39949C
          949CA3520D6996B42BD730B728B74F662B2B930DE479E66DCA1B9387CAF7E423
          F973F3DB156C854CD1A3B452AE500E164C2FA82B785B185B78B848BD485AD433
          DF66FEEAF9230B82167CBD90B050B8B0B3D8B87859F1E022BF45BB16238B5317
          772E315D52BA647869F0D27DCB68CBB296FD50E2585255F26A79DCF28E5283D2
          A5A5432B82573495A994C9CB6EAEF45AB9631561956455EF6A97D55B567F2A17
          955FAC70ACA8AEF8B046B8E6E2574E5FD57CF5796DDADADE4AB7CAEDEB48EBA4
          EB6EACF759BFAF4ABD6A41D5D086F00DAD1BF18DE51B5F6D4ADE74A17A6AF58E
          CDB4CDCACD03356135ED5BCCB6ACDBF2A136A3F67A9D7F5DCB56FDADABB7BED9
          26DAD6BFDD777BF30E831D153BDEEF94ECBCB52B78576BBD457DF56ED2EE82DD
          8F1A621BBABFE67EDDB847774FC59E8F7BA57B07F645EFEB6A746F6CDCAFBFBF
          B2096D52368D1E483A70E59B806FDA9BED9A77B5705A2A0EC241E5C127DFA67C
          7BE350E8A1CEC3DCC3CDDF997FB7F508EB48792BD23ABF75AC2DA36DA03DA1BD
          EFE88CA39D1D5E1D47BEB7FF7EEF31E36375C7358F579EA09D283DF1F9E48293
          E3A764A79E9D4E3F3DD499DC79F74CFC996B5D515DBD6743CF9E3F1774EE4CB7
          5FF7C9F3DEE78F5DF0BC70F422F762DB25B74BAD3DAE3D477E70FDE148AF5B6F
          EB65F7CBED573CAE74F44DEB3BD1EFD37FFA6AC0D573D7F8D72E5D9F79BDEFC6
          EC1BB76E26DD1CB825BAF5F876F6ED17770AEE4CDC5D7A8F78AFFCBEDAFDEA07
          FA0FEA7FB4FEB165C06DE0F860C060CFC3590FEF0E09879EFE94FFD387E1D247
          CC47D52346238D8F9D1F1F1B0D1ABDF264CE93E1A7B2A713CFCA7E56FF79EB73
          ABE7DFFDE2FB4BCF58FCD8F00BF98BCFBFAE79A9F372EFABA9AF3AC723C71FBC
          CE793DF1A6FCADCEDB7DEFB8EFBADFC7BD1F9928FC40FE50F3D1FA63C7A7D04F
          F73EE77CFEFC2FF784F3FB25D29F33000000F24944415478DA63FCFFFF3F0325
          80711818709D9BA154838FCFEBAF082F03E31FE20CFBCFC2C8C0FCE633C38D4F
          9FB631FE666138C6327DAD2583BC2C03C3DFDFC459CBCCCAC0F0F031C39FCCE0
          E38C5F99190E70C5D4DA33FC65041A4DA47718816A99FF337C5BD27C90F12D1B
          C37E21637F0786CFDF48F33C2F17C3BBB31B0F303EE1603820CD2D65FFFBED47
          064622F582DCC92ACCCFF0F4EBB3838C8F79198ECAB07158FDFDF68381918948
          03FE017DC0C5C1F0E4D78F638C4D9C0C916C0C0CFE2C0C0CECFF2186130E0220
          FAC3C0F0F31703C346464545456090328801313B03910640CC60F809C4AF0641
          4A1C7003001A315D2C8A265B510000000049454E44AE426082}
        Name = 'PngImage2'
        Background = clWindow
      end
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
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000030B4944415478DA75535B485451145D771E3E6794B9634E8EAF9CD47C
          44515828CC47A0811FD28748D8878A1F919541640E541FA262FE48F557604690
          925910853F82839A31F4308CD2B4ACB47CA489A533E39D3B735FED3BE3A33E3A
          877DCFE61CD6DA6BED7B0E838D313D3D5D2AD150F328F0F8EFD0020CA0197A39
          D6575E5ECE319BFB6D6D6D0A0DF5105565C508087E4092A180425242AB1CE447
          44742C5C037D038F5D930D4C6B6BEBE5B4B4346B6666E6D9AEAE2E180C069C3F
          590E9EF74351543085224196D555C4CACC04B46111B0A46643322481191E1E1E
          B2DBED89CBCBCBBB2FD6D723D668C4957315F0711C2449802C0620A92188D0E9
          C3106E30E1D7EC244CD674307119D8B2E0703894D5D555E8F53A5C3A751C1CE7
          259010028B7ECAC912A38169A70D3F67C6A08936838B4876338D8D8DA76D369B
          D962B13477777723E0E7D172A10AEBA440AD2E125816027F11A461E9EB3B449B
          9310919AE766C6C7C75FE5E4E4B0AA85DADA5AB8D7D670B3A9165EEF3A642904
          0C9204022102AB0D8B9F47618CDF0553D6916D0B959595CAC4C404628C06DC6A
          3A43041C14553A85A85A11540206A6441B963EBE812EC6025D6A81B865C16834
          36B7B7DFC6C2C21CEE5FAF27022F55A5CAA20041DA5400B0D60C2C7E7A0D7D4C
          0262728B7FFC63A1A6A606A32323E8ED6884C7EB2605A1CAA2C843F213814603
          363103F31F5C88B7ED47C2A1D26D0B4545454A7F7F3F76B02C9C9D5789801408
          AA021E025990834D64604EDC83D9F161B029FB603E700C4C7E7E7E01CBB27174
          179EDEEBECC4CC9729B87ADAE0F17808ECDF68222909F08467C0266761EEFD20
          0C097B11995BFC9D999F9F17AC56AB4E55515D5D8D9E9E0718BCDB80758F9B9A
          E70FDE0375950522D068614EC9C5B7B7FDB01D3C8A647BC59685F0929212BEB7
          B71751519178F1F01A381F1FBACA3421D397DE8956AB27FFCFE1F3AE20FD7009
          AC0527B67B505858A8389DCE60FEACC3012F290855E78336540B12F543FD2BAA
          1AC4657B398BFDC916415D5DDD239FCF276869A72C2F9680C1F7472714A48424
          045399A68EBC4CCDFEBE51D372C7F507436FADF90A0E61350000000049454E44
          AE426082}
        Name = 'PngImage5'
        Background = clWindow
      end>
    Left = 392
    Top = 216
    Bitmap = {}
  end
  object ActionList: TActionList
    Images = PngImageList
    Left = 360
    Top = 216
    object aAddPos: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      OnExecute = aAddPosExecute
    end
    object aEditPos: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Enabled = False
      ImageIndex = 1
      OnExecute = aEditPosExecute
    end
    object aDelPos: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      ImageIndex = 2
      OnExecute = aDelPosExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 4
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 3
      OnExecute = aSaveExecute
    end
    object aHistory: TAction
      Caption = #1048#1089#1090#1086#1088#1080#1103
      ImageIndex = 5
      OnExecute = aHistoryExecute
    end
  end
end
