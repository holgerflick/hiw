unit uSettings;

interface
uses
  Classes;

type
  TSettings = class
  private
    function GetAppPath: String;
    function GetIniPath: String;
    function GetLibPath: String;
    function GetVendorLibFilename: String;
    function GetSettingsIniFilename: String;
    function GetResourcePath: String;
    function GetIniValue( ASection, AKey, ADefault: String ) : String;
    class var
      FInstance: TSettings;
  public
    class function Shared: TSettings;
    class destructor Destroy;
    procedure AssignConnectionParams( AParams: TStrings );
    property AppPath: String read GetAppPath;
    property IniPath: String read GetIniPath;
    property LibPath: String read GetLibPath;
    property ResourcePath: String read GetResourcePath;
    property VendorLibFileName: String read GetVendorLibFilename;
    property SettingsIniFileName: String read GetSettingsIniFilename;
  end;

implementation
{ TSettings }

uses
  SysUtils,
  IOUtils,
  IniFiles;

function TSettings.GetAppPath: String;
begin
  Result := TPath.GetLibraryPath;
end;

function TSettings.GetIniPath: String;
begin
  Result := TPath.Combine( AppPath, 'etc' );
end;

function TSettings.GetIniValue(ASection, AKey, ADefault: String): String;
var
  LIniFile: TIniFile;

begin
 LIniFile := TIniFile.Create( SettingsIniFileName );
 try
    Result := LIniFile.ReadString( ASection, AKey, ADefault );
 finally
    LIniFile.Free;
 end;
end;

function TSettings.GetLibPath: String;
begin
  Result := TPath.Combine( AppPath, 'lib' );
end;

function TSettings.GetResourcePath: String;
begin
  Result := TPath.Combine( AppPath, 'resources' );
end;

function TSettings.GetSettingsIniFilename: String;
begin
  Result := TPath.Combine( IniPath, 'feedback.ini' );
end;

function TSettings.GetVendorLibFilename: String;
var
  LDefaultLibraryFileName: String;
  LFallback: Boolean;
  LErrMsg: String;

begin
  LDefaultLibraryFilename := TPath.Combine( LibPath, 'fbclient.dll' );
  Result := GetIniValue( 'Firebird', 'VendorLib', LDefaultLibraryFileName );
  if NOT TFile.Exists(Result) then
  begin
    LFallback := LDefaultLibraryFileName = Result;
    LErrMsg := 'Database vendor specific library not found (%s). ';
    if LFallback then
    begin
      LErrMsg := LErrMsg + 'File should be in ' + LibPath + ', or create an INI file instead.'
    end
    else
    begin
      LErrMsg := LErrMsg + 'The information in ' + SettingsIniFileName + ' is incorrect.';
    end;
    raise EFileNotFoundException.CreateFmt(LErrMsg,
     [Result]);
  end;
end;

procedure TSettings.AssignConnectionParams(AParams: TStrings);
var
  LIniFile: TIniFile;
begin
  LIniFile := TIniFile.Create( GetSettingsIniFilename );
  try
    LIniFile.ReadSectionValues( 'Connection', AParams )
  finally
    LIniFile.Free;
  end;
end;

class destructor TSettings.Destroy;
begin
   FInstance.Free;
end;

class function TSettings.Shared: TSettings;
begin
  if not Assigned( FInstance ) then
  begin
    FInstance := TSettings.Create;
  end;
  Result := FInstance;
end;

end.

