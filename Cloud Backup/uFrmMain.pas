unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VCL.TMSFNCCustomComponent,
  VCL.TMSFNCCloudStorage, VCL.TMSFNCCloudStorageServices, VCL.TMSFNCCloudBase;

type
  TForm1 = class(TForm)
    CloudStorage: TTMSFNCCloudStorageServices;
    btnConnect: TButton;
    btnList: TButton;
    procedure btnConnectClick(Sender: TObject);
    procedure CloudStorageConnected(Sender: TObject);
    procedure CloudStorageGetFolderList(Sender: TObject;
      const AItems: TTMSFNCCloudItems;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uKeys, System.IOUtils, TMSFNCUtils;

procedure TForm1.btnConnectClick(Sender: TObject);
begin
  CloudStorage.Authentication.ClientID := DROPBOX_CLIENTID;
  CloudStorage.Authentication.Secret := DROPBOX_SECRET;
  CloudStorage.PersistTokens.Key := TPath.Combine( TTMSFNCUtils.GetDocumentsPath ,  'token.ini' );
  CloudStorage.Authentication.CallBackURL := 'http://127.0.0.1:8888';
  CloudStorage.Connect;
end;

procedure TForm1.CloudStorageConnected(Sender: TObject);
begin

  CloudStorage.GetFolderList;
end;

procedure TForm1.CloudStorageGetFolderList(Sender: TObject;
  const AItems: TTMSFNCCloudItems;
  const ARequestResult: TTMSFNCCloudBaseRequestResult);
var
  item: TTMSFNCCloudItem;

begin
  for item in AItems do
  begin
    CloudStorage.Download(item,
      TPath.Combine( TTMSFNCUtils.GetDocumentsPath, item.FileName) );
  end;
end;

end.
