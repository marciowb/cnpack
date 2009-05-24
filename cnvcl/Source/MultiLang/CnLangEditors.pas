{******************************************************************************}
{                       CnPack For Delphi/C++Builder                           }
{                     �й����Լ��Ŀ���Դ�������������                         }
{                   (C)Copyright 2001-2009 CnPack ������                       }
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

unit CnLangEditors;
{* |<PRE>
================================================================================
* ������ƣ�CnPack �����
* ��Ԫ���ƣ�������������Ա༭����Ԫ
* ��Ԫ���ߣ�CnPack������ ��Х (liuxiao@cnpack.org)
* ��    ע���õ�Ԫʵ���˶�����Ĳ������Ա༭��
* ����ƽ̨��PWin2000 + Delphi 5.0
* ���ݲ��ԣ�PWin9X/2000/XP + Delphi 5/6/7
* �� �� �����õ�Ԫ�е��ַ��������ϱ��ػ�����ʽ
* ��Ԫ��ʶ��$Id: CnLangEditors.pas,v 1.12 2009/01/02 08:27:39 liuxiao Exp $
* �޸ļ�¼��2003.08.20 V1.0
*               ������Ԫ��ʵ�ֹ���
================================================================================
|</PRE>}

interface

{$I CnPack.inc}

uses
  {$IFDEF COMPILER6_UP}
  DesignIntf, DesignEditors,
  {$ELSE}
  Dsgnintf,
  {$ENDIF}
  SysUtils, Classes, FileCtrl;

type
  TCnLanguageItemProperty = class(TPropertyEditor)
  {* ��� TCnLanguageItem �� LanugageID �����Ա༭��}
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
  end;

  TCnLangManagerProperty = class(TPropertyEditor)
  {* ��� TCnLanguageManager �� CurrentLanugageIndex �����Ա༭��}
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
  end;

  TCnLanguagePathProperty = class(TStringProperty)
  {* ��� TCnLangFileStorage �� LanugagePath �����Ա༭��}
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

{$IFDEF DELPHI}
  TCnStorageEditor = class(TComponentEditor)
  {* ��Զ���洢���˫���ı༭������Ŀ������༭��}
  public
    procedure Edit; override;
    {* ˫���Ĺ��� }
    procedure ExecuteVerb(Index: Integer); override;
    {* ִ���Ҽ��˵��Ĺ��� }
    function GetVerb(Index: Integer): string; override;
    {* �����Ҽ��˵���Ŀ }
    function GetVerbCount: Integer; override;
    {* �����Ҽ��˵���Ŀ�� }
  end;
{$ENDIF}

implementation

uses
  CnLangMgr, CnLangStorage, CnLangUtils, CnLangConsts
  {$IFDEF DELPHI}, ColnEdit{$ENDIF};

{ TCnLanguageItemProperty }

function TCnLanguageItemProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paSortList, paRevertable];
end;

function TCnLanguageItemProperty.GetValue: string;
begin
  Result := InttoStr(GetOrdValue);
end;

procedure TCnLanguageItemProperty.GetValues(Proc: TGetStrProc);
var
  i: Integer;
begin
  for i := 0 to CnLanguages.Count - 1 do
    Proc(CnLanguages.ID[i] + ' ' + CnLanguages.Name[i]);
end;

procedure TCnLanguageItemProperty.SetValue(const Value: string);
begin
  if Pos(' ', Value) > 0 then
    SetOrdValue(StrToInt(Copy(Value, 1, Pos(' ', Value) - 1)))
  else
    SetOrdValue(StrToInt(Value));
end;

{ TCnLangManagerProperty }

function TCnLangManagerProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paSortList, paRevertable];
end;

function TCnLangManagerProperty.GetValue: string;
begin
  Result := InttoStr(GetOrdValue);
end;

procedure TCnLangManagerProperty.GetValues(Proc: TGetStrProc);
var
  i: Integer;
  Storage: TCnCustomLangStorage;
begin
  if (GetComponent(0) <> nil) and
    ((GetComponent(0) as TCnCustomLangManager).LanguageStorage <> nil) then
  begin
    Storage := (GetComponent(0) as TCnCustomLangManager).LanguageStorage;
    for i := 0 to Storage.Languages.Count - 1 do
      Proc(InttoStr(i) + ' - ' + InttoStr(Storage.Languages.Items[i].LanguageID)
        + ' - ' + Storage.Languages.Items[i].LanguageName);
  end;
end;

procedure TCnLangManagerProperty.SetValue(const Value: string);
begin
  if Pos(' ', Value) > 0 then
    SetOrdValue(StrToInt(Copy(Value, 1, Pos(' ', Value) - 1)))
  else
    SetOrdValue(StrToInt(Value));
end;

{ TCnLangguagePathProperty }

procedure TCnLanguagePathProperty.Edit;
var
  S: String;
begin
  if SelectDirectory(SCnLanguagePath, '', S) then
    SetStrValue(S);
end;

function TCnLanguagePathProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paDialog, paRevertable];
end;

{$IFDEF DELPHI}

{ TCnStorageEditor }

procedure TCnStorageEditor.Edit;
begin
  if Component is TCnCustomLangStorage then
    ShowCollectionEditor(Designer, Component,
      TCnCustomLangStorage(Component).Languages, 'Languages');
end;

procedure TCnStorageEditor.ExecuteVerb(Index: Integer);
begin
  // Do Nothing.
end;

function TCnStorageEditor.GetVerb(Index: Integer): string;
begin
  Result := '';
end;

function TCnStorageEditor.GetVerbCount: Integer;
begin
  Result := 0;
end;

{$ENDIF}

end.
