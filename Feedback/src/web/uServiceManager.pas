unit uServiceManager;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Modules,
  XData.Web.Connection, XData.Web.Client;

type
  TPrxAddSuggestion = class
  private
    FSuggestion: String;
    FContact: String;
    FEmail: String;
    FDetails: String;
  published
    property Suggestion: String read FSuggestion write FSuggestion;
    property Contact: String read FContact write FContact;
    property Email: String read FEmail write FEmail;
    property Details: String read FDetails write FDetails;
  end;

type
  TServiceManager = class(TWebDataModule)
    Client: TXDataWebClient;
    Connection: TXDataWebConnection;
  private
    { Private declarations }
    class var FInstance: TServiceManager;

  public
    { Public declarations }
    class destructor Destroy;
    class function Shared: TServiceManager;

    [async]
    function Connect: Boolean;

    [async]
    function SendSuggestion( const ASuggestion: TPrxAddSuggestion ): String;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TServiceManager }
const
  URL = 'http://localhost:2112/';


function TServiceManager.Connect: Boolean;
begin
  Result := True;
  if not Connection.Connected then
  begin
    try
      Connection.URL := URL;
      await(Connection.OpenAsync);
    except on E: Exception do Result := False;
    end;
  end;
end;

class destructor TServiceManager.Destroy;
begin
  FInstance.Free;
end;

function TServiceManager.SendSuggestion(
  const ASuggestion: TPrxAddSuggestion): String;
var
  LObj: TJSObject;
  LResponse: TXDataClientResponse;

begin
  Result := '';

  LObj := TJSObject.new;
  LObj['Suggestion'] := ASuggestion.Suggestion;
  LObj['Contact'] := ASuggestion.Contact;
  LObj['Email'] := ASuggestion.Email;
  LObj['Details'] := ASuggestion.Details;

  LResponse := await( Client.RawInvokeAsync('IFeedbackService.AddSuggestion', [LObj]) );
  if LResponse.StatusCode = 200  then
  begin
    LObj := LResponse.ResultAsObject;
    Result := string( LObj['value'] );
  end;
end;

class function TServiceManager.Shared: TServiceManager;
begin
  if not Assigned( FInstance ) then
  begin
    FInstance := TServiceManager.Create( nil );
  end;

  Result := FInstance;
end;

end.
