{*******************************************************}
{                                                       }
{       Pascal Script Source File                       }
{       Run by RemObjects Pascal Script in CnWizards    }
{                                                       }
{       Generated by CnPack IDE Wizards                 }
{                                                       }
{*******************************************************}

program SetBookmark;

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

var
  View: IOTAEditView;
  I: Integer;
  BookMarkPos: TOTACharPos;
  ValidBookMarkId: Integer;
begin
  View := CnOtaGetTopMostEditView(nil);
  if View <> nil then
  begin
    ValidBookMarkId := -1;
    for I := 0 to 9 do
    begin
      BookMarkPos := View.GetBookmarkPos(I);
      if (BookMarkPos.CharIndex = 0) and (BookMarkPos.Line = 0) then
      begin
        // It means this bookmark id (I) is not used
        ValidBookMarkId := I;
        Break;
      end;
    end;

    if ValidBookMarkId <> -1 then
    begin
      View.BookmarkRecord(ValidBookMarkId);
      View.Paint;
    end
    else
      Writeln('NO valid bookmark id. Maybe all used.');
  end;
end.

