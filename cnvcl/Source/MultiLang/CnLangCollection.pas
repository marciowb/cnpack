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

unit CnLangCollection;
{* |<PRE>
================================================================================
* ������ƣ�CnPack �����
* ��Ԫ���ƣ�������Ŀ���������б��൥Ԫ
* ��Ԫ���ߣ�CnPack������ ��Х (liuxiao@cnpack.org)
* ��    ע���õ�Ԫʵ����������Ŀ���������б���
* ����ƽ̨��PWin2000 + Delphi 5.0
* ���ݲ��ԣ�PWin9X/2000/XP + Delphi 5/6/7
* �� �� �����õ�Ԫ�е��ַ��������ϱ��ػ�����ʽ
* ��Ԫ��ʶ��$Id: CnLangCollection.pas,v 1.12 2009/01/02 08:27:39 liuxiao Exp $
* �޸ļ�¼��2003.12.13 V1.1
*               �� DefaultFont ��������Դ�ƶ��� LanguageItem �У�
*               ÿ�����Կ�����һ������ DefaultFont���������� Storage ��
*           2003.08.20 V1.0
*               ������Ԫ��ʵ�ֹ���
================================================================================
|</PRE>}

interface
{$I CnPack.inc}

uses
  SysUtils, Classes, Windows, Graphics, CnIniStrUtils;

type

  TCnLanguageItem = class (TCollectionItem)
  {* ������Ŀ������ }
  private
    FLanguageName: String;
    FAuthor: string;
    FAuthorEmail: string;
    FAbbreviation: string;
    FLanguageFileName: string;
    FLanguageDirName: string;
    FLanguageID: LongWord;
    FOnLanguageIDChanged: TNotifyEvent;
    FDefaultFont: TFont;
    function GetAbbreviation: string;
    function GetLanguageName: string;
    procedure SetAbbreviation(Value: string);
    function GetLanguageFileName: String;
    procedure SetLanguageFileName(const Value: String);
    procedure SetDefaultFont(Value: TFont);
    function GetDefaultFontStr: string;
    function GetLanguageDirName: string;
    procedure SetLanguageDirName(const Value: string);
  protected
    procedure SetAuthor(Value: string);
    procedure SetAuthorEmail(Value: string);
    procedure SetLanguageID(Value: LongWord);
    procedure SetLanguageName(Value: string);
    procedure DoLanguageIDChanged; virtual;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

    function IsValidLanguageID(ALanguageID: LongWord): Boolean;
    {* �ж�һ ID �Ƿ��ǺϷ������� ID }
    property OnLanguageIDChanged: TNotifyEvent read FOnLanguageIDChanged
      write FOnLanguageIDChanged;
    {* ������ ID �����ı�ʱ���� }
    property DefaultFontStr: string read GetDefaultFontStr;
    {* Ĭ�ϵ����� Font �� Str}
  published
    property Abbreviation: string read GetAbbreviation write SetAbbreviation;
    {* �����Ե���д�������� LanguageID ʱ���Զ����� }
    property Author: string read FAuthor write SetAuthor;
    {* �����Եķ�����Ŀ������ }
    property AuthorEmail: string read FAuthorEmail write SetAuthorEmail;
    {* �����Եķ�����Ŀ�����ߵĵ����ʼ���ַ }
    property LanguageID: LongWord read FLanguageID write SetLanguageID;
    {* �����Ե� ID �� }
    property LanguageName: string read GetLanguageName write SetLanguageName;
    {* �����Ե����ƣ������� LanguageID ʱ���Զ����� }
    property LanguageFileName: string read GetLanguageFileName
      write SetLanguageFileName;
    {* ���ؿ��õı����ļ����������Դ洢���ʹ�ã����ļ���ʽ�洢ʱ������Ч }
    property LanguageDirName: string read GetLanguageDirName
      write SetLanguageDirName;
    {* ���ؿ��õı�������Ŀ¼������Ŀ¼��ʽ�洢ʱ������Ч }
    property DefaultFont: TFont read FDefaultFont write SetDefaultFont;
    {* �����Ե�Ĭ�� Font���ڲ�ʹ�� FontStr �洢 }
  end;

  TCnLanguageCollection = class (TOwnedCollection)
  {* ���������б� }
  private
    function GetItems(Index: Integer): TCnLanguageItem;
    procedure SetItems(Index: Integer; Value: TCnLanguageItem);
  public
    constructor Create(AOwner: TPersistent); reintroduce;
    function Add: TCnLanguageItem;
    {* ����һ�µ�������Ŀ }
    function Find(ALanguageID: LongWord): Integer; overload;
    {* �������� ID ����������Ŀ }
    function Find(ALanguageName: string): Integer; overload;
    {* �����������Ʋ���������Ŀ }
    property Items[Index: Integer]: TCnLanguageItem read GetItems write
      SetItems; default;
    {* ����ĳ��������Ŀ }
  end;

