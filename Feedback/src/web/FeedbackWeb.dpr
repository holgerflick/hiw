program FeedbackWeb;

uses
  Vcl.Forms,
  WEBLib.Forms,
  uFrmMain in 'uFrmMain.pas' {FrmMain: TWebForm} {*.html},
  uServiceManager in 'uServiceManager.pas' {ServiceManager: TWebDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
