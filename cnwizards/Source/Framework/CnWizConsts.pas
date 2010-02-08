{******************************************************************************}
{                       CnPack For Delphi/C++Builder                           }
{                     �й����Լ��Ŀ���Դ�������������                         }
{                   (C)Copyright 2001-2010 CnPack ������                       }
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

unit CnWizConsts;
{* |<PRE>
================================================================================
* ������ƣ�CnPack IDE ר�ҹ��߰�
* ��Ԫ���ƣ���Դ�ַ������嵥Ԫ
* ��Ԫ���ߣ�CnPack������
* ��    ע���õ�Ԫ������ CnWizards �õ�����Դ�ַ���
* ����ƽ̨��PWin2000Pro + Delphi 5.01
* ���ݲ��ԣ�PWin9X/2000/XP + Delphi 5/6/7 + C++Builder 5/6
* �� �� �����õ�Ԫ�е��ַ��������ϱ��ػ�����ʽ
* ��Ԫ��ʶ��$Id$
* �޸ļ�¼��2005.05.05 V1.2
*               hubdog: �����µİ汾��Ϣ��չר��
*           2003.08.20 V1.1
*               LiuXiao: ����Ӣ������
*           2002.09.17 V1.0
*               ������Ԫ
================================================================================
|</PRE>}

interface

{$I CnWizards.inc}

uses
  CnWizCompilerConst, CnConsts;

//==============================================================================
// ����Ҫ���ػ����ַ���
//==============================================================================

const
  {$I Version.inc}

  SCnWizardVersion = SCnWizardMajorVersion + '.' + SCnWizardMinorVersion;
  SCnWizardFullVersion = SCnWizardVersion + ' Build ' + SCnWizardBuildDate;

  SCnWizardCaption = 'CnPack IDE Wizards ' + SCnWizardVersion;
  SCnWizardDesc = 'CnPack IDE Wizards for Delphi/C++Builder/BDS/Rad Studio' + #13#10 +
                  '' + #13#10 +
                  'Version: ' + SCnWizardFullVersion + #13#10 +
                  'Copyright: 2001-2010 CnPack Team' + #13#10 +
                  '' + #13#10 +
                  'This is a freeware, you can use it freely without any fee. ' +
                  'You can copy or distribute it in any form, without any fee. ' +
                  'The source code can be abtained from Internet. ' +
                  'For more information please see the license file.' + #13#10 +
                  '' + #13#10 +
                  'WebSite: ' + SCnPackUrl + #13#10 +
                  'Forum: ' + SCnPackBbsUrl + #13#10 +
                  'Mail: ' + SCnPackEmail;
  SCnWizardLicense = 'Freeware';

resourcestring

  // Framework
  SCnWizardMgrName = 'CnPack Wizards';
  SCnWizardMgrID = 'CnPack.Wizards';
  SCnWizardsMenuName = 'CnPackMenu';
  SToolsMenuName = 'ToolsMenu';
  SCnPackKeyboard = 'CnPack_Keyboard';
  SCnActiveSection = 'Active';
  SCnMenuOrderSection = 'MenuOrder';

  // ���洰��λ��
  SCnFormPosition = 'FormPosition';
  SCnFormPositionTop = '_Top';
  SCnFormPositionLeft = '_Left';
  SCnFormPositionWidth = '_Width';
  SCnFormPositionHeight = '_Height';

  SCnCreateSection = 'Create';
  SCnBootLoadSection = 'BootLoad';
  SCnSplashBmp = 'CnWizSplash';
  SCnAboutBmp = 'CnWizAbout';

  SCnActionPrefix = 'act';
  SCnMenuItemPrefix = 'mni';
  SCnIcoFileExt = '.ico';
  SCnBmpFileExt = '.bmp';

  // IDE CmdLine Switch
  SCnNoCnWizardsSwitch = 'nocn';
  SCnShowBootFormSwitch = 'swcn';
  SCnUserRegSwitch = 'cnreg';

  SCnWizardsPage = 'CnPack';
  SCnWizardsNamePrefix = 'CnPack';
  SCnWizardsMenuCaption = 'C&nPack';
  SCnWizardsActionCategory = 'CnPack';
  SCnWizAlignSizeCategory = 'CnFormDesign';

  SCnKeyBindingDispName = 'CnPack Buffer List';
  SCnKeyBindingName = 'CnPack.BufferList';
  SCnShortCutsSection = 'ShortCuts';
  SCnOptionSection = 'Option';
  SCnCommentSection = 'Comment';
  SCnUpgradeSection = 'Upgrade';

  SCnWizConfigCommand = 'CnWizConfig';
  SCnWizConfigIcon = 'CnWizConfig';
  SCnWizConfigMenuName = 'CnWizConfig';

  SCnWizardRegPath = 'CnWizards';
  SCnWizLangPath = 'Lang';
  SCnWizDataPath = 'Data';
  SCnWizTemplatePath = 'Data\Templates';
  SCnWizIconPath = 'Icons';
  SCnWizHelpPath = 'Help';
  SCnWizUserPath = 'User';
  SCnWizCustomUserPath = 'CnWizards';
  SCnWizCommentPath = 'Comment';
  SCnWizLangFile = 'CnWizards.txt';
  SCnWizHelpIniFile = 'Help.ini';
  SCnWizCommentIniFile = 'Comments.ini';
  SCnWizUpgradeIniFile = 'Upgrade.ini';
  SCnWizTipOfDayIniFile = 'TipOfDay.ini';
  SCnWizResDllName = 'CnWizRes.dll';

  // RegPath
  SCnPropEditorRegPath = 'CnPropEditor';
  SCnCompEditorRegPath = 'CnCompEditor';
  SCnIdeEnhancementsRegPath = 'IdeEnhancements';

  SCnEditorEnhReg = 'SourceEditor';
  SCnFormEnhReg = 'FormDesigner';
  SCnPalEnhReg = 'ComponentPalette';

  // IdePath
{$IFDEF BDS}
  SCnIDEPathMacro = '$(BDS)';
{$ELSE}
{$IFDEF BCB}
  SCnIDEPathMacro = '$(BCB)';
{$ELSE}
  SCnIDEPathMacro = '$(DELPHI)';
{$ENDIF}
{$ENDIF}

  SCnWizOnlineHelpUrl = 'http://help.cnpack.org/cnwizards/';

  // CnWizUpgrade
  SCnWizDefUpgradeURL = 'http://upgrade.cnpack.org/cnwizards/';
  SCnWizDefNightlyBuildUrl = 'http://upgrade.cnpack.org/cnwizards/latest/';
  SCnWizUpgradeVersion = 'Ver %s Build %s';

  // CnMessageBoxWizard
  SCnMsgBoxDataName = 'MsgBoxPrj.ini';
  SCnMsgBoxProjectLastName = 'Auto Saved';

  // CnSrcTemplate
  SCnSrcTemplateDataName = 'Editor.cdt';

  // CnInputHelper
  SCnPreDefSymbolsFile = 'PreDefSymbols.xml';
  SCnCodeTemplateFile = 'CodeTemplate.xml';
  SCnUserSymbolsFile = 'UserSymbols.xml';
  SCnXmlCommentDataFile = 'XmlComment.xml';
  SCnJavaDocDataFile = 'JavaDocComment.xml';
  SCnCompDirectDataFile = 'CompDirect.ini';
  SCnInputHelperHelpStr = 'CnInputHelper';

  // CnPas2HtmlWizard
  SCnHTMLPostFix = '_Html';

  // CnFormEnhancements
  SCnFlatToolBarDataExt = 'ini';

  // CnEditorWizard
  SCnEditorWizardConfigName = 'CnEditorWizardConfig';
  SCnEditorCollectorDir = 'Collector';
  SCnEditorCollectorData = 'Collector.dat';

  // CnSrcTemplate
  SCnSrcTemplateConfigName = 'CnSrcTemplateConfig';
  SCnSrcTemplateIconName = 'TCnSrcTemplate';
  SCnSrcTemplateItem = 'CnEditorItem';

  // CnTabOrderWizard
  SCnTabOrderSetCurrControl = 'CnTabOrderSetCurrControl';
  SCnTabOrderSetCurrForm = 'CnTabOrderSetCurrForm';
  SCnTabOrderSetOpenedForm = 'CnTabOrderSetOpenedForm';
  SCnTabOrderSetProject = 'CnTabOrderSetProject';
  SCnTabOrderSetProjectGroup = 'CnTabOrderSetProjectGroup';
  SCnTabOrderDispTabOrder = 'CnTabOrderDispTabOrder';
  SCnTabOrderAutoReset = 'CnTabOrderAutoReset';
  SCnTabOrderConfig = 'CnTabOrderConfig';

  // CnPas2HtmlWizard
  SCnPas2HtmlWizardCopySelected = 'CnPas2HtmlWizardCopySelected';
  SCnPas2HtmlWizardExportUnit = 'CnPas2HtmlWizardExportUnit';
  SCnPas2HtmlWizardExportOpened = 'CnPas2HtmlWizardExportOpened';
  SCnPas2HtmlWizardExportDPR = 'CnPas2HtmlWizardExportDPR';
  SCnPas2HtmlWizardExportBPG = 'CnPas2HtmlWizardExportBPG';
  SCnPas2HtmlWizardConfig = 'CnPas2HtmlWizardConfig';

  // CnPrefixWizard
  SCnPrefixDataName = 'Prefix.ini';

  // CnProjectExtWizard
  SCnProjExtWizard = 'CnProjectExtWizard';
  SCnProjExtRunSeparately = 'CnProjExtRunSeparately';
  SCnProjExtExploreUnit = 'CnProjExtExploreUnit';
  SCnProjExtExploreProject = 'CnProjExtExploreProject';
  SCnProjExtExploreExe = 'CnProjExtExploreExe';
  SCnProjExtViewUnits = 'CnProjExtViewUnits';
  SCnProjExtViewForms = 'CnProjExtViewForms';
  SCnProjExtUseUnits = 'CnProjExtUseUnits';
  SCnProjExtListUsed = 'CnProjExtListUsed';
  SCnProjExtBackup = 'CnProjExtBackup';
  SCnProjExtDelTemp = 'CnProjExtDelTemp';
  SCnProjExtFileReopen = 'CnProjExtFileReopen';
  SCnProjExtDirBuilder = 'CnProjExtDirBuilder';

  SCnProjExtBackupDllName = 'CnZipWrapper.Dll';

  // CnFilesSnapshotWizard
  SCnProjExtFilesSnapshotAdd = 'CnProjExtFilesSnapshotAdd';
  SCnProjExtFilesSnapshotManage = 'CnProjExtFilesSnapshotManage';
  SCnProjExtFilesSnapshotsItem = 'CnProjExtFilesSnapshotsItem';

  // CnWizAbout
  SCnWizAboutHelp = 'CnWizAboutHelp';
  SCnWizAboutHistory = 'CnWizAboutHistory';
  SCnWizAboutBugReport = 'CnWizAboutBugReport';
  SCnWizAboutUpgrade = 'CnWizAboutUpgrade';
  SCnWizAboutConfigIO = 'CnWizAboutConfigIO';
  SCnWizAboutUrl = 'CnWizAboutUrl';
  SCnWizAboutBbs = 'CnWizAboutBbs';
  SCnWizAboutMail = 'CnWizAboutMail';
  SCnWizAboutTipOfDay = 'CnWizAboutTipOfDay';
  SCnWizAboutAbout = 'CnWizAboutAbout';

  // CnEditorEnhancements
  SCnMenuCloseOtherPagesName = 'CnCloseOtherPages';
  SCnShellMenuName = 'CnShellMenu';
  SCnMenuSelAllName = 'CnSelAll';
  SCnMenuBlockToolsName = 'CnMenuBlockTools';
  SCnMenuExploreName = 'CnExplore';
  SCnCopyFileNameMenuName = 'CnCopyFileName';
  SCnEditorToolBarDataName = 'EditorToolBar.ini';
  SCnEditorDesignToolBarDataName = 'DesignToolBar.ini';
{$IFDEF DELPHI}
  SCnCodeWrapFile = 'CodeWrap.xml';
{$ELSE}
  SCnCodeWrapFile = 'CodeWrap_CB.xml';
{$ENDIF}
  SCnGroupReplaceFile = 'GroupReplace.xml';
  SCnWebSearchFile = 'WebSearch.xml';

  // CnFormEnhancements
  SCnFlatPanelFileName = 'FormToolBar';
  SCnFloatPropBarFileName = 'FloatPropBar.dat';

  // CnPaletteEnhancements
  SCnPaletteTabsMenuName = 'CnPaletteTabs';
  SCnPaletteMutiLineMenuName = 'CnPaletteMultiLine';
  SCnLockToolbarMenuName = 'CnLockToolBar';
  SCnWizMenuName = 'CnWizToolMenu';
  SCnWizOptionMenuName = 'CnWizToolOptionMenu';
  SCnDefWizMenuCaption = '&Wizards';

  // CnCorPropWizard
  SCnCorPropDataName = 'CorRules.ini';

  // CnConfigIO
  SCnConfigIOName = 'CnConfigIO.exe';

  // CnFavoriteWizard
  SCnFavWizAddToFavorite = 'CnFavWziAddToFavorite';
  SCnFavWizManageFavorite = 'CnFavWizManageFavorite';

  // CnCpuWinEnhancements
  SCnMenuCopy30LinesName = 'CnCopy30Lines';
  SCnMenuCopyLinesName = 'CnCopyLines';

  // CnWizMultiLang
  SCnWizMultiLangName = 'Language Switch';
  SCnWizMultiLangCaption = 'Languages';
  SCnWizMultiLangHint = 'Language Switch';
  SCnWizMultiLangComment = 'Language Switch';

  // CnResourceMgrWizard
  SCnWizDocumentMgr = 'CnWizDocumentMgr';
  SCnWizImageMgr = 'CnWizImageMgr';
  SCnWizResMgrConfig = 'CnWizResMgrConfig';

  // CnRepositoryMenu
  SCnRepositoryMenuCommand = 'CnRepositoryMenu';

  // CnMsdnWizard
  SCnMsdnWizRunConfig = 'CnMsdnWizRunConfig';
  SCnMsdnWizRunMsdn = 'CnMsdnWizRunMsdn';
  SCnMsdnWizRunSearch = 'CnMsdnWizRunSearch';

  // CnInputHelper
  SCnInputHelperPopup = 'CnInputHelperPopup';

  // CnIdeEnhanceMenu
  SCnIdeEnhanceMenuCommand = 'CnIdeEnhanceMenu';

  // CnIdeBRTool
  SCnIdeBRToolName = 'CnIdeBRTool.exe';

  // CnScriptWizard
  SCnScriptWizCfgCommand = 'CnScriptWizardConfig';
  SCnScriptFormCommand = 'CnScriptForm';
  SCnScriptBrowseDemoCommand = 'CnScriptBrowseDemo';
  SCnScriptTemplateFileName = 'CnScript.pas';
  SCnScriptFileName = 'Scripts.xml';
  SCnScriptItem = 'CnScriptItem';
  SCnScriptDeclDir = 'PSDecl';
  SCnScriptDemoDir = 'PSDemo';
  SCnScriptFileDir = 'Scripts';
  SCnScriptDefName = 'Script%d.pas';

