library Project_Exe;



uses
  System.SysUtils,
  System.Classes,
  Winapi.Windows;

{$R *.res}

  procedure RunE(Path:AnsiString); Export;
  begin

    WinExec(PAnsiChar(Path),SW_SHOW);

  end;


  Exports
  RunE;

begin
end.
