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
  object btnExecute: TButton
    Left = 240
    Top = 16
    Width = 161
    Height = 33
    Caption = 'Execute Method'
    TabOrder = 1
    OnClick = btnExecuteClick
  end
  object txtMethod: TEdit
    Left = 8
    Top = 18
    Width = 217
    Height = 29
    TabOrder = 2
    Text = 'SayName'
  end
end
