program Project3;

uses
  Vcl.Forms,
  Unit9 in 'Unit9.pas' {Formentertainment},
  Unit1 in 'Unit1.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TFormentertainment, Formentertainment);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
