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

unit CnPngUtilsIntf;
{* |<PRE>
================================================================================
* ������ƣ�CnWizards ��������
* ��Ԫ���ƣ�Png ��ʽ֧�ֵ�Ԫ
* ��Ԫ���ߣ��ܾ��� zjy@cnpack.org
* ��    ע������ pngimage �Ѿ��� Embarcadero �չ����µ����Э���ƺ������������Ŀ
*           ��Դ��Ϊ�˱����Ȩ���⣬�˴��� D2010 ��ʹ�ùٷ��� pngimage ����һ��
*           DLL �����Ͱ汾�� IDE ������ʹ�á�
* ����ƽ̨��Win7 + Delphi 2010
* ���ݲ��ԣ�
* �� �� �����õ�Ԫ�ʹ����е��ַ����Ѿ����ػ�����ʽ
* ��Ԫ��ʶ��$Id: $
* �޸ļ�¼��
*           2011.07.05 V1.0
*               ������Ԫ
================================================================================
|</PRE>}

{$I CnWizards.inc}

interface

function CnConvertPngToBmp(PngFile, BmpFile: PAnsiChar): LongBool; stdcall;
function CnConvertBmpToPng(BmpFile, PngFile: PAnsiChar): LongBool; stdcall;

implementation

function CnConvertPngToBmp; external 'CnPngLib.dll';
function CnConvertBmpToPng; external 'CnPngLib.dll';

end.
