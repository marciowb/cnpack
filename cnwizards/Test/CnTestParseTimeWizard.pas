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

unit CnTestParseTimeWizard;
{ |<PRE>
================================================================================
* ������ƣ�CnPack IDE ר�Ұ�
* ��Ԫ���ƣ�������ʱ����ר����ʾ��Ԫ
* ��Ԫ���ߣ�CnPack ������
* ��    ע���õ�Ԫ�Ǳ༭���ⲿ�������Ĳ��Ե�Ԫ
* ����ƽ̨��PWin2000Pro + Delphi 5.01
* ���ݲ��ԣ�PWin9X/2000/XP + Delphi 5/6/7 + C++Builder 5/6
* �� �� �����ô����е��ַ����ݲ�֧�ֱ��ػ�����ʽ
* ��Ԫ��ʶ��$Id:  CnTestParseTimeWizard.pas,v 1.3 2009/01/06 15:26:27 liuxiao Exp $
* �޸ļ�¼��2009.06.06 V1.0
*               ������Ԫ
================================================================================
|</PRE>}

interface

{$I CnWizards.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolsAPI, IniFiles, StdCtrls, CnPasCodeParser, mPasLex, Contnrs,
  CnWizClasses, CnWizUtils, CnWizConsts, CnEditControlWrapper;

type

//==============================================================================
// ������ʱ�����ò˵�ר��
//==============================================================================

{ TCnTestParseTimeWizard }

  TCnTestParseTimeWizard = class(TCnMenuWizard)
  private

  protected
    function GetHasConfig: Boolean; override;
  public
    function GetState: TWizardState; override;
    procedure Config; override;
    procedure LoadSettings(Ini: TCustomIniFile); override;
    procedure SaveSettings(Ini: TCustomIniFile); override;
    class procedure GetWizardInfo(var Name, Author, Email, Comment: string); override;
    function GetCaption: string; override;
    function GetHint: string; override;
    function GetDefShortCut: TShortCut; override;
    procedure Execute; override;

    destructor Destroy; override;
  end;

implementation

//==============================================================================
// ������ʱ�����ò˵�ר��
//==============================================================================

{ TCnSampleMenuWizard }

procedure TCnTestParseTimeWizard.Config;
begin
  ShowMessage('Test option.');
  { TODO -oAnyone : �ڴ���ʾ���ô��� }
end;

destructor TCnTestParseTimeWizard.Destroy;
begin
  
  inherited;
end;

procedure TCnTestParseTimeWizard.Execute;
var
  Tick: Cardinal;
  EditView: IOTAEditView;
  Stream: TMemoryStream;
  CharPos: TOTACharPos;
  EditPos: TOTAEditPos;
  Parser: TCnPasStructureParser;
  I: Integer;
  List: TObjectList;
  Token: TCnPasToken;
begin
  Stream := TMemoryStream.Create;
  Parser := TCnPasStructureParser.Create;
  try
    EditView := CnOtaGetTopMostEditView;
    CnOtaSaveEditorToStream(EditView.Buffer, Stream);
    // ������ǰ��ʾ��Դ�ļ�������ʱ��
    Tick := GetTickCount;
    Parser.ParseSource(PAnsiChar(Stream.Memory),
      IsDpr(EditView.Buffer.FileName), True);
    Tick := GetTickCount - Tick;
  finally
    Parser.Free;
    Stream.Free;
  end;

  ShowMessage('Parse Time: ' + IntToStr(Tick));

  List := TObjectList.Create(True);
  Tick := GetTickCount;
  for I := 0 to 100000 - 1 do
  begin
    Token := TCnPasToken.Create;
    List.Add(Token);
  end;
  Tick := GetTickCount - Tick;

  ShowMessage('Create 100000 Time: ' + IntToStr(Tick));
  List.Free;
end;

function TCnTestParseTimeWizard.GetCaption: string;
begin
  Result := 'Test Parse Time';
  { TODO -oAnyone : ����ר�Ҳ˵��ı��⣬�ַ�������б��ػ����� }
end;

function TCnTestParseTimeWizard.GetDefShortCut: TShortCut;
begin
  Result := 0;
  { TODO -oAnyone : ����Ĭ�ϵĿ�ݼ� }
end;

function TCnTestParseTimeWizard.GetHasConfig: Boolean;
begin
  Result := False;
  { TODO -oAnyone : ����ר���Ƿ������ô��� }
end;

function TCnTestParseTimeWizard.GetHint: string;
begin
  Result := 'Test Parse Time of Current Unit';
  { TODO -oAnyone : ����ר�Ҳ˵���ʾ��Ϣ���ַ�������б��ػ����� }
end;

function TCnTestParseTimeWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
  { TODO -oAnyone : ����ר�Ҳ˵�״̬���ɸ���ָ���������趨 }
end;

class procedure TCnTestParseTimeWizard.GetWizardInfo(var Name, Author, Email, Comment: string);
begin
  Name := 'CnTestParseTimeWizard';
  Author := 'CnPack Team';
  Email := 'master@cnpack.org';
  Comment := 'Test Parse Time Wizard';
  { TODO -oAnyone : ����ר�ҵ����ơ����ߡ����估��ע���ַ�������б��ػ����� }
end;

procedure TCnTestParseTimeWizard.LoadSettings(Ini: TCustomIniFile);
begin
  { TODO -oAnyone : �ڴ�װ��ר���ڲ��õ��Ĳ�����ר�Ҵ���ʱ�Զ������� }
end;

procedure TCnTestParseTimeWizard.SaveSettings(Ini: TCustomIniFile);
begin
  { TODO -oAnyone : �ڴ˱���ר���ڲ��õ��Ĳ�����ר���ͷ�ʱ�Զ������� }
end;

initialization
  RegisterCnWizard(TCnTestParseTimeWizard); // ע��ר��

end.
