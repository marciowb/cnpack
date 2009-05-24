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

unit CnTransEditor;
{* |<PRE>
================================================================================
* ������ƣ�CnPack �����
* ��Ԫ���ƣ������ IDE ����༭��Ԫ
* ��Ԫ���ߣ�CnPack������ ��Х (liuxiao@cnpack.org)
* ��    ע���õ�Ԫʵ���˶������ IDE ����༭����
* ����ƽ̨��PWin2000 + Delphi 5.0
* ���ݲ��ԣ�PWin9X/2000/XP + Delphi 5/6/7
* �� �� �����õ�Ԫ�е��ַ��������ϱ��ػ�����ʽ
* ��Ԫ��ʶ��$Id: CnTransEditor.pas,v 1.38 2009/01/17 02:42:08 liuxiao Exp $
* �޸ļ�¼��2008.10.130 V1.4
*               ������ Filter ����ĸ���ʱ�����������Ե�����
*           2008.05.30 V1.3
*               ������ֻ���� string ����
*           2004.03.05 V1.2
*               ������ TFrame ������������
*           2003.12.10 V1.1
*               ���Ӷ�����Ķ��⴦��
*           2003.08.20 V1.0
*               ������Ԫ��ʵ�ֹ���
================================================================================
|</PRE>}

interface

{$I CnPack.inc}

uses
  {$IFDEF COMPILER6_UP}
  DesignIntf, DesignEditors, Variants,
  {$ELSE}
  Dsgnintf,
  {$ENDIF}
  SysUtils, Classes, Forms, Windows, Messages, Dialogs, Graphics, Menus, Grids,
  ComCtrls, Controls, ExtCtrls, ToolWin, ActnList, ImgList, TypInfo, StdCtrls,
  FileCtrl,
  CnLangConsts, CnLangTranslator, CnLangMgr, CnLangCollection, CnLangStorage,
  CnIniLangFileStorage, CnIniStrUtils, CnCommon, ToolsApi, ComObj, CnOTAUtils,
  CnClasses, CnTransFilter;

type
  TCnTranslatorEditor = class(TComponentEditor)
  private
    FFilterOptions: TLangTransFilterSet;
  protected
    procedure ExecFormTranslationManager;
   {* ��ʾ��������� }
    procedure GetObjectStrings(AObject: TObject; Strings: TStrings;
      const BaseName: string);
    procedure GetRecurComponentStrings(AComponent: TComponent; AList: TList;
      Strings: TStrings; const BaseName: string = ''); virtual;
    {* �ݹ���һ Component �Լ����� Component ���ִ� }
    procedure GetRecurObjectStrings(AObject: TObject; AList: TList;
      Strings: TStrings; const BaseName: string = ''); virtual;
    {* �ݹ���һ Object �����Լ��������Զ�����ִ� }
  public

    procedure Edit; override;
    {* ˫���Ĺ��� }
    procedure ExecuteVerb(Index: Integer); override;
    {* ִ���Ҽ��˵��Ĺ��� }
    function GetVerb(Index: Integer): string; override;
    {* �����Ҽ��˵���Ŀ }
    function GetVerbCount: Integer; override;
    {* �����Ҽ��˵���Ŀ�� }
    procedure GetFormStrings(AForm: TComponent; Strings: TStrings);
    {* ���һ Form �ϵ������ִ� }
    procedure GetComponentStrings(AComponent: TComponent; Strings: TStrings;
      const BaseName: string = '');
    {* ���һ Component �������ִ� }
    procedure SetFilterOptions(const AFilterOptions: TLangTransFilterSet);
    {* ���ù��� *}
  end;

type
  TFrmTransEditor = class(TForm)
    statTrans: TStatusBar;
    tvStorages: TTreeView;
    tlbMain: TToolBar;
    splTrans: TSplitter;
    pnlTrans: TPanel;
    clbrTrans: TCoolBar;
    pnlTitle: TPanel;
    StringGrid: TStringGrid;
    lblLangName: TLabel;
    lblLangID: TLabel;
    lblIndex: TLabel;
    lblLangNameValue: TLabel;
    lblLangIDValue: TLabel;
    lblLangIndexValue: TLabel;
    actlstTrans: TActionList;
    actGenStrs: TAction;
    ToolButton1: TToolButton;
    actCopyStrs: TAction;
    ToolButton2: TToolButton;
    actUpdateStrs: TAction;
    actSaveCurItem: TAction;
    actAddLine: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    actDelLine: TAction;
    ToolButton6: TToolButton;
    ilStorage: TImageList;
    ilImages: TImageList;
    lbl1: TLabel;
    lblFileName: TLabel;
    actClear: TAction;
    btn1: TToolButton;
    btn2: TToolButton;
    actCollectForm: TAction;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    actClose: TAction;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    actDelBlank: TAction;
    ToolButton11: TToolButton;
    btnFilter: TToolButton;
    actFilter: TAction;
    procedure tvStoragesChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure StringGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure actGenStrsExecute(Sender: TObject);
    procedure StringGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure actCopyStrsExecute(Sender: TObject);
    procedure actUpdateStrsExecute(Sender: TObject);
    procedure actAddLineExecute(Sender: TObject);
    procedure actSaveCurItemExecute(Sender: TObject);
    procedure tvStoragesCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure actDelLineExecute(Sender: TObject);
    procedure pnlTransResize(Sender: TObject);
    procedure actClearExecute(Sender: TObject);
    procedure actCollectFormExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actDelBlankExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
  private
    FFormFilterOptions: TLangTransFilterSet;
    FTransEditor: TCnTranslatorEditor;
    FContainer: TWinControl;
    { Private declarations }
  public
    { Public declarations }
    procedure WriteNameValueStringsToGrid(List: TStrings; Item: TCnLanguageItem);
    procedure LoadStorageFromList(List: TList);
    procedure SetBasicInfo(List: TStrings; Item: TCnLanguageItem);
    procedure UpdateLangDisplay(Storage: TCnCustomLangStorage; Item: TCnLanguageItem);
    property TransEditor: TCnTranslatorEditor read FTransEditor write FTransEditor;
    property Container: TWinControl read FContainer write FContainer;
  end;

