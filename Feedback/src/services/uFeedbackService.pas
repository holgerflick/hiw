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
    function AddSuggestion( [FromBody] ASuggestion: TPrxAddSuggestion ): String;

    [HttpGet]
    function Areas: TPrxAreas;

    [HttpGet]
    function Products: TPrxProducts;

    [HttpGet]
    function Stati: TPrxStati;

    [HttpGet]
    function References: TPrxReferences;



  end;

implementation

initialization
  RegisterServiceType(TypeInfo(IFeedbackService));

end.
