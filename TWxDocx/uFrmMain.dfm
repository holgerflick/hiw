object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Wx Docx Example'
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
  object Docx: TTMSFNCWXDocx
    Left = 144
    Top = 128
    Width = 26
    Height = 26
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
    Visible = True
    OnDownloadAsFile = DocxDownloadAsFile
  end
  object btnCreate: TButton
    Left = 16
    Top = 16
    Width = 193
    Height = 57
    Caption = 'Create Document'
    TabOrder = 1
    OnClick = btnCreateClick
  end
end
