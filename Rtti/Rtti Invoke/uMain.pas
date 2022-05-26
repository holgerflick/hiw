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
    btnExecute: TButton;
    txtMethod: TEdit;
    procedure btnExecuteClick(Sender: TObject);

  private
    { Private declarations }

    procedure ExecuteMethod( AName: String );

  public
    { Public declarations }
    procedure SayName;
    procedure SayAddress;
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  System.DateUtils
  ;

{$R *.dfm}


procedure TFrmMain.btnExecuteClick(Sender: TObject);
begin
  ExecuteMethod( txtMethod.Text );
end;

procedure TFrmMain.ExecuteMethod(AName: String);
var
  LContext: TRttiContext;
  LType: TRttiType;
  LMethod: TRttiMethod;

begin
  LContext := TRttiContext.Create;
  try
    LType := LContext.GetType(self.ClassType);
    LMethod := LType.GetMethod( AName );

    if Assigned( LMethod ) then
    begin
      LMethod.Invoke(self, [] );
    end
    else
    begin
      ShowMessage( 'Method not found in instance of ' + self.ClassName );
    end;

  finally
    LContext.Free;
  end;

end;

procedure TFrmMain.SayAddress;
begin
  txtResults.Lines.Add( 'called SayAddress' );
end;

procedure TFrmMain.SayName;
begin
  txtResults.Lines.Add( 'called SayName' );
end;

end.
