unit UnitRun;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

    procedure RunE(Path:AnsiString); Far; External 'Project4.dll';

    function Nail_Remove(DPath:Ansistring):Ansistring; Far; External 'Project_Exe.dll';

procedure TForm3.Button1Click(Sender: TObject);
begin
   var EditPath:Ansistring :=Edit1.Text;
   try
      if(FileExists(EditPath)) then
        begin
            if LowerCase(ExtractFileExt(EditPath))='.exe' then
              begin
                  EditPath:=Nail_Remove(EditPath);
                  RunE(EditPath);
              end;

        end
        else
        begin
          MessageDlg('Dosya Bulunamad�!', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
        end;
   except
   on E:Exception do
      MessageDlg('Bir Hata Meydana Geldi! ' + E.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
   end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
Form3.Position:=poScreenCenter;
Form3.BorderStyle:=bsToolWindow;
Label1.Caption:='Bu progmram, klas�r, belge veya internet kayna��n�n ad�n� '+#13#10+' yazd���n�zda Windows sizin i�in a�akacakt�r.';
end;

end.
