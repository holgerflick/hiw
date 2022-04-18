unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Generics.Collections

  ;

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

  TCustomers = TList<TCustomer>;

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

    procedure GenerateObjects;
    procedure GenerateJsonArray;
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
  GenerateObjects;
end;

procedure TForm1.btnToJsonClick(Sender: TObject);
begin
  GenerateJsonArray;
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

procedure TForm1.GenerateJsonArray;
var
  LCustomers: TCustomers;
  i: Integer;
  LCustomer: TCustomer;
  LJson: String;
begin
  txtResults.Clear;

  LCustomers := TCustomers.Create;
  try
    for i := 1 to 10 do
    begin
      LCustomer := TCustomer.RandomCustomer;
      LCustomer.Name := 'Customer ' + i.ToString;

      LCustomers.Add(LCustomer);
    end;

    LJson := TJson.ObjectToJsonString(LCustomers,
      [joDateIsUTC, joIndentCaseCamel]);

    txtResults.Lines.Add(LJson);

  finally
    for LCustomer in LCustomers do
    begin
      LCustomer.Free;
    end;
    LCustomers.Free;
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

  LCustomer := TJson.JsonToObject<TCustomer>(LJson, [ joDateIsUTC ] );
  try
    ShowMessage( 'Customer has ' + LCustomer.TotalOrders.ToString +
      ' orders and ordered last on ' + DateToStr( LCustomer.LastOrder ) + '.' );
  finally
    LCustomer.Free;
  end;
end;

procedure TForm1.GenerateObjects;
var
  LCustomers: TCustomers;
  LJson: String;
  LAvg: Double;
  LCustomer: TCustomer;


begin
  LJson := txtResults.Lines.Text;

  LCustomers := TJson.JsonToObject<TCustomers>( LJson, [ joDateIsUTC ] );

  LAvg := 0;
  for LCustomer in LCustomers do
  begin
    LAvg := LAvg + LCustomer.Balance;
  end;

  LAvg := LAvg / LCustomers.Count;

  ShowMessage( LCustomers.Count.ToString + ' customers read with an average balance of ' + LAvg.ToString );
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
