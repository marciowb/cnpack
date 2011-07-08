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

unit CnImageProvider_FindIcons;
{* |<PRE>
================================================================================
* ������ƣ����������ԡ�����༭����
* ��Ԫ���ƣ�www.FindIcons.com ����֧�ֵ�Ԫ
* ��Ԫ���ߣ��ܾ��� zjy@cnpack.org
* ��    ע��
* ����ƽ̨��Win7 + Delphi 7
* ���ݲ��ԣ�
* �� �� �����õ�Ԫ�ʹ����е��ַ����Ѿ����ػ�����ʽ
* ��Ԫ��ʶ��$Id: $
* �޸ļ�¼��
*           2011.07.08 V1.0
*               ������Ԫ
================================================================================
|</PRE>}

{$I CnWizards.inc}

interface

uses
  Windows, SysUtils, Classes, Graphics, CnImageProviderMgr, CnInetUtils,
  OmniXML, OmniXMLUtils, CnCommon;

type
  TCnImageProvider_FindIcons = class(TCnBaseImageProvider)
  protected
    function DoSearchImage(Req: TCnImageReqInfo): Boolean; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    class procedure GetProviderInfo(var DispName, HomeUrl: string); override;
    procedure OpenInBrowser(Item: TCnImageRespItem); override;
    function SearchIconset(Item: TCnImageRespItem; var Req: TCnImageReqInfo): Boolean; override;
  end;


implementation

{ TCnImageProvider_FindIcons }

constructor TCnImageProvider_FindIcons.Create;
begin
  inherited;
  FItemsPerPage := 20;
  FFeatures := [pfOpenInBrowser, pfSearchIconset];
end;

destructor TCnImageProvider_FindIcons.Destroy;
begin

  inherited;
end;

class procedure TCnImageProvider_FindIcons.GetProviderInfo(var DispName,
  HomeUrl: string);
begin
  DispName := 'FindIcons.com';
  HomeUrl := 'http://www.findicons.com';
end;

function TCnImageProvider_FindIcons.DoSearchImage(
  Req: TCnImageReqInfo): Boolean;
var
  Url, Text, KeyStr, PageStr, LicStr: string;
  i, j, size: Integer;
  Item: TCnImageRespItem;
begin
  Result := False;
  KeyStr := Req.Keyword;
  if Req.Page = 0 then
    PageStr := ''
  else
    PageStr := '/' + IntToStr(Req.Page + 1);
  if Req.CommercialLicenses then
    LicStr := 'cf'
  else
    LicStr := 'all';
  Url := Format('http://findicons.com/search/%s%s?icons=%d&width_from=%d&width_to=%d&color=all&style=all&order=default&license=%s&icon_box=small&icon=&png_file=&output_format=jpg',
    [Req.Keyword, PageStr, FItemsPerPage, Req.MinSize, Req.MaxSize, LicStr]);
  with TCnHTTP.Create do
  try
    HttpRequestHeaders.Add('x-requested-with: XMLHttpRequest');
    NoCookie := True;
    Text := GetString(Url);
  finally
    Free;
  end;
  // todo:
end;

procedure TCnImageProvider_FindIcons.OpenInBrowser(Item: TCnImageRespItem);
begin
  inherited;

end;

function TCnImageProvider_FindIcons.SearchIconset(Item: TCnImageRespItem;
  var Req: TCnImageReqInfo): Boolean;
begin

end;

initialization
  ImageProviderMgr.RegisterProvider(TCnImageProvider_FindIcons);

end.
