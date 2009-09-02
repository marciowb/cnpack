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

unit CnSrcEditorToolBar;
{ |<PRE>
================================================================================
* ������ƣ�CnPack IDE ר�Ұ�
* ��Ԫ���ƣ�����༭����������Ԫ
* ��Ԫ���ߣ��ܾ��� (zjy@cnpack.org)
* ��    ע��
* ����ƽ̨��PWin2000Pro + Delphi 5.01
* ���ݲ��ԣ�PWin9X/2000/XP + Delphi 5/6/7 + C++Builder 5/6
* �� �� �����õ�Ԫ�е��ַ��������ϱ��ػ�����ʽ
* ��Ԫ��ʶ��$Id$
* �޸ļ�¼��2004.12.25
*               ������Ԫ����ԭ CnSrcEditorEnhancements �Ƴ�
================================================================================
|</PRE>}

interface

{$I CnWizards.inc}

{$IFDEF CNWIZARDS_CNSRCEDITORENHANCE}

uses
  Windows, Messages, Classes, Graphics, SysUtils, Controls, Menus, Forms, CnIni,
  ComCtrls, ToolWin, ToolsAPI, IniFiles, CnEditControlWrapper, CnWizNotifier,
  CnWizIni;

type

//==============================================================================
// ����༭��������
//==============================================================================

{ TCnSrcEditorToolButton }

  TCnSrcEditorToolButton = class(TToolButton)
  private
    FMenu: TPopupMenu;
    procedure OnPopup(Sender: TObject);
    procedure DoClick(Sender: TObject);
  public
    procedure Click; override;
  end;

{ TCnSrcEditorToolBar }

  TCnSrcEditorToolBarMgr = class;

  TCnSrcEditorToolBar = class(TToolBar)
  private
    FMenu: TPopupMenu;
    FToolBarMgr: TCnSrcEditorToolBarMgr;
    procedure OnConfig(Sender: TObject);
    procedure OnClose(Sender: TObject);
    procedure OnEnhConfig(Sender: TObject);
  protected
{$IFDEF BDS}
    procedure SetEnabled(Value: Boolean); override;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure InitControls;
    procedure RecreateButtons;
    procedure InitPopupMenu;
    procedure LanguageChanged(Sender: TObject);
    property Menu: TPopupMenu read FMenu;
  end;

  TCnExternalSrcEditorToolBar = class(TToolBar)
  private
    procedure InitControls;
  protected
{$IFDEF BDS}
    procedure SetEnabled(Value: Boolean); override;
{$ENDIF}
  end;

//==============================================================================
// ����༭��������������
//==============================================================================

{ TCnSrcEditorToolBarMgr }

  TCnSrcEditorToolBarMgr = class
  private
    FShowToolBar: Boolean;
    FToolBarActions: TStringList;
    FActive: Boolean;
    FList: TList;
    FOnEnhConfig: TNotifyEvent;
    FWrapable: Boolean;
{$IFDEF BDS}
    FShowInDesign: Boolean;
    procedure SetShowInDesign(const Value: Boolean);
{$ENDIF}
    procedure LoadToolBarActions(const FileName: string);
    procedure SaveToolBarActions(const FileName: string);
    procedure SetShowToolBar(const Value: Boolean);
    procedure SetActive(const Value: Boolean);
    procedure DoInstallToolBars(EditWindow: TCustomForm; EditControl: TControl;
      Context: Pointer);
    function GetCount: Integer;
    function GetToolBar(Index: Integer): TCnSrcEditorToolBar;
    procedure EditControlNotify(EditControl: TControl; EditWindow: TCustomForm;
      Operation: TOperation);
    procedure SetWrapable(Value: Boolean);
  protected
    procedure DoEnhConfig;
    function CanShowToolBar: Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    procedure InstallToolBars;
    procedure UpdateToolBars;
    procedure ConfigToolBar;
    procedure LanguageChanged(Sender: TObject);
    procedure LoadSettings(Ini: TCustomIniFile);
    procedure SaveSettings(Ini: TCustomIniFile);

    property Count: Integer read GetCount;
    property ToolBars[Index: Integer]: TCnSrcEditorToolBar read GetToolBar;

    property ShowToolBar: Boolean read FShowToolBar write SetShowToolBar;
{$IFDEF BDS}
    property ShowInDesign: Boolean read FShowInDesign write SetShowInDesign;
{$ENDIF}
    property Wrapable: Boolean read FWrapable write SetWrapable;
    property Active: Boolean read FActive write SetActive;
    property OnEnhConfig: TNotifyEvent read FOnEnhConfig write FOnEnhConfig;
  end;

