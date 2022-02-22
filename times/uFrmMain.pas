unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmMain = class(TForm)
    txtLog: TMemo;
    btnDate: TButton;
    procedure btnDateClick(Sender: TObject);
  private
    { Private declarations }
    procedure Log( AText: String );
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses
  System.DateUtils;

procedure TFrmMain.btnDateClick(Sender: TObject);
var
  LRelease : TDate;
  LBirthday: TDate;
  LAdd: TDate;

  LYears: Integer;

  LFormat: TFormatSettings;

  LConvert: TDateTime;
  LDays: Integer;

begin
  // release date of Delphi: Feb 14, 1995
  // 14.02.1995
  // 02.14.1995
  // 02/14/1995
  LRelease := EncodeDate(1995, 2, 14 );
  LBirthday := EncodeDate( 2022, 2, 14 );

  LYears := YearsBetween( LRelease, LBirthday );
  Log( Format( '%d years have passed since the release of Delphi 1',
    [ LYears ] ) );


  LFormat := TFormatSettings.Create;
  LFormat.DateSeparator := '-';
  LFormat.ShortDateFormat := 'yyyy-mm-dd';

  LAdd := IncYear( LRelease, 27 );
  Log( DateToStr( LAdd, LFormat ) );

  LConvert := StrToDate('1995-02-14', LFormat);

  LDays := DaysBetween( Today, LConvert );

  Log( Format( '%d days have passed since Delphi 1 was released.',
    [ LDays ] ) );
end;

procedure TFrmMain.Log(AText: String);
begin
  txtLog.Lines.Add( AText );
end;

end.
