{******************************************************************************}
{                       CnPack For Delphi/C++Builder                           }
{                     �й����Լ��Ŀ���Դ�������������                         }
{                   (C)Copyright 2001-2010 CnPack ������                       }
{                   ------------------------------------                       }
{                                                                              }
{            ���������ǿ�Դ��������������������� CnPack �ķ���Э������        }
{        �ĺ����·�����һ����                                                }
{                                                                              }
{            ������һ��������Ŀ����ϣ�������ã���û���κε���������û��        }
{        �ʺ��ض�Ŀ�Ķ������ĵ���������ϸ���������� CnPack ����Э�顣        }
{                                                                              }
{            ��Ӧ���Ѿ��Ϳ�����һ���յ�һ�� CnPack ����Э��ĸ��������        }
{        ��û�У��ɷ������ǵ���վ��                                            }
{                                                                              }
{            ��վ��ַ��http://www.cnpack.org                                   }
{            �����ʼ���master@cnpack.org                                       }
{                                                                              }
{******************************************************************************}

unit CnLangUtils;
{* |<PRE>
================================================================================
* ������ƣ�CnPack �����
* ��Ԫ���ƣ����﹤���൥Ԫ
* ��Ԫ���ߣ�CnPack������ ��Х (liuxiao@cnpack.org)
* ��    ע���õ�Ԫ�����˶��﹤����
* ����ƽ̨��PWin2000 + Delphi 5.0
* ���ݲ��ԣ�PWin9X/2000/XP + Delphi 5/6/7
* �� �� �����õ�Ԫ�е��ַ��������ϱ��ػ�����ʽ
* ��Ԫ��ʶ��$Id$
* �޸ļ�¼��2006.10.12 V1.0
*               ������Ԫ��ʵ�ֹ���
================================================================================
|</PRE>}

interface

{$I CnPack.inc}

uses
  SysUtils, SysConst, Classes, Windows;

type
  {* �� SysUtils �� TLanguages ��ֲ������������ DEP ����������б���}
  TCnLanguages = class(TObject)
  private
    FSysLangs: array of TLangRec;
    function LocalesCallback(LocaleID: PChar): Integer; stdcall;
    function GetExt(Index: Integer): string;
    function GetID(Index: Integer): string;
    function GetLCID(Index: Integer): LCID;
    function GetName(Index: Integer): string;
    function GetNameFromLocaleID(ID: LCID): string;
    function GetNameFromLCID(const ID: string): string;
    function GetCount: integer;
  public
    constructor Create;
    destructor Destroy; override;
    function IndexOf(ID: LCID): Integer;
    property Count: Integer read GetCount;
    property Name[Index: Integer]: string read GetName;
    property NameFromLocaleID[ID: LCID]: string read GetNameFromLocaleID;
    property NameFromLCID[const ID: string]: string read GetNameFromLCID;
    property ID[Index: Integer]: string read GetID;
    property LocaleID[Index: Integer]: LCID read GetLCID;
    property Ext[Index: Integer]: string read GetExt;
  end;

function CnLanguages: TCnLanguages;
{* ����ȫ�ֵ� CnLanguages �б���}

implementation

const
  THUNK_SIZE = 4096; // x86 ҳ��С
  
var
  FLanguages: TCnLanguages;
  FTempLanguages: TCnLanguages = nil;

function EnumLocalesCallback(LocaleID: PChar): Integer; stdcall;
begin
  Result := FTempLanguages.LocalesCallback(LocaleID);
end;
  
{ TCnLanguages }

function GetLocaleDataW(ID: LCID; Flag: DWORD): string;
var
  Buffer: array[0..1023] of WideChar;
begin
  Buffer[0] := #0;
  GetLocaleInfoW(ID, Flag, Buffer, SizeOf(Buffer) div 2);
  Result := Buffer;
end;

function GetLocaleDataA(ID: LCID; Flag: DWORD): string;
var
  Buffer: array[0..1023] of AnsiChar;
begin
  Buffer[0] := #0;
  SetString(Result, Buffer, GetLocaleInfoA(ID, Flag, Buffer, SizeOf(Buffer)) - 1);
end;

function TCnLanguages.LocalesCallback(LocaleID: PChar): Integer; stdcall;
var
  AID: LCID;
  ShortLangName: string;
  GetLocaleDataProc: function (ID: LCID; Flag: DWORD): string;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    GetLocaleDataProc := @GetLocaleDataW
  else
    GetLocaleDataProc := @GetLocaleDataA;
  AID := StrToInt('$' + Copy(LocaleID, 5, 4));
  ShortLangName := GetLocaleDataProc(AID, LOCALE_SABBREVLANGNAME);
  if ShortLangName <> '' then
  begin
    SetLength(FSysLangs, Length(FSysLangs) + 1);
    with FSysLangs[High(FSysLangs)] do
    begin
      FName := GetLocaleDataProc(AID, LOCALE_SLANGUAGE);
      FLCID := AID;
      FExt := ShortLangName;
    end;
  end;
  Result := 1;
end;

constructor TCnLanguages.Create;
begin
  inherited Create;
  FTempLanguages := Self; 
  EnumSystemLocales(@EnumLocalesCallback, LCID_SUPPORTED);
end;

destructor TCnLanguages.Destroy;
begin

  inherited;
end;

function TCnLanguages.GetCount: Integer;
begin
  Result := High(FSysLangs) + 1;
end;

function TCnLanguages.GetExt(Index: Integer): string;
begin
  Result := FSysLangs[Index].FExt;
end;

function TCnLanguages.GetID(Index: Integer): string;
begin
  Result := HexDisplayPrefix + IntToHex(FSysLangs[Index].FLCID, 8);
end;

function TCnLanguages.GetLCID(Index: Integer): LCID;
begin
  Result := FSysLangs[Index].FLCID;
end;

function TCnLanguages.GetName(Index: Integer): string;
begin
  Result := FSysLangs[Index].FName;
end;

function TCnLanguages.GetNameFromLocaleID(ID: LCID): string;
var
  Index: Integer;
begin
  Index := IndexOf(ID);
  if Index <> - 1 then Result := Name[Index];
  if Result = '' then Result := SUnknown;
end;

function TCnLanguages.GetNameFromLCID(const ID: string): string;
begin
  Result := NameFromLocaleID[StrToIntDef(ID, 0)];
end;

function TCnLanguages.IndexOf(ID: LCID): Integer;
begin
  for Result := Low(FSysLangs) to High(FSysLangs) do
    if FSysLangs[Result].FLCID = ID then Exit;
  Result := -1;
end;

function CnLanguages: TCnLanguages;
begin
  if FLanguages = nil then
    FLanguages := TCnLanguages.Create;
  Result := FLanguages;
end;

initialization

finalization
  if FLanguages <> nil then
    FreeAndNil(FLanguages);

end.
