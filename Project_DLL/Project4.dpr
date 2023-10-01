library Project4;



uses
  System.SysUtils,
  System.Classes;

{$R *.res}

  function Nail_Remove(DPath:Ansistring):Ansistring; Export;
  begin
    if (Length(DPath)>=2) and (DPath[1]='"') and (DPath[Length(DPath)]='"')  then
    begin
        Result:=Copy(DPath,2,Length(DPath)-2);
    end
    else
    begin
      Result:=DPath;
    end;
  end;

  Exports
  Nail_Remove;

begin
end.
