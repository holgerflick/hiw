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
    function AddSuggestion( ASuggestion: TPrxAddSuggestion ): String;

    function Areas: TPrxAreas;
    function Products: TPrxProducts;
    function Stati: TPrxStati;
    function References: TPrxReferences;
  end;

implementation

uses
  uDatabaseManager;


{ TFeedbackService }

function TFeedbackService.AddSuggestion(ASuggestion: TPrxAddSuggestion): String;
begin
  Result := TDbManager.Shared.AddSuggestion( ASuggestion );
end;

function TFeedbackService.Areas: TPrxAreas;
begin
  Result := TDbManager.Shared.GetAreas;
end;

function TFeedbackService.Products: TPrxProducts;
begin
  Result := TDbManager.Shared.GetProducts;
end;

function TFeedbackService.References: TPrxReferences;
begin
  Result := TDbManager.Shared.GetReferenceData;
end;

function TFeedbackService.Stati: TPrxStati;
begin
  Result := TDbManager.Shared.GetStati;
end;

initialization
  RegisterServiceType(TFeedbackService);

end.