implementation

{$R *.dfm}

procedure SetDesignPathFile(Storage: TCnCustomLangFileStorage);
var
  aPath, aFile: string;
begin
  if Storage = nil then Exit;

  aPath := CnOtaGetOutputDir;
  if aPath = '' then
    aPath := ExtractFilePath(CnOtaGetFileNameOfCurrentModule);
  (Storage as TCnCustomLangFileStorage).SetDesignLangPath(aPath);

  aFile := ChangeFileExt(CnOtaGetCurrentProjectFileName, '');
  (Storage as TCnCustomLangFileStorage).SetDesignLangFile(ExtractFileName(aFile));
end;

procedure TCnTranslatorEditor.Edit;
begin
  ExecFormTranslationManager;
end;

procedure TCnTranslatorEditor.ExecFormTranslationManager;
var
  ATranslator: TCnLangTranslator;
  Container: TComponent;
  i: Integer;
  List: TList;
begin
  if CnLanguageManager = nil then
  begin
    MessageBox(0, PChar(SCnErrorNoLangManager), PChar(SCnErrorCaption),
      MB_OK or MB_ICONWARNING);
    Exit;
  end;
  ATranslator := TCnLangTranslator(Self.Component);
  Container := ATranslator.Owner;

  List := TList.Create;
  for i := 0 to Container.ComponentCount - 1 do
    if Container.Components[i] is TCnCustomLangStorage then
    begin
      List.Add(Container.Components[i]);
      if Container.Components[i] is TCnCustomLangFileStorage then
        SetDesignPathFile(Container.Components[i] as TCnCustomLangFileStorage);
    end;

  if CnLanguageManager.LanguageStorage <> nil then
    if List.IndexOf(CnLanguageManager.LanguageStorage) < 0 then
    begin
      List.Add(CnLanguageManager.LanguageStorage);
      if CnLanguageManager.LanguageStorage is TCnCustomLangFileStorage then
        SetDesignPathFile(CnLanguageManager.LanguageStorage as TCnCustomLangFileStorage);
    end;

  if List.Count = 0 then
  begin
    MessageBox(0, PChar(SCnErrorNoStorage), PChar(SCnErrorCaption),
      MB_OK or MB_ICONWARNING);
    Exit;
  end;

  with TFrmTransEditor.Create(nil) do
  begin
    TransEditor := Self;
    LoadStorageFromList(List);
    ShowModal;
    Free;
  end;
  List.Free;
end;

procedure TCnTranslatorEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: ExecFormTranslationManager;
  end;
end;

procedure TCnTranslatorEditor.GetComponentStrings(AComponent: TComponent;
  Strings: TStrings; const BaseName: string);
var
  List: TList;
begin
  if (Strings <> nil) and (AComponent.ComponentCount > 0) then
  begin
    List := TList.Create;
    List.Add(AComponent);
    try
      GetRecurComponentStrings(AComponent, List, Strings, BaseName);
    finally
      List.Free;
    end;
  end
  else
    GetObjectStrings(AComponent, Strings, BaseName);
end;

procedure TCnTranslatorEditor.GetFormStrings(AForm: TComponent;
  Strings: TStrings);
begin
  GetComponentStrings(AForm, Strings, AForm.ClassName);
end;

procedure TCnTranslatorEditor.GetObjectStrings(AObject: TObject;
  Strings: TStrings; const BaseName: string);
var
  AList: TList;
begin
  AList := TList.Create;
  AList.Add(AObject);
  try
    GetRecurObjectStrings(AObject, AList, Strings, BaseName);
  finally
    AList.Free;
  end;
end;

procedure TCnTranslatorEditor.GetRecurComponentStrings(AComponent: TComponent;
  AList: TList; Strings: TStrings; const BaseName: string);
var
  I: Integer;
  T: TComponent;
begin
  if (AComponent <> nil) and (AList <> nil) then
  begin
    GetObjectStrings(AComponent, Strings, BaseName);
    for I := 0 to AComponent.ComponentCount - 1 do
    begin
      T := AComponent.Components[I];
      if AList.IndexOf(T) = -1 then
      begin
        AList.Add(T);
        if AComponent is TCustomForm then
          GetRecurComponentStrings(T, AList, Strings, BaseName)
        else
          GetRecurComponentStrings(T, AList, Strings, BaseName + DefDelimeter + AComponent.Name);
      end;
    end;
  end;
end;

procedure TCnTranslatorEditor.GetRecurObjectStrings(AObject: TObject;
  AList: TList; Strings: TStrings; const BaseName: string);
var
  i: Integer;
  APropName, APropValue, AStr: string;
  APropType: TTypeKind;
  Data: PTypeData;
  ActionObj, SubObj: TObject;
  AItem: TCollectionItem;
  AListItem: TListItem;
  ATreeNode: TTreeNode;
  IsForm: Boolean;
  NeedIgnoreAction: Boolean;
  ActionCaption, ActionHint: string;
  Info: PPropInfo;