{$ELSE}

uses
  SysUtils, Classes, Controls;

{$ENDIF CNWIZARDS_CNSRCEDITORENHANCE}

type
  TCnEditorToolBarTypeIndex = Integer;
  TCnEditorToolBarCreateEvent = procedure (EditControl: TControl; Sender: TObject) of object;
  TCnEditorToolBarInitEvent = procedure (EditControl: TControl; Sender: TObject) of object;
  TCnEditorToolBarRemoveEvent = procedure (EditControl: TControl; Sender: TObject) of object;

  ICnEditorToolBarService = interface
  ['{BF6B4399-270A-4E24-8137-587162D12497}']
    function RegisterToolBarType(const ToolBarType: string;
      CreateEvent: TCnEditorToolBarCreateEvent;
      InitEvent: TCnEditorToolBarInitEvent;
      RemoveEvent: TCnEditorToolBarRemoveEvent): TCnEditorToolBarTypeIndex;
    {* �����ⲿģ��ע��һ���������Ͳ��ṩ�ص���������������ʼ����ɾ����
       ���ش��๤������������}
    procedure SetVisible(ToolBarTypeIndex: TCnEditorToolBarTypeIndex;
      AParent: TControl; Visible: Boolean; Forced: Boolean);
    {* ����ĳ�๤�����Ƿ�ȫ���ɼ���ȫ�����ɼ������ ToolBarTypeIndex �� -1��
       ���ʾ�����඼���ã��� AParent ��Ϊ�գ���ʾ������� AParent ��ص�
       ToolBar, Forced ���� BDS ��ʾǿ�����ã����� EditControl �ȵ��������}
    function GetVisible(ToolBarTypeIndex: TCnEditorToolBarTypeIndex): Boolean;
    {* ���ĳ�๤�����Ƿ�ɼ�}
    procedure CheckEditorToolbarEnable;
    {* ���ⲿ Timer ��ʱ���ã���� BDS �µĹ������Ƿ�Ӧ���ڽ����л�ʱ�л� Visible}
    procedure LanguageChanged;
    {* ���ⲿ���õ����Ըı�֪ͨ}
  end;

var
  CnEditorToolBarService: ICnEditorToolBarService = nil;
  {* �༭�������������ṩ��}
  CreateEditorToolBarServiceProc: TProcedure = nil;
  {* �����༭����������������}

implementation

{$IFDEF CNWIZARDS_CNSRCEDITORENHANCE}

uses
{$IFDEF DEBUG}
  CnDebug,
{$ENDIF}
  Math, TypInfo, CnCommon, CnWizUtils, CnWizConsts, CnWizIdeUtils,
  CnWizShareImages, CnFlatToolbarConfigFrm, CnWizOptions;

const
  SCnSrcEditorToolBar = 'CnSrcEditorToolBar';

  csToolBar = 'ToolBar';
  csShowToolBar = 'ShowToolBar';
  csShowInDesign = 'ShowInDesign';
  csWrapable = 'Wrapable';

type
  TCnEditorToolBarObj = class(TComponent)
  {* ��������һ�๤������������ʵ���������ص�������� EditControl ������}
  private
    FCreateEvent: TCnEditorToolBarCreateEvent;
    FToolBars: TList;
    FEditControls: TList;
    FInitEvent: TCnEditorToolBarInitEvent;
    FRemoveEvent: TCnEditorToolBarRemoveEvent;
    FToolBarVisible: Boolean;
    function GetToolBars(Index: Integer): TControl;
    function GetToolBarCount: Integer;
    function GetEditControls(Index: Integer): TControl;
  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddToolBar(AToolBar: TControl; EditControl: TControl);
    procedure RemoveEditControlFromIndex(Index: Integer);

    property CreateEvent: TCnEditorToolBarCreateEvent read FCreateEvent write FCreateEvent;
    property InitEvent: TCnEditorToolBarInitEvent read FInitEvent write FInitEvent;
    property RemoveEvent: TCnEditorToolBarRemoveEvent read FRemoveEvent write FRemoveEvent;
    property EditControls[Index: Integer]: TControl read GetEditControls;
    property ToolBars[Index: Integer]: TControl read GetToolBars;
    property ToolBarCount: Integer read GetToolBarCount;
    property ToolBarVisible: Boolean read FToolBarVisible write FToolBarVisible;
  end;

  TCnExternalEditorToolBarMgr = class(TInterfacedObject, ICnEditorToolBarService)
  private
    FToolBarTypes: TStrings;
    procedure DoInstallToolBars(EditWindow: TCustomForm; EditControl: TControl;
      Context: Pointer);
  protected
    procedure EditControlNotify(EditControl: TControl; EditWindow: TCustomForm;
      Operation: TOperation);
  public
    constructor Create;
    destructor Destroy; override;

    procedure InstallToolBars;
    function RegisterToolBarType(const ToolBarType: string;
      CreateEvent: TCnEditorToolBarCreateEvent;
      InitEvent: TCnEditorToolBarInitEvent;
      RemoveEvent: TCnEditorToolBarRemoveEvent): TCnEditorToolBarTypeIndex;
    procedure SetVisible(ToolBarTypeIndex: TCnEditorToolBarTypeIndex;
      AParent: TControl; Visible: Boolean; Forced: Boolean);
    function GetVisible(ToolBarTypeIndex: TCnEditorToolBarTypeIndex): Boolean;
    procedure CheckEditorToolbarEnable;
    procedure LanguageChanged;
  end;

