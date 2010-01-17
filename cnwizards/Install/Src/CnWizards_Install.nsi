;******************************************************************************
;                        CnPack For Delphi/C++Builder
;                      �й����Լ��Ŀ���Դ�������������
;                    (C)Copyright 2001-2009 CnPack ������
;******************************************************************************

; ���½ű��������� CnPack IDE ר�Ұ���װ����
; �ýű����� NSIS 2.26 �±���ͨ������֧�ָ��ͻ���ߵİ汾��ʹ��ʱ��ע��

; �ýű�֧�������в������������룬�����в������簴���·�ʽ����ʱ��
;       makensis /DIDE_VERSION_D5 CnWizards_Install.nsi
; ��ֻ�������� Delphi 5 ר���ļ��Լ��������ߵİ�װ�����ް������ݡ�
; /D ��������֧�ֵ� IDE �汾���������������µ�������
;    IDE_VERSION_D5
;    IDE_VERSION_D6
;    IDE_VERSION_D7
;    IDE_VERSION_D9
;    IDE_VERSION_D10
;    IDE_VERSION_D11
;    IDE_VERSION_D12
;    IDE_VERSION_D14
;    IDE_VERSION_CB5
;    IDE_VERSION_CB6
;    NO_HELP
;******************************************************************************

!include "Sections.nsh"
!include "MUI.nsh"
!include "LogicLib.nsh"

!include "release.inc"

;------------------------------------------------------------------------------
; ��������ѡ��
;------------------------------------------------------------------------------

; �����ļ����Ǳ��
SetOverwrite on
; ����ѹ��ѡ��
SetCompress auto
; ѡ��ѹ����ʽ
SetCompressor /SOLID lzma
SetCompressorDictSize 32
; �������ݿ��Ż�
SetDatablockOptimize on
; ������������д���ļ�ʱ��
SetDateSave on

;------------------------------------------------------------------------------
; ����汾�ţ�����ʵ�ʰ汾�Ž��и���
;------------------------------------------------------------------------------

;!define DEBUG "1"

!define SUPPORTS_BDS "1"

; ������汾��
!ifndef VER_MAJOR
  !define VER_MAJOR "0"
!endif

; ����Ӱ汾��
!ifndef VER_MINOR
  !define VER_MINOR "8.9.0"
!endif

;------------------------------------------------------------------------------
; IDE �汾�����֧��
;------------------------------------------------------------------------------

; IDE �汾����δָ����ȫָ��
!ifndef IDE_VERSION_D5
!ifndef IDE_VERSION_D6
!ifndef IDE_VERSION_D7
!ifndef IDE_VERSION_D9
!ifndef IDE_VERSION_D10
!ifndef IDE_VERSION_D11
!ifndef IDE_VERSION_D12
!ifndef IDE_VERSION_D14
!ifndef IDE_VERSION_CB5
!ifndef IDE_VERSION_CB6

  !define FULL_VERSION    "1"

  !define IDE_VERSION_D5  "1"
  !define IDE_VERSION_D6  "1"
  !define IDE_VERSION_D7  "1"
  !define IDE_VERSION_D9  "1"
  !define IDE_VERSION_D10 "1"
  !define IDE_VERSION_D11 "1"
  !define IDE_VERSION_D12 "1"
  !define IDE_VERSION_D14 "1"
  !define IDE_VERSION_CB5 "1"
  !define IDE_VERSION_CB6 "1"

!endif
!endif
!endif
!endif
!endif
!endif
!endif
!endif
!endif
!endif

!ifndef FULL_VERSION
  !ifdef IDE_VERSION_D5
    !define IDE_SHORT_NAME "D5"
    !define IDE_LONG_NAME "Delphi 5"
  !endif
  !ifdef IDE_VERSION_D6
    !define IDE_SHORT_NAME "D6"
    !define IDE_LONG_NAME "Delphi 6"
  !endif
  !ifdef IDE_VERSION_D7
    !define IDE_SHORT_NAME "D7"
    !define IDE_LONG_NAME "Delphi 7"
  !endif
  !ifdef IDE_VERSION_D9
    !define IDE_SHORT_NAME "D2005"
    !define IDE_LONG_NAME "BDS 2005"
  !endif
  !ifdef IDE_VERSION_D10
    !define IDE_SHORT_NAME "D2006"
    !define IDE_LONG_NAME "BDS 2006"
  !endif
  !ifdef IDE_VERSION_D11
    !define IDE_SHORT_NAME "D2007"
    !define IDE_LONG_NAME "RAD Studio 2007"
  !endif
  !ifdef IDE_VERSION_D12
    !define IDE_SHORT_NAME "D2009"
    !define IDE_LONG_NAME "RAD Studio 2009"
  !endif
  !ifdef IDE_VERSION_D14
    !define IDE_SHORT_NAME "D2010"
    !define IDE_LONG_NAME "RAD Studio 2010"
  !endif
  !ifdef IDE_VERSION_CB5
    !define IDE_SHORT_NAME "CB5"
    !define IDE_LONG_NAME "C++Builder 5"
  !endif
  !ifdef IDE_VERSION_CB6
    !define IDE_SHORT_NAME "CB6"
    !define IDE_LONG_NAME "C++Builder 5"
  !endif
!endif

!ifndef FULL_VERSION
  !define VERSION_STRING "${VER_MAJOR}.${VER_MINOR}_${IDE_SHORT_NAME}"
