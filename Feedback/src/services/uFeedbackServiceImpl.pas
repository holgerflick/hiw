unit uFeedbackServiceImpl;

interface

uses
  XData.Server.Module,
  XData.Service.Common,
  uFeedbackService,
  uProxyClasses;

type
  [ServiceImplementation]
  TFeedbackService = class(TInterfacedObject, IFeedbackService)
    procedure AddSuggestion( ASuggestion: TPrxAddSuggestion );
  end;

implementation

uses
  uDatabaseManager;


{ TFeedbackService }

procedure TFeedbackService.AddSuggestion(ASuggestion: TPrxAddSuggestion);
begin
  TDbManager.Shared.AddSuggestion( ASuggestion );
end;

initialization
  RegisterServiceType(TFeedbackService);

end.
