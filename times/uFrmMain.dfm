object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Working with Times'
  ClientHeight = 438
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Noto Sans Mono'
  Font.Style = []
  DesignSize = (
    651
    438)
  TextHeight = 26
  object txtLog: TMemo
    Left = 8
    Top = 8
    Width = 635
    Height = 366
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ExplicitWidth = 608
    ExplicitHeight = 369
  end
  object btnTime: TButton
    Left = 378
    Top = 389
    Width = 265
    Height = 41
    Anchors = [akRight, akBottom]
    Caption = 'Time calculations'
    TabOrder = 1
    OnClick = btnTimeClick
    ExplicitLeft = 351
    ExplicitTop = 392
  end
end
