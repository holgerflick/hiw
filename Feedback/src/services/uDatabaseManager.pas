unit uDatabaseManager;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client
  , uProxyClasses
  ;

type
  TDbManager = class(TDataModule)
    Manager: TFDManager;
    DriverLink: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    class var FInstance : TDbManager;

    function GetQuery: TFDQuery;
    procedure ReleaseQuery( AQuery: TFDQuery );
    function GetConnection: TFDConnection;
    procedure InitDriverLink;
    { Private declarations }

  public
    { Public declarations }
    class destructor Destroy;
    class function Shared: TDbManager;

    procedure AddSuggestion( AProxy: TPrxAddSuggestion );
    function GetProducts: TPrxProducts;
    function GetAreas: TPrxAreas;
    function GetStati: TPrxStati;

    function GetReferenceData: TPrxReferences;
  end;

implementation

uses
  DateUtils,
  IOUtils,
  uSettings;


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDbManager.AddSuggestion(AProxy: TPrxAddSuggestion);
var
  LQuery: TFDQuery;

begin
  if not Assigned( AProxy )  then
  begin
    raise EArgumentNilException.Create('Suggestion to be added cannot be nil.');
  end;

  LQuery := GetQuery;
  try
    LQuery.SQL.Text := 'INSERT INTO SUGGESTIONS ( RECEIVED, SUGGESTION, CONTACT, EMAIL, DETAILS ) ' +
      'VALUES ( :RECEIVED, :SUGGESTION, :CONTACT, :EMAIL, :DETAILS )';
    LQuery.ParamByName('RECEIVED').AsDateTime := TTimeZone.Local.ToUniversalTime(Now);
    LQuery.ParamByName('SUGGESTION').AsString := AProxy.Suggestion;
    LQuery.ParamByName('CONTACT').AsString := AProxy.Contact;
    LQuery.ParamByName('EMAIL').AsString := AProxy.Email;
    LQuery.ParamByName('DETAILS').AsString := AProxy.Details;
    LQuery.ExecSQL;
  finally
    ReleaseQuery( LQuery );
  end;
end;

procedure TDbManager.DataModuleCreate(Sender: TObject);
begin
  InitDriverLink;
end;

class destructor TDbManager.Destroy;
begin
  FInstance.Free;
end;

function TDbManager.GetAreas: TPrxAreas;
const
  SQLGetAreas = 'SELECT * FROM areas ORDER BY area';

var
  LQuery: TFDQuery;
  LArea: TPrxArea;

begin
  Result := TPrxAreas.Create;
  LQuery := GetQuery;

  try
    LQuery.SQL.Text := SQLGetAreas;
    LQuery.Open;
    while not LQuery.Eof do
    begin
      LArea := TPrxArea.Create;
      LArea.Id := LQuery.FieldByName('Id').AsInteger;
      LArea.Area := LQuery.FieldByName('Area').AsString;
      Result.Add( LArea );

      LQuery.Next;
    end;
  finally
    ReleaseQuery( LQuery );
  end;
end;

function TDbManager.GetStati: TPrxStati;
const
  SQLGetStati = 'SELECT * FROM status ORDER BY status';

var
  LQuery: TFDQuery;
  LStatus: TPrxStatus;

begin
  Result := TPrxStati.Create;
  LQuery := GetQuery;

  try
    LQuery.SQL.Text := SQLGetStati;
    LQuery.Open;
    while not LQuery.Eof do
    begin
      LStatus := TPrxStatus.Create;
      LStatus.Id := LQuery.FieldByName('Id').AsInteger;
      LStatus.Status := LQuery.FieldByName('Status').AsString;
      Result.Add( LStatus );

      LQuery.Next;
    end;
  finally
    ReleaseQuery( LQuery );
  end;
end;


function TDBManager.GetConnection: TFDConnection;
const
  CDef = 'feedback';

var
  LParams: TStringList;

begin
  if Manager.ConnectionDefs.FindConnectionDef(CDef) = nil then
  begin
    LParams := TStringlist.Create;
    try
      TSettings.Shared.AssignConnectionParams( LParams );
      Manager.AddConnectionDef(CDef, DriverLink.DriverID, LParams, False );
    finally
      LParams.Free;
    end;
  end;
  Result := TFDConnection.Create(nil);
  Result.ConnectionDefName := CDef;
end;

function TDbManager.GetProducts: TPrxProducts;
const
  SQLGetProducts = 'SELECT * FROM products ORDER BY name';

var
  LQuery: TFDQuery;
  LProduct: TPrxProduct;

begin
  Result := TPrxProducts.Create;
  LQuery := GetQuery;

  try
    LQuery.SQL.Text := SQLGetProducts;
    LQuery.Open;
    while not LQuery.Eof do
    begin
      LProduct := TPrxProduct.Create;
      LProduct.Id := LQuery.FieldByName('Id').AsInteger;
      LProduct.Name := LQuery.FieldByName('Name').AsString;
      Result.Add( LProduct );

      LQuery.Next;
    end;
  finally
    ReleaseQuery( LQuery );
  end;
end;

function TDbManager.GetQuery: TFDQuery;
begin
  Result := TFDQuery.Create( nil );
  Result.Connection := GetConnection;
end;

function TDbManager.GetReferenceData: TPrxReferences;
begin
  Result := TPrxReferences.Create;
  Result.Products := GetProducts;
  Result.Areas := GetAreas;
  Result.Stati := GetStati;
end;

procedure TDbManager.InitDriverLink;
begin
  DriverLink.VendorLib := TSettings.Shared.VendorLibFileName;
end;

procedure TDbManager.ReleaseQuery(AQuery: TFDQuery);
begin
  AQuery.Connection.Free;
  AQuery.Free;
end;

class function TDbManager.Shared: TDbManager;
begin
  if not Assigned( FInstance ) then
  begin
    FInstance := TDbManager.Create(nil);
  end;

  Result := FInstance;
end;

end.