!else
  !define VERSION_STRING "${VER_MAJOR}.${VER_MINOR}"
!endif

!ifndef INSTALLER_NAME
  !define INSTALLER_NAME "CnWizards_${VERSION_STRING}.exe"
!endif

;------------------------------------------------------------------------------
; ��Ҫ�����Դ�����ַ���
;------------------------------------------------------------------------------

; ר������
LangString APPNAME 1033 "CnPack IDE Wizards"
LangString APPNAME 1028 "CnPack IDE �M�a�]"
LangString APPNAME 2052 "CnPack IDE ר�Ұ�"

; ר�Ұ�װĿ¼���ƣ������
LangString APPNAMEDIR 1033 "CnPack IDE Wizards"
LangString APPNAMEDIR 1028 "CnPack IDE Wizards"
LangString APPNAMEDIR 2052 "CnPack IDE Wizards"

; ��װ����
LangString TYPICALINST 1033 "Typical"
LangString TYPICALINST 1028 "�嫬�w��"
LangString TYPICALINST 2052 "���Ͱ�װ"

LangString MINIINST 1033 "Minimized"
LangString MINIINST 1028 "�̤p�w��"
LangString MINIINST 2052 "��С��װ"

LangString CUSTINST 1033 "Custom"
LangString CUSTINST 1028 "�۩w�q"
LangString CUSTINST 2052 "�Զ���"

; Section ��
LangString PROGRAMDATA 1033 "Data files"
LangString PROGRAMDATA 1028 "�{�Ǽƾڤ��"
LangString PROGRAMDATA 2052 "���������ļ�"

LangString HELPFILE 1033 "Help Files"
LangString HELPFILE 1028 "���U���"
LangString HELPFILE 2052 "�����ļ�"

LangString OTHERTOOLS 1033 "Tools"
LangString OTHERTOOLS 1028 "���U�u��"
LangString OTHERTOOLS 2052 "��������"

; ��ݷ�ʽ��
LangString SHELP 1033 "CnWizards Help"
LangString SHELP 1028 "�M�a�]���U"
LangString SHELP 2052 "ר�Ұ�����"

LangString SHELPCHM 1033 "CnWizards_ENU.chm"
LangString SHELPCHM 1028 "CnWizards_CHT.chm"
LangString SHELPCHM 2052 "CnWizards_CHS.chm"

LangString SENABLE 1033 "Enable CnWizards"
LangString SENABLE 1028 "�ҥαM�a�]"
LangString SENABLE 2052 "����ר�Ұ�"

LangString SDISABLE 1033 "Disable CnWizards"
LangString SDISABLE 1028 "�T�αM�a�]"
LangString SDISABLE 2052 "����ר�Ұ�"

LangString SCONFIGIO 1033 "CnWizards Config Import & Export"
LangString SCONFIGIO 1028 "�M�a�]�]�m�ɤJ�ɥX�u��"
LangString SCONFIGIO 2052 "ר�Ұ����õ��뵼������"

LangString SCLEANIDEHIS 1033 "IDE History Cleaner"
LangString SCLEANIDEHIS 1028 "�M�� IDE ���}�����v"
LangString SCLEANIDEHIS 2052 "��� IDE ���ļ���ʷ"

LangString SASCIICHART 1033 "ASCII Chart"
LangString SASCIICHART 1028 "ASCII �r�Ū�"
LangString SASCIICHART 2052 "ASCII �ַ���"

LangString SUNINSTALL 1033 "Uninstall"
LangString SUNINSTALL 1028 "����"
LangString SUNINSTALL 2052 "ж��"

LangString SDFMCONVERTOR 1033 "DFM Convertor"
LangString SDFMCONVERTOR 1028 "DFM �����ഫ�u��"
LangString SDFMCONVERTOR 2052 "DFM ����ת������"

LangString SDEBUGVIEWER 1033 "Debug Viewer"
LangString SDEBUGVIEWER 1028 "�ոիH���d�ݾ�"
LangString SDEBUGVIEWER 2052 "������Ϣ�鿴��"

LangString SIDEBRTOOL 1033 "IDE Config Backup & Restore"
LangString SIDEBRTOOL 1028 "IDE �]�m�ƥ���_�u��"
LangString SIDEBRTOOL 2052 "IDE ���ñ��ݻָ�����"

LangString SMANAGEWIZ 1033 "IDE External Wizard Management"
LangString SMANAGEWIZ 1028 "IDE �M�a�޲z�u��"
LangString SMANAGEWIZ 2052 "IDE ר�ҹ�����"

LangString SRELATIONANALYZER 1033 "Relation Analyzer"
LangString SRELATIONANALYZER 1028 "���X�Ҷ����Y���R"
LangString SRELATIONANALYZER 2052 "Դ��ģ���ϵ����"

LangString SSELECTLANG 1033 "Select CnWizards Language"
LangString SSELECTLANG 1028 "Select CnWizards Language"
LangString SSELECTLANG 2052 "Select CnWizards Language"

; �Ի�����ʾ��Ϣ
LangString SQUERYIDE 1033 "Setup has detected some wizard dlls are in using.$\n\
                           Please close Delphi or C++Builder first.$\n$\n\
                           Click [OK] to retry and continue.$\n\
                           Click [Cancel] to exit Setup."
