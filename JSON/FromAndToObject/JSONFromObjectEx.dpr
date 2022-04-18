program JSONFromObjectEx;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1};

{$R *.res}

begin
  {$IF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
