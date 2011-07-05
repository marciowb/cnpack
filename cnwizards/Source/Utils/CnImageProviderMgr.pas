{******************************************************************************}
{                       CnPack For Delphi/C++Builder                           }
{                     �й����Լ��Ŀ���Դ�������������                         }
{                   (C)Copyright 2001-2011 CnPack ������                       }
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

unit CnImageProviderMgr;
{* |<PRE>
================================================================================
* ������ƣ����������ԡ�����༭����
* ��Ԫ���ƣ�����ͼ���������������
* ��Ԫ���ߣ��ܾ��� zjy@cnpack.org
* ��    ע��
* ����ƽ̨��Win7 + Delphi 7
* ���ݲ��ԣ�
* �� �� �����õ�Ԫ�ʹ����е��ַ����Ѿ����ػ�����ʽ
* ��Ԫ��ʶ��$Id: $
* �޸ļ�¼��
*           2011.07.04 V1.0
*               ������Ԫ
================================================================================
|</PRE>}

{$I CnWizards.inc}

interface

uses
  Windows, SysUtils, Classes, Graphics;

type
  TCnImageReqInfo = record
    Keyword: string;
    Page: Integer;
    MinSize, MaxSize: Integer;
    CommercialLicenses: Boolean;
  end;

  TCnImageRespItem = class(TCollectionItem)
  private
    FId: string;
    FUrl: string;
    FBitmap: TBitmap;
    FSize: Integer;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    property Id: string read FId write FId;
    property Url: string read FUrl write FUrl;
    property Size: Integer read FSize write FSize;
    property Bitmap: TBitmap read FBitmap;
  end;

  TCnImageRespItems = class(TCollection)
  private
    function GetItems(Index: Integer): TCnImageRespItem;
    procedure SetItems(Index: Integer; const Value: TCnImageRespItem);
  public
    constructor Create;
    function Add: TCnImageRespItem;
    property Items[Index: Integer]: TCnImageRespItem read GetItems write SetItems; default;
  end;

  TCnBaseImageProvider = class
  private
    FItems: TCnImageRespItems;
  protected
    FPageCount: Integer;
    FTotalCount: Integer;
    FItemsPerPage: Integer;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    class procedure GetProviderInfo(var DispName, HomeUrl: string); virtual; abstract;

    function SearchImage(Req: TCnImageReqInfo): Boolean; virtual; abstract;
    property Items: TCnImageRespItems read FItems;
    property PageCount: Integer read FPageCount;
    property ItemsPerPage: Integer read FItemsPerPage;
    property TotalCount: Integer read FTotalCount;
  end;

  TCnImageProviderClass = class of TCnBaseImageProvider;

  TCnImageProviderMgr = class
  private
    FList: TList; 
    function GetItems(Index: Integer): TCnImageProviderClass;
  public
    constructor Create;
    destructor Destroy; override;
    procedure RegisterProvider(AClass: TCnImageProviderClass);
    
    function Count: Integer;
    property Items[Index: Integer]: TCnImageProviderClass read GetItems; default;
  end;

function ImageProviderMgr: TCnImageProviderMgr;

implementation

var
  FImageProviderMgr: TCnImageProviderMgr;
  
function ImageProviderMgr: TCnImageProviderMgr;
begin
  if FImageProviderMgr = nil then
    FImageProviderMgr := TCnImageProviderMgr.Create;
  Result := FImageProviderMgr;
end;

{ TCnImageRespItem }

constructor TCnImageRespItem.Create(Collection: TCollection);
begin
  inherited;
  FBitmap := TBitmap.Create;
end;

destructor TCnImageRespItem.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

{ TCnImageRespItems }

function TCnImageRespItems.Add: TCnImageRespItem;
begin
  Result := TCnImageRespItem(inherited Add);
end;

constructor TCnImageRespItems.Create;
begin
  inherited Create(TCnImageRespItem);
end;

function TCnImageRespItems.GetItems(Index: Integer): TCnImageRespItem;
begin
  Result := TCnImageRespItem(inherited Items[Index]);
end;

procedure TCnImageRespItems.SetItems(Index: Integer;
  const Value: TCnImageRespItem);
begin
  inherited Items[Index] := Value;
end;

{ TCnBaseImageProvider }

constructor TCnBaseImageProvider.Create;
begin
  FItems := TCnImageRespItems.Create;
end;

destructor TCnBaseImageProvider.Destroy;
begin
  FItems.Free;
  inherited;
end;

{ TCnImageProviderMgr }

function TCnImageProviderMgr.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TCnImageProviderMgr.Create;
begin
  FList := TList.Create;
end;

destructor TCnImageProviderMgr.Destroy;
begin
  FList.Free;
  inherited;
end;

function TCnImageProviderMgr.GetItems(Index: Integer): TCnImageProviderClass;
begin
  Result := TCnImageProviderClass(FList[Index]);
end;

procedure TCnImageProviderMgr.RegisterProvider(AClass: TCnImageProviderClass);
begin
  FList.Add(AClass);
end;

initialization

finalization
  if FImageProviderMgr <> nil then
    FreeAndNil(FImageProviderMgr);

end.
