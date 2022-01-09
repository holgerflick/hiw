unit uProxyClasses;

interface
uses
 System.Generics.Collections
 ;

type
  TPrxAddSuggestion = class
  private
    FSuggestion: String;
    FContact: String;
    FEmail: String;
    FDetails: String;
  published
    property Suggestion: String read FSuggestion write FSuggestion;
    property Contact: String read FContact write FContact;
    property Email: String read FEmail write FEmail;
    property Details: String read FDetails write FDetails;
  end;

  TPrxStatus = class
  private
    FId: Integer;
    FStatus: String;

  published
    property Id: Integer read FId write FId;
    property Status: String read FStatus write FStatus;
  end;

  TPrxStati = TList<TPrxStatus>;

  TPrxArea = class
  private
    FId: Integer;
    FArea: String;
  published
    property Id: Integer read FId write FId;
    property Area: String read FArea write FArea;
  end;

  TPrxAreas = TList<TPrxArea>;

  TPrxProduct = class
  private
    FName: String;
    FId: Integer;
  published
    property Id: Integer read FId write FId;
    property Name: String read FName write FName;
  end;

  TPrxProducts = TList<TPrxProduct>;

  TPrxReferences = class
  private
    FProducts: TPrxProducts;
    FAreas: TPrxAreas;
    FStati: TPrxStati;
  published
    property Products: TPrxProducts read FProducts write FProducts;
    property Areas: TPrxAreas read FAreas write FAreas;
    property Stati: TPrxStati read FStati write FStati;

  end;

implementation

end.
