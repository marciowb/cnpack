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

unit CnInputIdeSymbolList;
{* |<PRE>
================================================================================
* ������ƣ�CnPack IDE ר�Ұ�
* ��Ԫ���ƣ��������ֵ����б��ඨ�嵥Ԫ
* ��Ԫ���ߣ�Johnson Zhong zhongs@tom.com http://www.longator.com
*           �ܾ��� zjy@cnpack.org
* ��    ע��IDE ��ʶ���б���
* ����ƽ̨��PWinXP SP2 + Delphi 5.01
* ���ݲ��ԣ�
* �� �� �����õ�Ԫ�е��ַ��������ϱ��ػ�����ʽ
* ��Ԫ��ʶ��$Id: CnInputIdeSymbolList.pas,v 1.25 2009/05/02 13:13:57 liuxiao Exp $
* �޸ļ�¼��2005.06.03
*               �� CnInputHelper �з������
================================================================================
|</PRE>}

interface

{$I CnWizards.inc}

{$IFDEF CNWIZARDS_CNINPUTHELPER}

uses
  Windows, SysUtils, Classes, Controls, ToolsApi, Math, Dialogs, Contnrs, TypInfo,
  CnCommon, CnWizConsts, CnWizCompilerConst, CnWizUtils, CnWizMethodHook,
  CnPasCodeParser, CnInputSymbolList, CnEditControlWrapper;

{$IFDEF DELPHI}
  {$DEFINE SUPPORT_IDESymbolList}
{$ENDIF}

{$IFDEF SUPPORT_IDESymbolList}
{$IFDEF COMPILER7_UP}
  {$DEFINE SUPPORT_IOTACodeInsightManager}
{$ENDIF}

{$IFNDEF COMPILER8_UP}
  {$DEFINE SUPPORT_KibitzCompile}
{$ENDIF}

{$IFDEF SUPPORT_IOTACodeInsightManager} {$IFDEF SUPPORT_KibitzCompile}
  {$DEFINE SUPPORT_MULTI_IDESymbolList}
{$ENDIF} {$ENDIF}
{$ENDIF SUPPORT_IDESymbolList}

{$IFDEF BDS4_UP}
  // BDS 2006 ��ִ�� IOTACodeInsightServices.SetQueryContext(nil, nil)
  // ���ٵ����Զ���ɻᵼ�� IDE �쳣
  {$DEFINE IDE_SetQueryContext_Bug}
{$ENDIF}

type

//==============================================================================
// �� IDE �л�õı�ʶ���б�
//==============================================================================

{ TIDESymbolList }

  TIDESymbolList = class(TSymbolList)
  private
  {$IFDEF SUPPORT_IOTACodeInsightManager}
    function Reload_CodeInsightManager(Editor: IOTAEditBuffer;
      const InputText: string; PosInfo: TCodePosInfo): Boolean;
  {$ENDIF SUPPORT_IOTACodeInsightManager}
  {$IFDEF SUPPORT_KibitzCompile}
    function Reload_KibitzCompile(Editor: IOTAEditBuffer;
      const InputText: string; PosInfo: TCodePosInfo): Boolean;
  {$ENDIF SUPPORT_KibitzCompile}
  public
    constructor Create; override;
    destructor Destroy; override;
    class function GetListName: string; override;
    function Reload(Editor: IOTAEditBuffer; const InputText: string; PosInfo:
      TCodePosInfo): Boolean; override;
  end;

const
{$IFDEF SUPPORT_MULTI_IDESymbolList}
  SupportMultiIDESymbolList = True;
{$ELSE}
  SupportMultiIDESymbolList = False;
{$ENDIF}

var
  UseCodeInsightMgr: Boolean = False;
  {* �� D7 ���Ƿ�ʹ�ü����ԽϺõķ�ʽȡ�÷����б�����}
  
{$ENDIF CNWIZARDS_CNINPUTHELPER}

implementation

{$IFDEF CNWIZARDS_CNINPUTHELPER}

{$IFDEF Debug}
uses
  CnDebug;
{$ENDIF Debug}

const
  csCIMgrNames = ';pascal;';

//==============================================================================
// �� IDE �л�õı�ʶ���б�
//==============================================================================

{ TIDESymbolList }

{$IFDEF SUPPORT_IOTACodeInsightManager}
function MyMessageDlgPosHelp(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string): Integer;
begin
{$IFDEF Debug}
  CnDebugger.LogMsg('MyMessageDlgPosHelp called');
{$ENDIF Debug}
  Result := mrOk;
