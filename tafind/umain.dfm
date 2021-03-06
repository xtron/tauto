object FMain: TFMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1055#1086#1080#1089#1082
  ClientHeight = 386
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcFind: TPageControl
    Left = 0
    Top = 0
    Width = 634
    Height = 347
    ActivePage = tsClientFind
    Align = alClient
    TabOrder = 0
    object tsClientFind: TTabSheet
      Caption = #1055#1086' '#1082#1083#1080#1077#1085#1090#1091
      object pFindClientParam: TPanel
        Left = 0
        Top = 0
        Width = 626
        Height = 49
        Align = alTop
        TabOrder = 0
        object gbLName: TGroupBox
          Left = 0
          Top = 1
          Width = 185
          Height = 41
          Caption = #1060#1072#1084#1080#1083#1080#1103
          TabOrder = 0
          object ELname: TUdcEdit
            Left = 2
            Top = 17
            Width = 175
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
          end
        end
        object gbFname: TGroupBox
          Left = 191
          Top = 0
          Width = 202
          Height = 41
          Caption = #1048#1084#1103
          TabOrder = 1
          object EFName: TUdcEdit
            Left = 2
            Top = 17
            Width = 197
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
          end
        end
        object gbMname: TGroupBox
          Left = 399
          Top = 0
          Width = 218
          Height = 42
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          TabOrder = 2
          object EMname: TUdcEdit
            Left = 3
            Top = 17
            Width = 206
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
            OnExit = EMnameExit
          end
        end
      end
      object gFindClientResult: TUdcIB_Grid
        Left = 0
        Top = 49
        Width = 626
        Height = 270
        CustomGlyphsSupplied = []
        DataSource = DMMain.ClientFindDS
        Align = alClient
        TabOrder = 1
        OnKeyDown = gFindClientResultKeyDown
        RowSelect = True
        IndicateRow = False
        StretchColumn = 'MNAME.MNAME'
        OnCellDblClick = gFindClientResultCellDblClick
      end
    end
    object tsOrderFind: TTabSheet
      Caption = #1055#1086' '#1079#1072#1082#1072#1079#1091
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 626
        Height = 49
        Align = alTop
        TabOrder = 0
        object gbOrderNum: TGroupBox
          Left = 0
          Top = 0
          Width = 177
          Height = 41
          Caption = #1053#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1072
          TabOrder = 0
          object EOrderNum: TUdcEdit
            Left = 4
            Top = 17
            Width = 170
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
            IsNumerical = True
          end
        end
        object gbOrderPeriod: TGroupBox
          Left = 183
          Top = 0
          Width = 426
          Height = 41
          Caption = #1055#1077#1088#1080#1086#1076' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1082#1072#1079#1072
          TabOrder = 1
          object LSPeriod: TLabel
            Left = 8
            Top = 20
            Width = 46
            Height = 13
            Caption = #1055#1077#1088#1080#1086#1076' '#1089
          end
          object LEPeriod: TLabel
            Left = 224
            Top = 18
            Width = 12
            Height = 13
            Caption = #1087#1086
          end
          object deSDate: TUdcDateEdit
            Left = 63
            Top = 17
            Width = 154
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object deEDate: TUdcDateEdit
            Left = 247
            Top = 17
            Width = 170
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
        end
      end
      object gFindOrderResult: TUdcIB_Grid
        Left = 0
        Top = 49
        Width = 626
        Height = 270
        CustomGlyphsSupplied = []
        DataSource = DMMain.OrderFindDS
        Align = alClient
        TabOrder = 1
        RowSelect = True
        ListBoxStyle = True
        IndicateRow = False
        StretchColumn = 'FIO'
      end
    end
  end
  object pControl: TPanel
    Left = 0
    Top = 347
    Width = 634
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object bFind: TPngBitBtn
      Left = 381
      Top = 6
      Width = 80
      Height = 25
      Action = aFind
      Caption = #1053#1072#1081#1090#1080
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object bClear: TPngBitBtn
      Left = 466
      Top = 6
      Width = 80
      Height = 25
      Action = aClear
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
    end
    object bExit: TPngBitBtn
      Left = 549
      Top = 6
      Width = 80
      Height = 25
      Action = aExit
      Caption = #1042#1099#1093#1086#1076
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
    end
  end
  object ActionList: TActionList
    Images = PngImageList
    Left = 16
    Top = 128
    object aClear: TAction
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      ImageIndex = 2
      OnExecute = aClearExecute
    end
    object aFind: TAction
      Caption = #1053#1072#1081#1090#1080
      ImageIndex = 1
      OnExecute = aFindExecute
    end
    object aExit: TAction
      Caption = #1042#1099#1093#1086#1076
      ImageIndex = 0
      ShortCut = 27
      OnExecute = aExitExecute
    end
    object aSelect: TAction
      Caption = 'aSelect'
      OnExecute = aSelectExecute
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
          61000002D64944415478DA95535D489361143EDB5C73FBF6FFBF39F7D36CB672
          08CD763192D40C342F368AEA62442041D7DE455069D6455DF473934177C92625
          260EC586C4D6E64FD9A650361BE52E64CE2DA689FBCBFD64EFFB5150A4512F7C
          70BE73CEFB9CE73CE73D14D8E5343737D7F3F97CD3F0F0F013F45BDC2D8FB28B
          5FEC703816A854AAAC5C2E4FF0783CCFCACACAB8DBED0EEF0820100894369BED
          59B158DC743A9DA7908BD1D4D41437180C741CA7D16880D87C0B87C3BD232323
          DD7F00582C96AB56ABB5472291403A9D9E191A1ABAABD168EE170A05454D4D0D
          E47239904AA520168B21180C5E424C6EFD06D0DEDEFED468349EA6D3E9C0E572
          211289402693816C360BA55209643219C9021750ABD5303B3B7BC5E572DD2001
          381C8ECE6EB77F64B15834269309959595C06030607E7E9EB453A91450281412
          0CB50A280F70A1783CDEE5F7FBEF5110B5132D2D2D63F8120E6210822000D187
          50280442A11062B118A8542A309BCD24A3C5C5454826936BA89D7A1200F53F86
          ABE10F538C46A38004838A8A0AB26FCC40A15080482482E36D6DF0FE531426FD
          2F9383FD8F2D58032D62F081CD6633900E90482460636303743A1DAE02F97C1E
          D074D6103B8156AFA7CA11A8CA3B0A9B1A6DAA7772AE9114D164324DE8F5FA56
          6C6F6D6D4143430359191F8FC7F3627979F9A15C5E75B15AAB69B50506A0439F
          86C81E359C5F92749200885E17AA7E677B7B1BD0F848914E9E390B99741A5E4D
          CD840301DF513419E290C1E87D4079A3D31E2C833371186E2E65DB7EBE441112
          E82DA2ADC442728422E0A73EC391B9715048B9701BD43D2E9FBF1BD8EC03E7B4
          CAE7554271F5EB12ADDF3B1DB8F0EB53AEABADADB5F30482FDFB747B1D9DA141
          B01A8BF015052EAF37BAFB0201DB8F3C2547A130A45757A7915DD871178ED599
          827DC43BB3CCC880D198011EE545D77D53BE6BFFBC4CA80D7387B67A404A10CA
          28933731EEF77622F797FFD946525B965028CFADAF2FFC6D9DBF03ADEC02C059
          9023950000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = 'PngImage2'
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
      end>
    Left = 48
    Top = 128
    Bitmap = {}
  end
end