//==============================================================================
// ����༭��������
//==============================================================================

{ TCnSrcEditorToolButton }

procedure TCnSrcEditorToolButton.Click;
begin
  // ��ʱ��ť���ִ�еĲ����н� ToolBar �ͷ��ˣ��ᵼ�³����������򿪡���ť
  // ��һ���µĹ��̻��ͷŵ�ǰ�༭���ؽ�һ�����˴��� Click �¼�ת�� OnIdle ʱȥ
  // ִ�У��������������⡣
  CnWizNotifierServices.ExecuteOnApplicationIdle(DoClick)
end;

procedure TCnSrcEditorToolButton.DoClick(Sender: TObject);
begin
  inherited Click;
end;

procedure TCnSrcEditorToolButton.OnPopup(Sender: TObject);
var
  Menu: Menus.TPopupMenu;
begin
  if (Sender <> nil) and (Sender is Menus.TPopupMenu) then
  begin
    Menu := Menus.TPopupMenu((Sender as TComponent).Tag);
    if Menu <> nil then
    begin
      FMenu.Items.Clear;
      if Assigned(Menu.OnPopup) then
        Menu.OnPopup(Menu); // ����һ��ԭʼ�� Menu �ĵ���
      // �� Menu �и������� Items ����
      CloneMenuItem(Menu.Items, FMenu.Items);
    end;
  end;  
end;

{ TCnSrcEditorToolBar }

constructor TCnSrcEditorToolBar.Create(AOwner: TComponent);
begin
  inherited;
  FMenu := TPopupMenu.Create(Self);
end;

destructor TCnSrcEditorToolBar.Destroy;
begin
  FToolBarMgr.FList.Remove(Self);
  inherited;
end;

//------------------------------------------------------------------------------
// ��������ʼ��������
//------------------------------------------------------------------------------

{$IFDEF BDS}
procedure TCnSrcEditorToolBar.SetEnabled(Value: Boolean);
begin
// ʲôҲ���������赲 BDS ���л�ҳ��ʱ Disable �������Ĳ���
end;
{$ENDIF}

procedure TCnSrcEditorToolBar.InitControls;
begin
  InitPopupMenu;
  Caption := '';
  AutoSize := True;
  Align := alTop;
  EdgeBorders := [ebBottom];
  Flat := True;
  DockSite := False;
  Wrapable := FToolBarMgr.Wrapable;
  Images := GetIDEImageList;
  ShowHint := True;
  PopupMenu := FMenu;
  RecreateButtons;
end;

procedure TCnSrcEditorToolBar.InitPopupMenu;
begin
  FMenu.Items.Clear;
  AddMenuItem(FMenu.Items, SCnMenuFlatFormCustomizeCaption, OnConfig);
  AddSepMenuItem(Menu.Items);
  AddMenuItem(FMenu.Items, SCnEditorEnhanceConfig, OnEnhConfig);
  AddMenuItem(FMenu.Items, SCnToolBarClose, OnClose);
end;

procedure TCnSrcEditorToolBar.RecreateButtons;
var
  i: Integer;
  Btn: TCnSrcEditorToolButton;
  IDEBtn: TToolButton;
  MenuObj: TObject;
  Act: TBasicAction;
  Actions: TStringList;
  Svcs40: INTAServices40;
  IDEToolBarParent: TWinControl;

  // ���� IDE �е���Ӧ�� ToolButton
  function FindIDEToolButton(AAction: TBasicAction): TToolButton;
  var
    i, j: Integer;
  begin
    Result := nil;
    if IDEToolBarParent <> nil then
    begin
      for i := 0 to IDEToolBarParent.ControlCount - 1 do
        if IDEToolBarParent.Controls[i] is TToolBar then
        with IDEToolBarParent.Controls[i] as TToolBar do
          for j := 0 to ButtonCount - 1 do
            if Buttons[j].Action = AAction then
            begin
              Result := Buttons[j];
              Exit;
            end;
    end;
  end;
