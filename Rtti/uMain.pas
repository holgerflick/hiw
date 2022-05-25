unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Rtti
  ;



type
  TFrmMain = class(TForm)
    txtResults: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }


  public
    { Public declarations }

  end;

var
  FrmMain: TFrmMain;

implementation

uses
  System.DateUtils
  ;

{$R *.dfm}


procedure TFrmMain.Button1Click(Sender: TObject);
var
  LContext: TRttiContext;

  LPackages: TArray<TRttiPackage>;
  LTypes: TArray<TRttiType>;

begin
  LContext := TRttiContext.Create;
  try
    LPackages := LContext.GetPackages;

    for var LPackage in LPackages do
    begin
      txtResults.Lines.Add( LPackage.Name );
    end;

    LTypes := LContext.GetTypes;

    for var LType in LTypes do
    begin
      txtResults.Lines.Add( LType.Name );
    end;

  finally
    LContext.Free;
  end;
end;

end.
