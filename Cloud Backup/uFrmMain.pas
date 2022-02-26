unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCCloudStorage, VCL.TMSFNCCloudStorageServices,
  VCL.TMSFNCCloudBase;

type
  TForm1 = class(TForm)
    CloudStorage: TTMSFNCCloudStorageServices;
    btnConnect: TButton;
    btnDownload: TButton;
    procedure btnConnectClick(Sender: TObject);
    procedure CloudStorageConnected(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDownloadClick(Sender: TObject);
    procedure CloudStorageGetFolderList(Sender: TObject;
      const AItems: TTMSFNCCloudItems;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
  private
    { Private declarations }
    procedure Connect;
    procedure Download;

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
  Connect;
end;

procedure TForm1.btnDownloadClick(Sender: TObject);
begin
  Download;
end;

procedure TForm1.CloudStorageConnected(Sender: TObject);
begin
  btnDownload.Enabled := True;
  btnConnect.Enabled := False;
end;

procedure TForm1.CloudStorageGetFolderList(Sender: TObject;
  const AItems: TTMSFNCCloudItems;
  const ARequestResult: TTMSFNCCloudBaseRequestResult);
var
  LItem: TTMSFNCCloudItem;
  LFilename: String;

begin
  for LItem in AItems do
  begin
    if LItem.ItemType = ciFile  then
    begin
      LFilename := TPath.Combine( TPath.GetDocumentsPath,
       LItem.FileName );

      CloudStorage.Download( LItem, LFilename);
    end;
  end;
end;

procedure TForm1.Connect;
begin
  CloudStorage.Authentication.ClientID := DROPBOX_CLIENTID;
  CloudStorage.Authentication.Secret := DROPBOX_SECRET;
  CloudStorage.PersistTokens.Key :=
    TPath.Combine(
    TPath.GetDocumentsPath,
    'tokens.ini' );
  CloudStorage.Authentication.CallBackURL := 'http://127.0.0.1:8888';
  CloudStorage.Connect;
end;

procedure TForm1.Download;
begin
  CloudStorage.GetFolderList;

  // we go here right away...
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  btnConnect.Enabled := True;
  btnDownload.Enabled := False;
end;

end.