begin
  if (AObject <> nil) and (AList <> nil) then
  begin
    // ���⴫��һЩҰ�˵� AObject ������ѭ�������� IDE �ڲ����ֹ�
    try
      if AObject.ClassType = AObject.ClassParent then
        Exit;
      
      if (AObject.ClassParent <> nil) and (AObject.ClassParent.ClassParent = AObject.ClassType) then
        Exit;
    except
      Exit;
    end;
  
    if (AObject is TCnCustomLangStorage) or (AObject is TCnCustomLangStorage)
      or ((AObject is TComponent) and ((AObject as TComponent).Name = '')) then
        Exit;

    if (AObject is TStrings) then  // Strings�Ķ���ֱ�Ӽ����� Text ���ԡ�
    begin
      if not (tfText in FFilterOptions) then
        Exit;

      AStr := 'Text';
      if BaseName <> '' then
        AStr := BaseName + DefDelimeter + AStr;

      Strings.Add(AStr + DefEqual + (AObject as TStrings).Text);
      Exit;
    end
    else if (AObject is TCollection) then // TCollection ��������� Item
    begin
      for i := 0 to (AObject as TCollection).Count - 1 do
      begin
        AItem := (AObject as TCollection).Items[i];
        if AList.IndexOf(AItem) = -1 then
        begin
          AList.Add(AItem);
          if BaseName <> '' then
            GetRecurObjectStrings(AItem, AList, Strings, BaseName + DefDelimeter
              + 'Item' + InttoStr(i))
          else
            GetRecurObjectStrings(AItem, AList, Strings, 'Item' + InttoStr(i));
        end;
      end;
    end
    // ListView ����Ҫʱ������ Item
    else if CnLanguageManager.TranslateListItem and (AObject is TListView) then
    begin
      for i := 0 to (AObject as TListView).Items.Count - 1 do
      begin
        AListItem := (AObject as TListView).Items[i];
        if AList.IndexOf(AListItem) = -1 then
        begin
          AList.Add(AListItem);
          if BaseName <> '' then
            GetRecurObjectStrings(AListItem, AList, Strings, BaseName + DefDelimeter
              + TComponent(AObject).Name + DefDelimeter + 'ListItem' + InttoStr(i))
          else
            GetRecurObjectStrings(AListItem, AList, Strings,
              TComponent(AObject).Name + DefDelimeter + 'ListItem' + InttoStr(i));
        end;
      end;
    end
    // �� ListItem ʱ������ Caption ���Ժ� SubItems ����
    else if CnLanguageManager.TranslateListItem and (AObject is TListItem) then
    begin
      if (tfCaption in FFilterOptions) then
        begin
          AStr := 'Caption';
          if BaseName <> '' then
            AStr := BaseName + DefDelimeter + AStr;

          Strings.Add(AStr + DefEqual + (AObject as TListItem).Caption);
        end;

      if (tfSubItemsText in FFilterOptions) then
        begin
          AStr := 'SubItems.Text';
          if BaseName <> '' then
            AStr := BaseName + DefDelimeter + AStr;

          Strings.Add(AStr + DefEqual + (AObject as TListItem).SubItems.Text);
        end;
      Exit;
    end
    // TreeView ����Ҫʱ������ Item
    else if CnLanguageManager.TranslateTreeNode and (AObject is TTreeView) then
    begin
      for i := 0 to (AObject as TTreeView).Items.Count - 1 do
      begin
        ATreeNode := (AObject as TTreeView).Items[i];
        if AList.IndexOf(ATreeNode) = -1 then
        begin
          AList.Add(ATreeNode);
          if BaseName <> '' then
            GetRecurObjectStrings(ATreeNode, AList, Strings, BaseName + DefDelimeter
              + TComponent(AObject).Name + DefDelimeter + 'TreeNode' + InttoStr(i))
          else
            GetRecurObjectStrings(ATreeNode, AList, Strings,
              TComponent(AObject).Name + DefDelimeter + 'TreeNode' + InttoStr(i));
        end;
      end;
    end
    // �� TreeNode ʱ������ Text ����
    else if CnLanguageManager.TranslateTreeNode and (AObject is TTreeNode) then
    begin
      if not (tfText in FFilterOptions) then
        Exit;

      AStr := 'Text';
      if BaseName <> '' then
        AStr := BaseName + DefDelimeter + AStr;

      Strings.Add(AStr + DefEqual + (AObject as TTreeNode).Text);
      Exit;
    end;

    IsForm := (AObject is TCustomForm); // or (AObject is TCustomFrame);
    // if IsForm then IsForm := (AObject as TWinControl).Parent = nil;

    try
      Data := GetTypeData(AObject.Classinfo);
    except
      Exit; // TChartSeriesList ���ڴ˴��������ò�ץס����
    end;

    NeedIgnoreAction := False;
    if CnLanguageManager.IgnoreAction then
    begin
      // �����Ƿ��� Action ���ԣ����Ƿ� nil
      for I := 0 to Data^.PropCount - 1 do
      begin
        APropName := GetPropName(AObject, I);
        if (PropType(AObject, APropName) = tkClass) and (APropName = 'Action') then
        begin
          // ���� Action ���ԣ�ΪtkClass
          ActionObj := GetObjectProp(AObject, APropName);
          if (ActionObj <> nil) and (ActionObj is TCustomAction)then
          begin
            // �� Action ���Բ�Ϊ nil �ģ���Ҫ��¼ Caption �� Hint ���Ƚ�
            NeedIgnoreAction := True;
            ActionCaption := (ActionObj as TCustomAction).Caption;
            ActionHint := (ActionObj as TCustomAction).Hint;
            Break;
          end;
        end;
      end;
    end;

    for I := 0 to Data^.PropCount - 1 do
    begin
      APropName := GetPropName(AObject, I);

      // ������ TComponent �� Name ����
      if (AObject is TComponent) and (APropName = 'Name') then
        Continue;
      // ������ TCnComponent �� About ����
      if (AObject is TCnComponent) and (APropName = 'About') then
        Continue;

      APropType := PropType(AObject, APropName);
      if (APropType in [tkString, tkWChar, tkLString, tkWString
        {$IFDEF UNICODE_STRING}, tkUString{$ENDIF}]) then
      begin
        try
          APropValue := VartoStr(GetPropValue(AObject, APropName));
        except
          // ���� OLE �������ȡ WideString ����ʱ�����Ӹ�����
          Continue;
        end;

        if NeedIgnoreAction then
        begin
          if (APropName = 'Caption') and (ActionCaption = APropValue) then
            Continue
          else if (APropName = 'Hint') and (ActionHint = APropValue) then
            Continue;
        end;

        Info := GetPropInfo(AObject, APropName);
        if (Info <> nil) and (Info^.SetProc = nil) then // ֻ������д�ģ��㿪
          Continue;

        // �����������
        if (APropName = 'Caption') then
        begin
          if not (tfCaption in FFilterOptions) then
          begin
            Continue;
          end;
        end
        else if (APropName = 'Category') then
        begin
          if not (tfCategory in FFilterOptions) then
          begin
            Continue;
          end;
        end
        else if (APropName = 'HelpKeyword') then
        begin
          if not (tfHelpKeyword in FFilterOptions) then
          begin
            Continue;
          end;
        end
        else if (APropName = 'Hint') then
        begin
          if not (tfHint in FFilterOptions) then
          begin
            Continue;
          end;
        end
        else if (APropName = 'ImeName') then
        begin
          if not (tfImeName in FFilterOptions) then
          begin
            Continue;
          end;
        end
        else if (APropName = 'Title') then
        begin
          if not (tfTitle in FFilterOptions) then
          begin
            Continue;
          end;
        end
        else if (APropName = 'DefaultExt') then
        begin
          if not (tfDefaultExt in FFilterOptions) then
          begin
            Continue;
          end;
        end
        else if (APropName = 'Filter') then
        begin
          if not (tfFilter in FFilterOptions) then
          begin
            Continue;
          end;
        end
        else if (APropName = 'InitialDir') then
        begin
          if not (tfInitialDir in FFilterOptions) then
          begin
            Continue;
          end;
        end
        else if not (tfOthers in FFilterOptions) then
        begin
          Continue;
        end;

        if IsForm then
          AStr := AObject.ClassName + DefDelimeter + APropName
        else if AObject is TComponent then
          AStr := TComponent(AObject).Name + DefDelimeter + APropName
        else
          AStr := APropName;

        if (BaseName <> '') and not IsForm then
          AStr := BaseName + DefDelimeter + AStr;

        Strings.Add(AStr + DefEqual + APropValue);
      end
      else if APropType = tkClass then
      begin
        SubObj := GetObjectProp(AObject, APropName);
        if AObject is TComponent then
        begin
          if AList.IndexOf(SubObj) = -1 then
          begin
            AList.Add(SubObj);

            if (AObject is TControl) and (SubObj is TFont) and (APropName = 'Font') then
            begin
              if (tfFont in FFilterOptions) then
                if not IsParentFont(AObject as TControl) then // ��ʹ�� ParentFont ʱ������
                begin
                  if not IsForm then
                    AStr := TComponent(AObject).Name + DefDelimeter + SCnControlFont
                  else
                    AStr := SCnControlFont;

                  if BaseName <> ''  then
                    AStr := BaseName + DefDelimeter + AStr;

                  Strings.Add(AStr + DefEqual + FontToStringEx(SubObj as TFont,
                    GetParentFont(AObject as TComponent)));
                end;
            end // �������洦�� TControl������
            else if CnLanguageManager.TranslateOtherFont and (SubObj is TFont) then
            begin
              if (tfFont in FFilterOptions) then
                begin
                  if not IsForm then
                    AStr := TComponent(AObject).Name + DefDelimeter +
                      SystemNamePrefix + APropName
                  else
                    AStr := SystemNamePrefix + APropName;

                  if BaseName <> ''  then
                    AStr := BaseName + DefDelimeter + AStr;

                  Strings.Add(AStr + DefEqual + FontToStringEx(SubObj as TFont,
                    GetParentFont(AObject as TComponent)));
                end;                    
            end
            else if not (SubObj is TComponent) or ((SubObj as TComponent).Owner = nil) then
            begin
              if IsForm then
                GetRecurObjectStrings(SubObj, AList, Strings,
                  TComponent(AObject).ClassName + DefDelimeter + APropName)
              else if (InheritsFromClassName(AObject, 'TNotebook') or InheritsFromClassName(AObject, 'TTabbedNotebook'))
                and (APropName = 'Pages') then
                // ����ȡ TNotebook/TTabbedNotebook �� Pages ���ԣ�������ַ����ҳ�����ݶ�ʧ��
              else
                GetRecurObjectStrings(SubObj, AList, Strings, BaseName +
                  DefDelimeter + TComponent(AObject).Name + DefDelimeter + APropName);
            end;
          end;
        end
        else
        begin
          if AList.IndexOf(SubObj) = -1 then
          begin
            AList.Add(SubObj);
            GetRecurObjectStrings(SubObj, AList, Strings,
              BaseName + DefDelimeter + APropName);
          end;
        end;
      end;
    end;
  end;
