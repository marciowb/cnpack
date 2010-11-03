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

unit CnIniCfg;
{* |<PRE>
================================================================================
* ������ƣ�������������
* ��Ԫ���ƣ����� RTTI �� INI �б������ò����Ļ���
* ��Ԫ���ߣ��ܾ��� (zjy@cnpack.org)
* ��    ע��
* ����ƽ̨��PWinXP SP3 + Delphi 7
* ���ݲ��ԣ�
* �� �� �����õ�Ԫ�е��ַ��������ϱ��ػ�����ʽ
* ��Ԫ��ʶ��$Id: $
* �޸ļ�¼��2010.11.03 V1.0
*               ������Ԫ
================================================================================
|</PRE>}

interface

{$I CnPack.inc}

uses
  Windows, SysUtils, Classes, TypInfo, IniFiles, Registry;

type
  TGetDefaultStringEvent = procedure (Sender: TObject; PropName: string; var Default: string) of object;

{$M+}
  TCnIniCfg = class
  private
    FIni: TCustomIniFile;
    FIniOwned: Boolean;
    FDefaultStrings: TStringList;
    FOnGetDefaultString: TGetDefaultStringEvent;
    FPropList: PPropList;
    FPropCount: Integer;
  protected
    function GetBoolean(const Index: Integer): Boolean;
    procedure SetBoolean(const Index: Integer; const Value: Boolean);
    function GetInteger(const Index: Integer): Integer;
    procedure SetInteger(const Index, Value: Integer);
    function GetString(const Index: Integer): string;
    procedure SetString(const Index: Integer; const Value: string);
    procedure DoCreate;
    procedure InitPropLists;
    procedure FreePropLists;
    
    function GetDefaultString(const PropName: string): string; virtual;
    procedure InitDefaultStrings(Strings: TStringList); virtual;
    
    property DefaultStrings: TStringList read FDefaultStrings;
  public
    constructor Create(IniFile: TCustomIniFile; Owned: Boolean = False); overload;
    constructor Create(IniName: string); overload;
    constructor Create(RootKey: HKEY; RegPath: string); overload;
    destructor Destroy; override;
    
    property Ini: TCustomIniFile read FIni;
    property OnGetDefaultString: TGetDefaultStringEvent read FOnGetDefaultString write FOnGetDefaultString;
  end;
{$M-}

implementation

{ TCnIniCfg }

constructor TCnIniCfg.Create(IniFile: TCustomIniFile; Owned: Boolean);
begin
  DoCreate;
  FIni := IniFile;
  FIniOwned := Owned;
end;

constructor TCnIniCfg.Create(IniName: string);
begin
  DoCreate;
  FIni := TIniFile.Create(IniName);
  FIniOwned := True;
end;

constructor TCnIniCfg.Create(RootKey: HKEY; RegPath: string);
begin
  DoCreate;
  FIni := TRegistryIniFile.Create(RegPath);
  TRegistryIniFile(FIni).RegIniFile.RootKey := RootKey;
  FIniOwned := True;
end;

destructor TCnIniCfg.Destroy;
begin
  if FIniOwned then
    FIni.Free;
  FreePropLists;
  FDefaultStrings.Free;
  inherited;
end;

procedure TCnIniCfg.DoCreate;
begin
  InitPropLists;
  FDefaultStrings := TStringList.Create;
  InitDefaultStrings(FDefaultStrings);
end;

procedure TCnIniCfg.InitDefaultStrings(Strings: TStringList);
begin

end;

procedure TCnIniCfg.InitPropLists;
begin
  FPropCount := GetPropList(ClassInfo, [tkInteger, tkEnumeration, tkString, tkLString], nil);
  if FPropCount > 0 then
    FPropList := GetMemory(FPropCount * SizeOf(PPropInfo));
  GetPropList(ClassInfo, [tkInteger, tkEnumeration, tkString, tkLString], FPropList);
end;

procedure TCnIniCfg.FreePropLists;
begin
  FreeMem(FPropList);
end;

function TCnIniCfg.GetDefaultString(const PropName: string): string;
begin
  Result := FDefaultStrings.Values[PropName];
  if Assigned(FOnGetDefaultString) then
    FOnGetDefaultString(Self, PropName, Result);
end;

function TCnIniCfg.GetBoolean(const Index: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to FPropCount - 1 do
    if (FPropList[i].PropType^ = TypeInfo(Boolean)) and (FPropList[i].Index = Index) then
    begin
      Result := FIni.ReadBool('Boolean', FPropList[i].Name, FPropList[i].Default <> 0);
      Exit;
    end;
end;

function TCnIniCfg.GetInteger(const Index: Integer): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to FPropCount - 1 do
    if (FPropList[i].PropType^.Kind = tkInteger) and (FPropList[i].Index = Index) then
    begin
      Result := FIni.ReadInteger('Integer', FPropList[i].Name,
        FPropList[i].Default);
      Exit;
    end;
end;

function TCnIniCfg.GetString(const Index: Integer): string;
var
  i: Integer;
begin
  for i := 0 to FPropCount - 1 do
    if (FPropList[i].PropType^.Kind in [tkString, tkLString]) and (FPropList[i].Index = Index) then
    begin
      Result := FIni.ReadString('String', FPropList[i].Name,
        GetDefaultString(FPropList[i].Name));
      Exit;
    end;
end;

procedure TCnIniCfg.SetBoolean(const Index: Integer;
  const Value: Boolean);
var
  i: Integer;
begin
  for i := 0 to FPropCount - 1 do
    if (FPropList[i].PropType^ = TypeInfo(Boolean)) and (FPropList[i].Index = Index) then
    begin
      FIni.WriteBool('Boolean', FPropList[i].Name, Value);
      Exit;
    end;
end;

procedure TCnIniCfg.SetInteger(const Index, Value: Integer);
var
  i: Integer;
begin
  for i := 0 to FPropCount - 1 do
    if (FPropList[i].PropType^.Kind = tkInteger) and (FPropList[i].Index = Index) then
    begin
      FIni.WriteInteger('Integer', FPropList[i].Name, Value);
      Exit;
    end;
end;

procedure TCnIniCfg.SetString(const Index: Integer; const Value: string);
var
  i: Integer;
begin
  for i := 0 to FPropCount - 1 do
    if (FPropList[i].PropType^.Kind in [tkString, tkLString]) and (FPropList[i].Index = Index) then
    begin
      FIni.WriteString('String', FPropList[i].Name, Value);
      Exit;
    end;
end;

end.

