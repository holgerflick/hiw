unit uFeedbackService;

interface

uses
  XData.Service.Common,
  uProxyClasses;

type
  [ServiceContract]
  IFeedbackService = interface(IInvokable)
    ['{9EF2F8D0-F82D-40D1-93CE-AC2E57BA88EA}']

    [HttpPost]
    procedure AddSuggestion( [FromBody] ASuggestion: TPrxAddSuggestion );
  end;

implementation

initialization
  RegisterServiceType(TypeInfo(IFeedbackService));

end.
