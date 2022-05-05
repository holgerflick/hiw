object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'JSON: Create JSON from object and vice versa'
  ClientHeight = 443
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'JetBrains Mono'
  Font.Style = []
  OnCreate = FormCreate
  DesignSize = (
    624
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
    Width = 601
    Height = 337
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      '')
    ReadOnly = True
    TabOrder = 1
  end
  object btnFromJson: TButton
    Left = 408
    Top = 32
    Width = 201
    Height = 33
    Anchors = [akTop, akRight]
    Caption = 'Convert from JSON'
    TabOrder = 2
    OnClick = btnFromJsonClick
  end
end
