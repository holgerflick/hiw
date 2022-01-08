program FeedbackServices;

uses
  Vcl.Forms,
  uServerContainer in 'uServerContainer.pas' {ServerContainer: TDataModule},
  uFrmMain in 'uFrmMain.pas' {MainForm},
  uDatabaseManager in 'uDatabaseManager.pas' {DbManager: TDataModule},
  uSettings in 'uSettings.pas',
  uProxyClasses in 'uProxyClasses.pas',
  uFeedbackService in 'uFeedbackService.pas',
  uFeedbackServiceImpl in 'uFeedbackServiceImpl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TServerContainer, ServerContainer);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
