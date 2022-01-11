object FrmMain: TFrmMain
  Width = 479
  Height = 344
  CSSLibrary = cssBootstrap
  ElementFont = efCSS
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  OnCreate = WebFormCreate
  OnShow = WebFormShow
  object txtSuggestion: TWebEdit
    Left = 24
    Top = 32
    Width = 425
    Height = 22
    ElementClassName = 'form-control'
    ElementFont = efCSS
    HeightStyle = ssAuto
    HeightPercent = 100.000000000000000000
    Text = 'txtSuggestion'
    WidthPercent = 100.000000000000000000
  end
  object txtDetails: TWebMemo
    Left = 24
    Top = 80
    Width = 425
    Height = 89
    AutoSize = False
    ElementClassName = 'form-control'
    ElementFont = efCSS
    HeightPercent = 100.000000000000000000
    Lines.Strings = (
      'txtDetails')
    SelLength = 0
    SelStart = 0
    WidthPercent = 100.000000000000000000
  end
  object txtName: TWebEdit
    Left = 24
    Top = 192
    Width = 425
    Height = 22
    ChildOrder = 2
    ElementClassName = 'form-control'
    ElementFont = efCSS
    HeightStyle = ssAuto
    HeightPercent = 100.000000000000000000
    Text = 'txtName'
    WidthPercent = 100.000000000000000000
  end
  object txtMail: TWebEdit
    Left = 24
    Top = 240
    Width = 425
    Height = 22
    ChildOrder = 3
    ElementClassName = 'form-control'
    ElementFont = efCSS
    HeightStyle = ssAuto
    HeightPercent = 100.000000000000000000
    Text = 'txtMail'
    WidthPercent = 100.000000000000000000
  end
  object btnSendSuggestion: TWebButton
    Left = 248
    Top = 288
    Width = 201
    Height = 25
    Caption = 'Send Suggestion'
    ChildOrder = 4
    ElementClassName = 'btn btn-success'
    ElementFont = efCSS
    HeightStyle = ssAuto
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = btnSendSuggestionClick
  end
  object btnReset: TWebButton
    Left = 24
    Top = 288
    Width = 96
    Height = 25
    Caption = 'Reset'
    ChildOrder = 4
    ElementClassName = 'btn btn-danger'
    ElementFont = efCSS
    HeightStyle = ssAuto
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = btnResetClick
  end
end
