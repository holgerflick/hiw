object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 21
  object lblStringValue: TLabel
    Left = 56
    Top = 120
    Width = 96
    Height = 21
    Caption = 'lblStringValue'
  end
  object txtEdit: TAdvEdit
    Left = 56
    Top = 56
    Width = 465
    Height = 29
    EditType = etFloat
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    ReturnIsTab = True
    Precision = 2
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    TabOrder = 0
    Text = '0.00'
    Visible = True
    OnChange = txtEditChange
    Version = '4.0.1.3'
  end
  object txtResult: TAdvEdit
    Left = 56
    Top = 160
    Width = 393
    Height = 29
    EditType = etFloat
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    ReturnIsTab = True
    Precision = 6
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    TabOrder = 1
    Text = '0.000000'
    Visible = True
    Version = '4.0.1.3'
  end
  object txtCurrency: TAdvEdit
    Left = 56
    Top = 232
    Width = 449
    Height = 29
    EditType = etMoney
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    ReturnIsTab = True
    Precision = 2
    Prefix = '$'
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    TabOrder = 2
    Text = '0.00'
    Visible = True
    OnChange = txtCurrencyChange
    Version = '4.0.1.3'
  end
  object AdvEdit1: TAdvEdit
    Left = 56
    Top = 320
    Width = 441
    Height = 29
    EmptyText = 'Please enter your name.'
    EmptyTextStyle = []
    FlatLineColor = 11250603
    FocusColor = clWindow
    FocusFontColor = 3881787
    ReturnIsTab = True
    LabelCaption = 'Full Name'
    LabelPosition = lpTopLeft
    LabelMargin = 15
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -16
    LabelFont.Name = 'Segoe UI'
    LabelFont.Style = [fsBold]
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    InvalidChars = 'AEI'
    ParentFont = False
    TabOrder = 3
    Text = ''
    Visible = True
    Version = '4.0.1.3'
  end
end