begin
  for i := ButtonCount - 1 downto 0 do
    Buttons[i].Free;

  Actions := FToolBarMgr.FToolBarActions;
  QuerySvcs(BorlandIDEServices, INTAServices40, Svcs40);
  if Svcs40.ToolBar[sStandardToolBar] <> nil then
    IDEToolBarParent := Svcs40.ToolBar[sStandardToolBar].Parent;
  for i := Actions.Count - 1 downto 0 do
  begin
    if Actions[i] = '-' then
    begin
      Btn := TCnSrcEditorToolButton.Create(Self);
      Btn.Style := tbsSeparator;
      if Align in [alTop, alBottom] then
        Btn.Width := 4
      else
        Btn.Height := 4;
      Btn.SetToolBar(Self);
    end
    else
    begin
      Act := FindIDEAction(Actions[i]);
      if Act <> nil then
      begin
        Btn := TCnSrcEditorToolButton.Create(Self);
        Btn.Action := Act;
        if Btn.ImageIndex < 0 then
          Btn.ImageIndex := dmCnSharedImages.IdxUnknownInIDE;
        if Btn.Caption = '' then
          Btn.Caption := Btn.Name;
        if Btn.Hint = '' then
          Btn.Hint := StripHotkey(Btn.Caption);

        // ����������˵��İ�ť
        IDEBtn := FindIDEToolButton(Act);
        if IDEBtn <> nil then
        begin
          // ֱ��������ȡ�õ�ʼ���ǿգ����� IDE �� TCommandButton �ض������������
          MenuObj := GetObjectProp(IDEBtn, 'DropdownMenu');
          if (MenuObj <> nil) and (MenuObj is Menus.TPopupMenu) then
          begin
            Btn.Style := tbsDropDown;
            if Btn.FMenu <> nil then
              FreeAndNil(Btn.FMenu);
            Btn.FMenu := TPopupMenu.Create(Btn);
            Btn.FMenu.Tag := Integer(MenuObj);
            Btn.FMenu.OnPopup := Btn.OnPopup;
            Btn.DropdownMenu := Btn.FMenu;
          end;
        end;
        Btn.SetToolBar(Self);
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------
// �¼�����
//------------------------------------------------------------------------------

procedure TCnSrcEditorToolBar.OnConfig(Sender: TObject);
begin
  FToolBarMgr.ConfigToolBar;
end;

procedure TCnSrcEditorToolBar.OnClose(Sender: TObject);
begin
  InfoDlg(SCnToolBarCloseHint);
  FToolBarMgr.ShowToolBar := False;
end;

procedure TCnSrcEditorToolBar.OnEnhConfig(Sender: TObject);
begin
  FToolBarMgr.DoEnhConfig;
end;

procedure TCnSrcEditorToolBar.LanguageChanged(Sender: TObject);
begin
  InitPopupMenu;
end;

//==============================================================================
// ����༭��������������
//==============================================================================

{ TCnSrcEditorToolBarMgr }

constructor TCnSrcEditorToolBarMgr.Create;
begin
  inherited;
  FWrapable := True;
  FShowToolBar := True;
  FActive := True;

  FToolBarActions := TStringList.Create;
  FList := TList.Create;
  
  EditControlWrapper.AddEditControlNotifier(EditControlNotify);
  InstallToolBars;
end;

destructor TCnSrcEditorToolBarMgr.Destroy;
var
  i: Integer;
begin
  EditControlWrapper.RemoveEditControlNotifier(EditControlNotify);
  for i := FList.Count - 1 downto 0 do
    TCnSrcEditorToolBar(FList[i]).Free;
  FList.Free;
  FToolBarActions.Free;
  inherited;
end;

//------------------------------------------------------------------------------
// ��������װ������
//------------------------------------------------------------------------------

function TCnSrcEditorToolBarMgr.CanShowToolBar: Boolean;
begin
  Result := Active and ShowToolBar;
end;

procedure TCnSrcEditorToolBarMgr.DoInstallToolBars(EditWindow: TCustomForm;
  EditControl: TControl; Context: Pointer);
var
  ToolBar: TCnSrcEditorToolBar;