end;

function TCnTranslatorEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := SCnFormTranslationManager;
  end;
end;

function TCnTranslatorEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

{ TFrmTransEditor }

procedure TFrmTransEditor.LoadStorageFromList(List: TList);
var
  i, j: Integer;
  ANode: TTreeNode;
begin
  Self.tvStorages.Items.Clear;
  for i := 0 to List.Count - 1 do
  begin
    ANode := Self.tvStorages.Items.AddObject(nil,
      TCnCustomLangStorage(List[i]).Name, List[i]);
    for j := 0 to TCnCustomLangStorage(List[i]).LanguageCount - 1 do
      Self.tvStorages.Items.AddChildObject(ANode,
        InttoStr(TCnCustomLangStorage(List[i]).Languages[j].LanguageID) + ' - ' +
        TCnCustomLangStorage(List[i]).Languages[j].LanguageName,
        TCnCustomLangStorage(List[i]).Languages[j]);
  end;

  for i := 0 to Self.tvStorages.Items.Count - 1 do
  begin
    Self.tvStorages.Items[i].ImageIndex := Self.tvStorages.Items[i].Level;
    Self.tvStorages.Items[i].SelectedIndex := Self.tvStorages.Items[i].Level;
    if Self.tvStorages.Items[i].Level = 0 then
      Self.tvStorages.Items[i].Expand(True);
  end;
end;

procedure TFrmTransEditor.tvStoragesChange(Sender: TObject;
  Node: TTreeNode);
begin
  if Node.Level = 1 then
  begin
    Self.UpdateLangDisplay(TCnCustomLangStorage(Node.Parent.Data),
      TCnLanguageItem(Node.Data));
    Self.pnlTrans.Enabled := True;
  end
  else
    Self.pnlTrans.Enabled := False;
end;

procedure TFrmTransEditor.UpdateLangDisplay(Storage: TCnCustomLangStorage;
  Item: TCnLanguageItem);

  function IsLangComment(const CommentString: string): Boolean;
  begin
    Result := (CommentString[1] = SCnCommentChar1) or
              (CommentString[1] = SCnCommentChar2) or
              ((CommentString[1] = SCnCommentChar3) and
              (CommentString[2] = SCnCommentChar3));
  end;

