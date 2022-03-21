program dataApi;

uses
  Vcl.Forms,
  getFromDataApi in 'getFromDataApi.pas' {FMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
