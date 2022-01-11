unit uFrmMain;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.StdCtrls, WEBLib.StdCtrls, Vcl.Controls;

type
  TFrmMain = class(TWebForm)
    txtSuggestion: TWebEdit;
    txtDetails: TWebMemo;
    txtName: TWebEdit;
    txtMail: TWebEdit;
    btnSendSuggestion: TWebButton;
    btnReset: TWebButton;
    procedure WebFormShow(Sender: TObject);
    procedure WebFormCreate(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnSendSuggestionClick(Sender: TObject);
  private
    FConnected: Boolean;

    procedure ClearEdits;

    [async]
    procedure Connect;

    [async]
    procedure SendSuggestion;

    procedure SetConnected(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    property Connected: Boolean read FConnected write SetConnected;
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  uServiceManager;

{$R *.dfm}

procedure TFrmMain.btnResetClick(Sender: TObject);
begin
  ClearEdits;
end;

procedure TFrmMain.btnSendSuggestionClick(Sender: TObject);
begin
  SendSuggestion;
end;

procedure TFrmMain.ClearEdits;
var
  i: Integer;
  c: TControl;

begin
  for i := 0 to ControlCount-1 do
  begin
    c := Controls[i];
    if c is TWebEdit then
    begin
      TWebEdit( c ).Clear;
    end;

    if c is TWebMemo then
    begin
      TWebMemo( c ).Clear;
    end;
  end;
end;

procedure TFrmMain.Connect;
begin
 Connected := await( TServiceManager.Shared.Connect );
end;

procedure TFrmMain.SendSuggestion;
var
  LSuggestion: TPrxAddSuggestion;
  LId: String;

begin
  LSuggestion := TPrxAddSuggestion.Create;
  try
    LSuggestion.Suggestion := txtSuggestion.Text;
    LSuggestion.Contact := txtName.Text;
    LSuggestion.Details := txtDetails.Lines.Text;
    LSuggestion.Email := txtMail.Text;

    LId := await( TServiceManager.Shared.SendSuggestion( LSuggestion ) );

    if LId <> '' then
    begin
      ShowMessage( 'Your feedback was received (' + LId + ')' );
      ClearEdits;
    end
    else
    begin
      ShowMessage( 'Transfer Error. Please try again.' );
    end;
  finally
    LSuggestion.Free;
  end;
end;

procedure TFrmMain.SetConnected(const Value: Boolean);
var
  i: Integer;
  c: TControl;

begin
  FConnected := Value;

  for i := 0 to ControlCount - 1 do
  begin
    c := self.Controls[i];
    c.Enabled := FConnected;
  end;
end;

procedure TFrmMain.WebFormCreate(Sender: TObject);
begin
  ClearEdits;
end;

procedure TFrmMain.WebFormShow(Sender: TObject);

begin
  Connect;
end;

end.