end;

// Invoke delphi code completion, load symbol list
function TIDESymbolList.Reload_CodeInsightManager(Editor: IOTAEditBuffer;
  const InputText: string; PosInfo: TCodePosInfo): Boolean;
var
  CodeInsightServices: IOTACodeInsightServices;
  CodeInsightManager: IOTACodeInsightManager;
  EditView: IOTAEditView;
  Element, LineFlag: Integer;
  Index: Integer;

  function SymbolFlagsToKind(Flags: TOTAViewerSymbolFlags; Description: string):
    TSymbolKind;
  begin
    Result := TSymbolKind(Flags);
    if (Flags = vsfType) then
    begin
      if Copy(Description, 1, 8) = ' : class' then
        Result := skClass;
      if Copy(Description, 1, 12) = ' : interface' then
        Result := skInterface;
    end;
  end;

  function MyInvokeCodeCompletion(Manager: IOTACodeInsightManager): Boolean;
  var
    Hook: TCnMethodHook;
    Filter: string;
  begin
    try
    {$IFDEF Debug}
      CnDebugger.LogMsg('Before InvokeCodeCompletion');
    {$ENDIF Debug}
      // IDE ���޷����� CodeInsight ʱ�ᵯ��һ������򣨲����쳣��
      // �˴���ʱ�滻����ʾ�����ĺ��� MessageDlgPosHelp��ʹ֮����ʾ����
      // ��������ɺ��ٻָ���
      Hook := TCnMethodHook.Create(GetBplMethodAddress(@MessageDlgPosHelp),
        @MyMessageDlgPosHelp);
      try
        Filter := '';
        Result := Manager.InvokeCodeCompletion(itManual, Filter);
      finally
        Hook.Free;
      end;
    {$IFDEF Debug}
      CnDebugger.LogBoolean(Result, 'After InvokeCodeCompletion');
    {$ENDIF Debug}
    except
      Result := False;
    end;
  end;

  procedure AddToSymbolList(Manager: IOTACodeInsightManager);
  var
    DisplayParams: Boolean;
    i: Integer;
    SymbolList: IOTACodeInsightSymbolList;
    Desc: string;
    Kind: TSymbolKind;
    Allow: Boolean;
    ValidChars: TSysCharSet;
    Name: string;
  begin
    if not Assigned(Manager) or not Manager.Enabled then
      Exit;

    if not Manager.HandlesFile(Editor.FileName) then
      Exit;

    CodeInsightServices.SetQueryContext(EditView, Manager);
    try
      // Allow: otherwise you will get an AV in 'InvokeCodeCompletion'
      Allow := True;
      Manager.AllowCodeInsight(Allow, #0);
      if not Allow then
        Exit;

      // Not used, but the IDE calls it in this order, and the calling order might be important.
      ValidChars := Manager.EditorTokenValidChars(False);
      
      if not MyInvokeCodeCompletion(Manager) then
        Exit;
      try
        SymbolList := nil;
        Manager.GetSymbolList(SymbolList);
        if Assigned(SymbolList) then
        begin
          try
            for i := 0 to SymbolList.Count - 1 do
            begin
              // follow code maybe raise exception, but disabled.
            {$IFDEF IDE_WIDECONTROL}
              Name := string(FastUtf8ToAnsi(AnsiString(SymbolList.SymbolText[i])));
            {$ELSE}
              Name := SymbolList.SymbolText[i];
            {$ENDIF}
              Desc := SymbolList.SymbolTypeText[i];
              Kind := SymbolFlagsToKind(SymbolList.SymbolFlags[i], Desc);
              // Description is Utf-8 format under BDS.
              Add(Name, Kind, Round(MaxInt / SymbolList.Count * i), Desc, '', True,
                False, False, {$IFDEF IDE_WIDECONTROL}True{$ELSE}False{$ENDIF});
            end;
          except
            ;
          end;
        end;
      finally
        DisplayParams := False;
        Manager.Done(False, DisplayParams);
      end;
    finally
      CodeInsightServices.SetQueryContext(nil, nil);
    end;
  end;

begin
  Result := False;
  if PosInfo.PosKind in csNonCodePosKinds then
    Exit;

  EditView := Editor.TopView;
  if not Assigned(EditView) then
    Exit;

  // debug or comment will exit
  EditControlWrapper.GetAttributeAtPos(CnOtaGetCurrentEditControl,
    EditView.CursorPos, False, Element, LineFlag);
  if (LineFlag = lfCurrentEIP) or (Element = atComment) then
    Exit;

  Clear;
  CodeInsightServices := (BorlandIDEServices as IOTACodeInsightServices);
  if CodeInsightServices <> nil then
  begin
  {$IFDEF IDE_SetQueryContext_Bug}
    for Index := 0 to CodeInsightServices.CodeInsightManagerCount - 1 do
    begin
      CodeInsightManager := CodeInsightServices.CodeInsightManager[Index];
      AddToSymbolList(CodeInsightManager);
    end;

    for Index := 0 to CodeInsightServices.CodeInsightManagerCount - 1 do
    begin
      CodeInsightManager := CodeInsightServices.CodeInsightManager[Index];
      // BDS2006/2007 �� SetQueryContext(nil, nil) �ᵼ�� IDE �쳣
      if CodeInsightManager.Enabled and CodeInsightManager.HandlesFile(Editor.FileName)
        and (Pos(UpperCase(CodeInsightManager.Name), UpperCase(csCIMgrNames)) > 0) then
      begin
        CodeInsightServices.SetQueryContext(nil, CodeInsightManager);
        Break;
      end;
    end;
  {$ELSE}
    CodeInsightServices.GetCurrentCodeInsightManager(CodeInsightManager);
    if (CodeInsightManager = nil) then
    begin
      for Index := 0 to CodeInsightServices.CodeInsightManagerCount - 1 do
      begin
        CodeInsightManager := CodeInsightServices.CodeInsightManager[Index];
        AddToSymbolList(CodeInsightManager);
      end;
    end
    else
    begin
      AddToSymbolList(CodeInsightManager);
    end;
  {$ENDIF}
  end;

  Result := Count > 0;
end;

{$ENDIF SUPPORT_IOTACodeInsightManager}

{$IFDEF SUPPORT_KibitzCompile}

{******************************************************************************}
{ Code Note:                                                                   }
{    The code below is derived from GExperts 1.2                               }
{                                                                              }
{ Original author:                                                             }
{    GExperts, Inc  http://www.gexperts.org/                                   }
{    Erik Berry <eberry@gexperts.org> or <eb@techie.com>                       }
{******************************************************************************}

type
  TSymbols = packed array[0..(MaxInt div SizeOf(Integer))-1] of Integer;
  PSymbols = ^TSymbols;
  TUnknowns = packed array [0..(MaxInt div SizeOf(Byte))-1] of Byte;
  PUnknowns = ^TUnknowns;
  // ����������� TKibitzResult ��¼�� RTTI ��Ϣ
  TKibitzResult = packed record
  {$IFDEF COMPILER7_UP}
    KibitzDataArray: array [0..82] of Integer;
  {$ELSE}
    KibitzDataArray: array [0..81] of Integer;
  {$ENDIF}
  {$IFDEF COMPILER6_UP}
    KibitzDataStr: string; // RTTI ��ʾ�����λ����һ�� string ����
  {$ENDIF}
    KibitzReserveArray: array[0..255] of Integer; // �ٶ���һ�������鱸��
  end;

const
  // dphideXX.bpl
  // DoKibitzCompile(FileName: AnsiString; XPos, YPos: Integer; var KibitzResult: TKibitzResult);
{$IFDEF COMPILER7_UP}
  DoKibitzCompileName = '@Pascodcmplt@DoKibitzCompile$qqrx17System@AnsiStringiir22Comtypes@TKibitzResult';
{$ELSE}
  DoKibitzCompileName = '@Codcmplt@DoKibitzCompile$qqrx17System@AnsiStringiir22Comtypes@TKibitzResult';
{$ENDIF COMPILER7_UP}
  // dccXX.dll
  // KibitzGetValidSymbols(var KibitzResult: TKibitzResult; Symbols: PSymbols; Unknowns: PUnknowns; SymbolCount: Integer): Integer; stdcall;
  KibitzGetValidSymbolsName = 'KibitzGetValidSymbols';
  // corideXX.bpl
  // Comdebug.CompGetSymbolText(Symbol: PSymbols; var S: string; Unknown: Word); stdcall;
  CompGetSymbolTextName = '@Comdebug@CompGetSymbolText$qqsp16Comtypes@TSymbolr17System@AnsiStringus';

type
  TDoKibitzCompileProc = procedure(FileName: AnsiString; XPos, YPos: Integer;
    var KibitzResult: TKibitzResult); register;

  TKibitzGetValidSymbolsProc = function(var KibitzResult: TKibitzResult;
    Symbols: PSymbols; Unknowns: PUnknowns; SymbolCount: Integer): Integer; stdcall;

  TCompGetSymbolTextProc = procedure(Symbol: Integer {Comtypes::TSymbol*};
    var S: string; Unknown: Word); stdcall;

var
  DoKibitzCompile: TDoKibitzCompileProc;
  KibitzGetValidSymbols: TKibitzGetValidSymbolsProc;
  CompGetSymbolText: TCompGetSymbolTextProc;
  KibitzEnabled: Boolean;

  CorIdeModule: HModule;
  DphIdeModule: HModule;
  dccModule: HModule;

function KibitzInitialize: Boolean;
begin
  Result := False;
  try
    DphIdeModule := LoadLibrary(DphIdeLibName);
    Assert(DphIdeModule <> 0, 'Failed to load DphIdeModule');

    DoKibitzCompile := GetProcAddress(DphIdeModule, DoKibitzCompileName);
    Assert(Assigned(DoKibitzCompile), 'Failed to load DoKibitzCompile from DphIdeModule');

    dccModule := LoadLibrary(dccLibName);
    Assert(dccModule <> 0, 'Failed to load dccModule');

    KibitzGetValidSymbols := GetProcAddress(dccModule, KibitzGetValidSymbolsName);
    Assert(Assigned(KibitzGetValidSymbols), 'Failed to load KibitzGetValidSymbols from dccModule');

    CorIdeModule := LoadLibrary(CorIdeLibName);
    Assert(CorIdeModule <> 0, 'Failed to load CorIdeModule');

    CompGetSymbolText := GetProcAddress(CorIdeModule, CompGetSymbolTextName);
    Assert(Assigned(CompGetSymbolText), 'Failed to load CompGetSymbolText');

    Result := True;
  {$IFDEF Debug}
    CnDebugger.LogMsg('KibitzInitialize succ');
  {$ENDIF}
  except
    on E: Exception do
      DoHandleException(E.Message);
  end;
end;

procedure KibitzFinalize;
begin
  if CorIdeModule <> 0 then
  begin
    FreeLibrary(CorIdeModule);
    CorIdeModule := 0;
  end;

  if dccModule <> 0 then
  begin
    FreeLibrary(dccModule);
    dccModule := 0;
  end;

  if DphIdeModule <> 0 then
  begin
    FreeLibrary(DphIdeModule);
    DphIdeModule := 0;
  end;
end;

function TIDESymbolList.Reload_KibitzCompile(Editor: IOTAEditBuffer;
  const InputText: string; PosInfo: TCodePosInfo): Boolean;
const
  csMaxSymbolCount = 32768;
var
  KibitzResult: TKibitzResult;
  SymbolCount: Integer;
  Unknowns: PUnknowns;
  Symbols: PSymbols;
  CharPos: TOTACharPos;
  Text: string;
  i, Offset: Integer;

  procedure AddItem(const AText: string; Index: Integer);
  var
    Idx, Len: Integer;
    AName, ADesc: string;
    AKind: TSymbolKind;
  begin
    if Length(AText) > 6 then
    begin
      // �жϱ�ʶ�������ͣ����ж����������
      case AText[1] of
        'v':
          AKind := skVariable;       // 'var '
        'p':
          begin
            if AText[4] = 'c' then   // 'proc '
              AKind := skProcedure
            else                     // 'prop '
              AKind := skProperty;
          end;
        'f':
          AKind := skFunction;       // 'func '
        't':
          begin                      // 'type '
            if Pos(' = class', AText) > 0 then
              AKind := skClass
            else if Pos(' = interface', AText) > 0 then
              AKind := skInterface
            else
              AKind := skType;
          end;
        'c':
          AKind := skConstant;       // 'const '
        'r':
          AKind := skConstant;       // 'rstrg '
        '?':
          AKind := skKeyword;        // '??? '
      else
        begin
        {$IFDEF Debug}
          CnDebugger.LogMsg('Unknown declear: ' + AText);
        {$ENDIF}
          AKind := skUnknown;
        end;
      end;

      // ȡ��ʶ������
      Idx := 1;
      while AText[Idx] <> ' ' do     // ������������
        Inc(Idx);
      while AText[Idx] = ' ' do      // �����ո�
        Inc(Idx);
      Len := 0;
      while AText[Idx + Len] in ['a'..'z', 'A'..'Z', '0'..'9', '_'] do
        Inc(Len);
      AName := Copy(AText, Idx, Len);

      // ȡ������Ϣ
      while AText[Idx + Len] = ' ' do
        Inc(Len);
      ADesc := Copy(AText, Idx + Len, MaxInt);

      // ����ı���
      if (AKind = skVariable) and (CompareStr(ADesc, ': erroneous type') = 0) then
        Exit;

      // ��������
      Add(AName, AKind, Round(MaxInt / SymbolCount * Index), ADesc);
    end;
  end;
begin
  Result := False;
  if not KibitzEnabled or (PosInfo.PosKind in csNonCodePosKinds) then
    Exit;

  Clear;
  try
    FillChar(KibitzResult, SizeOf(KibitzResult), 0);
    CharPos := CnOtaGetCurrCharPos(nil);
    if PosInfo.PosKind in [pkClass, pkInterface, pkField] then
      Offset := -Length(InputText)
    else
      Offset := 0;

    // ִ�з�����Ϣ����
    DoKibitzCompile(Editor.FileName, CharPos.CharIndex + Offset, CharPos.Line,
      KibitzResult);

    // ���´����� GExperts ��ʹ�ã���;δ����ʹ�ú�ᵼ��ĳЩö��ֵ���������˴�����
    //if Byte(KibitzResult.KibitzDataArray[0]) in [$0B, $08, $09] then
    //  Exit;

    Symbols := nil;
    Unknowns := nil;
    try
      // ������ʱ�ڴ�
      GetMem(Symbols, csMaxSymbolCount * SizeOf(Integer));
      GetMem(Unknowns, csMaxSymbolCount * SizeOf(Byte));

      // ȡ����Ч�ķ��ű�����
      SymbolCount := KibitzGetValidSymbols(KibitzResult, Symbols, Unknowns,
        csMaxSymbolCount);

      // ���ӷ�����
      List.Capacity := SymbolCount;
      for i := 0 to SymbolCount - 1 do
      begin
        CompGetSymbolText(Symbols^[i], Text, 1);
        AddItem(Text, i);
      end;

      Result := Count > 0;
    {$IFDEF Debug}
      CnDebugger.LogMsg(Format('TIDESymbolList.Reload, Count: %d', [Count]));
    {$ENDIF}
    finally
      if Unknowns <> nil then
        FreeMem(Unknowns);
      if Symbols <> nil then
        FreeMem(Symbols);
    end;
  except
    on E: Exception do
      DoHandleException(E.Message);
  end;
end;

{$ENDIF SUPPORT_KibitzCompile}

constructor TIDESymbolList.Create;
begin
  inherited;
{$IFDEF SUPPORT_KibitzCompile}
  KibitzEnabled := KibitzInitialize;
{$ENDIF SUPPORT_KibitzCompile}
end;

destructor TIDESymbolList.Destroy;
begin
{$IFDEF SUPPORT_KibitzCompile}
  KibitzFinalize;
{$ENDIF SUPPORT_KibitzCompile}
  inherited;
end;

class function TIDESymbolList.GetListName: string;
begin
  Result := SCnInputHelperIDESymbolList;
end;

function TIDESymbolList.Reload(Editor: IOTAEditBuffer;
  const InputText: string; PosInfo: TCodePosInfo): Boolean;
begin
{$IFDEF SUPPORT_IDESymbolList}

{$IFDEF SUPPORT_MULTI_IDESymbolList}
  if UseCodeInsightMgr then
    Result := Reload_CodeInsightManager(Editor, InputText, PosInfo)
  else
    Result := Reload_KibitzCompile(Editor, InputText, PosInfo);
{$ELSE}

{$IFDEF SUPPORT_IOTACodeInsightManager}
  Result := Reload_CodeInsightManager(Editor, InputText, PosInfo);
{$ENDIF SUPPORT_IOTACodeInsightManager}

{$IFDEF SUPPORT_KibitzCompile}
  Result := Reload_KibitzCompile(Editor, InputText, PosInfo);
{$ENDIF SUPPORT_KibitzCompile}

{$ENDIF SUPPORT_MULTI_IDESymbolList}

{$ELSE}
  Result := False;
{$ENDIF SUPPORT_IDESymbolList}
end;

initialization
{$IFDEF SUPPORT_IDESymbolList}
  RegisterSymbolList(TIDESymbolList);
{$ENDIF}

{$ENDIF CNWIZARDS_CNINPUTHELPER}
end.
