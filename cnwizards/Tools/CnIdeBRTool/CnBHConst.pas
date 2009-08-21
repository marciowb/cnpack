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

unit CnBHConst;
{* |<PRE>
================================================================================
* ������ƣ�CnPack IDE ר�Ҹ�������/�ָ�����
* ��Ԫ���ƣ�CnWizards ��������/�ָ������ַ����������嵥Ԫ
* ��Ԫ���ߣ�ccRun(����)
* ��    ע��CnWizards ר�Ҹ�������/�ָ������ַ����������嵥Ԫ
* ����ƽ̨��PWinXP + Delphi 5.01
* ���ݲ��ԣ�PWin9X/2000/XP + Delphi 5/6/7 + C++Builder 5/6
* �� �� �����õ�Ԫ�е��ַ��������ϱ��ػ�����ʽ
* ��Ԫ��ʶ��$Id$
* �޸ļ�¼��2006.08.23 V1.0
*               LiuXiao ��ֲ�˵�Ԫ
================================================================================
|</PRE>}

interface

var
  g_strAppName: array [0..10] of string =
  (
      'C++Builder 5.0 ', 'C++Builder 6.0 ', 'Delphi 5.0 ', 'Delphi 6.0 ',
      'Delphi 7.0 ', 'Delphi 8.0 ', 'BDS 2005 ', 'BDS 2006 ', 'RAD Studio 2007',
      'RAD Studio 2009', 'RAD Studio 2010'
  );

  g_strAppAbName: array[0..10] of string =
  (
      'BCB5', 'BCB6', 'Delphi5', 'Delphi6', 'Delphi7',
      'Delphi8', 'BDS2005', 'BDS2006', 'RADStudio2007',
      'RADStudio2009', 'RADStudio2010'
  );

  g_strRegPath: array[0..10] of string =
  (
      'C++Builder\5.0', 'C++Builder\6.0', 'Delphi\5.0', 'Delphi\6.0',
      'Delphi\7.0', 'BDS\2.0', 'BDS\3.0', 'BDS\4.0', 'BDS\5.0', 'BDS\6.0',
      'BDS\7.0'
  );

  g_strOpResult: array[0..1] of string =
  (
      'ʧ�ܣ�����', '�ɹ���'
  );

  g_strAbiOptions: array[0..3] of string =
  (
      '����ģ�� (Code Templates)',
      '����� (Object Repository)',
      'IDE ������Ϣ (IDE Configuration)',
      '�˵�ģ�� (Menu Templates)'
  );
  
  g_strObjReps: array[0..9] of string =
  (
      'Type', 'Name', 'Page', 'Icon', 'Description', 'Author',
      'DefaultMainForm', 'DefaultNewForm', 'Ancestor', 'Designer'
  );

  g_strFileInvalid: string = '����ļ������� IDE ���õı����ļ���' + #13#10
          + '��ʹ�ñ����򱸷ݲ������ļ���' + #13#10
          + '���󱨸�, ������������ŵ�: master@cnpack.org';
            
  g_strBackup: string = ' --> ����';
  g_strRestore: string =' --> �ָ�';
  g_strBackuping: string = '���ڱ��� ';
  g_strAnalyzing: string = '���ڷ��� ';
  g_strRestoring: string = '���ڻָ� ';
  g_strCreating: string = '���ڴ��� ';
  g_strNotFound: string = 'û���ҵ� ';
  g_strObjRepConfig: string = '���������';
  g_strObjRepUnit: string = '����ⵥԪ�ļ�';
  g_strPleaseWait: string = ', ���Ժ�...';
  g_strUnkownName: string = 'δ֪���ƣ�';
  g_strBakFile: string = '�����ļ�';
  g_strCreate: string = '����';
  g_strAnalyseSuccess: string = ' --> �������';
  g_strBackupSuccess: string = ' --> �������';
  g_strThanksForRestore: string = '��л����ʹ��, �����ļ��ѻָ���ɡ�';
  g_strThanksForBackup: string = '��л����ʹ��, �����Ʊ��ܺ�����ļ���';
  g_strPleaseCheckFile: string = '������ļ��Ƿ�����ʹ���л���ֻ��״̬��';
  g_strAppTitle: string = 'CnPack IDE ר�Ұ� IDE ���ñ���/�ָ�����';
  g_strAppVer: string = ' 1.0';
  g_strBugReportToMe: string = '���󱨸�, ������������ŵ�: master@cnpack.org';
  g_strIDEName: string = 'IDE ����: ';
  g_strInstallDir: string = 'ԭ��װĿ¼: ';
  g_strBackupContent: string = '������Ŀ: ';
  g_strIDENotInstalled: string = ' ��ϵͳ��û�а�װ'; 

  g_strErrorSelectApp: string = '��ѡ�� IDE��';
  g_strErrorSelectBackup: string = '������ѡ��һ�����ݵ�ѡ�';
  g_strErrorFileName: string = '����д���ݵ��ļ�����';
  g_strErrorSelectFile: string = '����ѡ��һ�����ݵ��ļ���';
  g_strErrorFileNotExist: string = 'ѡ��ı����ļ�������, ������ѡ��';
  g_strErrorNoIDE: string = '����ϵͳ��û�а�װ��Ӧ�� IDE';
  g_strErrorSelectRestore: string = '������ѡ��һ���ָ���ѡ�';
  g_strErrorIDERunningFmt: string = '��⵽ %s ���������С�' + #13#10 + '���ȹرոó�����ټ���������';
  g_strNotInstalled: string = 'δ��װ';

  SCnIDERunning: string = 'IDE �������У����˳� IDE ���������д˹��ܡ�';
  SCnQuitAsk: string = '�Ƿ�Ҫ�˳������ߣ�';
  SCnQuitAskCaption: string = '��ʾ';
  SCnErrorCaption: string = '����';
  SCnCleaned: string = '��ʷ��¼�����ϣ�';
  SCnHelpOpenError: string = '�����ļ��򿪳���';

  SCnAboutCaption: string = '����';
  SCnIDEAbout: string = 'IDE ���ñ���/�ָ�����' + #13#10 +
  '' + #13#10 +
  '������� ccrun (����)  info@ccrun.com' + #13#10 +
  '������ֲ ��Х (LiuXiao)  liuxiao@cnpack.org' + #13#10 +
  '��Ȩ���� (C) 2001-2009 CnPack ������';

implementation

end.
