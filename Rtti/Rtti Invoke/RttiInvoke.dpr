program RttiEx;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FrmMain};

{$R *.res}

begin
  {$IF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