//==============================================================================
// ��Ҫ���ػ����ַ���
//==============================================================================

var
  // Common
  SCnSaveDlgTxtFilter: string = '�ı��ļ� (*.txt)|*.TXT|�����ļ� (*.*)|*.*|';
  SCnSaveDlgTitle: string = '����Ϊ...';
  SCnOverwriteQuery: string = '�ļ��Ѿ����ڣ��Ƿ񸲸ǣ�';
  SCnDeleteConfirm: string = '��ȷ��Ҫɾ����';
  SCnClearConfirm: string = '��ȷ��Ҫ�����';
  SCnDefaultConfirm: string = '��ȷ��Ҫɾ���Զ������ݣ��ָ�Ĭ��������';
  SCnNoHelpofThisLang: string = 'Sorry. No HELP in this Language.';
  SCnOnlineHelp: string = '���߰���(&H)';
  SCnImportAppend: string = '�Ƿ����׷�ӷ�ʽ���룿';
  SCnImportError: string = '��������ʧ�ܣ�';
  SCnExportError: string = '��������ʧ�ܣ�';
  SCnUnknownNameResult: string = '������';
  SCnNoneResult: string = '��';
  SCnInputFile: string = '�������ļ�����';
  SCnDoublePasswordError: string = '����Ƿ���һ�£����������룡';
  SCnMoreMenu: string = '����...';

  // ������
  STypeDescription: string =
    '  ���󱨸�����Ƿ����ʡ��������������������Ĺ����Լ������쳣�����' + #13#10#13#10 +
    '  �û�����ָ�� CnPack �������Ľ��顢�¹��������Լ���������Ϣ��' + #13#10#13#10 +
    '  �����ύ���󱨸�ͽ���ʱ���뱣֤��ʹ�õ������µ� CnPack��' +
    '������ͨ���Զ����¹��ܻ���ʿ�����վ��������°汾��';
  SBugDescriptionDescription: string =
    '  ��������ڴ������ϸ������������ϵͳ����������ݺ����ã��Լ�����Ϊ���ܶ�' +
    '������Ա���ָô������õ����ݡ�' + #13#10#13#10 +
    '  ͨ����ֻ�е�������Ա�ܹ���Ч������һ������ʱ�����ſ��ܱ���ȷ��������' +
    '��Ϊ��Ҫ�����ݣ����ı��뻷��������ϵͳ�������Ժ󽫻ᱻ�ռ���';
  SFeatureDescriptionDescription: string =
    '  ������һ�ݹ�������Ҫ���¹��ܵ���ϸ��������ȷ�ϸù��ܶ�����˵ȷʵ�����õġ�';
  SDetailsDescription: string =
    '  ��������һ������󣬿�����Ա�ܹ��������������������Ƿǳ���Ҫ�ġ�' + #13#10#13#10 +
    '  ��˵�����Ƿ����ͨ��һЩ�̶��Ĳ������ָô��󣬼��������ֵĸ��ʡ�' + #13#10#13#10 +
    '  ͬʱ����ѡ�����Ƿ�������������������ָ����⣬�Լ��ô����Ƿ�ֻ���ض�����Ŀ��ء�';
  SStepsDescription: string =
    '  ��������ϸ�Ĳ������裬�԰���������Ա���ָô���' + #13#10#13#10 +
    '  ���Ĳ���Ӧ�������� IDE ��ʼ��ֱ�����ִ���ǰ�Ĳ�����' +
    '������������������л����壬�Լ������������ϸ�쳣��Ϣ��' + #13#10#13#10 +
    '  ������ܣ�������һ��Ĭ�ϵĹ��̡��򵥵Ĺ��̻��� IDE �Դ������ӹ�������������';
  SConfigurationDescription1: string =
    '';
  SConfigurationDescription2: string =
    #13#10#13#10 + '  Ϊ�˱�֤һ����Ч�ı��棬�����Ƽ�������Ĭ�ϵ�ѡ��Ժ��ڷ��͸�����֮ǰ��' +
    '��Ҳ�������ѱ༭��ɾ����Щ������Ϣ��';
  SBugConfigurationDescription: string = '  ��ѡ����������ݶ������͸������飬�԰������������ִ�����������'
    + #13#10#13#10 + '  Ϊ�˱�֤һ����Ч�ı��棬�����Ƽ�������Ĭ�ϵ�ѡ��Ժ��ڷ��͸�����֮ǰ��' +
    '��Ҳ�������ѱ༭��ɾ����Щ������Ϣ��';
  SFeatureConfigurationDescription: string = '  ��ѡ����������ݶ������͸������飬�԰���������ȷ����������Ľ��顣'
    + #13#10#13#10 + '  Ϊ�˱�֤һ����Ч�ı��棬�����Ƽ�������Ĭ�ϵ�ѡ��Ժ��ڷ��͸�����֮ǰ��' +
    '��Ҳ�������ѱ༭��ɾ����Щ������Ϣ��';
  SReportDescription: string =
    '  �������ɡ���ť��������һ�ⷴ���ʼ�������Ҫ���������е�����ճ�����ʼ���ȥ��' + #13#10#13#10 +
    '  ���ߣ���Ҳ���Ե�������桱��ť�����Ǳ��浽�ļ��У�����Ϊ�������͸� %s��' + #13#10#13#10 +
    '  ����򵼲������Զ������κ�����Ը�⹫�������ݣ��������ݶ���Ҫ���ֹ����͡�';

  STypeExample: string =
    '  CnPack �����鲢������е��κ���ҵ�������񡣳�Ա�Ƕ���æ�����������������' +
    'ֻ�����ǵ���Ȥ��׷���������ǲ���Ϊ���������Ƶ������ר�һ���Ŀ��' + #13#10#13#10 +
    '  ���⣬ר�Ұ�ͨ�����ٿ��� GExperts ����ѹ������Ѵ��ڵ�ר�ң����ڽ���ʱ��ע�⡣';
  SBugDescriptionExample: string =
    '  ������ IDE �Ĺ�����������ר�Ұ�ť���������� IDE ȴ�������ӵ�' +
    '��ť����˿յİ�ť��';
  SFeatureDescriptionExample: string =
    '  ��ϣ����������һ���µı༭�����ߣ��ܹ��� ' +
    {$IFDEF BCB} 'C++' {$ELSE} 'Delphi' {$ENDIF} +
    ' ����ת�� VB �Ĵ��룬�����ҾͿ���������д Outlook �ʼ������� :-)' + #13#10#13#10 +
    '  �����ʵ�ֵĻ����һ����һ�ݸ�н�����ɵĹ�����';
  SDetailsExample: string =
    '';
  SStepsExample: string =
    '1. �ӿ�ʼ�˵������� ' + CompilerName + #13#10 +
    '2. �Ҽ���� IDE ��������ѡ�� Customize...' + #13#10 +
    '3. �϶�һ�� CnPack ר�����������' + #13#10 +
    '4. �ر� ' + CompilerName + #13#10 +
    '5. �������� ' + CompilerName + #13#10 +
    '6. �������ϸղ������İ�ť����˿հ�ť';
  SConfigurationExample: string =
    '';
  SReportExample: string =
    '';

  SFinish: string = '���(&F)';
  SNext: string = '��һ��(&N) >';

  STitle: string = '���󱨸漰�û������� - ';
  SBugReport: string = '���󱨸档';
  SFeatureRequest: string = '���ܽ��顣';

  SDescription: string = '����:';
  SSteps: string = '����:';

  SBugDetails: string = '����ϸ��:';
  SBugIsReproducible: string = '  �ô����� %s%% �ĸ��ʿ����֡�';
  SBugIsNotReproducible: string = '  �ô��󲻿����֡�';

  SFillInReminder: string = '��ǵ��ڴ�ճ�����ɵı���';
  SFillInReminderPaste: string = '��ǵ��ڴ�ճ�����ɵı���';
  SFillInReminderAttach: string = '��ǵ��ڴ�ճ�����ɵı���򸽼� %s';

  SBugSteps: string =
    '1. �ӿ�ʼ�˵������� ' + CompilerName + #13#10 +
    '2. һ��Ĭ�ϵĿչ��̱�����' + #13#10 +
    '3. �����˵��У�ѡ��...' + #13#10 +
    '4.' + #13#10 +
    '5.';

  SUnknown: string = '<δ֪>';
  SOutKeyboard: string = '����:';
  SOutLocale: string = '���ػ���Ϣ:';
  SOutExperts: string = '�Ѱ�װ��ר��:';
  SOutPackages: string = '�Ѱ�װ�İ�:';
  SOutIDEPackages: string = '�Ѱ�װ�� IDE ��:';
  SOutCnWizardsActive: string = 'CnPack IDE ר������״̬:';
  SOutCnWizardsCreated: string = 'CnPack IDE ר�Ҵ���״̬:';
  SOutConfig: string = '����:';

  // CnWizUpgrade
  SCnWizNoUpgrade: string = '����ǰʹ�õ��Ѿ������µİ汾�ˣ�' + #13#10#13#10 +
    '����Ҫ���ÿ�չ����淢��ҳ����';
  SCnWizUpgradeFail: string = '���ӷ�����ʧ�ܣ����Ժ����ԣ��������Ŀ��վ����ѯ���£�';
  SCnWizUpgradeCommentName: string = 'Comment';

  // CheckIDEVersion
  SCnIDENOTLatest: string = '����⣬���� IDE ����û�а�װ���µĲ�������' +
    '��ᵼ�� IDE �����ȶ�������ר�Ұ��Ĳ��ֹ���Ҳ���ܵò���֧�֡�' +
    '����Ƽ������ذ�װ���µĲ�������';

  // CnWizUtils
  SCnWizardForPasOrDprOnly: string = '��ר�ҽ������� .pas �� .dpr �ļ�';
  SCnWizardForPasOrIncOnly: string = '��ר�ҽ������� .pas �� .inc �ļ�';
  SCnWizardForDprOrPasOrIncOnly: string = '��ר�ҽ������� .pas��.dpr �� .inc �ļ�';

  // CnShortcut
  SCnDuplicateShortCutName: string = 'Ҫ������ȼ������ظ�: %s';

  // CnMenuAction
  SCnDuplicateCommand: string = 'Ҫ������������ظ�: %s';
  SCnWizSubActionShortCutFormCaption: string = '%s - ��ݼ�����';

  // CnWizConfigForm
  SCnWizConfigCaption: string = '����(&O)...';
  SCnWizConfigHint: string = '���� CnPack IDE ר�ҹ���';
  SCnProjectWizardName: string = '����ģ����';
  SCnFormWizardName: string = '����ģ����';
  SCnUnitWizardName: string = '��Ԫģ����';
  SCnRepositoryWizardName: string = 'ģ����';
  SCnMenuWizardName: string = '��׼�˵�ר��';
  SCnSubMenuWizardName: string = '���Ӳ˵���ר��';
  SCnActionWizardName: string = '��ݼ�ר��';
  SCnIDEEnhanceWizardName: string = 'IDE ������չר��';
  SCnBaseWizardName: string = '��ͨר��';
  SCnWizardNameStr: string = '����: ';
  SCnWizardShortCutStr: string = '�ȼ�: ';
  SCnWizardStateStr: string = '״̬: ';
  SCnWizardActiveStr: string = '��Ч';
  SCnWizardDisActiveStr: string = '����';
  SCnWizCommentReseted: string = '����ר�ҵĹ�����ʾ���������¿�����' + #13#10 +
    'ʹ��ר�ҹ���ʱ������õ�������ʾ��';

  SCnSelectDir: string = 'ѡ��һ���ļ���';
  SCnQueryAbort: string = '��ȷ��Ҫ�жϵ�ǰ������';

  SCnExportPCDirCaption: string = '��ѡ��ؼ��б�����б�����ļ���';
  SCnExportPCSucc: string = '�Ѿ��ɹ�����ؼ��б��ļ� %s �Ͱ��б��ļ� %s';
  // CnWizAbout
  SCnConfigIONotExists: string = '�޷����е��뵼�����ߣ������°�װר�Ұ���';

  // CnMessageBoxWizard
  SCnMsgBoxMenuCaption: string = 'MessageBox(&M)...';
  SCnMsgBoxMenuHint: string = '���ӻ����� MessageBox �������ô���';
  SCnMsgBoxName: string = 'MessageBox �����';
  SCnMsgBoxComment: string = '���ڿ��ӻ����� MessageBox �������ô��롣';
  SCnMsgBoxProjectCaption: string = '����ģ��';
  SCnMsgBoxProjectPrompt: string = '������ģ������:';
  SCnMsgBoxProjectDefaultName: string = 'ģ��';
  SCnMsgBoxProjectExists: string = '�������ģ�����Ѵ��ڣ���ȷ��Ҫ������';
  SCnMsgBoxDeleteProject: string = '��ȷ��Ҫɾ����ģ����';
  SCnMsgBoxCannotDelLastProject: string = '������ɾ���Զ�����ģ�壡';

  // CnComponentSelector
  SCnCompSelectorMenuCaption: string = '���ѡȡ(&S)...';
  SCnCompSelectorMenuHint: string = 'ʹ�ö��ַ�ʽ����ѡȡ���';
  SCnCompSelectorName: string = '���ѡȡ����';
  SCnCompSelectorComment: string = '�����û�ʹ�ö��ַ�ʽ����ѡȡ�����';
  SCnCompSelectorNotSupport: string = '���ѡȡ����ֻ֧�ִ���� Frame��';

  // CnTabOrderWizard
  SCnTabOrderMenuCaption: string = '����Tab Order(&T)';
  SCnTabOrderMenuHint: string = '�Զ����ÿؼ��� Tab Order ֵ';
  SCnTabOrderName: string = 'Tab Order ���ù���';
  SCnTabOrderComment: string = '���Ը��ݶ����Զ����ÿؼ��� Tab Order ֵ��';
  SCnTabOrderSetCurrControlCaption: string = '��ѡ��Ŀؼ�(&C)';
  SCnTabOrderSetCurrControlHint: string = '�Զ����õ�ǰѡ��ؼ��� Tab Order ֵ��' + #13#10 +
    '���ѡ��Ŀؼ������ӿؼ������������ӿؼ���' + #13#10 +
    '��֮���øÿؼ��ĸ��ؼ��µ��ӿؼ���';
  SCnTabOrderSetCurrFormCaption: string = '��ǰ�������пؼ�(&F)';
  SCnTabOrderSetCurrFormHint: string = '�Զ����õ�ǰ���������пؼ��� Tab Order';
  SCnTabOrderSetOpenedFormCaption: string = '���д򿪵Ĵ���(&E)';
  SCnTabOrderSetOpenedFormHint: string = '�Զ��������д򿪴��������пؼ��� Tab Order';
  SCnTabOrderSetProjectCaption: string = '��ǰ�������д���(&P)';
  SCnTabOrderSetProjectHint: string = '�Զ����õ�ǰ�������д��������пؼ��� Tab Order';
  SCnTabOrderSetProjectGroupCaption: string = '��ǰ���������д���(&G)';
  SCnTabOrderSetProjectGroupHint: string = '�Զ����õ�ǰ���������д��������пؼ��� Tab Order';
  SCnTabOrderDispTabOrderCaption: string = '��ʾ�ؼ�Tab Order(&D)';
  SCnTabOrderDispTabOrderHint: string = '�Ƿ��������������ʾ���ڿؼ��� Tab Order';
  SCnTabOrderAutoResetCaption: string = '�ƶ��ؼ��Զ�����(&A)';
  SCnTabOrderAutoResetHint: string = '���ؼ�λ���ƶ�ʱ�Ƿ��Զ����� Tab Order';
  SCnTabOrderConfigCaption: string = '����(&O)...';
  SCnTabOrderConfigHint: string = '��ʾ Tab Order ���ù��ߵ����ô��ڡ�';
  SCnTabOrderSucc: string = '�ɹ������� %d �������ϵĿؼ���';
  SCnTabOrderFail: string = 'û����Ҫ����Ĵ��壡';

  // CnDfm6To5Wizard
  SCnDfm6To5WizardMenuCaption: string = '�򿪸߰汾����(&H)...';
  SCnDfm6To5WizardMenuHint: string = '���ɸ߰汾�����������Ĵ��嵥Ԫ';
  SCnDfm6To5WizardName: string = '�򿪸߰汾���幤��';
  SCnDfm6To5WizardComment: string = '���ɸ߰汾�����������Ĵ��嵥Ԫ��';
  SCnDfm6To5OpenError: string = '�ļ���ʧ�ܣ�'
    + #13#10#13#10 + '�ļ���: %s';
  SCnDfm6To5SaveError: string = 'д�ļ�ʧ�ܣ������ļ���ֻ�����ԣ�'
    + #13#10#13#10 + '�ļ���: %s';
  SCnDfm6To5InvalidFormat: string = '�����ļ���ʽת��ʧ�ܣ�'
    + #13#10#13#10 + '�ļ���: %s';

  // CnBookmarkWizard
  SCnBookmarkWizardMenuCaption: string = '��ǩ���(&B)...';
  SCnBookmarkWizardMenuHint: string = '�����ǰ���ļ������е���ǩ';
  SCnBookmarkWizardName: string = '��ǩ���ר��';
  SCnBookmarkWizardComment: string = '�����ǰ���ļ������е���ǩ��';
  SCnBookmarkAllUnit: string = '<ȫ����Ԫ>';
  SCnBookmarkFileCount: string = '��Ԫ����: %d';

  // CnEditorWizard
  SCnEditorWizardMenuCaption: string = '����༭��ר��(&E)';
  SCnEditorWizardMenuHint: string = '����༭����ǿ���߼�';
  SCnEditorWizardName: string = '����༭��ר��';
  SCnEditorWizardComment: string = '����༭����ǿ���߼���';
  SCnEditorWizardConfigCaption: string = '����(&O)...';
  SCnEditorWizardConfigHint: string = '���ô���༭����ǿ����';

  // CnEditorCodeTool
  SCnEditorCodeToolSelIsEmpty: string = '����ѡ��Ҫ���д���Ĵ��룡';
  SCnEditorCodeToolNoLine: string = '�޷������Ҫ����Ĵ��룡';

  // CnEditorCodeSwap
  SCnEditorCodeSwapMenuCaption: string = '��ֵ����(&C)';
  SCnEditorCodeSwapName: string = '��ֵ��������';
  SCnEditorCodeSwapMenuHint: string = '������ǰѡ������и�ֵ�����ߵ�����';

  // CnEditorCodeToString
  SCnEditorCodeToStringMenuCaption: string = 'ת��Ϊ�ַ���(&S)';
  SCnEditorCodeToStringName: string = '����ת�ַ�������';
  SCnEditorCodeToStringMenuHint: string = '����ǰѡ��Ĵ���ת�����ַ���';

  // CnEditorCodeDelBlank
  SCnEditorCodeDelBlankMenuCaption: string = 'ɾ������(&D)...';
  SCnEditorCodeDelBlankName: string = 'ɾ�����й���';
  SCnEditorCodeDelBlankMenuHint: string = '����Ҫɾ�������еĿ���';

  // CnEditorOpenFile
  SCnEditorOpenFileMenuCaption: string = '���ļ�(&P)...';
  SCnEditorOpenFileName: string = '���ļ�����';
  SCnEditorOpenFileMenuHint: string = 'ֱ�Ӹ����ļ���������·���в��Ҳ����ļ�';
  SCnEditorOpenFileDlgCaption: string = '���ļ�';
  SCnEditorOpenFileDlgHint: string = '�����ļ���:';
  SCnEditorOpenFileNotFind: string = '������·����ϵͳ·����û���ҵ�ָ�����ļ���';

  // CnEditorZoomFullScreen
  SCnEditorZoomFullScreenMenuCaption: string = '���봰��ȫ���л�(&F)';
  SCnEditorZoomFullScreenMenuHint: string = '����༭��������������ȫ��֮���л�';
  SCnEditorZoomFullScreen: string = '���봰��ȫ���л�����';
  SCnEditorZoomFullScreenNoEditor: string = 'δ�ҵ�����༭�����ڻ����༭�����ڴ���ͣ��״̬���޷�����ȫ���л�';

  // CnEditorCodeComment
  SCnEditorCodeCommentMenuCaption: string = 'ע�ʹ����(&B)';
  SCnEditorCodeCommentMenuHint: string = '��˫б��ע�͵�ѡ�еĴ����';
  SCnEditorCodeCommentName: string = '�����ע�͹���';

  // CnEditorCodeUnComment
  SCnEditorCodeUnCommentMenuCaption: string = 'ȡ�������ע��(&U)';
  SCnEditorCodeUnCommentMenuHint: string = 'ȡ��ѡ�е���˫б��ע�͵��Ĵ�����ע��';
  SCnEditorCodeUnCommentName: string = '�����ȡ��ע�͹���';

  // CnEditorCodeToggleComment
  SCnEditorCodeToggleCommentMenuCaption: string = '��ת�����ע��(&I)';
  SCnEditorCodeToggleCommentMenuHint: string = '��תѡ�еĴ�����ע��';
  SCnEditorCodeToggleCommentName: string = '��ת�����ע�͹���';

  // CnEditorCodeIndent
  SCnEditorCodeIndentMenuCaption: string = '���������(&R)';
  SCnEditorCodeIndentMenuHint: string = '�������������';
  SCnEditorCodeIndentName: string = '�������������';

  // CnEditorCodeUnIndent
  SCnEditorCodeUnIndentMenuCaption: string = '����鷴����(&L)';
  SCnEditorCodeUnIndentMenuHint: string = '����鷴����';
  SCnEditorCodeUnIndentName: string = '����鷴��������';

  // CnAsciiChart
  SCnAsciiChartMenuCaption: string = 'ASCII �ַ���(&A)';
  SCnAsciiChartMenuHint: string = '��ʾ ASCII �ַ���';
  SCnAsciiChartName: string = 'ASCII �ַ���';

  // CnEditorInsertColor
  SCnEditorInsertColorMenuCaption: string = '������ɫ(&N)';
  SCnEditorInsertColorMenuHint: string = '������ɫ';
  SCnEditorInsertColorName: string = '������ɫ����';

  // CnEditorInsertTime
  SCnEditorInsertTimeMenuCaption: string = '��������ʱ��(&T)';
  SCnEditorInsertTimeMenuHint: string = '��������ʱ��';
  SCnEditorInsertTimeName: string = '��������ʱ�乤��';

  // CnEditorCollector
  SCnEditorCollectorMenuCaption: string = '�ռ����(&G)';
  SCnEditorCollectorMenuHint: string = '�ռ����';
  SCnEditorCollectorName: string = '�ռ����';
  SCnEditorCollectorInputCaption: string = '�������ǩ��';

  // CnEditorSortLines
  SCnEditorSortLinesMenuCaption: string = 'ѡ��������(&S)';
  SCnEditorSortLinesMenuHint: string = 'ѡ��������';
  SCnEditorSortLinesName: string = 'ѡ�������򹤾�';

  // CnEditorToggleVar
  SCnEditorToggleVarMenuCaption: string = '�л��ֲ�����(&V)';
  SCnEditorToggleVarMenuHint: string = '�л��ֲ������༭��';
  SCnEditorToggleVarName: string = '�л��ֲ������༭������';

  // CnEditorToggleUses
  SCnEditorToggleUsesMenuCaption: string = '�л�����(&X)';
  SCnEditorToggleUsesMenuHint: string = '�л�������';
  SCnEditorToggleUsesName: string = '�л�����������';

  // CnEditorPrevMessage
  SCnEditorPrevMessageMenuCaption: string = '������һ��Ϣ��(&E)';
  SCnEditorPrevMessageMenuHint: string = '�ڱ༭����������Ϣ������ʶ����һ��';
  SCnEditorPrevMessageName: string = '������һ��Ϣ�й���';

  // CnEditorNextMessage
  SCnEditorNextMessageMenuCaption: string = '������һ��Ϣ��(&F)';
  SCnEditorNextMessageMenuHint: string = '�ڱ༭����������Ϣ������ʶ����һ��';
  SCnEditorNextMessageName: string = '������һ��Ϣ�й���';

  // CnEditorJumpIntf
  SCnEditorJumpIntfMenuCaption: string = '���� interface(&Q)';
  SCnEditorJumpIntfMenuHint: string = '������Ԫ�� interface ����';
  SCnEditorJumpIntfName: string = '��������������';

  // CnEditorJumpImpl
  SCnEditorJumpImplMenuCaption: string = '���� implementation(&M)';
  SCnEditorJumpImplMenuHint: string = '������Ԫ�� implementation ����';
  SCnEditorJumpImplName: string = '����ʵ��������';

  // CnEditorJumpMatchedKeyword
  SCnEditorJumpMatchedKeywordMenuCaption: string = '����ƥ��Ĺؼ���(&K)';
  SCnEditorJumpMatchedKeywordMenuHint: string = '���������ƥ��Ĺؼ���';
  SCnEditorJumpMatchedKeywordName: string = '����ƥ��ؼ��ֹ���';

  // CnSrcTemplate
  SCnSrcTemplateMenuCaption: string = 'Դ��ģ��ר��(&K)';
  SCnSrcTemplateMenuHint: string = 'Դ���뼰ע��ģ��';
  SCnSrcTemplateName: string = 'Դ��ģ��ר��';
  SCnSrcTemplateComment: string = 'Դ���뼰ע��ģ�塣';
  SCnSrcTemplateConfigCaption: string = '����(&O)...';
  SCnSrcTemplateConfigHint: string = '����Դ���뼰ע��ģ��';

  SCnSrcTemplateCaptionIsEmpty: string = '�༭��ģ��˵����ⲻ��Ϊ�գ�';
  SCnSrcTemplateContentIsEmpty: string = '�༭��ģ�����ݲ���Ϊ�գ�';
  SCnSrcTemplateReadDataError: string = '��ȡ�༭��ר�������ļ�����';
  SCnSrcTemplateWriteDataError: string = '����༭��ר�������ļ�����';
  SCnSrcTemplateImportAppend: string = '�Ƿ�ʹ��׷�ӷ�ʽ������׷�ӵ���ǰ��ģ����У�';
  SCnSrcTemplateWizardDelete: string = '��ȷ��Ҫɾ���ñ༭��ģ����';
  SCnSrcTemplateWizardClear: string = '��ȷ��Ҫɾ�����еı༭��ģ����';

  SCnSrcTemplateDataDefName: string = 'Editor_CHS.cdt';

  SCnEIPCurrPos: string = '��ǰ��괦';
  SCnEIPBOL: string = '��ǰ������';
  SCnEIPEOL: string = '��ǰ����ĩ';
  SCnEIPBOF: string = '��Ԫͷ��';
  SCnEIPEOF: string = '��Ԫβ��';
  SCnEIPProcHead: string = '��ǰ������һ����ͷ��';

  SCnEMVProjectDir: string = '����Ŀ¼';
  SCnEMVProjectName: string = '��������';
  SCnEMVProjectGroupDir: string = '������Ŀ¼';
  SCnEMVProjectGroupName: string = '����������';
  SCnEMVUnit: string = '��Ԫ����';
  SCnEMVProceName: string = '��ǰ������һ��������';
  SCnEMVResult: string = '��������ֵ';
  SCnEMVArguments: string = '���̲���';
  SCnEMVArgList: string = '���̲����б��';
  SCnEMVRetType: string = '��������ֵ���Ϳ�';
  SCnEMVCurProceName: string = '��ǰ������ڵĹ�������';
  SCnEMVCurMethodName: string = '��ǰ������ڵķ������ƣ���������';
  SCnEMVCurClassName: string = '��ǰ������ڵ�����';
  SCnEMVUser: string = '��ǰ��¼�û�';
  SCnEMVDateTime: string = '��ǰ����ʱ��';
  SCnEMVDate: string = '��ǰ����';
  SCnEMVYear: string = '���';
  SCnEMVMonth: string = '��';
  SCnEMVMonthShortName: string = '�̸�ʽ��';
  SCnEMVMonthLongName: string = '����ʽ��';
  SCnEMVDay: string = '��';
  SCnEMVDayShortName: string = '�̸�ʽ��';
  SCnEMVDayLongName: string = '����ʽ��';
  SCnEMVHour: string = 'ʱ';
  SCnEMVMinute: string = '��';
  SCnEMVSecond: string = '��';
  SCnEMVCodeLines: string = '��Ԫ��������';
  SCnEMVColPos: string = '�ÿո���䵽ָ���У���%ColPos80%��';
  SCnEMVCursor: string = '�����Ĺ��λ�ã����ж���������һ��Ϊ׼';

  // CnMsdnWizard
  SCnMsdnWizardName: string = 'MSDN ����ר��';
  SCnMsdnWizardMenuCaption: string = 'MSDN ����ר��(&D)';
  SCnMsdnWizardMenuHint: string = '�� IDE �д� MSDN ����';
  SCnMsdnWizardRunConfigCaption: string = '����(&O)...';
  SCnMsdnWizardRunConfigHint: string = '���� MSDN ѡ��';
  SCnMsdnWizardRunMsdnCaption: string = 'MSDN ����(&H)...';
  SCnMsdnWizardRunMsdnHint: string = '�� MSDN ����';
  SCnMsdnWizardRunSearchCaption: string = 'MSDN ����(&S)...';
  SCnMsdnWizardRunSearchHint: string = '�� MSDN ����';

  SCnMsdnWizardComment: string = 'MSDN �������ߵ��ù��ߣ������� IDE �е��� MSDN ������';
  SCnMsdnToolBarCaption: string = 'MSDN Help';
  SCnMsdnSelectKeywordHint: string = '��ѡ��Ҫ�� MSDN �в��ҵĹؼ���';
  SCnMsdnNoMsdnInstalled: string = '���Ȱ�װ MSDN ��';
  SCnMsdnNoLanguage: string = '��ѡ���� [%s] �����ڣ�';
  SCnMsdnNoCollection: string = '��ѡ�汾 [%s] �����ڣ�';
  SCnMsdnRegError: string = '��ע����ж�ȡ MSDN ��װ��Ϣ����';
  SCnMsdnConnectToServerError: string = '���ӷ�������쳣��';
  SCnMsdnDisconnectServerError: string = '�Ͽ����ӷ�������쳣��';
  SCnMsdnIsInvalidURL: string = '��ҳ��ַ��Ч��';
  SCnMsdnShowKeywordFailed: string = '��ʾ�ؼ���ʧ�ܣ�';
  SCnMsdnOpenIndexFailed: string = '������ʧ�ܣ�';
  SCnMsdnOpenSearchFailed: string = '������ʧ�ܣ�';

  // CnPas2HtmlWizard
  SCnPas2HtmlWizardMenuCaption: string = '����ʽ�������(&L)';
  SCnPas2HtmlWizardMenuHint: string = '������ת���� HTML �� RTF ��ʽ���';
  SCnPas2HtmlWizardName: string = '����ʽ�����������';
  SCnPas2HtmlWizardComment: string = '������ת���� HTML �� RTF ��ʽ�����';

  SCnPas2HtmlWizardCopySelectedCaption: string = '���� HTML ��������(&C)';
  SCnPas2HtmlWizardCopySelectedHint: string = '����ǰ�༭����ѡ�д����ת���� HTML ��ʽ����������';

  SCnPas2HtmlWizardExportUnitCaption: string = '�����ǰ�ļ�(&U)...';
  SCnPas2HtmlWizardExportUnitHint: string = '����ǰ�༭�� Unit ����� HTML �ļ��� RTF �ļ�';

  SCnPas2HtmlWizardExportOpenedCaption: string = '����򿪵��ļ�(&A)...';
  SCnPas2HtmlWizardExportOpenedHint: string = '�����д򿪵� Unit ����� HTML �ļ��� RTF �ļ�';

  SCnPas2HtmlWizardExportDPRCaption: string = '�����ǰ����(&P)...';
  SCnPas2HtmlWizardExportDPRHint: string = '����ǰ�����е����� Unit ����� HTML �ļ��� RTF �ļ�';

  SCnPas2HtmlWizardExportBPGCaption: string = '�����ǰ������(&G)...';
  SCnPas2HtmlWizardExportBPGHint: string = '����ǰ�������е����� Unit ����� HTML �ļ��� RTF �ļ�';

  SCnPas2HtmlWizardConfigCaption: string = '����(&O)...';
  SCnPas2HtmlWizardConfigHint: string = '��ʽ�������';

  SCnSelectDirCaption: string = '��ѡ������ļ������Ŀ¼';
  SCnDispCaption: string = '����ת�� %s';
  SCnPas2HtmlErrorNOTSupport: string = '����ֻ֧�� Pascal/C/C++ ����/�ļ�ת����';
  SCnPas2HtmlErrorConvertProject: string = 'ת�������ļ�ʧ�ܣ�';
  SCnPas2HtmlErrorConvert: string = 'ת��ʧ�ܣ��ļ� %s';
  SCnPas2HtmlDefEncode: string = 'gb2312';

  // CnWizEditFiler
  SCnFileDoesNotExist: string = '�ļ� %s �����ڣ�';
  SCnNoEditorInterface: string = 'FEditRead: �ļ� %s û���ҵ��༭���ӿڣ�';
  SCnNoModuleNotifier: string = 'TCnEditFiler: �ļ� %s �޷�ȡ��ģ��֪ͨ����';

  // CnReplaceWizard
  SCnReplaceWizardMenuCaption: string = '�����ļ��滻(&R)...';
  SCnReplaceWizardMenuHint: string = '�ڶ���ļ���ִ�в����滻';
  SCnReplaceWizardName: string = '�����ļ��滻ר��';
  SCnReplaceWizardComment: string = '�ڶ���ļ���ִ�в����滻��';

  SCnLineLengthError: string = '�������ļ���һ�еĳ��ȳ����� %d �ַ���' + #13#10 +
    '�ļ���: %s' + #13#10 +
    '���������Ϊ���ļ���һ����֧�ֵĶ������ļ���';
  SCnClassNotTerminated: string = '�� %d ���ַ�Ϊ��ƥ��� "[" ��ǣ�' + #13#10 +
    '����������ʽ��ʹ��˵������鿴�����ļ���';
  SCnPatternTooLong: string = '�������ݳ��ȴ��� 500 �ַ���';
  SCnInvalidGrepSearchCriteria: string = '�� %d ���ַ��������� ":" ������һ����Ч���ַ���' + #13#10 +
    '����������ʽ��ʹ��˵������鿴�����ļ���';
  SCnSenselessEscape: string = 'ת��� "\" ����û�з�����Ч���ַ���' + #13#10 +
    '����������ʽ��ʹ��˵������鿴�����ļ���';

  SCnReplaceSourceEmpty: string = '�����ı�����Ϊ�գ�';
  SCnReplaceDirEmpty: string = '����Ŀ¼ʱĿ¼����Ϊ�գ�';
  SCnReplaceDirNotExists: string = 'ָ����Ŀ¼�����ڣ�';
  SCnReplaceSelectDirCaption: string = 'ѡ���ļ���';

  SCnSaveFileError: string = '�����ļ������ļ����ܾ���ֻ�����ԣ�' + #13#10 +
    '�ļ���: %s';
  SCnSaveEditFileError: string = 'д�༭��Դ�����Դ����ܾ���ֻ�����ԣ�' + #13#10 +
    '�ļ���: %s';
  SCnReplaceWarning: string = '�����ļ��滻���ܻ��޸Ķ���ļ���' + #13#10 +
    '��ȷ����ȷʵҪִ�д˴β�����' + #13#10#13#10 + '�Ƿ������';
  SCnReplaceResult: string = '�ı��滻��ɣ�' + #13#10#13#10 +
    '�ڲ��ҵ� %d ���ļ��У�һ�������� %d ���滻��';
  SCnReplaceQueryContinue: string = '�Ƿ�����滻�����ļ���';

  // CnSourceDiffWizard
  SCnSourceDiffWizardMenuCaption: string = 'Դ����Ƚ�(&F)...';
  SCnSourceDiffWizardMenuHint: string = '��Դ������бȽϺʹ���ƴ��';
  SCnSourceDiffWizardName: string = 'Դ����Ƚ�ר��';
  SCnSourceDiffWizardComment: string = '��Դ������бȽϺʹ���ƴ�ϡ�';
  SCnSourceDiffCaseIgnored: string = '���Դ�Сд';
  SCnSourceDiffBlanksIgnored: string = '���Կհ��ַ�';
  SCnSourceDiffChanges: string = '�ļ������: %d %s';
  SCnSourceDiffApprox: string = '����ɰٷ���: %d%%';
  SCnSourceDiffOpenError: string = '���ļ�ʧ�ܣ�';
  SCnSourceDiffOpenFile: string = '���ļ�(&O)...';
  SCnSourceDiffUpdateFile: string = 'ˢ�µ�ǰ�ļ�(&U)';
  SCnDiskFile: string = '�ļ�';
  SCnEditorBuff: string = '�ڴ�';
  SCnBakFile: string = '����';

  // CnStatWizard
  SCnStatWizardMenuCaption: string = 'Դ����ͳ��(&J)...';
  SCnStatWizardMenuHint: string = '��Դ�������ͳ��';
  SCnStatWizardName: string = 'Դ����ͳ��ר��';
  SCnStatWizardComment: string = '��Դ�������ͳ�ơ�';

  SCnStatDirEmpty: string = '����Ŀ¼ʱĿ¼����Ϊ�գ�';
  SCnStatDirNotExists: string = 'ָ����Ŀ¼�����ڣ�';

  SCnStatSelectDirCaption: string = '��ѡ��Դ����Ŀ¼';
  SCnStatusBarFmtString: string = '��ͳ�� %s ���ļ����� %s �ֽڣ���Ч�й� %s �С�';
  SCnStatusBarFindFileFmt: string = '�������� %s ���ļ�';
  SCnStatClearResult: string = '����׼�������µ�ͳ�ơ���';
  SCnErrorNoFile: string = '�ļ������ڡ�';
  SCnErrorNoFind: string = 'δ�ҵ��ַ�����%s';

  SCnStatBytesFmtStr: string = '�ֽ��� %s������ %s �ֽڣ�ע�� %s ����ע�͹� %s �ֽڡ�';
  SCnStatLinesFmtStr: string = '������ %s������ %s �У�ע�� %s �У����� %s �У���Ч�� %s �С�';
  SCnStatFilesCaption: string = '�����ļ�����';
  SCnStatProjectName: string = '���̣�%s';
  SCnStatProjectFiles: string = '�ļ���Ŀ %s���ܹ� %s �ֽڡ�';
  SCnStatProjectBytes: string = '���� %s �ֽڣ�ע�� %s �ֽڡ�';
  SCnStatProjectLines1: string = '���� %s����Ч�� %s������ %s��';
  SCnStatProjectLines2: string = '���� %s �У�ע�� %s �� %s �С�';
  SCnStatProjectGroupName: string = '�����飺%s';
  SCnStatProjectGroupFiles: string = '%s ���̣�%s �ļ����ܹ� %s �ֽڡ�';
  SCnStatProjectGroupBytes: string = '���� %s �ֽڣ�ע�� %s �ֽڡ�';
  SCnStatProjectGroupLines1: string = '���� %s����Ч�� %s������ %s��';
  SCnStatProjectGroupLines2: string = '���� %s �У�ע�� %s �� %s �С�';
  SCnStatNoProject: string = '�޹�����Ϣ��';
  SCnStatNoProjectGroup: string = '�޹�������Ϣ��';

  SCnStatExpTitle: string = 'Դ����ͳ�ƽ�����'#13#10'�� CnPack IDE ר�Ұ�����'#13#10'%s';
  SCnStatExpDefFileName: string = 'StatResult';
  SCnStatExpProject: string = '���� %s ��������ͳ�ƣ�';
  SCnStatExpProjectGroup: string = '������ %s ��������ͳ�ƣ�';
  SCnStatExpFileName: string = '�ļ�����%s';
  SCnStatExpFileDir: string = '����Ŀ¼��%s';
  SCnStatExpFileBytes: string = '���ֽ�����%s';
  SCnStatExpFileCodeBytes: string = '�����ֽ�����%s';
  SCnStatExpFileCommentBytes: string = 'ע���ֽ�����%s';
  SCnStatExpFileAllLines: string = '��������%s';
  SCnStatExpFileEffectiveLines: string = '��Ч������%s';
  SCnStatExpFileBlankLines: string = '��������%s';
  SCnStatExpFileCodeLines: string = '����������%s';
  SCnStatExpFileCommentLines: string = 'ע��������%s';
  SCnStatExpFileCommentBlocks: string = 'ע�Ϳ�����%s';
  SCnStatExpSeperator: string = #13#10'--------------------------'#13#10;

  SCnStatExpCSVTitleFmt: string = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s';
  SCnStatExpCSVLineFmt: string = '%s%s%s%s%d%s%d%s%d%s%d%s%d%s%d%s%d%s%d%s%d';
  SCnStatExpCSVProject: string = '������������';
  SCnStatExpCSVProjectGroup: string = '��������������';
  SCnStatExpCSVFileName: string = '�ļ���';
  SCnStatExpCSVFileDir: string = '����Ŀ¼';
  SCnStatExpCSVBytes: string = '���ֽ���';
  SCnStatExpCSVCodeBytes: string = '�����ֽ���';
  SCnStatExpCSVCommentBytes: string = 'ע���ֽ���';
  SCnStatExpCSVAllLines: string = '������';
  SCnStatExpCSVEffectiveLines: string = '��Ч����';
  SCnStatExpCSVBlankLines: string = '������';
  SCnStatExpCSVCodeLines: string = '��������';
  SCnStatExpCSVCommentLines: string = 'ע������';
  SCnStatExpCSVCommentBlocks: string = 'ע�Ϳ���';
  SCnDoNotStat: string = '��Դ�����ļ�����ͳ�ơ�';

  // CnPrefixWizard
  SCnPrefixWizardMenuCaption: string = '���ǰ׺ר��(&P)...';
  SCnPrefixWizardMenuHint: string = '�����������׼ǰ׺���и���';
  SCnPrefixWizardName: string = '���ǰ׺ר��';
  SCnPrefixWizardComment: string = '�����������׼ǰ׺���и�����';
  SCnPrefixInputError: string = '��������Ч�ı�ʶ����Ϊ���ǰ׺��';
  SCnPrefixNameError: string = '��������Ч�ı�ʶ����Ϊ�������';
  SCnPrefixDupName: string = '�������Ѿ���һ��ͬ��������ˣ������������������';
  SCnPrefixNoComp: string = '����ѡ��ķ�Χ��û����Ҫ�����������';
  SCnPrefixAskToProcess: string = '��ȷʵҪ����Щ��������ƽ��д�����';

  // CnWizAbout
  // CnWizAboutForm
  SCnWizAboutCaption: string = '����(&A)';
  SCnWizAboutHelpCaption: string = '��������(&I)...';
  SCnWizAboutHistoryCaption: string = '��ʷ�޸ļ�¼(&H)...';
  SCnWizAboutTipOfDaysCaption: string = 'ÿ��һ��(&D)...';
  SCnWizAboutBugReportCaption: string = '���󱨸漰����(&R)...';
  SCnWizAboutUpgradeCaption: string = '������(&U)...';
  SCnWizAboutConfigIOCaption: string = '���õ��뵼��(&E)...';
  SCnWizAboutUrlCaption: string = '���ʿ�����վ(&W)';
  SCnWizAboutBbsCaption: string = '�����û���̳(&B)';
  SCnWizAboutMailCaption: string = '�����ʼ�(&M)';

  SCnWizAboutAboutCaption: string = '����(&A)...';
  SCnWizAboutHint: string = '��������������';
  SCnWizAboutHelpHint: string = '��ʾ CnPack ר�Ұ������ļ�';
  SCnWizAboutHistoryHint: string = '��ʾ CnPack ר�Ұ���ʷ�޸ļ�¼';
  SCnWizAboutTipOfDayHint: string = '��ʾ��ÿ��һ����';
  SCnWizAboutBugReportHint: string = '�򿪴��󱨸漰������';
  SCnWizAboutUpgradeHint: string = 'ͨ��������������µĸ�����Ϣ';
  SCnWizAboutConfigIOHint: string = '���뵼�� CnPack IDE ר�Ұ�����';
  SCnWizAboutUrlHint: string = '���� CnPack ������վ';
  SCnWizAboutBbsHint: string = '���� CnPack �û���̳';
  SCnWizAboutMailHint: string = 'д�Ÿ� CnPack ������';
  SCnWizAboutAboutHint: string = '���� CnPack ר�Ұ�';
  SCnWizMailSubject: string = '���� CnPack ��������';

  // CnEditorEnhancements
  SCnEditorEnhanceWizardName: string = '����༭����չ';
  SCnEditorEnhanceWizardComment: string = '��չ����༭���Ĺ���';
  SCnMenuCloseOtherPagesCaption: string = '�ر�������ҳ��';
  SCnMenuShellMenuCaption: string = '��ǹ����˵�';
  SCnMenuSelAllCaption: string = 'ѡ��ȫ��';
  SCnMenuBlockToolsCaption: string = 'CnPack �༭�˵�';
  SCnMenuExploreCaption: string = '����Դ�������д� "%s"';
  SCnMenuCopyFileNameMenuCaption: string = '����������·����/�ļ���';
  SCnEditorEnhanceConfig: string = '�༭����չ����(&C)...';

  SCnToolBarClose: string = '�رձ༭��������(&H)';
  SCnToolBarCloseHint: string = '���Ѿ�ѡ���˹رձ༭����������'#13#10#13#10 +
    '������Ժ���Ҫ������ʾ�˹����������ڱ༭����չ���ô����й�ѡ'#13#10 +
    '���ڱ༭������ʾ����������ʵ�֡�';

  SCnLineNumberGotoLine: string = '�����к�(&G)...';
  SCnLineNumberGotoBookMark: string = '������ǩ(&J)';
  SCnLineNumberClearBookMarks: string = '���������ǩ(&R)';
  SCnLineNumberShowIDELineNum: string = '��ʾ IDE �к�(&I)';
  SCnLineNumberClose: string = '�ر��к���ʾ(&X)';

  SCnSrcEditorNavIDEBack: string = 'IDE ���� (Shift+Click)';
  SCnSrcEditorNavIDEForward: string = 'IDE ǰ�� (Shift+Click)';
  SCnSrcEditorNavIDEBackList: string = 'IDE �����б�';
  SCnSrcEditorNavIDEForwardList: string = 'IDE ǰ���б�';
  SCnSrcEditorNavPause: string = '���� IDE ��ת����';

  // CnSrcEditorBlockTools
  SCnSrcBlockToolsHint: string = 'ѡ���ı���ز���';

  SCnSrcBlockEdit: string = '�༭(&E)';
  SCnSrcBlockCopy: string = '���Ƶ�������(&C)';
  SCnSrcBlockCopyAppend: string = '׷�Ӹ��Ƶ�������(&E)';
  SCnSrcBlockDuplicate: string = '�ڵ�ǰλ���ظ�(&U)';
  SCnSrcBlockCut: string = '���е�������(&T)';
  SCnSrcBlockCutAppend: string = '׷�Ӽ��е�������(&F)';
  SCnSrcBlockDelete: string = 'ɾ��(&D)';
  SCnSrcBlockSaveToFile: string = '���浽�ļ�(&S)...';

  SCnSrcBlockCase: string = '��Сдת��(&A)';
  SCnSrcBlockLowerCase: string = 'ת��ΪСд(&L)';
  SCnSrcBlockUpperCase: string = 'ת��Ϊ��д(&U)';
  SCnSrcBlockToggleCase: string = '��Сд����(&T)';

  SCnSrcBlockFormat: string = '��ʽ����(&F)';
  SCnSrcBlockIndent: string = '��������(&I)';
  SCnSrcBlockIndentEx: string = '��������ָ����(&J)...';
  SCnSrcBlockUnindent: string = '���뷴����(&U)';
  SCnSrcBlockUnindentEx: string = '���뷴����ָ����(&V)...';
  SCnSrcBlockIndentCaption: string = '��������';
  SCnSrcBlockIndentPrompt: string = '������Ҫ�����Ĵ�������:';
  SCnSrcBlockUnindentCaption: string = '���뷴����';
  SCnSrcBlockUnindentPrompt: string = '������Ҫ�������Ĵ�������:';

  SCnSrcBlockComment: string = '����ע��(&M)';

  SCnSrcBlockWrap: string = '����Ƕ��(&B)';
  SCnSrcBlockWrapBy: string = 'Ƕ�뵽 %s ��';
  
  SCnSrcBlockReplace: string = '���滻(&P)';

  SCnSrcBlockSearch: string = 'Web ����(&W)';
  SCnWebSearchFileDef: string = 'WebSearch_CHS.xml';

  SCnSrcBlockMisc: string = '����(&O)';

  // CnSrcEditorKey
  SCnRenameVarCaption: string = '��ʶ������';
  SCnRenameVarHintFmt: string = '�滻 %s Ϊ��';
  SCnRenameErrorValid: string = '��ʶ���Ƿ����޷������滻';
  
  // CnFormEnhancements
  SCnFormEnhanceWizardName: string = '�����������չ';
  SCnFormEnhanceWizardComment: string = '��չ����������Ĺ���';
  SCnMenuFlatFormCustomizeCaption: string = '���ƹ������(&O)...';
  SCnMenuFlatFormConfigCaption: string = '����(&N)...';
  SCnMenuFlagFormPosCaption: string = '�������λ��(&P)';
  SCnMenuFlatPanelTopLeft: string = '�Ϸ����(&1)';
  SCnMenuFlatPanelTopRight: string = '�Ϸ��ұ�(&2)';
  SCnMenuFlatPanelBottomLeft: string = '�·����(&3)';
  SCnMenuFlatPanelBottomRight: string = '�·��ұ�(&4)';
  SCnMenuFlatPanelLeftTop: string = '���ϱ�(&5)';
  SCnMenuFlatPanelLeftBottom: string = '���±�(&6)';
  SCnMenuFlatPanelRightTop: string = '�ҷ��ϱ�(&7)';
  SCnMenuFlatPanelRightBottom: string = '�ҷ��±�(&8)';
  SCnMenuFlatFormAllowDragCaption: string = '�����϶�������(&D)';
  SCnMenuFlagFormImportCaption: string = '���ļ��е���(&I)...';
  SCnMenuFlagFormExportCaption: string = '�������ļ�(&E)...';
  SCnMenuFlatFormCloseCaption: string = '�ر�(&C)';
  SCnMenuFlatFormDataFileFilter: string = '����������������ļ�(*.ini)|*.ini';
  SCnFlatToolBarRestoreDefault: string = '��ȷ��Ҫɾ���Զ���Ĺ��������ָ�Ĭ��������';
  SCnFloatPropBarFilterCaption: string = 'ֻ��ʾ�Զ��������';
  SCnFloatPropBarRenameCaption: string = '�޸��������';
  SCnEmbeddedDesignerNotSupport: string = '������ֻ֧�ַ�Ƕ��ģʽ�� VCL ����ڴ���';

  // CnAlignSizeWizard
  SCnAlignSizeMenuCaption: string = '�������ר��(&Z)';
  SCnAlignSizeMenuHint: string = '��ѡ��ؼ����ж��뼰��С����';
  SCnAlignSizeName: string = '�������ר��';
  SCnAlignSizeComment: string = '����ʹ�ò˵���򸡶�����ѡ��ؼ����ж��뼰�������á�';

  SCnAlignLeftCaption: string = '��߶���';
  SCnAlignLeftHint: string = '�������ѡ�ؼ���ѡ�������ؼ�����ʱ��Ч';
  SCnAlignRightCaption: string = '�ұ߶���';
  SCnAlignRightHint: string = '�Ҷ�����ѡ�ؼ���ѡ�������ؼ�����ʱ��Ч';
  SCnAlignTopCaption: string = '�ϱ߶���';
  SCnAlignTopHint: string = '�ϱ߶�����ѡ�ؼ���ѡ�������ؼ�����ʱ��Ч';
  SCnAlignBottomCaption: string = '�±߶���';
  SCnAlignBottomHint: string = '�±߶�����ѡ�ؼ���ѡ�������ؼ�����ʱ��Ч';
  SCnAlignHCenterCaption: string = 'ˮƽ���Ķ���';
  SCnAlignHCenterHint: string = 'ˮƽ���Ķ�����ѡ�ؼ���ѡ�������ؼ�����ʱ��Ч';
  SCnAlignVCenterCaption: string = '��ֱ���Ķ���';
  SCnAlignVCenterHint: string = '��ֱ���Ķ�����ѡ�ؼ���ѡ�������ؼ�����ʱ��Ч';
  SCnSpaceEquHCaption: string = 'ˮƽ����ȼ��';
  SCnSpaceEquHHint: string = 'ˮƽ����ȼ�࣬ѡ�������ؼ�����ʱ��Ч';
  SCnSpaceEquHXCaption: string = 'ˮƽ�����Զ���ȼ��';
  SCnSpaceEquHXHint: string = 'ˮƽ�����Զ���ȼ�࣬ѡ�������ؼ�����ʱ��Ч';
  SCnSpaceIncHCaption: string = 'ˮƽ����������';
  SCnSpaceIncHHint: string = 'ˮƽ���������࣬ѡ�������ؼ�����ʱ��Ч';
  SCnSpaceDecHCaption: string = 'ˮƽ������ټ��';
  SCnSpaceDecHHint: string = 'ˮƽ������ټ�࣬ѡ�������ؼ�����ʱ��Ч';
  SCnSpaceRemoveHCaption: string = 'ˮƽ�����������';
  SCnSpaceRemoveHHint: string = 'ˮƽ����������࣬ѡ�������ؼ�����ʱ��Ч';
  SCnSpaceEquVCaption: string = '��ֱ����ȼ��';
  SCnSpaceEquVHint: string = '��ֱ����ȼ�࣬ѡ�������ؼ�����ʱ��Ч';
  SCnSpaceEquVYCaption: string = '��ֱ�����Զ���ȼ��';
  SCnSpaceEquVYHint: string = '��ֱ�����Զ���ȼ�࣬ѡ�������ؼ�����ʱ��Ч';
  SCnSpaceIncVCaption: string = '��ֱ����������';
  SCnSpaceIncVHint: string = '��ֱ���������࣬ѡ�������ؼ�����ʱ��Ч';
  SCnSpaceDecVCaption: string = '��ֱ������ټ��';
  SCnSpaceDecVHint: string = '��ֱ������ټ�࣬ѡ�������ؼ�����ʱ��Ч';
  SCnSpaceRemoveVCaption: string = '��ֱ�����������';
  SCnSpaceRemoveVHint: string = '��ֱ����������࣬ѡ�������ؼ�����ʱ��Ч';
  SCnIncWidthCaption: string = '���ӿ��';
  SCnIncWidthHint: string = '���ӿؼ����';
  SCnDecWidthCaption: string = '���ٿ��';
  SCnDecWidthHint: string = '���ٿؼ����';
  SCnIncHeightCaption: string = '���Ӹ߶�';
  SCnIncHeightHint: string = '���ӿؼ��߶�';
  SCnDecHeightCaption: string = '���ٸ߶�';
  SCnDecHeightHint: string = '���ٿؼ��߶�';
  SCnMakeMinWidthCaption: string = '���������С';
  SCnMakeMinWidthHint: string = '�ؼ����������С��ѡ�������ؼ�����ʱ��Ч';
  SCnMakeMaxWidthCaption: string = '��ȷŵ����';
  SCnMakeMaxWidthHint: string = '�ؼ���ȷŵ����ѡ�������ؼ�����ʱ��Ч';
  SCnMakeSameWidthCaption: string = '���һ��';
  SCnMakeSameWidthHint: string = '�ؼ�������һ���ؼ�һ�£�ѡ�������ؼ�����ʱ��Ч';
  SCnMakeMinHeightCaption: string = '�߶�������С';
  SCnMakeMinHeightHint: string = '�ؼ��߶�������С��ѡ�������ؼ�����ʱ��Ч';
  SCnMakeMaxHeightCaption: string = '�߶ȷŵ����';
  SCnMakeMaxHeightHint: string = '�ؼ��߶ȷŵ����ѡ�������ؼ�����ʱ��Ч';
  SCnMakeSameHeightCaption: string = '�߶�һ��';
  SCnMakeSameHeightHint: string = '�ؼ��߶����һ���ؼ�һ�£�ѡ�������ؼ�����ʱ��Ч';
  SCnMakeSameSizeCaption: string = '��Сһ��';
  SCnMakeSameSizeHint: string = '�ؼ���С���һ���ؼ���ͬ��ѡ�������ؼ�����ʱ��Ч';
  SCnParentHCenterCaption: string = 'ˮƽ���ڸ��ؼ�����';
  SCnParentHCenterHint: string = '����ѡ�ؼ���ˮƽ���������ڸ��ؼ�����';
  SCnParentVCenterCaption: string = '��ֱ���ڸ��ؼ�����';
  SCnParentVCenterHint: string = '����ѡ�ؼ��ڴ�ֱ���������ڸ��ؼ�����';
  SCnBringToFrontCaption: string = '�Ƶ�ǰ��';
  SCnBringToFrontHint: string = '���ؼ��Ƶ�ǰ��';
  SCnSendToBackCaption: string = '�Ƶ�����';
  SCnSendToBackHint: string = '���ؼ��Ƶ�����';
  SCnSnapToGridCaption: string = '�ؼ�������դ��';
  SCnSnapToGridHint: string = '�ؼ��ƶ�������ʱ������դ��';
  SCnUseGuidelinesCaption: string = '�л���Ƹ�����';
  SCnUseGuidelinesHint: string = '�л���Ƹ�����';
  SCnAlignToGridCaption: string = '�ؼ����뵽դ��';
  SCnAlignToGridHint: string = '�ؼ�λ�ö��뵽դ��';
  SCnSizeToGridCaption: string = '�ؼ����ŵ�դ��';
  SCnSizeToGridHint: string = '�ؼ��ߴ����ŵ�դ��';
  SCnLockControlsCaption: string = '�����ؼ�';
  SCnLockControlsHint: string = '�����ؼ��������ƶ�';
  SCnSelectRootCaption: string = 'ѡ����';
  SCnSelectRootHint: string = 'ѡ��ǰ��ƶ���Ϊ����';
  SCnCopyCompNameCaption: string = '���Ƶ�ǰѡ��������';
  SCnCopyCompNameHint: string = '���Ƶ�ǰѡ���������������Ƶ�������';
  SCnHideComponentCaption: string = '���ز��������';
  SCnHideComponentHint: string = '���ػ���ʾ�����ϵĲ����ӵ����';
  SCnNonArrangeCaption: string = '���в��������...';
  SCnNonArrangeHint: string = '�Դ����ϵĲ����������������';
  SCnListCompCaption: string = '����б�...';
  SCnListCompHint: string = '���������б����ٶ�λ';
  SCnCompToCodeCaption: string = 'ת���ɴ���...';
  SCnCompToCodeHint: string = '����ѡ�����ת���ɴ�������';
  SCnShowFlatFormCaption: string = '���������������...';
  SCnShowFlatFormHint: string = '���������������';

  SCnListComponentCount: string = '�������: %d';
  SCnCompToCodeEnvNotSupport: string = '�������ת����֧�ִ˻�����';
  SCnCompToCodeProcCopiedFmt: string = '���� %s �Ѹ��Ƶ�������';
  SCnCompToCodeConvertedFmt: string = '��ת�� %d ��';
  SCnMustGreaterThanZero: string = '���������ֵ��������㣡';
  SCnHideNonVisualNotSupport: string = '������Ŀǰֻ֧�� VCL';
  SCnNonNonVisualFound: string = 'û�пɹ�����Ĳ��������';
  SCnNonNonVisualNotSupport: string = '�������������Ŀǰֻ֧�� VCL';
  SCnSpacePrompt: string = '������ؼ���ࣺ';
  SCnMustDigital: string = '�������������';

  // CnPaletteEnhanceWizard
  SCnPaletteEnhanceWizardName: string = 'IDE ��������չ';
  SCnPaletteEnhanceWizardComment: string = '��չ�������� IDE ���˵��ȵĹ���';
  SCnPaletteTabsMenuCaption: string = '&Tabs';
  SCnPaletteMultiLineMenuCaption: string = '���з�ʽ(&M)';
  SCnLockToolbarMenuCaption: string = '����������(&L)';
  SCnPaletteMoreCaption: string = '����(&M)...';

  SCnSearchComponent: string = '�������';
  SCnComponentDetailFmt: string = '�����: %s' + #13#10 + '��Ԫ��: %s' + #13#10 + '��ǩҳ: %s' + #13#10#13#10 + '�̳й�ϵ: ' + #13#10#13#10;

  // CnVerEnhanceWizard
  SCnVerEnhanceWizardName: string = '�汾��Ϣ��չ';
  SCnVerEnhanceWizardComment: string = '�汾��Ϣ������չר��';

  // CnCorPropWizard
  SCnCorrectPropertyName: string = '�����޸���';
  SCnCorrectPropertyMenuCaption: string = '�����޸���(&C)...';
  SCnCorrectPropertyMenuHint: string = '����һ�����������޸Ĵ����ϵ��������';
  SCnCorrectPropertyComment: string = '����һ�����������޸Ĵ����ϵ��������';

  SCnCorrectPropertyActionWarn: string = '��ʾ';
  SCnCorrectPropertyActionAutoCorrect: string = '�Զ�����';
  SCnCorrectPropertyStateCorrected: string = '���޸�';
  SCnCorrectPropertyStateWarning: string = '��Ҫȷ��';
  SCnCorrectPropertyAskDel: string = '���Ƿ�ȷʵҪɾ����������';
  SCnCorrectPropertyRulesCountFmt: string = '���й��� %d ����';

  SCnCorrectPropertyErrNoForm: string = '��ǰû�д�����Ĵ���';
  SCnCorrectPropertyErrNoResult: string = 'û���ҵ������������������';
  SCnCorrectPropertyErrNoModuleFound: string = '����������ڣ����������ڵĴ����ѹرջ���������ѱ�ɾ����';
  SCnCorrectPropertyErrClassFmt: string = '�Ҳ�������� %s ���Ƿ������';
  SCnCorrectPropertyErrClassCreate: string = '����� %s �޷�����������֤���Ƿ������';
  SCnCorrectPropertyErrPropFmt: string = '����� %s ���Ҳ������� %s �����ܽ������������д��ڣ��Ƿ������';
  SCnCorrPropSetPropValueErrorFmt: string = '�������� %s ʱ���������Ǹ���������Բ����ڻ�ֵ������������塣'
    + #13#10#13#10 + '%s';

  // CnProjectExtWizard
  SCnProjExtWizardName: string = '������չ����';
  SCnProjExtWizardCaption: string = '������չ����(&Q)';
  SCnProjExtWizardHint: string = '���ڹ��̹�����չ�Ĺ��߼��ϡ�';
  SCnProjExtWizardComment: string = '���ڹ��̹�����չ�Ĺ��߼��ϡ�';
  SCnProjExtRunSeparatelyCaption: string = '���� IDE ����(&R)';
  SCnProjExtRunSeparatelyHint: string = '���� IDE �������г���';
  SCnProjExtExploreUnitCaption: string = '�����ǰ�ļ�Ŀ¼(&D)...';
  SCnProjExtExploreUnitHint: string = '����Դ�������д򿪵�ǰ�ļ����ڵ��ļ��С�';
  SCnProjExtExploreProjectCaption: string = '�������Ŀ¼(&P)...';
  SCnProjExtExploreProjectHint: string = '����Դ�������д򿪵�ǰ�������ڵ��ļ��С�';
  SCnProjExtExploreExeCaption: string = '������Ŀ¼(&E)...';
  SCnProjExtExploreExeHint: string = '����Դ�������д򿪵�ǰ����ļ��С�';
  SCnProjExtViewUnitsCaption: string = '�����鵥Ԫ�б�(&U)...';
  SCnProjExtViewUnitsHint: string = '��ʾ��ǰ���������е�Ԫ�б�';
  SCnProjExtViewFormsCaption: string = '�����鴰���б�(&F)...';
  SCnProjExtViewFormsHint: string = '��ʾ��ǰ���������д����б�';
  SCnProjExtUseUnitsCaption: string = '���õ�Ԫ(&I)...';
  SCnProjExtUseUnitsHint: string = '��ʾ��ǰ���������е�Ԫ�б�������á�';
  SCnProjExtListUsedCaption: string = '�����õ�Ԫ�б�(&S)...';
  SCnProjExtListUsedHint: string = '��ʾ��ǰ��Ԫ�����õ�������Ԫ�б�';

  SCnProjExtBackupCaption: string = '���̱���(&B)...';
  SCnProjExtBackupHint: string = 'ѹ�����ݹ����ļ�';
  SCnProjExtBackupFileCount: string = '���� %s �����ļ�����: %d';
  SCnProjExtBackupNoFile: string = 'û����Ҫ���ݵ��ļ���';
  SCnProjExtBackupMustZip: string = 'Ŀǰֻ֧�� ZIP ��ʽ��ѹ���ļ���Ŀ���ļ���չ��������Ϊ ZIP���Ƿ������';
  SCnProjExtBackupDllMissCorrupt: string = '�Ҳ��� ZIP �������𻵣������°�װ��';
  SCnProjExtBackupErrorCompressor: string = '�ⲿѹ�����򲻴��ڣ�������ָ����';
  SCnProjExtBackupSuccFmt: string = '�ļ��ѳɹ������� %s';

  SCnProjExtDelTempCaption: string = '���������ʱ�ļ�(&C)...';
  SCnProjExtDelTempHint: string = '�������Ŀ¼�µ���ʱ�ļ���';
  SCnProjExtProjectAll: string = '<ȫ��>';
  SCnProjExtCurrentProject: string = '<��ǰ����>';
  SCnProjExtProjectCount: string = '��������: %d';
  SCnProjExtFormsFileCount: string = '��������: %d';
  SCnProjExtUnitsFileCount: string = '��Ԫ����: %d';
  SCnProjExtFramesFileCount: string = 'Frame ����: %d';

  SCnProjExtNotSave: string = '��δ���棩';
  SCnProjExtFileNotExistOrNotSave: string = '�ļ������ڻ�δ���棡';
  SCnProjExtOpenFormWarning: string = '��ѡ���˶�����壬�Ƿ������';
  SCnProjExtOpenUnitWarning: string = '��ѡ���˶����Ԫ���Ƿ������';
  SCnProjExtFileIsReadOnly: string = '�ļ�����Ϊ��ֻ�������Ƿ���������Ϊ����������ת�����壿';
  SCnProjExtCreatePrjListError: string = '���� ProjectList ����';
  SCnProjExtErrorInUse: string = '�޷��ҵ������ļ���' + #13#10 + '�����뵱ǰ�ļ����ڲ�ͬ�����У�';
  SCnProjExtAddExtension: string = '����ļ���չ��';
  SCnProjExtAddNewText: string = '����׼��ɾ�����ļ�����չ��:';
  SCnProjExtCleaningComplete: string = '�����ɡ� %d ���ļ���ɾ����' + #13#10 +
    '�ָ��� %s �ֽڵĴ洢�ռ䡣';
  SCnProjExtFileReopenCaption: string = '����ʷ�ļ�(&O)...';
  SCnProjExtFileReopenHint: string = '����ʷ�ļ�';
  SCnProjExtCustomBackupFile: string = '��ѡ����';
  
  SCnProjExtDirBuilderCaption: string = '����Ŀ¼������(&L)...';
  SCnProjExtDirBuilderHint: string = '�򿪹���Ŀ¼������';
  SCnProjExtConfirmOverrideTemplet: string = 'ģ�塰%s���Ѿ����ڣ��Ƿ񸲸ǣ�';
  SCnProjExtConfirmSaveTemplet: string = '��ǰģ��δ���棬Ҫ������';
  SCnProjExtConfirmDeleteDir: string = 'ȷ��Ҫɾ��Ŀ¼��%s����';
  SCnProjExtConfirmDeleteTemplet: string = 'ȷ��Ҫɾ��ģ�塰%s����';
  SCnProjExtSelectDir: string = '��ѡ��һ��Ŀ¼:';
  SCnProjExtSaveTempletCaption: string = '����ģ��';
  SCnProjExtInputTempletName: string = '������ģ������:';
  SCnProjExtIsNotUniqueDirName: string = 'Ŀ¼���ظ���';
  SCnProjExtDirNameHasInvalidChar: string = 'Ŀ¼�����ܰ��������ַ�:' + #10#13 + ' \ / :  * ? " < > | ';
  SCnProjExtDirCreateSucc: string = '�ѳɹ�����Ŀ¼��';
  SCnProjExtDirCreateFail: string = 'Ŀ¼������ʧ�ܣ�����Ŀ��ֻ��';

  // CnFilesSnapshotWizard
  SCnFilesSnapshotWizardName: string = '��ʷ�ļ������ר��';
  SCnFilesSnapshotWizardCaption: string = '��ʷ�ļ������ר��(&W)';
  SCnFilesSnapshotWizardHint: string = '���ٴ���ʷ�ļ���';
  SCnFilesSnapshotWizardComment: string = '���ٴ���ʷ�ļ���';
  SCnFilesSnapshotAddCaption: string = '�����ļ��б����(&C)...';
  SCnFilesSnapshotAddHint: string = '���ݵ�ǰ�򿪵��ļ�����һ������';
  SCnFilesSnapshotManageCaption: string = '�����ļ��б����(&M)...';
  SCnFilesSnapshotManageHint: string = '�������е��ļ��б����';

  SCnFilesSnapshotManageFrmCaptionManage: string = '�����ļ��б����';
  SCnFilesSnapshotManageFrmCaptionAdd: string = '�����ļ��б����';
  SCnFilesSnapshotManageFrmLblSnapshotsCaptionManage: string = '��ѡ��Ҫ������ļ��б����:';
  SCnFilesSnapshotManageFrmLblSnapshotsCaptionAdd: string = '����ǰ�򿪵��ļ��б���Ϊ����:';

  // CnCommentCroperWizard
  SCnCommentCropperWizardName: string = 'ɾ��ע��ר��';
  SCnCommentCropperWizardMenuCaption: string = 'ɾ��ע��(&V)...';
  SCnCommentCropperWizardMenuHint: string = 'ɾ�������е�ע��';
  SCnCommentCropperWizardComment: string = 'ɾ�������е�ע��';
  SCnCommentCropperCountFmt: string = '������ %d ���ļ���';

  // CnFavoriteWizard
  SCnFavWizName: string = '�ղؼ�ר��';
  SCnFavWizCaption: string = '�ղؼ�ר��';
  SCnFavWizHint: string = '�ղغ͹����̡���Ԫ�������ļ���ר��';
  SCnFavWizComment: string = '�ղغ͹����̡���Ԫ�������ļ���ר�ҡ�';
  SCnFavWizAddToFavoriteMenuCaption: string = '��ӵ��ղؼ�(&A)...';
  SCnFavWizAddToFavoriteMenuHint: string = '��ӵ�ǰ�ļ����ղؼ�';
  SCnFavWizManageFavoriteMenuCaption: string = '�����ղؼ�(&O)...';
  SCnFavWizManageFavoriteMenuHint: string = '�����ղؼ��е��ļ�';

  // CnCpuWinEnhancements
  SCnCpuWinEnhanceWizardName: string = 'CPU ������չ';
  SCnCpuWinEnhanceWizardComment: string = '����� CPU �����и��ƻ����롣';
  SCnMenuCopyLinesToClipboard: string = '���� %d �е�������';
  SCnMenuCopyLinesToFile: string = '���� %d �е��ļ�...';
  SCnMenuCopyLinesCaption: string = '���ƴ���...';

  // CnResourceMgrWizard
  SCnResMgrWizardMenuCaption: string = '��Դ����ר��';
  SCnResMgrWizardMenuHint: string = '��Դ����ר��';
  SCnResMgrWizardName: string = '��Դ����ר��';
  SCnResMgrWizardComment: string = '�����ռ����������Ч�ı����Դ��';
  SCnDocumentMgrWizardCaption: string = '�����ĵ�������';
  SCnDocumentMgrWizardHint: string = '�����ĵ�������';
  SCnDocumentMgrWizardComment: string = '�����ռ����������������ĸ��ֵ����ĵ���֧��.txt��.rtf��*.htm��ʽ��';
  SCnImageMgrWizardCaption: string = 'ͼ�������';
  SCnImageMgrWizardHint: string = 'ͼ�������';
  SCnImageMgrWizardComment: string = '�����ռ��������������͵�ͼ����Դ��֧��.bmp��.ico��gif��jpg�ȸ�ʽ��';
  SCnResMgrConfigCaption: string = '����(&O)...';
  SCnResMgrConfigHint: string = '������Դ����������';
  SCnResMgrConfigComment: string = '������Դ���������ԡ�';

  // CnRepositoryMenu
  SCnRepositoryMenuCaption: string = 'Repository �б�(&Y)';
  SCnRepositoryMenuHint: string = 'Repository ר���б�';
  SCnRepositoryMenuName: string = 'Repository �б�';
  SCnRepositoryMenuComment: string = 'Repository ר���б�';

  // CnExplore
  SCnExploreMenuCaption: string = '�ļ�������ר��(&X)';
  SCnExploreMenuHint: string = 'Ƕ��� Windows ��Դ���������������ļ����ˡ��ļ����ղغ���ʱ�ļ�ɾ������';
  SCnExploreName: string = '�ļ�������ר��';
  SCnExploreComment: string = 'Ƕ��� Windows ��Դ���������������ļ����ˡ��ļ����ղغ���ʱ�ļ�ɾ������';
  SCnNewFolder: string = '�½��ļ���';
  SCnNewFolderHint: string = '�������ļ������ƣ�';
  SCnNewFolderDefault: string = '�½��ļ���';
  SCnUnableToCreateFolder: string = '���ܴ����ļ���';
  SCnExploreFilterDataName: string = 'ExploreFilter.cdt';
  SCnExploreFilterAllFile: string = '�����ļ�';
  SCnExploreFilterDelphiFile: string = 'Delphi �ļ�';
  SCnExploreFilterBCBFile: string = 'C++Builder �ļ�';
  SCnExploreFilterDelphiProjectFile: string = '�����ļ�';
  SCnExploreFilterDelphiPackageFile: string = '���ļ�';
  SCnExploreFilterDelphiUnitFile: string = 'Delphi ��Ԫ�ļ�';
  SCnExploreFilterDelphiFormFile: string = '�����ļ�';
  SCnExploreFilterConfigFile: string = '�����ļ�'; 
  SCnExploreFilterTextFile: string = '�ı��ļ�';
  SCnExploreFilterSqlFile: string = 'SQL �ű�';
  SCnExploreFilterHtmlFile: string = 'HTML �ļ�';
  SCnExploreFilterWebFile: string = 'Web �ı�';
  SCnExploreFilterBatchFile: string = '�������ļ�';
  SCnExploreFilterTypeLibFile: string = 'Type Library';
  SCnExploreFilterStat: string = '��ǰ��������:';
  SCnExploreFilterDefault: string = '�⽫�ָ�Ĭ�ϵ��ļ��������ã�����ǰ�������޸Ľ����ı䡣�Ƿ������';
  SCnExploreFilterDeleteFmt: string = '�Ƿ�ɾ��ѡ�еĹ������ͣ�' + #13#10 +
    '���ͣ�   %s' + #13#10 + '��չ���� %s';

  // CnDUnitWizard
  SCnDUnitWizardName: string = 'DUnit ��������������';
  SCnDUnitWizardComment: string = '���� DUnit ����������Ҫ���Ѱ�װ DUnit ��Ԫ';
  SCnDUnitErrorNOTSupport: string = '����ֻ֧������ Delphi/Pascal �Ĺ��̻�Ԫ��';
  SCnDUnitTestName: string = '�������ƣ�';
  SCnDUnitTestAuthor: string = '��    �ߣ�';
  SCnDUnitTestVersion: string = '��    ����';
  SCnDUnitTestDescription: string = '˵    ����';
  SCnDUnitTestComments: string = '��    ע��';

  // CnObjInspectorEnhanceWizard
  SCnObjInspectorEnhanceWizardName: string = '����鿴����չ';
  SCnObjInspectorEnhanceWizardComment: string = '��ǿ����鿴���Ĺ��ܡ�';

  // CnWizBoot
  SCnWizBootCurrentCount: string = '��ǰר�ң�%d';
  SCnWizBootEnabledCount: string = '����ר�ң�%d';

  // CnIniFilerWizard
  SCnIniFilerWizardName: string = 'INI ��д��Ԫ������';
  SCnIniFilerWizardComment: string = '���� INI �ļ����ɶ�д�� INI �ļ��ĵ�Ԫ';
  SCnIniFilerPasFilter: string = 'Pascal �ļ�(*.pas)|*.pas';
  SCnIniFilerCppFilter: string = 'C++ �ļ�(*.cpp)|*.cpp';
  SCnIniErrorNoFile: string = 'INI �ļ������ڻ��ļ����������������ѡ���ļ���';
  SCnIniErrorPrefix: string = '��Ч���ַ�������ǰ׺';
  SCnIniErrorClassName: string = '��Ч������';
  SCnIniErrorReadIni: string = '��ȡ INI ʱ������������ INI �ļ���';
  SCnIniErrorNOTSupport: string = '����Ŀǰֻ֧������ Pascal �� C++ ��Ԫ����֧�� C# ��������';
  SCnIniErrorNOProject: string = '�޷��жϵ�ǰ�������ͣ����ֹ�ѡ��' + #13#10 + '�Ƿ����� Pascal ��Ԫ��ѡ���������� C++ ��Ԫ��';

  // CnMemProfWizard
  SCnMemProfWizardName: string = 'CnMemProf ������';
  SCnMemProfWizardComment: string = '���ɴ� CnMemProf �ڴ�������ܵĹ�����';

  // CnWinTopRoller
  SCnWinTopRollerName: string = '�����ö����۵���չ';
  SCnWinTopRollerComment: string = '�� IDE �еĴ��������ö����۵�����չ��ť';
  SCnWinTopRollerBtnTopHint: string = '�����ö�';
  SCnWinTopRollerBtnRollerHint: string = '�����۵�';
  SCnWinTopRollerBtnOptionsHint: string = '��ťѡ��';
  SCnWinTopRollerPopupAddToFilter: string = '���˴�����������б�';
  SCnWinTopRollerPopupOptions: string = '����...';

  // CnInputHelper
  SCnInputHelperName: string = '������������';
  SCnInputHelperComment: string = '���������ʱ�Զ�����������������';
  SCnInputHelperConfig: string = '����(&O)...';
  SCnInputHelperAutoPopup: string = '�����Զ�����(&A)';
  SCnInputHelperDispButtons: string = '��ʾ���ٰ�ť(&B)';
  SCnInputHelperSortKind: string = '����ʽ(&R)';
  SCnInputHelperIcon: string = 'ͼ��(&I)';
  SCnInputHelperSortByScope: string = '�Զ�����(&1)';
  SCnInputHelperSortByText: string = '���ı�����(&2)';
  SCnInputHelperSortByLength: string = '����������(&3)';
  SCnInputHelperSortByKind: string = '����������(&4)';
  SCnInputHelperAddSymbol: string = '����Զ������(&S)...';
  SCnInputHelperHelp: string = '�������ְ���(&H)';
  SCnInputHelperKibitzCompileRunning: string = '���ں�̨��ȡ��ʶ���б�';

  SCnInputHelperPreDefSymbolList: string = 'Ԥ����ĳ��ñ�ʶ���б�';
  SCnInputHelperUserTemplateList: string = '���ô���ģ���б�';
  SCnInputHelperCompDirectSymbolList: string = 'ϵͳ����ָʾ���б�';
  SCnInputHelperUnitNameList: string = '�� uses ����ʹ�õĵ�Ԫ�����б�';
  SCnInputHelperUnitUsesList: string = '�ڴ�����ʹ�õ����õ�Ԫ�����б�';
  SCnInputHelperIDECodeTemplateList: string = 'IDE �Դ��Ĵ���ģ���б�';
  SCnInputHelperIDESymbolList: string = '��ʵʱ������ȡ�õı�ʶ���б�';
  SCnInputHelperUserSymbolList: string = '�û��Զ���ı�ʶ��������ģ���б�';
  SCnInputHelperXMLCommentList: string = 'XML ��ʽ����ע���б�';
  SCnInputHelperJavaDocList: string = 'JavaDoc ��ʽ����ע���б�';

  SCnInputHelperSymbolNameIsEmpty: string = '�������Ʋ���Ϊ�գ�';
  SCnInputHelperSymbolKindError: string = '��ѡ��������ͣ�';
  SCnInputHelperUserMacroCaption: string = '�Զ����';
  SCnInputHelperUserMacroPrompt: string = '�������Զ��������:';

  SCnKeywordDefault: string = 'Ĭ��';
  SCnKeywordLower: string = 'Сд�ؼ���';
  SCnKeywordUpper: string = '��д�ؼ���';
  SCnKeywordFirstUpper: string = '���״�д';

  // CnProcListWizard
  SCnProcListWizardName: string = '���������б�ר��';
  SCnProcListWizardComment: string = '�г���ǰԴ���ļ��еĺ��������';
  SCnProcListWizardMenuCaption: string = '���������б�(&G)...';
  SCnProcListWizardMenuHint: string = '�г���ǰԴ���ļ��еĺ��������';
  SCnProcListObjsAll: string = '<ȫ��>';
  SCnProcListObjsNone: string = '<����>';
  SCnProcListErrorInFile: string = '�﷨��������Դ�ļ���������';
  SCnProcListErrorFileType: string = '�ļ������ڣ����ļ����Ͳ�֧��';
  SCnProcListErrorPreview: string = '<�ļ�δ�򿪣�����ʵ�ֲ��ֵ�Ԥ��������ʱ��Ч>';

  SCnProcListCurrentFile: string = '<��ǰ��Ԫ>';
  SCnProcListAllFileInProject: string = '<��ǰ�������е�Ԫ>';
  SCnProcListAllFileInProjectGroup: string = '<��ǰ���������е�Ԫ>';
  SCnProcListAllFileOpened: string = '<���д򿪵ĵ�Ԫ>';

  SCnProcListJumpIntfHint: string = '������Ԫ�� interface ����';
  SCnProcListJumpImplHint: string = '������Ԫ�� implementation ����';
  SCnProcListClassComboHint: string = '���������б�';
  SCnProcListProcComboHint: string = '���������б�';
  SCnProcListMatchStartHint: string = 'ƥ�俪ͷ';
  SCnProcListMatchAnyHint: string = 'ƥ������λ��';

  SCnProcListSortMenuCaption: string = '�������(&S)';
  SCnProcListSortSubMenuByName: string = '������(&N)';
  SCnProcListSortSubMenuByLocation: string = '��λ��(&L)';
  SCnProcListSortSubMenuReverse: string = '����(&R)';
  SCnProcListExportMenuCaption: string = '����б��ļ�(&E)...';
  SCnProcListCloseMenuCaption: string = '�رպ����б�����(&H)';

  SCnProcListNoContent: string = '<��>';
  SCnProcListCloseToolBarHint: string = '���Ѿ�ѡ���˹رպ����б�������'#13#10#13#10 +
    '������Ժ���Ҫ������ʾ�˹����������ں��������б����е��'#13#10 +
    '����ʾ���������б���������ť��ʵ�֡�';

  SCnProcListErrorNoIntf: string = 'δ�ҵ� interface ����';
  SCnProcListErrorNoImpl: string = 'δ�ҵ� implementation ����';

  // CnUsesCleaner
  SCnUsesCleanerMenuCaption: string = '�������õ�Ԫ(&U)...';
  SCnUsesCleanerMenuHint: string = '����Դ�����в���Ҫ�����õ�Ԫ';
  SCnUsesCleanerName: string = '�������õ�Ԫר��';
  SCnUsesCleanerComment: string = '����Դ�����в���Ҫ�����õ�Ԫ��';
  SCnUsesCleanerCompileFail: string = '���빤��ʧ�ܣ��޷�������Ԫ���ù�ϵ��';
  SCnUsesCleanerUnitError: string = '�����ļ� %s ʧ�ܣ�'#13#10#13#10 +
    '���ļ���ʽ���ܲ�֧�֣����뿪������ϵ��';
  SCnUsesCleanerProcessError: string = '�����ļ� %s ʧ�ܣ�����Ҫ�������������ļ���';
  SCnUsesCleanerHasInitSection: string = '������ʼ����';
  SCnUsesCleanerHasRegProc: string = '����ע�����';
  SCnUsesCleanerInCleanList: string = '�������б���';
  SCnUsesCleanerInIgnoreList: string = '�ں����б���';
  SCnUsesCleanerNotSource: string = '��Դ��';
  SCnUsesCleanerCompRef: string = '����������';
  SCnUsesCleanerNoneResult: string = 'û���ҵ���Ҫ��������ݣ�';
  SCnUsesCleanerReport: string = '���õ�Ԫ������ɣ�' + #13#10 +
    '������ %d ������������ %d ��Ԫ�С�'#13#10#13#10 +
    '����Ҫ�鿴������־��';

  // CnIdeEnhanceMenu
  SCnIdeEnhanceMenuCaption: string = 'IDE ��չ����(&I)';
  SCnIdeEnhanceMenuHint: string = 'IDE ��չ�����б�';
  SCnIdeEnhanceMenuName: string = 'IDE ��չ����';
  SCnIdeEnhanceMenuComment: string = 'IDE ��չ�����б�';

  // CnSourceHighlight
  SCnSourceHighlightWizardName: string = 'Դ���������չ';
  SCnSourceHighlightWizardComment: string = '����ƥ������ͽṹ��������չ';

  // CnIdeBRWizard
  SCnIdeBRWizardMenuCaption: string = 'IDE ���ñ���/�ָ�(&0)...';
  SCnIdeBRWizardMenuHint: string = '���� IDE ���ñ���/�ָ�����';
  SCnIdeBRWizardName: string = 'IDE ���ñ���/�ָ�����';
  SCnIdeBRWizardComment: string = '���� IDE ���ñ���/�ָ�����';
  SCnIdeBRToolNotExists: string = '�޷����� IDE ���ñ���/�ָ����ߣ������°�װר�Ұ���';

  // CnFastCodeWizard
  SCnFastCodeWizardName: string = 'FastCode �Ż�ר��';
  SCnFastCodeWizardComment: string = 'ʹ�� FastCode/FastMove ������ IDE ������';

  // CnScriptWizard
  SCnScriptWizardMenuCaption: string = '�ű���չר��(&1)';
  SCnScriptWizardMenuHint: string = '�ɱ�д Pascal �ű���ʵ�ֹ�����չ';
  SCnScriptWizardName: string = '�ű���չר��';
  SCnScriptWizardComment: string = '�ɱ�д Pascal �ű���ʵ�ֹ�����չ';
  SCnScriptFormCaption: string = '�ű�����(&W)';
  SCnScriptFormHint: string = '��ʾ���ڱ༭��ִ�нű��Ŀ�ͣ������';
  SCnScriptWizCfgCaption: string = '�ű�����(&S)...';
  SCnScriptWizCfgHint: string = '�ű���չ���ô���';
  SCnScriptBrowseDemoCaption: string = '����ű�ʾ��(&B)...';
  SCnScriptBrowseDemoHint: string = '����Դ�������д򿪽ű�ʾ��������Ŀ¼';
  SCnScriptFileNotExists: string = '�ű��ļ������ڣ�';
  SCnScriptCompError: string = '�ű��������:';
  SCnScriptExecError: string = '�ű����д���:';
  SCnScriptCompiler: string = '������';
  SCnScriptCompiling: string = '���ڱ���...';
  SCnScriptErrorMsg: string = '%s �� %d.%d';
  SCnScriptCompiledSucc: string = '����ɹ�';
  SCnScriptExecutedSucc: string = 'ִ�гɹ�';
  SCnScriptCompilingFailed: string = '����ʧ��';
  SCnScriptExecConfirm: string = '��ȷ��Ҫִ�нű� %s ��';
  SCnScriptMenuDemoCaption: string = '����(&D)';
  SCnScriptMenuDemoHint: string = '�ű�����';

implementation

end.

