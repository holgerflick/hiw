object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Working with Dates'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Noto Sans Mono'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 26
  object txtLog: TMemo
    Left = 8
    Top = 8
    Width = 608
    Height = 281
    TabOrder = 0
  end
  object btnDate: TButton
    Left = 8
    Top = 312
    Width = 265
    Height = 41
    Caption = 'Date calculations'
    TabOrder = 1
    OnClick = btnDateClick
  end
end
