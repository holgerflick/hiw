unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvEdit, Vcl.Mask,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    txtEdit: TAdvEdit;
    lblStringValue: TLabel;
    txtResult: TAdvEdit;
    txtCurrency: TAdvEdit;
    AdvEdit1: TAdvEdit;
    procedure txtEditChange(Sender: TObject);
    procedure txtCurrencyChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.txtCurrencyChange(Sender: TObject);
begin
  txtResult.FloatValue := txtCurrency.FloatValue;
end;

procedure TForm1.txtEditChange(Sender: TObject);
begin
  lblStringValue.Caption := txtEdit.Text;
  txtResult.FloatValue := txtEdit.FloatValue * Pi;
end;

end.
