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
    procedure DataModuleCreate(Sender: TObject);
  private
    class var FInstance : TDbManager;

    function GetQuery: TFDQuery;
    function GetConnection: TFDConnection;
    procedure InitDriverLink;
    { Private declarations }

  public
    { Public declarations }
    class destructor Destroy;
    class function Shared: TDbManager;

    procedure AddSuggestion( AProxy: TPrxAddSuggestion );
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
    LQuery.SQL.Text := 'INSERT INTO SUGGESTIONS ( RECEIVED, SUGGESTION, CONTACT, EMAIL ) ' +
      'VALUES ( :RECEIVED, :SUGGESTION, :CONTACT, :EMAIL )';
    LQuery.ParamByName('RECEIVED').AsDate := TTimeZone.Local.ToUniversalTime(Now);
    LQuery.ParamByName('SUGGESTION').AsString := AProxy.Suggestion;
    LQuery.ParamByName('CONTACT').AsString := AProxy.Contact;
    LQuery.ParamByName('EMAIL').AsString := AProxy.Email;
    LQuery.ExecSQL;
  finally
    LQuery.Connection.Free;
    LQuery.Free;
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
      Manager.AddConnectionDef(CDef, 'FB', LParams, False );
    finally
      LParams.Free;
    end;
  end;
  Result := TFDConnection.Create(nil);
  Result.ConnectionDefName := CDef;
end;

function TDbManager.GetQuery: TFDQuery;
begin
  Result := TFDQuery.Create( nil );
  Result.Connection := GetConnection;
end;

procedure TDbManager.InitDriverLink;
begin
  //DriverLink.VendorLib := TSettings.Shared.VendorLibFileName;
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
