unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmMain = class(TForm)
    txtLog: TMemo;
    btnTime: TButton;
    procedure btnTimeClick(Sender: TObject);
  private
    { Private declarations }
    procedure Log( AText: String );
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses
  System.DateUtils,
  TimeSpan;

procedure TFrmMain.btnTimeClick(Sender: TObject);
var
  LDate: TDateTime;
  LSpan: TTimeSpan;

begin
  Log( TTimeZone.Local.GetDisplayName(Now) );

  LSpan := TTimeSpan.FromDays(2);


  Log( LSpan.TotalHours.ToString );
end;

procedure TFrmMain.Log(AText: String);
begin
  txtLog.Lines.Add( AText );
end;

end.
