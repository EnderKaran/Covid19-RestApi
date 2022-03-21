unit getFromDataApi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ControlList, Vcl.VirtualImage,
  Vcl.StdCtrls, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Vcl.BaseImageCollection, Vcl.ImageCollection,
  System.JSON;

type
  TCovidData = record
    Key: string;
    Value: string;
  end;

  TFMain = class(TForm)
    ControlList1: TControlList;
    Label1: TLabel;
    VirtualImage1: TVirtualImage;
    Label2: TLabel;
    ControlListButton1: TControlListButton;
    ControlListButton2: TControlListButton;
    ImageCollection1: TImageCollection;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    procedure FormActivate(Sender: TObject);
    procedure ControlList1BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
  private
    { Private declarations }
    CovidData: TArray<TCovidData>;
    procedure GetCovid19DataFromApi;
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}
{ TFMain }

procedure TFMain.ControlList1BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
  ARect: TRect; AState: TOwnerDrawState);
begin
  Label2.Caption := CovidData[AIndex].Key;
  Label1.Caption := CovidData[AIndex].Value;
  VirtualImage1.ImageIndex := 0;
  if CovidData[AIndex].Value = 'Thailand' then
  begin
    VirtualImage1.ImageIndex := 2;
  end

  else if Pos('DEATHS', UpperCase(CovidData[AIndex].Key)) > 0 then
  begin
    VirtualImage1.ImageIndex := 1;
  end;

end;

procedure TFMain.FormActivate(Sender: TObject);
begin
  GetCovid19DataFromApi;
end;

procedure TFMain.GetCovid19DataFromApi;
var
  jsv: TJSONValue;
  jsPair: TJSONPair;
  jso: TJSONObject;
  i: integer;
begin
  try
    RESTRequest1.Execute;
    if RESTResponse1.StatusCode = 200 then
    begin
      jsv := TJSONObject.ParseJSONValue(RESTResponse1.Content);
      jso := jsv as TJSONObject;
      SetLength(CovidData, jso.Count);
      i := 0;
      try
        for jsPair in jso do
        begin
          CovidData[i].Key := jsPair.JsonString.Value;
          CovidData[i].Value := jsPair.JsonValue.Value;
          Inc(i);
        end;
        ControlList1.Enabled := False;
        ControlList1.ItemCount := jso.Count;
        ControlList1.Enabled := True;
      finally
        jsv.Free;
      end;
    end;
  except
    on E: exception do
    begin
      ShowMessage(format('', [E.ClassName, E.Message]));
    end;
  end;
end;

end.