implementation

uses
  CnLangConsts, CnLangUtils, CnLangStorage;

{***************************** TCnLanguageItem ******************************}

procedure TCnLanguageItem.DoLanguageIDChanged;
begin
  if Assigned(FOnLanguageIDChanged) then
    FOnLanguageIDChanged(Self);
end;

function TCnLanguageItem.GetAbbreviation: string;
begin
  Result := FAbbreviation;
end;

function TCnLanguageItem.GetLanguageFileName: String;
begin
  Result := FLanguageFileName;
end;

function TCnLanguageItem.GetLanguageName: string;
begin
  Result := FLanguageName;
end;

function TCnLanguageItem.IsValidLanguageID(ALanguageID: LongWord): Boolean;
begin
  try
    Result := CnLanguages.IndexOf(ALanguageID) >= 0;
  except
    raise ELanguageStorageError.Create(SCnErrorInCheckingLanguage);
  end;
end;

procedure TCnLanguageItem.SetAbbreviation(Value: string);
begin
  if FAbbreviation <> Value then
    FAbbreviation := Value;
end;

procedure TCnLanguageItem.SetAuthor(Value: string);
begin
  if FAuthor <> Value then
  begin
    FAuthor := Value;
    
  end;
end;

procedure TCnLanguageItem.SetAuthorEmail(Value: string);
begin
  if FAuthorEmail <> Value then
  begin
    FAuthorEmail := Value;

  end;
end;

procedure TCnLanguageItem.SetLanguageFileName(const Value: String);
begin
  FLanguageFileName := Value;
end;

procedure TCnLanguageItem.SetLanguageID(Value: LongWord);
begin
  if FLanguageID <> Value then
  begin
    if Value = 0 then
    begin
      FLanguageID := Value;
      LanguageName := '';
      Abbreviation := '';
      LanguageFileName := '';

      LanguageDirName := '';
      DoLanguageIDChanged;
    end
    else if IsValidLanguageID(Value) then
    begin
      FLanguageID := Value;
      LanguageName := CnLanguages.NameFromLocaleID[Value];
      Abbreviation := CnLanguages.Ext[CnLanguages.IndexOf(Value)];
      if LanguageFileName = '' then
        LanguageFileName := Abbreviation;

      LanguageDirName := IntToStr(Value);
      DoLanguageIDChanged;
    end
    else
      raise ELanguageStorageError.CreateFmt(SCnInvalidLanguageIDError, [Value]);
  end;
end;

procedure TCnLanguageItem.SetLanguageName(Value: string);
begin
  if FLanguageName <> Value then
  begin
    FLanguageName := Value;

  end;
end;

procedure TCnLanguageItem.SetDefaultFont(Value: TFont);
begin
  FDefaultFont.Assign(Value);
end;

constructor TCnLanguageItem.Create(Collection: TCollection);
begin
  inherited;
  FDefaultFont := TFont.Create;
end;

destructor TCnLanguageItem.Destroy;
begin
  FDefaultFont.Free;
  inherited;
end;

function TCnLanguageItem.GetDefaultFontStr: string;
begin
  Result := FontToString(FDefaultFont);
end;

constructor TCnLanguageCollection.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner, TCnLanguageItem);
end;

function TCnLanguageCollection.Add: TCnLanguageItem;
begin
  Result := TCnLanguageItem(inherited Add);
end;

function TCnLanguageCollection.Find(ALanguageID: LongWord): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if Items[i].LanguageID = ALanguageID then
    begin
      Result := i;
      Exit;
    end;
end;

function TCnLanguageCollection.Find(ALanguageName: string): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if Items[i].LanguageName = ALanguageName then
    begin
      Result := i;
      Exit;
    end;
end;

function TCnLanguageCollection.GetItems(Index: Integer): TCnLanguageItem;
begin
  Result := TCnLanguageItem(inherited Items[Index]);
end;

procedure TCnLanguageCollection.SetItems(Index: Integer; Value: TCnLanguageItem);
begin
  inherited Items[Index] := Value;
end;

function TCnLanguageItem.GetLanguageDirName: string;
begin
  Result := FLanguageDirName;
end;

procedure TCnLanguageItem.SetLanguageDirName(const Value: string);
begin
  FLanguageDirName := Value;
end;

end.
