unit uProxyClasses;

interface

type
  TPrxAddSuggestion = class
  private
    FSuggestion: String;
    FContact: String;
    FEmail: String;
    FComment: String;
  published
    property Suggestion: String read FSuggestion write FSuggestion;
    property Contact: String read FContact write FContact;
    property Email: String read FEmail write FEmail;
  end;


implementation

end.
