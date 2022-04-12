unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TCustomer = class
  private
    FName: String;
    FTotalOrders: Integer;
    FBalance: Double;
    FLastOrder: TDateTime;
  public
    class function RandomCustomer: TCustomer;

    property Name: String read FName write FName;
    property TotalOrders: Integer read FTotalOrders write FTotalOrders;
    property Balance: Double read FBalance write FBalance;
    property LastOrder: TDateTime read FLastOrder write FLastOrder;

  end;

type
  TForm1 = class(TForm)
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
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  System.DateUtils,
  REST.Json;

{$R *.dfm}

procedure TForm1.btnFromJsonClick(Sender: TObject);
begin
  GenerateObject;
end;

procedure TForm1.btnToJsonClick(Sender: TObject);
begin
  GenerateJson;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  txtResults.Clear;
end;

procedure TForm1.GenerateJson;
var
  LCustomer : TCustomer;
  LJson: String;

begin
  LCustomer := TCustomer.RandomCustomer;
  try
    LJson := TJSON.ObjectToJsonString(LCustomer, [joIndentCaseCamel,
      joDateIsUTC]);
    txtResults.Lines.Add(LJson);
  finally
    LCustomer.Free;
  end;
end;

procedure TForm1.GenerateObject;
var
  LCustomer: TCustomer;
  LLastIdx: Integer;
  LJson: String;

begin
  LLastIdx := txtResults.Lines.Count - 1;
  LJson := txtResults.Lines[ LLastIdx ];

  LCustomer := TJson.JsonToObject<TCustomer>(LJson, [] );
  ShowMessage( 'Customer has ' + LCustomer.TotalOrders.ToString +
    ' orders and ordered last on ' + DateToStr( LCustomer.LastOrder ) + '.' );
end;

{ TCustomer }

class function TCustomer.RandomCustomer: TCustomer;
begin
  Result := TCustomer.Create;

  Result.Name := 'Example Customer';
  Result.TotalOrders := RANDOM(100);
  Result.Balance := RANDOM( 500000 ) / 3;
  Result.LastOrder := TDateTime.NowUTC.IncHour(RANDOM(9999) * -1);
end;

end.
