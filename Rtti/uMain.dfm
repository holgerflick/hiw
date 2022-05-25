object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Rtti: Learn more about your objects and classes'
  ClientHeight = 443
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'JetBrains Mono'
  Font.Style = []
  DesignSize = (
    702
    443)
  TextHeight = 21
  object txtResults: TMemo
    Left = 8
    Top = 72
    Width = 686
    Height = 363
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      '')
    ReadOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 16
    Top = 16
    Width = 161
    Height = 33
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
end