LangString SQUERYIDE 1028 "�w�˵{���˴���ݭn�w�˪��Y�ǱM�a�]�w��󥿦b�Q�ϥΡA$\n\
                           �������z�� Delphi �M C++Builder �{�ǡC$\n$\n\
                           �I�� [�T�w] �N���s�˴��}�~��w�ˡC$\n\
                           �I�� [����] �N�����w�˵{�ǡC"
LangString SQUERYIDE 2052 "��װ�����⵽��Ҫ��װ��ĳЩר�Ұ����ļ����ڱ�ʹ�ã�$\n\
                           ��ر����� Delphi �� C++Builder ����$\n$\n\
                           ��� [ȷ��] �����¼�Ⲣ������װ��$\n\
                           ��� [ȡ��] ���رհ�װ����"

LangString SQUERYDELETE 1033 "Delete user data files and wizards settings?$\n(If you want to keep them, please click [No].)"
LangString SQUERYDELETE 1028 "�O�_�R���Τ�ƾڤ��M�M�a�]�]�m�H���H$\n(�Y�z�n�O�d�o�Ǥ��A���I���U���� [�_] ���s)"
LangString SQUERYDELETE 2052 "�Ƿ�ɾ���û������ļ���ר�Ұ�������Ϣ��$\n(����Ҫ������Щ�ļ������������ [��] ��ť)"

; Section ������Ϣ
LangString DESCDATA 1033 "The core programs and data files required to use wizards."
LangString DESCDATA 1028 "�w�� CnPack IDE �M�a�]�������ƾڤ��C"
LangString DESCDATA 2052 "��װ CnPack IDE ר�Ұ�����������ļ���"

LangString DESCHELP 1033 "Help file for wizards."
LangString DESCHELP 1028 "�w�� CnPack IDE �M�a�]���U���C"
LangString DESCHELP 2052 "��װ CnPack IDE ר�Ұ������ļ���"

LangString DESCD5 1033 "Install wizard dll file for Delphi 5."
LangString DESCD5 1028 "��ܦw�� Delphi 5 �U�� CnPack IDE �M�a���C"
LangString DESCD5 2052 "ѡ��װ Delphi 5 �µ� CnPack IDE ר���ļ���"

LangString DESCD6 1033 "Install wizard dll file for Delphi 6."
LangString DESCD6 1028 "��ܦw�� Delphi 6 �U�� CnPack IDE �M�a���C"
LangString DESCD6 2052 "ѡ��װ Delphi 6 �µ� CnPack IDE ר���ļ���"

LangString DESCD7 1033 "Install wizard dll file for Delphi 7."
LangString DESCD7 1028 "��ܦw�� Delphi 7 �U�� CnPack IDE �M�a���C"
LangString DESCD7 2052 "ѡ��װ Delphi 7 �µ� CnPack IDE ר���ļ���"

!ifdef SUPPORTS_BDS
LangString DESCD9 1033 "Install wizard dll file for BDS 2005."
LangString DESCD9 1028 "��ܦw�� BDS 2005 �U�� CnPack IDE �M�a���C"
LangString DESCD9 2052 "ѡ��װ BDS 2005 �µ� CnPack IDE ר���ļ���"

LangString DESCD10 1033 "Install wizard dll file for BDS 2006."
LangString DESCD10 1028 "��ܦw�� BDS 2006 �U�� CnPack IDE �M�a���C"
LangString DESCD10 2052 "ѡ��װ BDS 2006 �µ� CnPack IDE ר���ļ���"

LangString DESCD11 1033 "Install wizard dll file for RAD Studio 2007."
LangString DESCD11 1028 "��ܦw�� RAD Studio 2007 �U�� CnPack IDE �M�a���C"
LangString DESCD11 2052 "ѡ��װ RAD Studio 2007 �µ� CnPack IDE ר���ļ���"

LangString DESCD12 1033 "Install wizard dll file for RAD Studio 2009."
LangString DESCD12 1028 "��ܦw�� RAD Studio 2009 �U�� CnPack IDE �M�a���C"
LangString DESCD12 2052 "ѡ��װ RAD Studio 2009 �µ� CnPack IDE ר���ļ���"

LangString DESCD14 1033 "Install wizard dll file for RAD Studio 2010."
LangString DESCD14 1028 "��ܦw�� RAD Studio 2010 �U�� CnPack IDE �M�a���C"
LangString DESCD14 2052 "ѡ��װ RAD Studio 2010 �µ� CnPack IDE ר���ļ���"
!endif

LangString DESCCB5 1033 "Install wizard dll file for C++Builder 5."
LangString DESCCB5 1028 "��ܦw�� C++Builder 5 �U�� CnPack IDE �M�a���C"
LangString DESCCB5 2052 "ѡ��װ C++Builder 5 �µ� CnPack IDE ר���ļ���"

LangString DESCCB6 1033 "Install wizard dll file for C++Builder 6."
LangString DESCCB6 1028 "��ܦw�� C++Builder 6 �U�� CnPack IDE �M�a���C"
LangString DESCCB6 2052 "ѡ��װ C++Builder 6 �µ� CnPack IDE ר���ļ���"

LangString DESCOTHERS 1033 "Other tools, include DFM Convertor etc."
LangString DESCOTHERS 1028 "�w�˱M�a�]���U�u��]�A�]�A�����ഫ�u�㵥�C"
LangString DESCOTHERS 2052 "��װר�Ұ��������߰�����������ת�����ߵȡ�"

;------------------------------------------------------------------------------
; �������Ϣ
;------------------------------------------------------------------------------

