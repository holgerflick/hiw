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
  OnCreate = FormCreate
  DesignSize = (
    702
    443)
  TextHeight = 21
  object txtResults: TMemo
    Left = 8
    Top = 88
    Width = 679
    Height = 337
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      '')
    ReadOnly = True
    TabOrder = 0
  end
end
