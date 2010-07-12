object FHistory: TFHistory
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1082#1083#1080#1077#1085#1090#1072
  ClientHeight = 405
  ClientWidth = 794
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
  object gOrdersDateH: TUdcIB_Grid
    Left = 0
    Top = 0
    Width = 145
    Height = 405
    CustomGlyphsSupplied = []
    DataSource = DMMain.OrdersHDS
    Align = alLeft
    TabOrder = 0
    RowSelect = True
    ListBoxStyle = True
    IndicateRow = False
    StretchColumn = 'DATETIME'
  end
  object gOrdersDateHAdd: TUdcIB_Grid
    Left = 145
    Top = 0
    Width = 649
    Height = 405
    CustomGlyphsSupplied = []
    DataSource = DMMain.OrdersHDSAdd
    Align = alClient
    TabOrder = 1
    RowSelect = True
    ListBoxStyle = True
    IndicateRow = False
    StretchColumn = 'DATETIME'
  end
end