; �������
!ifndef FULL_VERSION
  Name "$(APPNAME) ${VER_MAJOR}.${VER_MINOR} For ${IDE_LONG_NAME}"
!else
  Name "$(APPNAME) ${VER_MAJOR}.${VER_MINOR}"
!endif

; ��������
!ifndef FULL_VERSION
Caption "$(APPNAME) ${VER_MAJOR}.${VER_MINOR} For ${IDE_LONG_NAME}"
!else
Caption "$(APPNAME) ${VER_MAJOR}.${VER_MINOR}"
!endif

; ��������
BrandingText "$(APPNAME) Build ${__DATE__}"

; ��װ��������ļ���
OutFile "..\Output\${INSTALLER_NAME}"

;------------------------------------------------------------------------------
; �����ļ��� Modern UI ����
;------------------------------------------------------------------------------

!verbose 3

; ����Ҫ��ʾ��ҳ��

!define MUI_ICON "..\..\Bin\Icons\CnWizardsSetup.ico"
!define MUI_UNICON "..\..\Bin\Icons\CnWizardsSetup.ico"

!define MUI_ABORTWARNING

!define MUI_WELCOMEPAGE_TITLE_3LINES
!define MUI_FINISHPAGE_TITLE_3LINES

!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "cnpack.bmp"

LicenseLangString SLICENSEFILE 1033 "..\..\License.enu.txt"
LicenseLangString SLICENSEFILE 1028 "..\..\License.cht.txt"
LicenseLangString SLICENSEFILE 2052 "..\..\License.chs.txt"

; ��װ����ҳ��
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE $(SLICENSEFILE)
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES

; ж�س���ҳ��
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; ��װ��ɺ���ʾ�����ļ�
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\Help\$(SHELPCHM)"
!define MUI_FINISHPAGE_SHOWREADME_FUNCTION ShowReleaseNotes

; ��װ����Ҫ����
!define MUI_FINISHPAGE_NOREBOOTSUPPORT

!insertmacro MUI_PAGE_FINISH

;����֧��
!define MUI_LANGDLL_REGISTRY_ROOT "HKCU"
!define MUI_LANGDLL_REGISTRY_KEY "Software\CnPack"
!define MUI_LANGDLL_REGISTRY_VALUENAME "Installer Language"
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "SimpChinese"
!insertmacro MUI_LANGUAGE "TradChinese"

!verbose 4

;------------------------------------------------------------------------------
; ��װ��������
;------------------------------------------------------------------------------

; ���� WindowsXP ���Ӿ���ʽ
XPstyle on

; ��װ������ʾ����
WindowIcon on
; �趨���䱳��
BGGradient off
; ִ�� CRC ���
CRCCheck on
; ��ɺ��Զ��رհ�װ����
AutoCloseWindow true
; ��ʾ��װʱ����ʾ��ϸϸ�ڡ��Ի���
ShowInstDetails show
; ��ʾж��ʱ����ʾ��ϸϸ�ڡ��Ի���
ShowUninstDetails show
; �Ƿ�����װ�ڸ�Ŀ¼��
AllowRootDirInstall false

; Ĭ�ϵİ�װĿ¼
InstallDir "$PROGRAMFILES\CnPack\CnWizards"
; ������ܵĻ���ע����м�ⰲװ·��
InstallDirRegKey HKLM \
                "Software\Microsoft\Windows\CurrentVersion\Uninstall\CnWizards" \
                "UninstallString"

;------------------------------------------------------------------------------
; ��װ�������
;------------------------------------------------------------------------------

; ѡ��Ҫ��װ�����
InstType "$(TYPICALINST)"
InstType "$(MINIINST)"
InstType /CUSTOMSTRING=$(CUSTINST)

;------------------------------------------------------------------------------
; ��װ��������
;------------------------------------------------------------------------------

Section "$(PROGRAMDATA)" SecData
  ; ���ø�����ڵ�1��2��ѡ���г��֣�����Ϊֻ��
  SectionIn 1 2 RO

  ; ������־
  ClearErrors

; ����ļ��Ƿ�ʹ��
FileLoop:
!ifdef IDE_VERSION_D5
  IfFileExists "$INSTDIR\CnWizards_D5.dll" 0 +4
  FileOpen $0 "$INSTDIR\CnWizards_D5.dll" a
  IfErrors FileInUse
  FileClose $0
!endif

!ifdef IDE_VERSION_D6
  IfFileExists "$INSTDIR\CnWizards_D6.dll" 0 +4
  FileOpen $0 "$INSTDIR\CnWizards_D6.dll" a
  IfErrors FileInUse
  FileClose $0
!endif

!ifdef IDE_VERSION_D7
  IfFileExists "$INSTDIR\CnWizards_D7.dll" 0 +4
  FileOpen $0 "$INSTDIR\CnWizards_D7.dll" a
  IfErrors FileInUse
  FileClose $0
!endif

!ifdef SUPPORTS_BDS
!ifdef IDE_VERSION_D9
  IfFileExists "$INSTDIR\CnWizards_D9.dll" 0 +4
  FileOpen $0 "$INSTDIR\CnWizards_D9.dll" a
  IfErrors FileInUse
  FileClose $0
!endif

!ifdef IDE_VERSION_D10
  IfFileExists "$INSTDIR\CnWizards_D10.dll" 0 +4
  FileOpen $0 "$INSTDIR\CnWizards_D10.dll" a
  IfErrors FileInUse
  FileClose $0
!endif

