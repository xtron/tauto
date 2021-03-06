object FOrders: TFOrders
  Left = 0
  Top = 0
  Caption = #1047#1072#1082#1072#1079#1099
  ClientHeight = 530
  ClientWidth = 792
  Color = clBtnFace
  Constraints.MinHeight = 560
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 315
    Width = 792
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitLeft = 16
    ExplicitTop = 191
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 511
    Width = 792
    Height = 19
    Panels = <>
  end
  object pControl: TUdcPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 31
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    object LSPeriod: TLabel
      Left = 5
      Top = 8
      Width = 46
      Height = 13
      Caption = #1055#1077#1088#1080#1086#1076' '#1089
    end
    object LEPeriod: TLabel
      Left = 153
      Top = 8
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object deSDate: TUdcDateEdit
      Left = 60
      Top = 5
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 0
      OnChange = deSDateChange
    end
    object deEDate: TUdcDateEdit
      Left = 171
      Top = 5
      Width = 86
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 1
      OnChange = deSDateChange
    end
    object bCurrentDay: TPngBitBtn
      Left = 368
      Top = 4
      Width = 90
      Height = 25
      Action = aCurrentDay
      Caption = #1053#1072' '#1089#1077#1075#1086#1076#1085#1103
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
    end
    object bInfo: TPngBitBtn
      Left = 462
      Top = 4
      Width = 90
      Height = 25
      Action = aInfo
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 4
    end
    object bPrint: TPngBitBtn
      Left = 556
      Top = 4
      Width = 90
      Height = 25
      Action = aPrint
      Caption = #1055#1077#1095#1072#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 5
    end
    object bClose: TPngBitBtn
      Left = 650
      Top = 4
      Width = 90
      Height = 25
      Action = aClose
      Caption = #1047#1072#1082#1088#1099#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 6
    end
    object cbStatus: TUdcComboBox
      Left = 261
      Top = 4
      Width = 101
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnChange = cbStatusChange
      Items.Strings = (
        #1042#1057#1045
        #1058#1045#1050#1059#1065#1048#1045
        #1054#1058#1052#1045#1053#1045#1053#1053#1067#1045
        #1042#1067#1055#1054#1051#1053#1045#1053#1053#1067#1045)
    end
  end
  object gOrders: TUdcIB_Grid
    Left = 0
    Top = 31
    Width = 792
    Height = 284
    CustomGlyphsSupplied = []
    DataSource = DMMain.OrdersSumDS
    Align = alClient
    ReadOnly = True
    TabOrder = 2
    RowSelect = True
    ListBoxStyle = True
    IndicateRow = False
    OnDrawCellA = gOrdersDrawCellA
  end
  object UdcIB_Grid1: TUdcIB_Grid
    Left = 0
    Top = 318
    Width = 792
    Height = 193
    CustomGlyphsSupplied = []
    DataSource = DMMain.PositionsSumDS
    Align = alBottom
    ReadOnly = True
    TabOrder = 3
    RowSelect = True
    ListBoxStyle = True
    IndicateRow = False
    StretchColumn = 'POSITIONS.POSITIONNAME'
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Caption = #1057#1080#1089#1090#1077#1084#1072
          end
          item
            Caption = #1056#1072#1073#1086#1090#1072
          end
          item
            Caption = #1054#1090#1095#1077#1090#1099
          end
          item
            Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
          end>
      end
      item
      end>
    Images = PngImageList
    Left = 720
    Top = 328
    StyleName = 'XP Style'
    object aCurrentDay: TAction
      Caption = #1053#1072' '#1089#1077#1075#1086#1076#1085#1103
      ImageIndex = 3
      OnExecute = aCurrentDayExecute
    end
    object aInfo: TAction
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ImageIndex = 2
      OnExecute = aInfoExecute
    end
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 1
      OnExecute = aPrintExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 0
      OnExecute = aCloseExecute
    end
  end
  object PngImageList: TPngImageList
    PngImages = <
      item
        Background = clWindow
        Name = 'PngImage0'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB000003634944415478DA25535D6814
          5714FEEECEEECEFE6567DD44774997828D6EDD46B02A5ADBAAA56025D20A856A
          4B4B0B7DA80545C5AA1015D43E082A421FFAE043AA521153434B5BFA47A53F96
          889626A6A66F6AD6A4C6644DCCFECCECECEEFCCFF5CC64E03017EE39DFFDCE77
          CEC7AE0C9E3AAC3B5AAF613761393A1CD782ED5870B90B0E8073070E9D5D6EFB
          7F87EE0CAB09D70C226A654EB38B7F7DAA762472099773347519A6AB51924960
          A60FC6310F4448B05C9BC075E8760B55B90CF5B1D5605FFC7148E994F249D775
          D03464BA6C509281B0104150107D80965947C3A8C1CB212E306C0D0D55C5E444
          A9CECE5EDD2777249E9638D16B9A32180BA0AB7D2572E902E2A114C000D5A862
          6C7608A353BFFB0F084C80D63230335951D8E7BFEC9417C43B258FAEF7ADCCF5
          209BECC2DDC737313E77DB67F0CCC2552864D6636C6E08BFDDB9400CA93D0398
          795855D8673F7D24A7A219C925B1F28B5EC0B399173158EC47716E0489708AFA
          3651694E219F59872DDD3B71BD7805B7267F06271167A76A0A3BF3C38772425C
          20454209BC9AFF0025650C37C6BF816E36F0CE9AA324A48DF3370F20200878FD
          B95D58945C8C817F4FF81A54A655859DFCFE3D391E96A474BC13AF15766070AC
          1F13E5519A8285B756F5C2637671F8084C4743777603B676EFC1F97F0E62A6F2
          104A4957D8896FDF9663E136A93D9E430FBD70FD7E3FC6CBB7699C16B63D4F00
          20805BF300CBB31BF1466137FA863EC16C7912F592A1B0E35FBFE933688BA6B1
          B9F03166EB13B8717F002DA78577571FF319F40DED871010B075D96EB4C79EC2
          A5D1A3A82B3231D0147664608BDC26A6A560208415B94D149B49A87EDC9B1B46
          544CC2E624A2F6885EDF809EA53BF06BF11CFE7EF01D5C9A426DBAA9B0DEAF36
          9188692914101109C5F172D7762CEE5841231BC1BDF2B0BFCAF9856B28D6E2BF
          993FF1E3DDB3B068952DCD853CDD52D881CBAFF82D8483315A220691FE85EC4B
          584A45A9589600382AAD292ABE8691D255684E1DD417CCA64900D4C29E2FD72A
          F1482A290A510403615A1C4EA6712086620887A274B6D1B06AA85BD57983F9E6
          B208C042F5815A677BFB36AA163713112A080A6130728EB77D3625DA94C89943
          E1C2DB690FD881E97B425375F05AACC18E5D78FFF0FF8F8ABD2D5D8548E6A13E
          3CEBF91EF0C22BF6C237120502F0DD2AF224B26D4B4E3F01DC94E5097467EE2E
          0000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = 'PngImage1'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000002EA4944415478DA85535D489A61147E3EC57ED49695191999D12A6354
          2C172BFAB9A80505C210A411A6D02ED211BB2844465E44440A2BBB29675014BB
          C88B358C062B6A2DB69B0DE6453F12A33F473092CA24615D84253BDF07455BFB
          3937EF77DEF73BCF39CF73CE6170D3189BCD66686D6D7D5C5454F490FC08FE61
          CC75A7B2B2F2AEDBED7E5E5A5AFA80F59D4EA7DD62B1D8FE0B909696261B1A1A
          B21A8DC6A7E4C65D7B8FF5F6F6BA2391C8ABB5B5B5BD828202F9E8E8A88FEECF
          7F01309BCD4F28F38B3F65383939C1DCDCDC8F868686587A7AFAADB1B1B1E9F6
          F6763D3D45AF00C462B12A140A7D8D8F8FBF0A3C3B3B83CFE743777737363737
          313C3C8CE6E666EE6D6A6AEA0D69A463412E355012DF40575717E76F6C6CC0E3
          F160767616C7C7C750A9546018060683016D6D6D5CC0C0C080D36AB55AB88094
          9414F9C8C8C8B7EAEAEA38AFD78B8585050E4422918004454242022E2E2E9099
          99898E8E0EC8E572C462B1D3BABA3A1D07909C9CAC585A5A0A2C2E2EF2070707
          91939383DCDC5C6465657181494949282B2B437E7E3E0E0E0ED0D8D8C855A4D7
          EBCD1C00A13AFAFBFB9F11105C2E17969797919A9A0A3E9F0F521EE5E5E51089
          449C162B2B2B6C20121313232D2D2D8F186AE19DC9C9C92FB5B5B542168035BB
          DD0E1215555555282C2CC4E1E121B6B6B6B0BEBECE51D3683421EA866E7B7BFB
          23939D9D7DBFA7A7E713F1E3B1A5F1783CAE037EBF1F028100BBBBBBD8D9D9E1
          3A42BC515353038542713A3E3EAE9D9F9F7FC7521090B25E124443A30BB55ACD
          55717474849999195016040201E4E5E5A1A2A20219191990C964D827A3AEE92E
          DB789B26EEB352A9946AB55A4E34D64817ECEDED711AB05A50B720954A4182FB
          E9FF4E02FE70B50BA4B0CE64324DD7D7D783AD84A5323131F15D28148A4B4A4A
          24EC9011B573E24E3ABBD8FD38BDB14C4D4D4D2F69F28C2C8DBEBE3E8FC3E1E8
          2C2E2EBE47E7EB6030B84FA789B2BEFFEB369289A85C5D341A0DAFAEAEBE6597
          89BDA496AAC3E1F03E7D067FDF959F0077214951D285220000000049454E44AE
          426082}
      end
      item
        Background = clWindow
        Name = 'PngImage2'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000003224944415478DA6D937B48145114C6BF999DD19971574D5D49CB2834
          2B93B04DA3087A88412691460F334D908A4AA5D242FF881E16149965F4202A2C
          3474FF284DA207256644605196B654544211A5996BE9EABAEECECC76667A68D9
          C0CC65EE3DE7BBBF73EE77198C7E24DE92B92CD6327771983978A236D1D1F5F5
          BDEDD9A3BB9E96CBD7E9D7393298F92B3566E992D4EC9DA52B175A62279905F0
          ECCF698F0AB477B950DBD462BB567974175EDEBC3D4A409A9D95B5B9A0A42231
          26881B700EA26F5001FB6BD5EB05FC450344494483AD473E5FBE27C7F9B8AA6A
          5820CC62C9D85BF970FE9460C1EE70C1237B61140CD8B4689CBE7CEEDE27F4BB
          14F8700C824C029A5EDB5DD692F5F3D0D1D2A20930D139176EA4A524277B3D4E
          D06650694BA32F87DCC4705DE04CE367385C325842D213780975376EDD7A53B1
          218581397A6AD22E6B5BF458232F2BEA1F64966130DEDFA0337638545D9861BC
          50142F58038BB79DFD9E86D2F4198C149796B920E77095C0B831E8F6C24391B2
          4ABA461EE7B3A32809D852D98E9E01994A0078D2D4C63E3787A68AE22C266076
          6641646A71196437049E8389D07D3803C6FAF338B56EA24EB0BDFA03BAFA6568
          844E378DAA0A85E1D17AE56021639AB56A6BE48A7DA7037815FE02AFD7AE0984
          9A781C480BD34BDA57DF09BB53267C952815BD1F0E85459B754F2EE31B919014
          9F57713748F421018EBACFC1974842A884A225213AC1B13B767C1B50C80F0A06
          86647A152AC98DC6B2ACC55A5303130AEB9E4C9E9E1069E414988842A022B51E
          E42706EA0467EFF7E19B53C190AC257BE05278BC687DD4FEE0F0B278DD07C133
          976F5FBAEDCC71B3C4C2CFC7003F1209F2E3901ACBEB04375FA9E82563B9A87E
          27D9B29BC4AC4736EEB03FAD2FFFED443166F5FE9A948C1DCB43242FFCC8C312
          F542F6B861605888A240BB93001D51B70BB87AB1ACFE79CDEEB5943738F22E84
          4C4B2D3A99BC262F7DF284708C118946806E67CD1EBD43C09B0F5F505775C26A
          AB3D944FF1DDA32F131DB11431332321397B7D6CDC9C1966B339400BF8DED3DD
          6B6B6D6E6BBE7EA9D2F1F159354DB9FF7F1B871F91DE28F80687EA7F43F62EFA
          BED390FF0DFC0121543536A8774CD90000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = 'PngImage3'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000002AE4944415478DA75936D48535118C7FF77BB37973315C50F4E825021
          A18430510BE744579359D6A00F0A99B44941815814517EEA83E417837D9022C4
          A4372A1227CB19739A39CB18F6AAC3929430F3255FF265CEE9E6D673E7D5DCB2
          037F38F7DC737ECFFF799E73186C313232EA6243C511CAB0EDD24C1F18C6B5E4
          B42ECE3B5ADFF4168F07EF6582BF5572E395E494DDE7F6A7C5ED8C8E9660D507
          4C4F2DE3D3FBB11FF68F5F6E995EE6DFF82FA0E090B9BEB024BB24259583D309
          3817011F015816108B017B9F174D0DD6BB0653B6F61F804A6EA83C75567D2D29
          89C3F030E0F502A2207F613B8081012F5A0CAD55CF2D7957370039E9F76469F2
          9C2175415CC8E84FAAC101DA1C463F7C7FC33816009B8DA634EFEA9C72D97B8C
          F196B7DA313F204F61D09DD41DAD6539115C2EA0B0080809098CBEBC0C3C7DB2
          36FF3501B4999A4FB7741CA9F70334F9ADD5278A94176767D76C179700526920
          C0E1001EDC2753949A9382BC6EB756379AB22EF901459A577A852AAB8C074824
          804E27A41004A8AD85DF21AFAF9FBBF58F1B0F96FB01851ACB85ACBCDC9BE313
          6BD6CBCE13600B07FA1A608552E1B601FDEF3ACB1F3D53E88514CC7B156A792F
          C34AB0B2029416FB101E1E58C4B939A0EE210386DAE971B97DB6766B728331D7
          BED128ADD662506A728FCDFEA69EB31E709C2FC081DBCDC0E3611111415D3077
          35DDAE911FDF7C0F444074CCE58AE6B66C75FA1E3EDAD252600A7C6D222301AB
          B9A7AFEABAEA30304309C3CB089028928CE36253CF94DDA950AAD509915122FF
          35E67DB0B46361DE8BF696178335D5A5956EF7580F2D8F92663603E249BB4809
          3259467A5A66415262E2BE1886FA3AF8EDC3A4ADCBD83F32D24D570983A4EFA4
          A175003FA834900AA01841FC3C54F84F2F03D3A429D2247F90442F05ABC1AF51
          C43B267182C4C2FA2A5F47411E3EF7F5037F00F448F81368207F830000000049
          454E44AE426082}
      end>
    Left = 752
    Top = 328
    Bitmap = {}
  end
end
