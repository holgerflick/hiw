unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Generics.Collections
  ;


type
  TYearlyProfits = class
  private
    FMonthlyProfit: TArray<Double>;
    FYear: Integer;

  public
    class function Example: TYearlyProfits;

    constructor Create;

    property Year: Integer read FYear write FYear;
    property MonthlyProfit: TArray<Double> read FMonthlyProfit write FMonthlyProfit;
  end;


type
  TFrmMain = class(TForm)
    btnToJson: TButton;
    txtResults: TMemo;
    btnFromJson: TButton;
    procedure btnToJsonClick(Sender: TObject);
    procedure btnFromJsonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure GenerateJson;
    procedure GenerateObject;

    procedure GenerateObjects;

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  System.DateUtils,
  REST.Json;

{$R *.dfm}

procedure TFrmMain.btnFromJsonClick(Sender: TObject);
begin
  GenerateObjects;
end;

procedure TFrmMain.btnToJsonClick(Sender: TObject);
begin
  GenerateJson;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  txtResults.Clear;
end;

procedure TFrmMain.GenerateJson;
var
  LJson: String;
  LProfits: TYearlyProfits;

  LYears: TObjectList<TYearlyProfits>;
  i: Integer;

begin


  LYears := TObjectList<TYearlyProfits>.Create;

  try
    for i := 1990 to 2020 do
    begin
      LProfits := TYearlyProfits.Example;
      LProfits.Year := i;

      LYears.Add(LProfits);
    end;

    LJson := TJSON.ObjectToJsonString(LYears );
    txtResults.Lines.Add(LJson);

  finally
    LYears.Free;
  end;


end;

procedure TFrmMain.GenerateObject;


begin

end;

procedure TFrmMain.GenerateObjects;

begin

end;



{ TYearlyProfits }

constructor TYearlyProfits.Create;
begin
  SetLength( FMonthlyProfit, 12 );
end;

class function TYearlyProfits.Example: TYearlyProfits;
var
  i: Integer;

begin
  Result := TYearlyProfits.Create;

  Result.Year := 1979 + RANDOM( 40 );

  for i := 0 to 11 do
  begin
    Result.MonthlyProfit[i] := RANDOM( 200 );
  end;

end;

end.