!ifdef IDE_VERSION_D11
  IfFileExists "$INSTDIR\CnWizards_D11.dll" 0 +4
  FileOpen $0 "$INSTDIR\CnWizards_D11.dll" a
  IfErrors FileInUse
  FileClose $0
!endif

!ifdef IDE_VERSION_D12
  IfFileExists "$INSTDIR\CnWizards_D12.dll" 0 +4
  FileOpen $0 "$INSTDIR\CnWizards_D12.dll" a
  IfErrors FileInUse
  FileClose $0
!endif

!ifdef IDE_VERSION_D14
  IfFileExists "$INSTDIR\CnWizards_D14.dll" 0 +4
  FileOpen $0 "$INSTDIR\CnWizards_D14.dll" a
  IfErrors FileInUse
  FileClose $0
!endif

!endif

!ifdef IDE_VERSION_CB5
  IfFileExists "$INSTDIR\CnWizards_CB5.dll" 0 +4
  FileOpen $0 "$INSTDIR\CnWizards_CB5.dll" a
  IfErrors FileInUse
  FileClose $0
!endif

!ifdef IDE_VERSION_CB6
  IfFileExists "$INSTDIR\CnWizards_CB6.dll" 0 +4
  FileOpen $0 "$INSTDIR\CnWizards_CB6.dll" a
  IfErrors FileInUse
  FileClose $0
!endif

  Goto InitOk

FileInUse:
  FileClose $0
  MessageBox MB_OKCANCEL|MB_ICONQUESTION "$(SQUERYIDE)" IDOK FileLoop
  ; ѡ��ȡ���жϰ�װ
  Quit

InitOk:

  ; �������·����ÿ��ʹ�ö���ı�
  SetOutPath $INSTDIR
  File "..\..\Bin\Setup.exe"
  File "..\..\Bin\CnWizRes.dll"
  File "..\..\Bin\CnZipWrapper.dll"
  File "..\..\License.chs.txt"
  File "..\..\License.cht.txt"
  File "..\..\License.enu.txt"
  File "..\..\License.ru.txt"

  SetOutPath $INSTDIR\Data
  File "..\..\Bin\Data\*.*"
  SetOutPath $INSTDIR\Data\Templates
  File "..\..\Bin\Data\Templates\*.*"
  SetOutPath $INSTDIR\Lang\2052
  File "..\..\Bin\Lang\2052\*.*"
  SetOutPath $INSTDIR\Lang\1028
  File "..\..\Bin\Lang\1028\*.*"
  SetOutPath $INSTDIR\Lang\1033
  File "..\..\Bin\Lang\1033\*.*"
  SetOutPath $INSTDIR\Lang\1049
  File "..\..\Bin\Lang\1049\*.*"
  SetOutPath $INSTDIR\PSDecl
  File "..\..\Bin\PSDecl\*.*"
  SetOutPath $INSTDIR\PSDeclEx
  File "..\..\Bin\PSDeclEx\*.*"
  SetOutPath $INSTDIR\PSDemo
  File "..\..\Bin\PSDemo\*.*"

  ; ɾ�� 0.8.0 ��ǰ�汾��װ��ͼ���ļ������ں����汾��ȥ��
  Delete "$INSTDIR\Icons\*.*"
  RMDir /r $INSTDIR\Icons

  ; Ϊ Windows ж�س���д���ֵ
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CnWizards" "DisplayIcon" '"$INSTDIR\uninst.exe"'
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CnWizards" "DisplayName" "$(APPNAMEDIR)"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CnWizards" "DisplayVersion" "${VERSION_STRING}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CnWizards" "HelpLink" "http://bbs.cnpack.org"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CnWizards" "Publisher" "CnPack Team"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CnWizards" "URLInfoAbout" "http://www.cnpack.org"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CnWizards" "URLUpdateInfo" "http://www.cnpack.org"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CnWizards" "UninstallString" '"$INSTDIR\uninst.exe"'

  ; ɾ����ǰ�Ŀ�ʼ�˵���
  RMDir /r "$SMPROGRAMS\$(APPNAMEDIR)"
  RMDir /r "$SMPROGRAMS\CnPack IDE ר�Ұ�"
  RMDir /r "$SMPROGRAMS\CnPack IDE �M�a�]"

  ;  ������ʼ�˵���
  CreateDirectory "$SMPROGRAMS\$(APPNAMEDIR)"
  CreateShortCut "$SMPROGRAMS\$(APPNAMEDIR)\$(SENABLE).lnk" "$INSTDIR\Setup.exe" "-i" "$INSTDIR\Setup.exe" 1
  CreateShortCut "$SMPROGRAMS\$(APPNAMEDIR)\$(SDISABLE).lnk" "$INSTDIR\Setup.exe" "-u" "$INSTDIR\Setup.exe" 2
  CreateShortCut "$SMPROGRAMS\$(APPNAMEDIR)\$(SUNINSTALL) $(APPNAME).lnk" "$INSTDIR\uninst.exe"

  ; д������ж�س���
  WriteUninstaller "$INSTDIR\uninst.exe"
SectionEnd

!ifdef IDE_VERSION_D5
Section "Delphi 5" SecD5
  SectionIn 1 2
  SetOutPath $INSTDIR
  File "..\..\Bin\CnWizards_D5.dll"
  ; д��ר��ע���ֵ
  WriteRegStr HKCU "Software\Borland\Delphi\5.0\Experts" "CnWizards_D5" "$INSTDIR\CnWizards_D5.dll"
