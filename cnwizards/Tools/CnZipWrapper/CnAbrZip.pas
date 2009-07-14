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

unit CnAbrZip;
{ |<PRE>
================================================================================
* ������ƣ�CnPack IDE ר�Ұ�
* ��Ԫ���ƣ���Ŀ���ݹ��ܶ� TPAbbriva Zip ���ܵķ�װ DLL
* ��Ԫ���ߣ���Х (liuxiao@cnpack.org)
* ��    ע��
* ����ƽ̨��PWin2000Pro + Delphi 5.01
* ���ݲ��ԣ�PWin9X/2000/XP + Delphi 5/6/7 + C++Builder 5/6
* �� �� �����õ�Ԫ�е��ַ��������ϱ��ػ�����ʽ
* ��Ԫ��ʶ��$Id$
* �޸ļ�¼��2009.05.23 V1.0 by liuxiao
*               ������Ԫ
================================================================================
|</PRE>}

interface

uses
  SysUtils, Classes,
  AbBase, AbBrowse, AbZBrows, AbZipper, AbArcTyp;

procedure CnStartZip(const SaveFileName: PAnsiChar; const Password: PAnsiChar;
  RemovePath: Boolean); stdcall;
{* ��ʼһ�� Zip�������ڲ�����ָ���ļ����������}

procedure CnZipAddFile(FileName: PAnsiChar); stdcall;
{* ����ļ��� Zip}

function CnZipSaveAndClose: Boolean; stdcall;
{* ѹ������ Zip �ļ����ͷ��ڲ�����}

implementation

var
  Zip: TAbZipper = nil;

procedure CnStartZip(const SaveFileName: PAnsiChar; const Password: PAnsiChar;
  RemovePath: Boolean); stdcall;
begin
  FreeAndNil(Zip);

  Zip := TAbZipper.Create(nil);
  Zip.FileName := SaveFileName;
  Zip.StoreOptions := Zip.StoreOptions + [soReplace];
  Zip.DeleteFiles('*.*');

  if RemovePath then
    Zip.StoreOptions := Zip.StoreOptions + [soStripPath];

  if Password <> '' then
    Zip.Password := Password;
end;

procedure CnZipAddFile(FileName: PAnsiChar); stdcall;
begin
  if Zip = nil then Exit;
  Zip.AddFiles(FileName, 0);
end;

function CnZipSaveAndClose: Boolean; stdcall;
begin
  Result := False;
  if Zip = nil then Exit;

  Zip.Save;
  Zip.CloseArchive;
  FreeAndNil(Zip);
  Result := True;
end;

end.