begin
  ToolBar := TCnSrcEditorToolBar(EditWindow.FindComponent(SCnSrcEditorToolBar));
  if CanShowToolBar then
  begin
    if ToolBar = nil then
    begin
      ToolBar := TCnSrcEditorToolBar.Create(EditWindow);
      ToolBar.FToolBarMgr := Self;
      ToolBar.Name := SCnSrcEditorToolBar;
      ToolBar.Parent := EditControl.Parent;
      ToolBar.InitControls;
      FList.Add(ToolBar);
    end;
  end
  else if ToolBar <> nil then
  begin
    ToolBar.Free;
  end;
end;

procedure TCnSrcEditorToolBarMgr.InstallToolBars;
begin
  EnumEditControl(DoInstallToolBars, nil);
end;

procedure TCnSrcEditorToolBarMgr.UpdateToolBars;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
  begin
    ToolBars[I].RecreateButtons;
    ToolBars[I].InitPopupMenu;
  end; 
end;

procedure TCnSrcEditorToolBarMgr.EditControlNotify(EditControl: TControl;
  EditWindow: TCustomForm; Operation: TOperation);
begin
  if Operation = opInsert then
    InstallToolBars;
end;

//------------------------------------------------------------------------------
// �������������
//------------------------------------------------------------------------------

procedure TCnSrcEditorToolBarMgr.LoadToolBarActions(const FileName: string);
var
  Value: string;
  i: Integer;
begin
  FToolBarActions.Clear;
  with TMemIniFile.Create(FileName) do
  try
    i := 0;
    while ValueExists(csToolBar, csButton + IntToStr(i)) do
    begin
      Value := Trim(ReadString(csToolBar, csButton + IntToStr(i), ''));
      if Value <> '' then
        FToolBarActions.Add(Value);
      Inc(i);
    end;
  finally
    Free;
  end;
end;

procedure TCnSrcEditorToolBarMgr.SaveToolBarActions(const FileName: string);
var
  i: Integer;
begin
  with TMemIniFile.Create(FileName) do
  try
    EraseSection(csToolBar);
    for i := 0 to FToolBarActions.Count - 1 do
      WriteString(csToolBar, csButton + IntToStr(i), FToolBarActions[i]);
  finally
    UpdateFile;
    Free;
  end;
end;

procedure TCnSrcEditorToolBarMgr.ConfigToolBar;
begin
  with TCnFlatToolbarConfigForm.Create(nil) do
  try
    SetStyle(tbsEditor, SCnEditorToolBarDataName, 'CnSrcEditorToolbarConfigForm');
    ToolbarActions := FToolBarActions;
    if ShowModal = mrOk then
    begin
      FToolBarActions.Assign(ToolbarActions);

      SaveToolBarActions(WizOptions.GetUserFileName(SCnEditorToolBarDataName, False));
      WizOptions.CheckUserFile(SCnEditorToolBarDataName);
      UpdateToolBars;
    end;
  finally
    Free;
  end;
end;

//------------------------------------------------------------------------------
// �����������
//------------------------------------------------------------------------------