SectionEnd
!endif

!ifdef IDE_VERSION_D6
Section "Delphi 6" SecD6
  SectionIn 1 2
  SetOutPath $INSTDIR
  File "..\..\Bin\CnWizards_D6.dll"
  ; д��ר��ע���ֵ
  WriteRegStr HKCU "Software\Borland\Delphi\6.0\Experts" "CnWizards_D6" "$INSTDIR\CnWizards_D6.dll"
SectionEnd
!endif

!ifdef IDE_VERSION_D7
Section "Delphi 7" SecD7
  SectionIn 1 2
  SetOutPath $INSTDIR
  File "..\..\Bin\CnWizards_D7.dll"
  ; д��ר��ע���ֵ
  WriteRegStr HKCU "Software\Borland\Delphi\7.0\Experts" "CnWizards_D7" "$INSTDIR\CnWizards_D7.dll"
SectionEnd
!endif

!ifdef SUPPORTS_BDS
!ifdef IDE_VERSION_D9
Section "BDS 2005" SecD9
  SectionIn 1 2
  SetOutPath $INSTDIR
  File "..\..\Bin\CnWizards_D9.dll"
  ; д��ר��ע���ֵ
  WriteRegStr HKCU "Software\Borland\BDS\3.0\Experts" "CnWizards_D9" "$INSTDIR\CnWizards_D9.dll"
SectionEnd
!endif

!ifdef IDE_VERSION_D10
Section "BDS 2006" SecD10
  SectionIn 1 2
  SetOutPath $INSTDIR
  File "..\..\Bin\CnWizards_D10.dll"
  ; д��ר��ע���ֵ
  WriteRegStr HKCU "Software\Borland\BDS\4.0\Experts" "CnWizards_D10" "$INSTDIR\CnWizards_D10.dll"
SectionEnd
!endif

!ifdef IDE_VERSION_D11
Section "RAD Studio 2007" SecD11
  SectionIn 1 2
  SetOutPath $INSTDIR
  File "..\..\Bin\CnWizards_D11.dll"
  ; д��ר��ע���ֵ
  WriteRegStr HKCU "Software\Borland\BDS\5.0\Experts" "CnWizards_D11" "$INSTDIR\CnWizards_D11.dll"
SectionEnd
!endif

!ifdef IDE_VERSION_D12
Section "RAD Studio 2009" SecD12
  SectionIn 1 2
  SetOutPath $INSTDIR
  File "..\..\Bin\CnWizards_D12.dll"
  ; д��ר��ע���ֵ
  WriteRegStr HKCU "Software\CodeGear\BDS\6.0\Experts" "CnWizards_D12" "$INSTDIR\CnWizards_D12.dll"
SectionEnd
!endif

!ifdef IDE_VERSION_D14
Section "RAD Studio 2010" SecD14
  SectionIn 1 2
  SetOutPath $INSTDIR
  File "..\..\Bin\CnWizards_D14.dll"
  ; д��ר��ע���ֵ
  WriteRegStr HKCU "Software\CodeGear\BDS\7.0\Experts" "CnWizards_D14" "$INSTDIR\CnWizards_D14.dll"
SectionEnd
!endif

!endif

!ifdef IDE_VERSION_CB5
Section "C++Builder 5" SecCB5
  SectionIn 1 2
  SetOutPath $INSTDIR
  File "..\..\Bin\CnWizards_CB5.dll"
!ifdef DEBUG
  File "..\..\Bin\CnWizards_CB5.map"
!endif
  ; д��ר��ע���ֵ
  WriteRegStr HKCU "Software\Borland\C++Builder\5.0\Experts" "CnWizards_CB5" "$INSTDIR\CnWizards_CB5.dll"
SectionEnd
!endif

!ifdef IDE_VERSION_CB6
Section "C++Builder 6" SecCB6
  SectionIn 1 2
  SetOutPath $INSTDIR
  File "..\..\Bin\CnWizards_CB6.dll"
!ifdef DEBUG
  File "..\..\Bin\CnWizards_CB6.map"
!endif
  ; д��ר��ע���ֵ
  WriteRegStr HKCU "Software\Borland\C++Builder\6.0\Experts" "CnWizards_CB6" "$INSTDIR\CnWizards_CB6.dll"
SectionEnd
!endif

; �ֿ���ʱ���������
!ifndef NO_HELP
Section "$(HELPFILE)" SecHelp
  SectionIn 1
  SetOutPath $INSTDIR\Help
  File "..\..\Bin\Help\CnWizards_*.chm"
  CreateShortCut "$SMPROGRAMS\$(APPNAMEDIR)\$(SHELP).lnk" "$INSTDIR\Help\$(SHELPCHM)"
SectionEnd
!endif

