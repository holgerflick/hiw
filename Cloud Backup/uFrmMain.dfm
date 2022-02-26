object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cloud Backup Example'
  ClientHeight = 268
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 25
  object CloudStorage: TTMSFNCCloudStorageServices
    Left = 144
    Top = 63
    Width = 26
    Height = 26
    Visible = True
    PersistTokens.Section = 'TTMSFNCCloudDropBox'
    Service = cssDropBox
    OnConnected = CloudStorageConnected
    OnGetFolderList = CloudStorageGetFolderList
  end
  object btnConnect: TButton
    Left = 8
    Top = 16
    Width = 113
    Height = 41
    Caption = 'Connect'
    TabOrder = 1
    OnClick = btnConnectClick
  end
  object btnDownload: TButton
    Left = 8
    Top = 63
    Width = 113
    Height = 41
    Caption = 'Download'
    TabOrder = 2
    OnClick = btnDownloadClick
  end
end