procedure TCnSrcEditorToolBarMgr.LanguageChanged(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    ToolBars[I].InitPopupMenu;
end;

procedure TCnSrcEditorToolBarMgr.LoadSettings(Ini: TCustomIniFile);
begin
  ShowToolBar := Ini.ReadBool(csToolBar, csShowToolBar, FShowToolBar);
{$IFDEF BDS}
  ShowInDesign := Ini.ReadBool(csToolBar, csShowInDesign, False);
{$ENDIF}
  Wrapable := Ini.ReadBool(csToolBar, csWrapable, FWrapable);
  LoadToolBarActions(WizOptions.GetUserFileName(SCnEditorToolBarDataName, True));
end;

procedure TCnSrcEditorToolBarMgr.SaveSettings(Ini: TCustomIniFile);
begin
  Ini.WriteBool(csToolBar, csShowToolBar, FShowToolBar);
{$IFDEF BDS}
  Ini.WriteBool(csToolBar, csShowInDesign, FShowInDesign);
{$ENDIF}
  Ini.WriteBool(csToolBar, csWrapable, FWrapable);
  SaveToolBarActions(WizOptions.GetUserFileName(SCnEditorToolBarDataName, False));
  WizOptions.CheckUserFile(SCnEditorToolBarDataName);
end;

procedure TCnSrcEditorToolBarMgr.DoEnhConfig;
begin
  if Assigned(FOnEnhConfig) then
    FOnEnhConfig(Self);
end;

//------------------------------------------------------------------------------
// ���Զ�д����
//------------------------------------------------------------------------------

function TCnSrcEditorToolBarMgr.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TCnSrcEditorToolBarMgr.GetToolBar(Index: Integer): TCnSrcEditorToolBar;
begin
  Result := TCnSrcEditorToolBar(FList[Index]);
end;

procedure TCnSrcEditorToolBarMgr.SetActive(const Value: Boolean);
begin
  if FActive <> Value then
  begin
    FActive := Value;
    InstallToolBars;
  end;
end;

procedure TCnSrcEditorToolBarMgr.SetShowToolBar(const Value: Boolean);
begin
  if FShowToolBar <> Value then
  begin
    FShowToolBar := Value;
    InstallToolBars;
  end;
end;

procedure TCnSrcEditorToolBarMgr.SetWrapable(Value: Boolean);
var
  I: Integer;
begin
  if FWrapable <> Value then
  begin
    FWrapable := Value;
    for I := 0 to Count - 1 do
      ToolBars[I].Wrapable := Value;
  end;
end;

{$IFDEF BDS}

procedure TCnSrcEditorToolBarMgr.SetShowInDesign(const Value: Boolean);
begin
  FShowInDesign := Value;
end;

{$ENDIF}

{ TCnExternalEditorToolBarMgr }

constructor TCnExternalEditorToolBarMgr.Create;
begin
  inherited;
  FToolBarTypes := TStringList.Create;

  EditControlWrapper.AddEditControlNotifier(EditControlNotify);
  InstallToolBars;
end;

destructor TCnExternalEditorToolBarMgr.Destroy;
var
  I: Integer;
begin
  EditControlWrapper.RemoveEditControlNotifier(EditControlNotify);
  
  for I := FToolBarTypes.Count - 1 downto 0 do
    TObject(FToolBarTypes.Objects[I]).Free;
  FToolBarTypes.Free;
  inherited;
end;

procedure TCnExternalEditorToolBarMgr.DoInstallToolBars(
  EditWindow: TCustomForm; EditControl: TControl; Context: Pointer);
var
  I: Integer;
  ToolBar: TToolBar;
  Obj: TCnEditorToolBarObj;
begin
  for I := 0 to FToolBarTypes.Count - 1 do
  begin
    ToolBar := TToolBar(EditWindow.FindComponent(FToolBarTypes[I]));
    Obj := TCnEditorToolBarObj(FToolBarTypes.Objects[I]);
    if ToolBar = nil then
    begin
      ToolBar := TCnExternalSrcEditorToolBar.Create(EditWindow);
      ToolBar.Name := FToolBarTypes[I];
      ToolBar.Tag := Integer(EditControl); // �� Tag ��¼�����Ӧ�� EditoControl

      ToolBar.Parent := EditControl.Parent;
      (ToolBar as TCnExternalSrcEditorToolBar).InitControls;

      if Assigned(Obj.CreateEvent) then
        Obj.CreateEvent(EditControl, ToolBar);
      if Assigned(Obj.InitEvent) then
        Obj.InitEvent(EditControl, ToolBar);

      ToolBar.Visible := Obj.ToolBarVisible;
      if Obj.ToolBarVisible then
        ToolBar.Update;
      Obj.AddToolBar(ToolBar, EditControl);
    end;
  end;
end;

procedure TCnExternalEditorToolBarMgr.EditControlNotify(
  EditControl: TControl; EditWindow: TCustomForm; Operation: TOperation);
var
  I, J: Integer;
  Obj: TCnEditorToolBarObj;
begin
  if Operation = opInsert then
    DoInstallToolBars(EditWindow, EditControl, nil)
  else if Operation = opRemove then
  begin
{$IFDEF DEBUG}
    CnDebugger.LogFmt('TCnEditorToolBarObj EditControl Removed: %8.8x.',
      [Integer(EditControl)]);
{$ENDIF}
    for I := FToolBarTypes.Count - 1 downto 0 do
    begin
      Obj := TCnEditorToolBarObj(FToolBarTypes.Objects[I]);
      for J := Obj.ToolBarCount - 1 downto 0 do
      begin
        if Obj.EditControls[J] = EditControl then
        begin
          // Ϊ�˱������ EditControl �ͷŶ� ToolBar û���ͷŵ�������˴��ֹ��ͷŵ���
          // �� ToolBar �ͷŵ� Notification ֪ͨ������ʣ�µ����顣
          Obj.ToolBars[J].Free;
        end;
      end;
    end;
  end;
end;

function TCnExternalEditorToolBarMgr.GetVisible(
  ToolBarTypeIndex: TCnEditorToolBarTypeIndex): Boolean;
var
  Obj: TCnEditorToolBarObj;
begin
  Result := False;
  if (ToolBarTypeIndex >= 0) and (ToolBarTypeIndex < FToolBarTypes.Count) then
  begin
    Obj := TCnEditorToolBarObj(FToolBarTypes.Objects[ToolBarTypeIndex]);
    Result := Obj.ToolBarVisible;
  end;
end;

procedure TCnExternalEditorToolBarMgr.InstallToolBars;
begin
  EnumEditControl(DoInstallToolBars, nil);
end;

procedure TCnExternalEditorToolBarMgr.LanguageChanged;
var
  I, J: Integer;
  Obj: TCnEditorToolBarObj;
begin
  for I := 0 to FToolBarTypes.Count - 1 do
  begin
    Obj := TCnEditorToolBarObj(FToolBarTypes.Objects[I]);
    for J := 0 to Obj.ToolBarCount - 1 do
      if Obj.ToolBars[J] <> nil then
        if Assigned(Obj.InitEvent) then
        begin
          Obj.InitEvent(Obj.EditControls[J], Obj.ToolBars[J]);
          Obj.ToolBars[J].Update;
        end;
  end;
end;

function TCnExternalEditorToolBarMgr.RegisterToolBarType(const ToolBarType:
  string; CreateEvent: TCnEditorToolBarCreateEvent; InitEvent:
  TCnEditorToolBarInitEvent; RemoveEvent: TCnEditorToolBarRemoveEvent):
  TCnEditorToolBarTypeIndex;
var
  Obj: TCnEditorToolBarObj;
begin
  Result := FToolBarTypes.IndexOf(ToolBarType);
  if (ToolBarType <> '') and (Result = -1) then
  begin
    Obj := TCnEditorToolBarObj.Create(nil);
    Obj.ToolBarVisible := True;
    Obj.CreateEvent := CreateEvent;
    Obj.InitEvent := InitEvent;
    Obj.RemoveEvent := RemoveEvent;
    Result := FToolBarTypes.AddObject(ToolBarType, Obj);

    InstallToolBars;
  end;
end;

procedure TCnExternalEditorToolBarMgr.CheckEditorToolbarEnable;
{$IFDEF BDS}
var
  I, J, K: Integer;
  AControl: TControl;
  Obj: TCnEditorToolBarObj;
{$ENDIF}
begin
{$IFDEF BDS}
  for I := 0 to FToolBarTypes.Count - 1 do
  begin
    Obj := TCnEditorToolBarObj(FToolBarTypes.Objects[I]);
    if not Obj.ToolBarVisible then
      Continue;

    // ������пɼ��Ĺ�����
    for J := 0 to Obj.ToolBarCount - 1 do
    begin
      if (Obj.ToolBars[J] <> nil) and (Obj.ToolBars[J].Parent <> nil) then
      begin
        for K := Obj.ToolBars[J].Parent.ControlCount - 1 downto 0 do
        begin
          AControl := Obj.ToolBars[J].Parent.Controls[K];
          if AControl.Align = alClient then // �ҵ���һ�� alcient �� Control
          begin
            // ����� EditControl �Ϳɼ�
            Obj.ToolBars[J].Visible := AControl.ClassNameIs(EditControlClassName);
            Break;
          end;
        end;
      end;
    end;
  end;
{$ENDIF}
end;

procedure TCnExternalEditorToolBarMgr.SetVisible(
  ToolBarTypeIndex: TCnEditorToolBarTypeIndex; AParent: TControl;
  Visible: Boolean; Forced: Boolean);
var
  Obj: TCnEditorToolBarObj;
  I, J: Integer;
  ActualVisible: Boolean;
begin
  // ��� Forced Ϊ True����ǿ�����ã�ActualVisible := Visible
  // ��� Forced Ϊ False����Ҫ�� ToolBar ����� ToolBarVisible�����±�
  // ToolBarVisible Vislble   -> ActualVisible
  // True��         True         True
  // True��         False        False
  // False��        True         False
  // False��        False        False
  // ��˲� Forced ʱ ActualVisible := Visible and Obj.ToolBarVisible

  ActualVisible := Visible;

  if ToolBarTypeIndex <> -1 then
  begin
    Obj := TCnEditorToolBarObj(FToolBarTypes.Objects[ToolBarTypeIndex]);
    if not Forced then
      ActualVisible := Visible and Obj.ToolBarVisible
    else
      Obj.ToolBarVisible := Visible;

    for I := 0 to Obj.ToolBarCount - 1 do
      if Obj.ToolBars[I] <> nil then
        if (AParent = nil) or (Obj.ToolBars[I].Parent = AParent) then
          Obj.ToolBars[I].Visible := ActualVisible;
  end
  else
  begin
    if Visible then
    begin
      for J := 0 to FToolBarTypes.Count - 1 do
      begin
        Obj := TCnEditorToolBarObj(FToolBarTypes.Objects[J]);
        if not Forced then
          ActualVisible := Visible and Obj.ToolBarVisible
        else
          Obj.ToolBarVisible := Visible;

        for I := 0 to Obj.ToolBarCount - 1 do
          if Obj.ToolBars[I] <> nil then
            if (AParent = nil) or (Obj.ToolBars[I].Parent = AParent) then
              Obj.ToolBars[I].Visible := ActualVisible;
      end;
    end
    else // ���ÿɼ��벻�ɼ�ʱ�������������򹤾���֮����ܴ�λ
    begin
      for J := FToolBarTypes.Count - 1 downto 0 do
      begin
        Obj := TCnEditorToolBarObj(FToolBarTypes.Objects[J]);
        if not Forced then
          ActualVisible := Visible and Obj.ToolBarVisible
        else
          Obj.ToolBarVisible := Visible;

        for I := 0 to Obj.ToolBarCount - 1 do
          if Obj.ToolBars[I] <> nil then
            if (AParent = nil) or (Obj.ToolBars[I].Parent = AParent) then
              Obj.ToolBars[I].Visible := ActualVisible;
      end;
    end;
  end;
end;

{ TCnEditorToolBarObj }

procedure TCnEditorToolBarObj.AddToolBar(AToolBar: TControl; EditControl: TControl);
begin
  FToolBars.Add(AToolBar);
  FEditControls.Add(EditControl);
  AToolBar.FreeNotification(Self);
end;

constructor TCnEditorToolBarObj.Create(AOwner: TComponent);
begin
  inherited;
  FToolBars := TList.Create;
  FEditControls := TList.Create;
end;

destructor TCnEditorToolBarObj.Destroy;
begin
  FEditControls.Free;
  FToolBars.Free;
  inherited;
end;

function TCnEditorToolBarObj.GetEditControls(Index: Integer): TControl;
begin
  Result := TControl(FEditControls[Index]);
end;

function TCnEditorToolBarObj.GetToolBarCount: Integer;
begin
  Result := FToolBars.Count;
end;

function TCnEditorToolBarObj.GetToolBars(Index: Integer): TControl;
begin
  Result := TControl(FToolBars[Index]);
end;

procedure CreateEditorToolBarService;
begin
  CnEditorToolBarService := TCnExternalEditorToolBarMgr.Create;
end;

procedure TCnEditorToolBarObj.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  I: Integer;
begin
  inherited;
  if Operation = opRemove then
    for I := ToolBarCount - 1 downto 0 do
      if AComponent = FToolBars[I] then
      begin
        // ɾ�� ToolBar ʱ������ RemoveEvent ֪ͨ�ͷ���������
        if Assigned(FRemoveEvent)
          and (AComponent.Tag <> 0) and (TObject(AComponent.Tag) is TControl) then
          FRemoveEvent(TObject(AComponent.Tag) as TControl, AComponent);

        // ���б���ֱ��ɾ��
        FToolBars.Delete(I);
        FEditControls.Delete(I);
{$IFDEF DEBUG}
        CnDebugger.LogFmt('TCnEditorToolBarObj Notification: ToolBar %d %8.8x Removed.',
          [I, Integer(AComponent)]);
{$ENDIF}
      end;
end;

procedure TCnEditorToolBarObj.RemoveEditControlFromIndex(Index: Integer);
begin
  FToolBars.Delete(Index);
  FEditControls.Delete(Index);
end;

{ TCnExternalSrcEditorToolBar }

procedure TCnExternalSrcEditorToolBar.InitControls;
begin
  Caption := '';
  AutoSize := True;
  Align := alTop;
  EdgeBorders := [ebBottom];
  Flat := True;
  DockSite := False;
  ShowHint := True;
end;

{$IFDEF BDS}

procedure TCnExternalSrcEditorToolBar.SetEnabled(Value: Boolean);
begin
// ɶ���������Ա��� BDS �±�������Ϊ����
end;

{$ENDIF}

initialization
  CreateEditorToolBarServiceProc := CreateEditorToolBarService;

finalization
  CnEditorToolBarService := nil;

{$ENDIF CNWIZARDS_CNSRCEDITORENHANCE}
end.
