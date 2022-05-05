object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'JSON: Create JSON from object and vice versa'
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
  object btnToJson: TButton
    Left = 8
    Top = 32
    Width = 201
    Height = 33
    Caption = 'Generate JSON'
    TabOrder = 0
    OnClick = btnToJsonClick
  end
  object txtResults: TMemo
    Left = 8
    Top = 88
    Width = 679
    Height = 337
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      '')
    ReadOnly = True
    TabOrder = 1
    ExplicitWidth = 601
  end
  object btnFNCCore: TButton
    Left = 215
    Top = 32
    Width = 201
    Height = 33
    Caption = 'Use FNC Core'
    TabOrder = 2
    OnClick = btnFNCCoreClick
  end
end
