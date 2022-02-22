unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCWXDocx.Models,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCCustomWEBComponent, VCL.TMSFNCWXDocx, Vcl.StdCtrls;

type
  TFrmMain = class(TForm)
    Docx: TTMSFNCWXDocx;
    btnCreate: TButton;
    procedure btnCreateClick(Sender: TObject);
    procedure DocxDownloadAsFile(Sender: TObject; FileName: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}


type
  TDocument = TTMSFNCWXDocxDocument;
  TSection = TTMSFNCWXDocxSection;
  TPara = TTMSFNCWXDocxParagraph;
  TText = TTMSFNCWXDocxText;




procedure TFrmMain.btnCreateClick(Sender: TObject);
var
  LDoc: TDocument;
  LSection: TSection;
  LPara: TPara;
  LText: TText;

begin
  LDoc := Docx.Document;
  LSection := LDoc.AddSection;
  LPara := LSection.AddParagraph;

  LText := LPara.AddText;

  LText.Font.Name := 'Times New Roman';
  LText.Font.Style := [fsBold];
  LText.Font.Size := 40;
  LText.Text := 'Hello Delphi Community!';

  Docx.GetDocxAsFile('test.docx');

  // cannot work with the file here!!!!
end;

procedure TFrmMain.DocxDownloadAsFile(Sender: TObject; FileName: string);
begin
  TTMSFNCUtils.OpenFile(FileName);
end;

end.
