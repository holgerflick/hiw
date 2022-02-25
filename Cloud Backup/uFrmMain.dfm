object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 25
  object CloudStorage: TTMSFNCCloudStorageServices
    Left = 144
    Top = 136
    Width = 26
    Height = 26
    Visible = True
    PersistTokens.Section = 'TTMSFNCCloudDropBox'
    Service = cssDropBox
    OnConnected = CloudStorageConnected
    OnGetFolderList = CloudStorageGetFolderList
  end
  object btnConnect: TButton
    Left = 104
    Top = 224
    Width = 113
    Height = 41
    Caption = 'btnConnect'
    TabOrder = 1
    OnClick = btnConnectClick
  end
  object btnList: TButton
    Left = 104
    Top = 287
    Width = 113
    Height = 41
    Caption = 'btnList'
    TabOrder = 2
  end
end
