object formPB: TformPB
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Working'
  ClientHeight = 64
  ClientWidth = 270
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object lblStatus: TLabel
    Left = 6
    Top = 38
    Width = 40
    Height = 12
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Working'
  end
  object pb1: TJvProgressBar
    Left = 6
    Top = 12
    Width = 253
    Height = 22
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    TabOrder = 0
  end
  object btncancel: TButton
    Left = 203
    Top = 38
    Width = 56
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Cancel'
    TabOrder = 1
    Visible = False
    OnClick = btncancelClick
  end
end