var
  List: TStringList;
  i: Integer;
  S: string;
  bPrompted: Boolean;
begin
  Self.lblLangNameValue.Caption := Item.LanguageName;
  Self.lblLangIDValue.Caption := InttoStr(Item.LanguageID);
  Self.lblLangIndexValue.Caption := InttoStr(Item.Index);

  if Storage is TCnCustomLangFileStorage then
  begin
    if DirectoryExists((Storage as TCnCustomLangFileStorage).LanguagePath) then
      ForceDirectories((Storage as TCnCustomLangFileStorage).LanguagePath);

    if (Storage as TCnCustomLangFileStorage).StorageMode = smByFile then
      Self.lblFileName.Caption := Item.LanguageFileName +
        (Storage as TCnCustomLangFileStorage).GetLanguageFileExt
    else
      Self.lblFileName.Caption := '.\' + Item.LanguageDirName + '\'
        + (Storage as TCnCustomLangFileStorage).DesignLangFile
        + (Storage as TCnCustomLangFileStorage).GetLanguageFileExt;
  end;

  if Self.Container = nil then
    if (Self.TransEditor = nil) then
      Exit
    else
      Self.Container := TWinControl(TCnLangTranslator(Self.TransEditor.Component).Owner);

  Storage.CurrentLanguageIndex := Item.Index;

  List := TStringList.Create;
  Storage.GetNamesList(List);

  Self.StringGrid.RowCount := 2;
  Self.StringGrid.FixedRows := 1;

  if List.Count > 0 then
  begin
    //������к�ע��
    bPrompted := False;
    for i := List.Count - 1 downto 0 do
    begin
      if (List[i] = '') or IsLangComment(List[i]) then
      begin
        if not bPrompted then
        begin
          WarningDlg(SCnLangInvalidLine);
          bPrompted := True;
        end;
        List.Delete(i);
      end;
    end;

    Self.StringGrid.RowCount := List.Count + 1;
    for i := 1 to Self.StringGrid.RowCount - 1 do
      Self.StringGrid.Cells[0, i] := InttoStr(i);
      
    for i := 0 to List.Count - 1 do
    begin
      Self.StringGrid.Cells[1, i + 1] := List[i];
      S := List[i];
      if S[1] <> SystemNamePrefix then // �����ַ���ȡ��ԭ��ֵ
      begin
        S := GetValueByTransName(Self.Container, S);
        Self.StringGrid.Cells[2, i + 1] := S
      end;
      // ��ʾ�䷭����ֵ
      if Storage.GetString(List[i], S) then
        Self.StringGrid.Cells[3, i + 1] := S;
    end;
  end
  else
  begin
    Self.StringGrid.Rows[1].Text := '';
    Self.StringGrid.Cells[0, 1] := '1';
  end;
end;

procedure TFrmTransEditor.FormCreate(Sender: TObject);
begin
  Self.StringGrid.ColWidths[0] := 30;
  Self.StringGrid.ColWidths[1] := 141;
  Self.StringGrid.ColWidths[2] := 194;
  Self.StringGrid.ColWidths[3] := 194;

  // Localize UI
  actAddLine.Caption := SCnactAddLineCaption;
  actAddLine.Hint := SCnactAddLineHint;
  actClear.Caption := SCnactClearCaption;
  actClear.Hint := SCnactClearHint;
  actClose.Caption := SCnactCloseCaption;
  actCollectForm.Caption := SCnactCollectFormCaption;
  actCollectForm.Hint := SCnactCollectFormHint;
  actCopyStrs.Caption := SCnactCopyStrsCaption;
  actCopyStrs.Hint := SCnactCopyStrsHint;
  actDelBlank.Caption := SCnactDelBlankCaption;
  actDelBlank.Hint := SCnactDelBlankHint;
  actDelLine.Caption := SCnactDelLineCaption;
  actDelLine.Hint := SCnactDelLineHint;
  actFilter.Caption := SCnactFilterCaption;
  actFilter.Hint := SCnactFilterHint;
  actGenStrs.Caption := SCnactGenStrsCaption;
  actGenStrs.Hint := SCnactGenStrsHint;
  actSaveCurItem.Caption := SCnactSaveCurItemCaption;
  actSaveCurItem.Hint := SCnactSaveCurItemHint;
  actUpdateStrs.Caption := SCnactUpdateStrsCaption;
  actUpdateStrs.Hint := SCnactUpdateStrsHint;
  Caption := SCnCaption;
  lbl1.Caption := SCnlbl1Caption;
  lblIndex.Caption := SCnlblIndexCaption;
  lblLangID.Caption := SCnlblLangIDCaption;
  lblLangName.Caption := SCnlblLangNameCaption;
  StringGrid.Hint := SCnStringGridHint;
  tvStorages.Hint := SCntvStoragesHint;

  Self.StringGrid.Cells[1, 0] := SCnStringGridCells10;
  Self.StringGrid.Cells[2, 0] := SCnStringGridCells20;
  Self.StringGrid.Cells[3, 0] := SCnStringGridCells30;

  FFormFilterOptions := [];
end;

procedure TFrmTransEditor.StringGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  OutStr: string;
begin
  if (gdFixed in State)then
    with Sender as TStringGrid do
    begin
      OutStr := Cells[ACol, ARow];
      Canvas.FillRect(Rect);
      Canvas.TextOut(Rect.Left + ((Rect.Right - Rect.Left -
        Canvas.TextWidth(OutStr)) shr 1), Rect.Top + ((Rect.Bottom - Rect.top
        - Canvas.TextHeight(OutStr)) shr 1), OutStr);
    end;

  if ACol = 0 then
  begin
    Canvas.FillRect(Rect);
    Canvas.TextOut(Rect.Left + 3, Rect.Top + 2, InttoStr(ARow));
  end;
end;

procedure TFrmTransEditor.actGenStrsExecute(Sender: TObject);
var
  List: TStringList;
  Item: TCnLanguageItem;