Section "$(OTHERTOOLS)" SecTools
  SectionIn 1
  SetOutPath $INSTDIR
  File "..\..\Bin\CnDfm6To5.exe"
  File "..\..\Bin\CnConfigIO.exe"
  File "..\..\Bin\AsciiChart.exe"
  File "..\..\Bin\CnDebugViewer.exe"
  File "..\..\Bin\CnIdeBRTool.exe"
  File "..\..\Bin\CnManageWiz.exe"
  File "..\..\Bin\CnSelectLang.exe"
  File "..\..\Bin\CnSMR.exe"

  CreateShortCut "$SMPROGRAMS\$(APPNAMEDIR)\$(SCONFIGIO).lnk" "$INSTDIR\CnConfigIO.exe"
  CreateShortCut "$SMPROGRAMS\$(APPNAMEDIR)\$(SASCIICHART).lnk" "$INSTDIR\AsciiChart.exe"
  CreateShortCut "$SMPROGRAMS\$(APPNAMEDIR)\$(SDFMCONVERTOR).lnk" "$INSTDIR\CnDfm6To5.exe"
  CreateShortCut "$SMPROGRAMS\$(APPNAMEDIR)\$(SDEBUGVIEWER).lnk" "$INSTDIR\CnDebugViewer.exe"
  CreateShortCut "$SMPROGRAMS\$(APPNAMEDIR)\$(SIDEBRTOOL).lnk" "$INSTDIR\CnIdeBRTool.exe"
  CreateShortCut "$SMPROGRAMS\$(APPNAMEDIR)\$(SMANAGEWIZ).lnk" "$INSTDIR\CnManageWiz.exe"
  CreateShortCut "$SMPROGRAMS\$(APPNAMEDIR)\$(SSELECTLANG).lnk" "$INSTDIR\CnSelectLang.exe"
  CreateShortCut "$SMPROGRAMS\$(APPNAMEDIR)\$(SRELATIONANALYZER).lnk" "$INSTDIR\CnSMR.exe"

  ; д��CnDebugViewer·����ֵ
  WriteRegStr HKCU "Software\CnPack\CnDebug" "CnDebugViewer" "$INSTDIR\CnDebugViewer.exe"

  SetOutPath $INSTDIR\Source
  File "..\..\Bin\Source\*.pas"
  File "..\..\Bin\Source\*.dfm"
  File "..\..\Source\CnPack.inc"
SectionEnd

;------------------------------------------------------------------------------
; ��װʱ�Ļص�����
;------------------------------------------------------------------------------

!define SF_SELBOLD    9

; ��װ�����ʼ������
Function .onInit

  !insertmacro MUI_LANGDLL_DISPLAY

  Call SetCheckBoxes

FunctionEnd

; ����Ƶ�ָ�����ʱ����ʾ����
Function .onMouseOverSection

  ; �ú�ָ�����ð�װ�Լ���ע���ı�
  !insertmacro MUI_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecData} "$(DESCDATA)"
!ifndef NO_HELP
    !insertmacro MUI_DESCRIPTION_TEXT ${SecHelp} "$(DESCHELP)"
!endif
  !ifdef IDE_VERSION_D5
    !insertmacro MUI_DESCRIPTION_TEXT ${SecD5} "$(DESCD5)"
  !endif
  !ifdef IDE_VERSION_D6
    !insertmacro MUI_DESCRIPTION_TEXT ${SecD6} "$(DESCD6)"
  !endif
  !ifdef IDE_VERSION_D7
    !insertmacro MUI_DESCRIPTION_TEXT ${SecD7} "$(DESCD7)"
  !endif
!ifdef SUPPORTS_BDS
  !ifdef IDE_VERSION_D9
    !insertmacro MUI_DESCRIPTION_TEXT ${SecD9} "$(DESCD9)"
  !endif
  !ifdef IDE_VERSION_D10
    !insertmacro MUI_DESCRIPTION_TEXT ${SecD10} "$(DESCD10)"
  !endif
  !ifdef IDE_VERSION_D11
    !insertmacro MUI_DESCRIPTION_TEXT ${SecD11} "$(DESCD11)"
  !endif
  !ifdef IDE_VERSION_D12
    !insertmacro MUI_DESCRIPTION_TEXT ${SecD12} "$(DESCD12)"
  !endif
  !ifdef IDE_VERSION_D14
    !insertmacro MUI_DESCRIPTION_TEXT ${SecD14} "$(DESCD14)"
  !endif
!endif
  !ifdef IDE_VERSION_CB5
    !insertmacro MUI_DESCRIPTION_TEXT ${SecCB5} "$(DESCCB5)"
  !endif
  !ifdef IDE_VERSION_CB6
    !insertmacro MUI_DESCRIPTION_TEXT ${SecCB6} "$(DESCCB6)"
  !endif
    !insertmacro MUI_DESCRIPTION_TEXT ${SecTools} "$(DESCOTHERS)"
  !insertmacro MUI_DESCRIPTION_END

FunctionEnd

; ����ָ������������ĺ꣬����Ϊע����������ֵ������
; ���ָ����ע���ֵ��Ϊ�գ���ѡ��ýڣ���֮��ѡ
!macro SET_COMPILER_CHECKBOX REGROOT REGKEY REGVALUE SECNAME

  Push $0
  Push $R0

  SectionGetFlags "${SECNAME}" $0
  ReadRegStr $R0 "${REGROOT}" "${REGKEY}" "${REGVALUE}"
  StrCmp $R0 "" +3
  IntOp $0 $0 | ${SF_SELBOLD}

  goto +2
  IntOp $0 $0 & ${SECTION_OFF}

  SectionSetFlags "${SECNAME}" $0

  Pop $R0
  Pop $0

!macroend

; ���ñ���������
Function SetCheckBoxes

  ; ���浱ǰѡ��� Secton
  StrCpy $1 ${SecData}

!ifdef IDE_VERSION_D5
  !insertmacro SET_COMPILER_CHECKBOX HKLM "Software\Borland\Delphi\5.0" "App" ${SecD5}
