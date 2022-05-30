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
    btnShowTypes: TButton;
    procedure btnShowTypesClick(Sender: TObject);

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


procedure TFrmMain.btnShowTypesClick(Sender: TObject);
var
  LContext: TRttiContext;
  LPackages: TArray<TRttiPackage>;
  LPackage: TRttiPackage;

  LTypes: TArray<TRttiType>;
  LType: TRttiType;

  LMethods: TArray<TRttiMethod>;
  LMethod: TRttiMethod;

  LCount: Integer;

begin
  LContext := TRttiContext.Create;
  try


     LPackages := LContext.GetPackages;
     for LPackage in LPackages do
     begin
        txtResults.Lines.Add(LPackage.Name);
        txtResults.Lines.Add('------------------');

        LTypes := LPackage.GetTypes;

        LCount := 0;
        for LType in LTypes do
        begin
          if LType.TypeKind = tkClass then
          begin
            Inc( LCount );

            LMethods := LType.GetMethods;

            txtResults.Lines.Add( LType.QualifiedName );

            for LMethod in LMethods do
            begin
              txtResults.Lines.Add( '--' + LMethod.Name );
            end;
          end;

          if LCount > 8 then
          begin
            break;
          end;

        end;
     end;

  finally
    LContext.Free;
  end;

end;

end.