begin
  if (tvStorages.Selected = nil) or (tvStorages.Selected.Level <> 1) then
    Exit;

  if Self.Container = nil then
    if (Self.TransEditor = nil) then
      Exit
    else
      Self.Container := TWinControl(TCnLangTranslator(Self.TransEditor.Component).Owner);

  List := TStringList.Create;
  Item := TCnLanguageItem(tvStorages.Selected.Data);

  TransEditor.SetFilterOptions(FFormFilterOptions);
  Self.TransEditor.GetFormStrings(Self.Container, List);

  WriteNameValueStringsToGrid(List, Item);
end;

procedure TFrmTransEditor.StringGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ACol in [1, 3] then
    Self.StringGrid.Options := Self.StringGrid.Options + [goEditing]
  else
    Self.StringGrid.Options := Self.StringGrid.Options - [goEditing];
end;

procedure TFrmTransEditor.actCopyStrsExecute(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to Self.StringGrid.RowCount do
    if Self.StringGrid.Cells[3, i] = '' then
      Self.StringGrid.Cells[3, i] := Self.StringGrid.Cells[2, i];
end;

procedure TFrmTransEditor.actUpdateStrsExecute(Sender: TObject);
var
  List: TStringList;
  DestList: array[1..3] of TStringList;
  i, Index: Integer;
  Item: TCnLanguageItem;
begin
  { DONE : ��������ִ��б������Ѿ��з���ģ���Ӧ�ƶ������ִ���������ӡ� }
  if (tvStorages.Selected = nil) or (tvStorages.Selected.Level <> 1) then
    Exit;

  Item := TCnLanguageItem(Self.tvStorages.Selected.Data);

  if Self.Container = nil then
    if (Self.TransEditor = nil) then
      Exit
    else
      Self.Container := TWinControl(TCnLangTranslator(Self.TransEditor.Component).Owner);

  List := nil;
  for i := Low(DestList) to High(DestList) do
    DestList[i] := nil;
  TransEditor.SetFilterOptions(FFormFilterOptions);

  try
    List := TStringList.Create;
    Self.TransEditor.GetFormStrings(Self.Container, List);

    for i := Low(DestList) to High(DestList) do
      DestList[i] := TStringList.Create;

    for i := 1 to Self.StringGrid.RowCount - 1 do
    begin
      if Self.StringGrid.Cells[1, i] <> '' then
      begin
        DestList[1].Add(Self.StringGrid.Cells[1, i]);
        DestList[2].Add(Self.StringGrid.Cells[2, i]);
        DestList[3].Add(Self.StringGrid.Cells[3, i]);
      end;
    end;

    Index := DestList[1].IndexOf(SystemNamePrefix + SCnLanguageID);
    if Index > 0 then DestList[3][Index] := InttoStr(Item.LanguageID);
    Index := DestList[1].IndexOf(SystemNamePrefix + SCnLanguageName);
    if Index > 0 then DestList[3][Index] := Item.LanguageName;
    Index := DestList[1].IndexOf(SystemNamePrefix + SCnAuthor);
    if Index > 0 then DestList[3][Index] := Item.Author;
    Index := DestList[1].IndexOf(SystemNamePrefix + SCnAuthorEmail);
    if Index > 0 then DestList[3][Index] := Item.AuthorEmail;
    Index := DestList[1].IndexOf(SystemNamePrefix + SCnDefaultFont);
    if Index > 0 then DestList[3][Index] := Item.DefaultFontStr;

    for i := 0 to List.Count - 1 do
    begin
      Index := DestList[1].IndexOf(List.Names[i]);
      if Index > 0 then
      begin
        DestList[2][Index] := List.Values[List.Names[i]];
      end
      else
      begin
        DestList[1].Add(List.Names[i]);
        DestList[2].Add(List.Values[List.Names[i]]);
        DestList[3].Add('');
      end;
    end;

    Self.StringGrid.RowCount := DestList[1].Count + 1;
    for i := 0 to DestList[1].Count - 1 do
    begin
      Self.StringGrid.Cells[0, i + 1] := InttoStr(i + 1);
      Self.StringGrid.Cells[1, i + 1] := DestList[1][i];
      Self.StringGrid.Cells[2, i + 1] := DestList[2][i];
      Self.StringGrid.Cells[3, i + 1] := DestList[3][i];
    end;
  finally
    for i := Low(DestList) to High(DestList) do
      DestList[i].Free;
    List.Free;
  end;
end;

procedure TFrmTransEditor.actAddLineExecute(Sender: TObject);
var
  R: TGridRect;
begin
  if (tvStorages.Selected = nil) or (tvStorages.Selected.Level <> 1) then
    Exit;
    
  with Self.StringGrid do
  begin
    RowCount := RowCount + 1;
    Rows[RowCount - 1].Text := '';
    Cells[0, RowCount - 1] := InttoStr(RowCount - 1);
    R.Left := 1; R.Top := RowCount - 1;
    R.Right := 1; R.Bottom := RowCount - 1;
    Selection := R;
    SetFocus;
  end;
end;

procedure TFrmTransEditor.actSaveCurItemExecute(Sender: TObject);
var
  Storage: TCnCustomLangStorage;
  i: Integer;
begin
  if (tvStorages.Selected = nil) or (tvStorages.Selected.Level <> 1) then
    Exit;

  Storage := TCnCustomLangStorage(tvStorages.Selected.Parent.Data);
  if Storage is TCnCustomLangFileStorage then
    SetDesignPathFile(Storage as TCnCustomLangFileStorage);

  Storage.ClearCurrentLanguage;
  for i := 1 to Self.StringGrid.RowCount - 1 do
    if StringGrid.Cells[1, i] <> '' then
      Storage.SetString(StringGrid.Cells[1, i], StringGrid.Cells[3, i]);
  Storage.SaveCurrentLanguage;
end;

procedure TFrmTransEditor.SetBasicInfo(List: TStrings; Item: TCnLanguageItem);
begin
  if (List <> nil) and (Item <> nil) then
  begin
    List.Values[SystemNamePrefix + SCnLanguageID] := InttoStr(Item.LanguageID);
    List.Values[SystemNamePrefix + SCnLanguageName] := Item.LanguageName;
    List.Values[SystemNamePrefix + SCnAuthor] := Item.Author;
    List.Values[SystemNamePrefix + SCnAuthorEmail] := Item.AuthorEmail;
  end;
end;

procedure TFrmTransEditor.tvStoragesCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Node.Level = 0 then  // ����������Ĵ洢����ô�����ʾ
  begin
    if CnLanguageManager <> nil then
      if CnLanguageManager.LanguageStorage = TCnCustomLangStorage(Node.Data) then
        Sender.Canvas.Font.Style := [fsBold];
  end
  else if Node.Level = 1 then // ����������ĵ�ǰ������ĿҲ�ô�����ʾ
  begin
    if CnLanguageManager <> nil then
      if CnLanguageManager.LanguageStorage = TCnCustomLangStorage(Node.Parent.Data) then
        if CnLanguageManager.CurrentLanguageIndex = Node.Parent.IndexOf(Node) then
          Sender.Canvas.Font.Style := [fsBold];
  end;

  DefaultDraw := True;
end;

procedure TFrmTransEditor.actDelLineExecute(Sender: TObject);
var
  i: Integer;
begin
  { DONE : ɾ��һ�С� }
  with Self.StringGrid do
    if RowCount > 2 then
    begin
      for i := Row to RowCount - 2 do
      begin
        Rows[i].Text := Rows[i + 1].Text;
        Cells[0, i] := InttoStr(i);
      end;
      RowCount := RowCount - 1;
    end
    else if RowCount = 2 then
      Rows[1].Text := '1';
end;

procedure TFrmTransEditor.pnlTransResize(Sender: TObject);
begin
  { DONE : ����Resize�¼����ı�Grid�п� }
  Self.StringGrid.ColWidths[1] := (Self.StringGrid.Width - 30 - 24) * 7 div 27 + 1;
  Self.StringGrid.ColWidths[2] := (Self.StringGrid.Width - 30 - 24) * 10 div 27;
  Self.StringGrid.ColWidths[3] := (Self.StringGrid.Width - 30 - 24) * 10 div 27;
end;

procedure TFrmTransEditor.actClearExecute(Sender: TObject);
begin
  if (tvStorages.Selected = nil) or (tvStorages.Selected.Level <> 1) then
    Exit;

  Self.StringGrid.RowCount := 2;
  Self.StringGrid.Rows[1].Text := '';
  Self.StringGrid.Cells[0, 1] := '1';
end;

procedure TFrmTransEditor.actCollectFormExecute(Sender: TObject);
var
  List: TStringList;
  Item: TCnLanguageItem;
  i: Integer;
  Project: IOTAProject;
  ModuleInfo: IOTAModuleInfo;
  FormEditor: IOTAFormEditor;
  AModule: IOTAModule;
  Opened: Boolean;

  function CnOtaGetProjectGroup: IOTAProjectGroup;
  var
    IModuleServices: IOTAModuleServices;
    IModule: IOTAModule;
    i: Integer;
  begin
    Result := nil;
    Supports(BorlandIDEServices, IOTAModuleServices, IModuleServices);
    if IModuleServices <> nil then
      for i := 0 to IModuleServices.ModuleCount - 1 do
      begin
        IModule := IModuleServices.Modules[i];
        if Supports(IModule, IOTAProjectGroup, Result) then
          Break;
      end;
  end;

  function CnOtaGetCurrentProject: IOTAProject;
  var
    IProjectGroup: IOTAProjectGroup;
  begin
    Result := nil;

    IProjectGroup := CnOtaGetProjectGroup;
    if not Assigned(IProjectGroup) then
      Exit;

    try
      // This raises exceptions in D5 with .bat projects active
      Result := IProjectGroup.ActiveProject;
    except
      Result := nil;
    end;
  end;

  function ExtractUpperFileExt(const FileName: string): string;
  begin
    Result := UpperCase(ExtractFileExt(FileName));
  end;

  function IsCpp(const FileName: string): Boolean;
  var
    FileExt: string;
  begin
    FileExt := ExtractUpperFileExt(FileName);
    Result := (FileExt = '.CPP');
  end;

  function CnOtaGetFileEditorForModule(Module: IOTAModule; Index: Integer): IOTAEditor;
  begin
    Result := nil;
    if not Assigned(Module) then Exit;
    try
      // BCB 5 ��Ϊһ���򵥵ĵ�Ԫ���� GetModuleFileEditor(1) �����
      {$IFDEF BCB5}
      if IsCpp(Module.FileName) and (Module.GetModuleFileCount = 2) and (Index = 1) then
        Index := 2;
      {$ENDIF}
      Result := Module.GetModuleFileEditor(Index);
    except
      Result := nil; // �� IDE �ͷ�ʱ�����ܻ����쳣����
    end;
  end;

  function CnOtaGetFormEditorFromModule(const Module: IOTAModule): IOTAFormEditor;
  var
    i: Integer;
    Editor: IOTAEditor;
    FormEditor: IOTAFormEditor;
  begin
    Result := nil;
    if not Assigned(Module) then
      Exit;
    for i := 0 to Module.GetModuleFileCount - 1 do
    begin
      Editor := CnOtaGetFileEditorForModule(Module, i);
      if Supports(Editor, IOTAFormEditor, FormEditor) then
      begin
        Result := FormEditor;
        Exit;
      end;
    end;
  end;

  function CnOtaGetRootComponentFromEditor(Editor: IOTAFormEditor): TComponent;
  var
    Component: IOTAComponent;
    NTAComponent: INTAComponent;
  begin
    Result := nil;
    if not Assigned(Editor) then Exit;

    try
      Component := Editor.GetRootComponent;
    except
      // ��ĳЩ�ļ�ʱ�����Delphi5��
      Exit;
    end;
  
    if Assigned(Component) and Supports(Component, INTAComponent,
      NTAComponent) then
    begin
      Result := NTAComponent.GetComponent;
      Exit;
    end;
  end;

begin
  if (tvStorages.Selected = nil) or (tvStorages.Selected.Level <> 1) then
    Exit;

  Item := TCnLanguageItem(tvStorages.Selected.Data);
  List := TStringList.Create;

  Project := CnOtaGetCurrentProject;
  if Project = nil then
    Exit;

  Screen.Cursor := crHourGlass;
  try
    for i := 0 to Project.GetModuleCount - 1 do
    begin
      ModuleInfo := Project.GetModule(i);
      Opened := CnOtaIsFileOpen(ModuleInfo.FileName);
      if ModuleInfo.FormName = '' then Continue;
      try
        AModule := ModuleInfo.OpenModule;
        FormEditor := CnOtaGetFormEditorFromModule(AModule);
      except
        FormEditor := nil;
        AModule := nil;
      end;

      if FormEditor <> nil then
      begin
        TransEditor.SetFilterOptions(FFormFilterOptions);
        Self.TransEditor.GetFormStrings(CnOtaGetRootComponentFromEditor(FormEditor), List);

        if not Opened and (AModule <> nil) then
        begin
          try
            AModule.CloseModule(True);
          except
            ;
          end;
          AModule := nil;
        end;
      end;
    end;

    Application.ProcessMessages;
    WriteNameValueStringsToGrid(List, Item);
  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure TFrmTransEditor.WriteNameValueStringsToGrid(List: TStrings;
  Item: TCnLanguageItem);
var
  i, EquPos: Integer;
  S: string;
begin
  if (List = nil) or (Item = nil) then
    Exit;

  Self.StringGrid.RowCount := List.Count + 6;
  Self.StringGrid.Cells[1, 1] := SystemNamePrefix + SCnLanguageID;
  Self.StringGrid.Cells[3, 1] := InttoStr(Item.LanguageID);
  Self.StringGrid.Cells[1, 2] := SystemNamePrefix + SCnLanguageName;
  Self.StringGrid.Cells[3, 2] := Item.LanguageName;
  Self.StringGrid.Cells[1, 3] := SystemNamePrefix + SCnAuthor;
  Self.StringGrid.Cells[3, 3] := Item.Author;
  Self.StringGrid.Cells[1, 4] := SystemNamePrefix + SCnAuthorEmail;
  Self.StringGrid.Cells[3, 4] := Item.AuthorEmail;
  Self.StringGrid.Cells[1, 5] := SystemNamePrefix + SCnDefaultFont;
  Self.StringGrid.Cells[3, 5] := Item.DefaultFontStr;

  for i := 1 to 5 do
  begin
    Self.StringGrid.Cells[0, i] := InttoStr(i);
    Self.StringGrid.Cells[2, i] := '';
  end;

  for i := 0 to List.Count - 1 do
  begin
    Self.StringGrid.Cells[0, i + 6] := InttoStr(i + 6);
    S := List[I];
    EquPos := Pos('=', S);
    if EquPos > 0 then
    begin
      Self.StringGrid.Cells[1, i + 6] := Copy(S, 1, EquPos - 1);
      Self.StringGrid.Cells[2, i + 6] := Copy(S, EquPos + 1, MaxInt);
    end
    else // �޵Ⱥ�
    begin
      Self.StringGrid.Cells[1, i + 6] := S;
      Self.StringGrid.Cells[2, i + 6] := '';
    end;
    Self.StringGrid.Cells[3, i + 6] := '';
  end;
  Self.StringGrid.Cells[0, 0] := '';
end;

procedure TFrmTransEditor.actCloseExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmTransEditor.actDelBlankExecute(Sender: TObject);
var
  I, BlankRow: Integer;

  function IsBlankText(AText: string): Boolean;
  var
    I: Integer;
  begin
    Result := True;
    for I := 1 to Length(AText) do
      if not CharInSet(AText[I], [' '..'@', '['..'_', '{'..'~']) then
      begin
        Result := False;
        Exit;
      end;   
  end;  
begin
  Screen.Cursor := crHourGlass;
  BlankRow := -1; // BlankRow ʼ�ռ�¼��һ�����л���Ч��
  try
    for I := 5 to Self.StringGrid.RowCount - 1 do
    begin
      if (StringGrid.Cells[1, I][1] <> '!') and IsBlankText(StringGrid.Cells[2, I])
        and IsBlankText(StringGrid.Cells[3, I]) then // �����������
      begin
        if BlankRow = -1 then // ����ǰ�޿��У�
          BlankRow := I;      // ���¼�˿���λ��
      end
      else // �����ǰ�в���
      begin
        if BlankRow >= 0 then // ��ǰ�п���
        begin
          // ��ǰ�������ƶ�������ȥ
          StringGrid.Cells[0, BlankRow] := IntToStr(BlankRow);
          StringGrid.Cells[1, BlankRow] := StringGrid.Cells[1, I];
          StringGrid.Cells[2, BlankRow] := StringGrid.Cells[2, I];
          StringGrid.Cells[3, BlankRow] := StringGrid.Cells[3, I];
          // BlankRow ָ����һ���У����ܷǿյ���������
          Inc(BlankRow);
        end;
      end;
    end;
    if BlankRow >= 0 then
      Self.StringGrid.RowCount := BlankRow;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TCnTranslatorEditor.SetFilterOptions(
  const AFilterOptions: TLangTransFilterSet);
begin
  if AFilterOptions = [] then
  begin
    Include(FFilterOptions, tfFont);
    Include(FFilterOptions, tfCaption);
    Include(FFilterOptions, tfCategory);
    Include(FFilterOptions, tfHelpKeyword);
    Include(FFilterOptions, tfHint);
    Include(FFilterOptions, tfText);
    Include(FFilterOptions, tfImeName);
    Include(FFilterOptions, tfTitle);
    Include(FFilterOptions, tfDefaultExt);
    Include(FFilterOptions, tfFilter);
    Include(FFilterOptions, tfInitialDir);
    Include(FFilterOptions, tfSubItemsText);
    Include(FFilterOptions, tfOthers);
  end
  else
    FFilterOptions := AFilterOptions;
end;

procedure TFrmTransEditor.actFilterExecute(Sender: TObject);
begin
  with TFrmTransFilter.Create(Self) do
  begin
    try
      Open(FFormFilterOptions);
    finally
      Free;
    end;
  end;
end;

end.

