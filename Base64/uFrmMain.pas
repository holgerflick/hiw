unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TForm2 = class(TForm)
    Image: TImage;
    Input: TEdit;
    Memo: TMemo;
    btnEncodeText: TButton;
    btnEncodeImage: TButton;
    btnDecodeImage: TButton;
    procedure btnEncodeTextClick(Sender: TObject);
    procedure btnEncodeImageClick(Sender: TObject);
    procedure btnDecodeImageClick(Sender: TObject);

  private
    function GetBase64: String;
    procedure SetBase64(const Value: String);

  public
    { Public declarations }

    property Base64: String read GetBase64 write SetBase64;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses
  System.NetEncoding, TMSFNCUtils;



{ TForm2 }

procedure TForm2.btnDecodeImageClick(Sender: TObject);
var
  LOutput: TMemoryStream;
  LInput: TMemoryStream;

begin


  LInput := TMemoryStream.Create;
  LOutput := TMemoryStream.Create;
  try
    Memo.Lines.SaveToStream( LInput );
    LInput.Position := 0;

    TNetEncoding.Base64.Decode( LInput, LOutput );
    LOutput.Position := 0;
    Image.Picture.LoadFromStream(LOutput);
  finally
    LOutput.Free;
    LInput.Free;
  end;
end;

procedure TForm2.btnEncodeImageClick(Sender: TObject);
var
  LStream: TMemoryStream;
  LOutput: TStringStream;

begin
  LStream := TMemoryStream.Create;
  LOutput := TStringStream.Create;

  try
    Image.Picture.SaveToStream(LStream);
    LStream.Position := 0;

    TNetEncoding.Base64.Encode( LStream, LOutput );
    Base64 := LOutput.DataString;
  finally
    LOutput.Free;
    LStream.Free;
  end;
end;

procedure TForm2.btnEncodeTextClick(Sender: TObject);
begin
  Base64 := TNetEncoding.Base64.Encode( Input.Text );
end;

function TForm2.GetBase64: String;
begin
  Result := Memo.Lines.Text;
end;

procedure TForm2.SetBase64(const Value: String);
begin
  Memo.Lines.Text := Value;
end;

// added

end.
