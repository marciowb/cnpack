{******************************************************************************}
{                       CnPack For Delphi/C++Builder                           }
{                     中国人自己的开放源码第三方开发包                         }
{                   (C)Copyright 2001-2010 CnPack 开发组                       }
{                   ------------------------------------                       }
{                                                                              }
{            本开发包是开源的自由软件，您可以遵照 CnPack 的发布协议来修        }
{        改和重新发布这一程序。                                                }
{                                                                              }
{            发布这一开发包的目的是希望它有用，但没有任何担保。甚至没有        }
{        适合特定目的而隐含的担保。更详细的情况请参阅 CnPack 发布协议。        }
{                                                                              }
{            您应该已经和开发包一起收到一份 CnPack 发布协议的副本。如果        }
{        还没有，可访问我们的网站：                                            }
{                                                                              }
{            网站地址：http://www.cnpack.org                                   }
{            电子邮件：master@cnpack.org                                       }
{                                                                              }
{******************************************************************************}

unit CnInputIdeSymbolList;
{* |<PRE>
================================================================================
* 软件名称：CnPack IDE 专家包
* 单元名称：输入助手单词列表类定义单元
* 单元作者：Johnson Zhong zhongs@tom.com http://www.longator.com
*           周劲羽 zjy@cnpack.org
* 备    注：IDE 标识符列表类
* 开发平台：PWinXP SP2 + Delphi 5.01
* 兼容测试：
* 本 地 化：该单元中的字符串均符合本地化处理方式
* 单元标识：$Id$
* 修改记录：2005.06.03
*               从 CnInputHelper 中分离出来
================================================================================
|</PRE>}

interface

{$I CnWizards.inc}

{$IFDEF CNWIZARDS_CNINPUTHELPER}

uses
  Windows, SysUtils, Classes, Controls, ToolsApi, Math, Dialogs, Contnrs, TypInfo,
  Forms, CnCommon, CnWizConsts, CnWizCompilerConst, CnWizUtils, CnWizMethodHook,
  CnPasCodeParser, CnInputSymbolList, CnEditControlWrapper, CnWizNotifier;

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

{$IFDEF IDE_WIDECONTROL} {$IFNDEF UNICODE_STRING}
  {$DEFINE UTF8_SYMBOL}
{$ENDIF} {$ENDIF}

{$IFDEF BDS4_UP}
  // BDS 2006 在执行 IOTACodeInsightServices.SetQueryContext(nil, nil)
  // 后再调用自动完成会导致 IDE 异常
  {$DEFINE IDE_SetQueryContext_Bug}
{$ENDIF}

type

//==============================================================================
// 从 IDE 中获得的标识符列表
//==============================================================================

{ TIDESymbolList }

  TIDESymbolList = class(TSymbolList)
  private
  {$IFDEF SUPPORT_IOTACodeInsightManager}
    function Reload_CodeInsightManager(Editor: IOTAEditBuffer;
      const InputText: string; PosInfo: TCodePosInfo): Boolean;
  {$ENDIF SUPPORT_IOTACodeInsightManager}
  {$IFDEF SUPPORT_KibitzCompile}
    procedure OnFileNotify(NotifyCode: TOTAFileNotification; const FileName: string);
    procedure OnIdleExecute(Sender: TObject);
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

{$IFDEF SUPPORT_KibitzCompile}
  SupportKibitzCompile = True;
{$ELSE}
  SupportKibitzCompile = False;
{$ENDIF}

{$IFDEF DELPHI5}
  SupportKibitzCompileThread = True;
{$ELSE}
  SupportKibitzCompileThread = False;
{$ENDIF}

var
  UseCodeInsightMgr: Boolean = False;
  {* 在 D7 中是否使用兼容性较好的方式取得符号列表，较慢}
  UseKibitzCompileThread: Boolean = False;
  {* 是否使用后台线程预处理符号 }

function KibitzCompileThreadRunning: Boolean;

{$ENDIF CNWIZARDS_CNINPUTHELPER}

implementation

{$IFDEF CNWIZARDS_CNINPUTHELPER}

uses
{$IFDEF Debug}
  CnDebug,
{$ENDIF Debug}
  CnWizEditFiler, mPasLex;

const
  csCIMgrNames = ';pascal;';

//==============================================================================
// 从 IDE 中获得的标识符列表
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
      // IDE 在无法进行 CodeInsight 时会弹出一个错误框（不是异常）
      // 此处临时替换掉显示错误框的函数 MessageDlgPosHelp，使之不显示出来
      // 待调用完成后再恢复。
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
            {$IFDEF UTF8_SYMBOL}
              Name := string(FastUtf8ToAnsi(AnsiString(SymbolList.SymbolText[i])));
            {$ELSE}
              Name := SymbolList.SymbolText[i];
            {$ENDIF}
              Desc := SymbolList.SymbolTypeText[i];
              Kind := SymbolFlagsToKind(SymbolList.SymbolFlags[i], Desc);
              // Description is Utf-8 format under BDS.
              Add(Name, Kind, Round(MaxInt / SymbolList.Count * i), Desc, '', True,
                False, False, {$IFDEF UTF8_SYMBOL}True{$ELSE}False{$ENDIF});
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
      // BDS2006/2007 下 SetQueryContext(nil, nil) 会导致 IDE 异常
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
  // 这个声明来自 TKibitzResult 记录的 RTTI 信息
  TKibitzResult = packed record
  {$IFDEF COMPILER7_UP}
    KibitzDataArray: array [0..82] of Integer;
  {$ELSE}
    KibitzDataArray: array [0..81] of Integer;
  {$ENDIF}
  {$IFDEF COMPILER6_UP}
    KibitzDataStr: string; // RTTI 显示在这个位置有一个 string 变量
  {$ENDIF}
    KibitzReserveArray: array[0..255] of Integer; // 再定义一个大数组备用
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

  TKibitzThread = class(TThread)
  private
    FFileName: AnsiString;
    FX, FY: Integer;
  protected
    procedure Execute; override;
  public
    constructor Create(const FileName: AnsiString; X, Y: Integer);
    destructor Destroy; override;
  end;

var
  DoKibitzCompile: TDoKibitzCompileProc;
  KibitzGetValidSymbols: TKibitzGetValidSymbolsProc;
  CompGetSymbolText: TCompGetSymbolTextProc;
  KibitzEnabled: Boolean;

  KibitzThread: TKibitzThread;
  HookCS: TRTLCriticalSection;
  KibitzFinished: Boolean = False;
  Hook1: TCnMethodHook;
  Hook2: TCnMethodHook;

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

procedure FakeDoKibitzCompile(FileName: AnsiString; XPos, YPos: Integer;
  var KibitzResult: TKibitzResult); register;
begin
{$IFDEF Debug}
  CnDebugger.LogMsg('FakeDoKibitzCompile');
{$ENDIF}
  FillChar(KibitzResult.KibitzDataArray, SizeOf(KibitzResult.KibitzDataArray), 0);
end;

function FakeKibitzGetValidSymbols(var KibitzResult: TKibitzResult;
  Symbols: PSymbols; Unknowns: PUnknowns; SymbolCount: Integer): Integer; stdcall;
begin
{$IFDEF Debug}
  CnDebugger.LogMsg('FakeKibitzGetValidSymbols');
{$ENDIF}
  Result := 0;
end;

{ TKibitzThread }

constructor TKibitzThread.Create(const FileName: AnsiString; X, Y: Integer);
begin
{$IFDEF Debug}
  CnDebugger.LogMsg('TKibitzThread.Create');
{$ENDIF}
  inherited Create(False);
  FFileName := FileName;
  FX := X;
  FY := Y;
  FreeOnTerminate := True;
end;

destructor TKibitzThread.Destroy;
begin
{$IFDEF Debug}
  CnDebugger.LogMsg('TKibitzThread.Destroy');
{$ENDIF}
  KibitzThread := nil;
  inherited;
end;

procedure TKibitzThread.Execute;
var
  KibitzResult: TKibitzResult;
begin
{$IFDEF Debug}
  CnDebugger.LogMsg('TKibitzThread.Execute');
{$ENDIF}
  try
    FillChar(KibitzResult, SizeOf(KibitzResult), 0);
    DoKibitzCompile(FFileName, FX, FY, KibitzResult);
  finally
    EnterCriticalSection(HookCS);
    try
      KibitzFinished := True;
      // 调用完成后恢复被 Hook 的函数
      FreeAndNil(Hook1);
      FreeAndNil(Hook2);
    finally
      LeaveCriticalSection(HookCS);
    end;
  end;
end;

function ParseProjectBegin(var FileName: AnsiString; var X, Y: Integer): Boolean;
var
  Stream: TMemoryStream;
  Source: AnsiString;
  Lex: TmwPasLex;
begin
{$IFDEF Debug}
  CnDebugger.LogMsg('ParseProjectBegin');
{$ENDIF}

  Result := False;
  FileName := CnOtaGetCurrentProjectFileName;
  Stream := TMemoryStream.Create;
  try
    EditFilerSaveFileToStream(FileName, Stream, False);
    Source := PAnsiChar(Stream.Memory);
  finally
    Stream.Free;
  end;

{$IFDEF Debug}
  CnDebugger.LogMsg(FileName + #13#10 + Source);
{$ENDIF}
  Lex := TmwPasLex.Create;
  try
    Lex.Origin := PAnsiChar(Source);
    while Lex.TokenID <> tkNull do
    begin
      if Lex.TokenID = tkBegin then
      begin
        Lex.Next;
        X := 0;
        Y := Lex.LineNumber + 1;
        Result := True;
        Break;
      end;
      Lex.Next;
    end;
  finally
    Lex.Free;
  end;
end;

procedure InvokeKibitzCompileInThread;
var
  Save: TCursor;
  FileName: AnsiString;
  X, Y: Integer;
begin
{$IFDEF Debug}
  CnDebugger.LogMsg('CreateKibitzThread');
{$ENDIF}
  if not SupportKibitzCompileThread or not UseKibitzCompileThread or KibitzCompileThreadRunning then
    Exit;

  if ParseProjectBegin(FileName, X, Y) then
  begin
  {$IFDEF Debug}
    CnDebugger.LogFmt('FileName: %s X: %d Y: %d', [FileName, X, Y]);
  {$ENDIF}
  
    Save := Screen.Cursor;
    KibitzFinished := False;
    KibitzThread := TKibitzThread.Create(FileName, X, Y);
    Sleep(50);  // 等待线程运行一会后再 Hook Kibitz 函数
    Screen.Cursor := Save; // 恢复原来的光标

    EnterCriticalSection(HookCS);
    try
      // 确保线程还没有结束前 Hook
      if not KibitzFinished then
      begin
        Hook1 := TCnMethodHook.Create(@DoKibitzCompile, @FakeDoKibitzCompile);
        Hook2 := TCnMethodHook.Create(@KibitzGetValidSymbols, @FakeKibitzGetValidSymbols);
      end;
    finally
      LeaveCriticalSection(HookCS);
    end;
  end;
end;

procedure TIDESymbolList.OnIdleExecute(Sender: TObject);
var
  Tick: Cardinal;
begin
  if not SupportKibitzCompileThread or not UseKibitzCompileThread then
    Exit;

  // 工程切换时等待线程结束
  Tick := GetTickCount;
  while KibitzCompileThreadRunning do
  begin
    if GetTickCount - Tick > 500 then
      Break;
    Sleep(100);
  end;
  InvokeKibitzCompileInThread;
end;

procedure TIDESymbolList.OnFileNotify(NotifyCode: TOTAFileNotification;
  const FileName: string);
begin
  if not SupportKibitzCompileThread or not UseKibitzCompileThread then
    Exit;
    
  if (NotifyCode = ofnFileOpened) and IsDpr(FileName) then
  begin
  {$IFDEF Debug}
    CnDebugger.LogFmt('TIDESymbolList.OnFileNotify: %s', [FileName]);
  {$ENDIF}
    CnWizNotifierServices.ExecuteOnApplicationIdle(OnIdleExecute);
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
      // 判断标识符的类型，简单判断以提高性能
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

      // 取标识符名称
      Idx := 1;
      while AText[Idx] <> ' ' do     // 跳过类型声明
        Inc(Idx);
      while AText[Idx] = ' ' do      // 跳过空格
        Inc(Idx);
      Len := 0;
      while AText[Idx + Len] in ['a'..'z', 'A'..'Z', '0'..'9', '_'] do
        Inc(Len);
      AName := Copy(AText, Idx, Len);

      // 取描述信息
      while AText[Idx + Len] = ' ' do
        Inc(Len);
      ADesc := Copy(AText, Idx + Len, MaxInt);

      // 错误的变量
      if (AKind = skVariable) and (CompareStr(ADesc, ': erroneous type') = 0) then
        Exit;

      // 增加新项
      Add(AName, AKind, Round(MaxInt / SymbolCount * Index), ADesc);
    end;
  end;
begin
  Result := False;
  if not KibitzEnabled or (PosInfo.PosKind in csNonCodePosKinds)
    or KibitzCompileThreadRunning then
    Exit;

  Clear;
  try
    FillChar(KibitzResult, SizeOf(KibitzResult), 0);
    CharPos := CnOtaGetCurrCharPos(nil);
    if PosInfo.PosKind in [pkClass, pkInterface, pkField] then
      Offset := -Length(InputText)
    else
      Offset := 0;

    // 执行符号信息编译
    DoKibitzCompile(Editor.FileName, CharPos.CharIndex + Offset, CharPos.Line,
      KibitzResult);

    // 以下代码在 GExperts 中使用，用途未明。使用后会导致某些枚举值出不来，此处禁用
    //if Byte(KibitzResult.KibitzDataArray[0]) in [$0B, $08, $09] then
    //  Exit;

    Symbols := nil;
    Unknowns := nil;
    try
      // 分配临时内存
      GetMem(Symbols, csMaxSymbolCount * SizeOf(Integer));
      GetMem(Unknowns, csMaxSymbolCount * SizeOf(Byte));

      // 取得有效的符号表及总数
      SymbolCount := KibitzGetValidSymbols(KibitzResult, Symbols, Unknowns,
        csMaxSymbolCount);

      // 增加符号项
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

function KibitzCompileThreadRunning: Boolean;
begin
{$IFDEF SUPPORT_KibitzCompile}
  Result := KibitzThread <> nil;
{$ELSE}
  Result := False;
{$ENDIF SUPPORT_KibitzCompile}
end;

constructor TIDESymbolList.Create;
begin
  inherited;
{$IFDEF SUPPORT_KibitzCompile}
  KibitzEnabled := KibitzInitialize;
  InitializeCriticalSection(HookCS);
  InvokeKibitzCompileInThread;
  CnWizNotifierServices.AddFileNotifier(OnFileNotify);
{$ENDIF SUPPORT_KibitzCompile}
end;

destructor TIDESymbolList.Destroy;
begin
{$IFDEF SUPPORT_KibitzCompile}
  CnWizNotifierServices.RemoveFileNotifier(OnFileNotify);
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