!endif
!ifdef IDE_VERSION_D6
  !insertmacro SET_COMPILER_CHECKBOX HKCU "Software\Borland\Delphi\6.0" "App" ${SecD6}
!endif
!ifdef IDE_VERSION_D7
  !insertmacro SET_COMPILER_CHECKBOX HKCU "Software\Borland\Delphi\7.0" "App" ${SecD7}
!endif
!ifdef SUPPORTS_BDS
!ifdef IDE_VERSION_D9
  !insertmacro SET_COMPILER_CHECKBOX HKCU "Software\Borland\BDS\3.0" "App" ${SecD9}
!endif
!ifdef IDE_VERSION_D10
  !insertmacro SET_COMPILER_CHECKBOX HKCU "Software\Borland\BDS\4.0" "App" ${SecD10}
!endif
!ifdef IDE_VERSION_D11
  !insertmacro SET_COMPILER_CHECKBOX HKCU "Software\Borland\BDS\5.0" "App" ${SecD11}
!endif
!ifdef IDE_VERSION_D12
  !insertmacro SET_COMPILER_CHECKBOX HKCU "Software\CodeGear\BDS\6.0" "App" ${SecD12}
!endif
!ifdef IDE_VERSION_D14
  !insertmacro SET_COMPILER_CHECKBOX HKCU "Software\CodeGear\BDS\7.0" "App" ${SecD14}
!endif
!endif
!ifdef IDE_VERSION_CB5
  !insertmacro SET_COMPILER_CHECKBOX HKLM "Software\Borland\C++Builder\5.0" "App" ${SecCB5}
!endif
!ifdef IDE_VERSION_CB6
  !insertmacro SET_COMPILER_CHECKBOX HKCU "Software\Borland\C++Builder\6.0" "App" ${SecCB6}
!endif

FunctionEnd

;------------------------------------------------------------------------------
; ж�س�������ػص�����
;------------------------------------------------------------------------------

; ж�س�������
Section "Uninstall"
  Delete "$INSTDIR\*.*"
  Delete "$INSTDIR\Data\*.*"
  RMDir /r $INSTDIR\Data
  Delete "$INSTDIR\Help\*.*"
  RMDir /r $INSTDIR\Help
  Delete "$INSTDIR\Lang\*.*"
  RMDir /r $INSTDIR\Lang
  Delete "$INSTDIR\Source\*.*"
  RMDir /r $INSTDIR\Source
  RMDir /r "$SMPROGRAMS\$(APPNAMEDIR)"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\CnWizards"

!ifdef IDE_VERSION_D5
  DeleteRegValue HKCU "Software\Borland\Delphi\5.0\Experts" "CnWizards_D5"
!endif
!ifdef IDE_VERSION_D6
  DeleteRegValue HKCU "Software\Borland\Delphi\6.0\Experts" "CnWizards_D6"
!endif
!ifdef IDE_VERSION_D7
  DeleteRegValue HKCU "Software\Borland\Delphi\7.0\Experts" "CnWizards_D7"
!endif

  DeleteRegValue HKCU "Software\Borland\BDS\2.0\Experts" "CnWizards_D8"

!ifdef IDE_VERSION_D9
  DeleteRegValue HKCU "Software\Borland\BDS\3.0\Experts" "CnWizards_D9"
!endif
!ifdef IDE_VERSION_D10
  DeleteRegValue HKCU "Software\Borland\BDS\4.0\Experts" "CnWizards_D10"
!endif
!ifdef IDE_VERSION_D11
  DeleteRegValue HKCU "Software\Borland\BDS\5.0\Experts" "CnWizards_D11"
!endif
!ifdef IDE_VERSION_D12
  DeleteRegValue HKCU "Software\CodeGear\BDS\6.0\Experts" "CnWizards_D12"
!endif
!ifdef IDE_VERSION_D14
  DeleteRegValue HKCU "Software\CodeGear\BDS\7.0\Experts" "CnWizards_D14"
!endif
!ifdef IDE_VERSION_CB5
  DeleteRegValue HKCU "Software\Borland\C++Builder\5.0\Experts" "CnWizards_CB5"
!endif
!ifdef IDE_VERSION_CB6
  DeleteRegValue HKCU "Software\Borland\C++Builder\6.0\Experts" "CnWizards_CB6"
!endif

  ; ��ʾ�û��Ƿ�ɾ�������ļ�
  MessageBox MB_YESNO|MB_ICONQUESTION "$(SQUERYDELETE)" IDNO NoDelete

  DeleteRegKey HKCU "Software\CnPack\CnWizards"
  DeleteRegKey HKCU "Software\CnPack\CnPropEditor"
  DeleteRegKey HKCU "Software\CnPack\CnCompEditor"
  DeleteRegKey HKCU "Software\CnPack\CnTools"
  RMDir /r $INSTDIR

NODelete:
SectionEnd

; ��ʼ��ж�س���Ի��������
Function un.onInit

  !insertmacro MUI_UNGETLANGUAGE

FunctionEnd

; ��װ��Ϻ���ʾ�����ĵ���
Function ShowReleaseNotes
!ifndef NO_HELP
  IfFileExists "$INSTDIR\Help\$(SHELPCHM)" 0 OpenWeb
    ExecShell "open" "$INSTDIR\Help\$(SHELPCHM)"
    Goto FuncEnd

  OpenWeb:
!endif
    ExecShell "open" "http://www.cnpack.org/"
!ifndef NO_HELP
  FuncEnd:
!endif
FunctionEnd

; ����