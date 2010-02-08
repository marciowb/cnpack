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

unit CnDTMainFrm;
{ |<PRE>
================================================================================
* ������ƣ�CnPack IDE ר�Ұ�
* ��Ԫ���ƣ������ʽת������������
* ��Ԫ���ߣ��ܾ��� (zjy@cnpack.org)
* ��    ע��
* ����ƽ̨��PWin2000Pro + Delphi 5.01
* ���ݲ��ԣ�PWin9X/2000/XP + Delphi 5/6/7 + C++Builder 5/6
* �� �� �����õ�Ԫ�е��ַ��������ϱ��ػ�����ʽ
* ��Ԫ��ʶ��$Id$
* �޸ļ�¼��2003.04.03 V1.0
*               ������Ԫ
================================================================================
|</PRE>}

interface

{$I CnPack.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, FileCtrl, CnLangTranslator, CnLangStorage,
  CnHashLangStorage, CnLangMgr, CnClasses;

type
  TCnDTMainForm = class(TForm)
    GroupBox1: TGroupBox;
    rbFile: TRadioButton;
    edtFile: TEdit;
    rbDir: TRadioButton;
    edtDir: TEdit;
    cbSubDirs: TCheckBox;
    GroupBox2: TGroupBox;
    ListView: TListView;
    sbFile: TSpeedButton;
    sbDir: TSpeedButton;
    btnStart: TButton;
    btnClose: TButton;
    btnAbout: TButton;
    Label1: TLabel;
    lblURL: TLabel;
    cbReadOnly: TCheckBox;
    OpenDialog: TOpenDialog;
    CnLangManager: TCnLangManager;
    CnHashLangFileStorage: TCnHashLangFileStorage;
    CnLangTranslator1: TCnLangTranslator;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbFileClick(Sender: TObject);
    procedure sbDirClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure lblURLClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure rbFileClick(Sender: TObject);
  private
    { Private declarations }
    procedure ConvertAFile(const FileName: string);
    procedure FileCallBack(const FileName: string; const Info: TSearchRec;
      var Abort: Boolean);
  protected
    procedure DoCreate; override;
    procedure TranslateStrings;
  public
    { Public declarations }
  end;

var
  CnDTMainForm: TCnDTMainForm;

implementation

uses
  CnWizDfm6To5, CnCommon, CnConsts, Registry, CnWizLangID;

{$R *.DFM}

const
  csSection = 'CnDfm6To5';
  csSelectFile = 'SelectFile';
  csFileName = 'FileName';
  csDirName = 'DirName';
  csSubDirs = 'SubDirs';
  csReadOnly = 'ReadOnly';

var
  SErrorCaption: string = '����';
  SInfoCaption: string = '��ʾ';
  SSelectDir: string = '��ѡ��Ŀ¼';
  SOpenFileError: string = 'ָ�����ļ������ڣ�';
  SDirNotExists: string = 'ָ����Ŀ¼�����ڣ�';
  SSucc: string = 'ת���ɹ�';
  SOpenFail: string = '��ʧ��';
  SSaveFail: string = '����ʧ��';
  SInvalidFormat: string = '��Ч�ĸ�ʽ';
  SAbout: string = 'DFM �����ļ�ת������' + #13#10 +
    '' + #13#10 +
    '���ڽ��� Delphi 6/7 �� C++Builder 6 ����� DFM ����' + #13#10 +
    'ת���� Delphi 5 �� C++Builder 5 ֧�ֵĴ����ļ���' + #13#10 +
    '֧���ı���ʽ�Ͷ����Ƹ�ʽ�Ĵ��塣' + #13#10 +
    '' + #13#10 +
    '������� �ܾ��� (zjy@cnpack.org)' + #13#10 +
    '��Ȩ���� (C)2001-2010 CnPack ������';

  csResults: array[TDFMConvertResult] of string =
    ('SSucc', 'SOpenFail', 'SSaveFail', 'SInvalidFormat');

procedure TCnDTMainForm.FormCreate(Sender: TObject);
begin
  with TRegistryIniFile.Create(MakePath(SCnPackRegPath) + SCnPackToolRegPath) do
  try
    rbFile.Checked := ReadBool(csSection, csSelectFile, True);
    rbDir.Checked := not rbFile.Checked;
    edtFile.Text := ReadString(csSection, csFileName, '');
    edtDir.Text := ReadString(csSection, csDirName, '');
    cbSubDirs.Checked := ReadBool(csSection, csSubDirs, True);
    cbReadOnly.Checked := ReadBool(csSection, csReadOnly, True);
    rbFileClick(nil);
  finally
    Free;
  end;
end;

procedure TCnDTMainForm.FormDestroy(Sender: TObject);
begin
  with TRegistryIniFile.Create(MakePath(SCnPackRegPath) + SCnPackToolRegPath) do
  try
    WriteBool(csSection, csSelectFile, rbFile.Checked);
    WriteString(csSection, csFileName, edtFile.Text);
    WriteString(csSection, csDirName, edtDir.Text);
    WriteBool(csSection, csSubDirs, cbSubDirs.Checked);
    WriteBool(csSection, csReadOnly, cbReadOnly.Checked);
  finally
    Free;
  end;
end;

procedure TCnDTMainForm.ConvertAFile(const FileName: string);
var
  Res: TDFMConvertResult;
begin
  if cbReadOnly.Checked then
    SetFileAttributes(PChar(FileName), FILE_ATTRIBUTE_NORMAL);

  Res := DFM6To5(FileName);
  with ListView.Items.Add do
  begin
    Caption := FileName;
    SubItems.Add(csResults[Res]);
  end;
end;

procedure TCnDTMainForm.FileCallBack(const FileName: string;
  const Info: TSearchRec; var Abort: Boolean);
begin
  if SameText(ExtractFileExt(FileName), '.DFM') then
    ConvertAFile(FileName);
end;

procedure TCnDTMainForm.btnStartClick(Sender: TObject);
begin
  ListView.Items.Clear;

  if rbFile.Checked then
  begin
    if FileExists(edtFile.Text) then
      ConvertAFile(edtFile.Text)
    else
      ErrorDlg(SOpenFileError, SErrorCaption);
  end
  else
  begin
    if not DirectoryExists(edtDir.Text) then
      ErrorDlg(SDirNotExists, SErrorCaption)
    else
    begin
      FindFile(edtDir.Text, '*.*', FileCallBack, nil, cbSubDirs.Checked);
    end;
  end;
end;

procedure TCnDTMainForm.sbFileClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    edtFile.Text := OpenDialog.FileName;
end;

procedure TCnDTMainForm.sbDirClick(Sender: TObject);
var
  Dir: string;
begin
  Dir := edtDir.Text;
  if GetDirectory(SSelectDir, Dir) then
    edtDir.Text := Dir;
end;

procedure TCnDTMainForm.rbFileClick(Sender: TObject);
begin
  edtFile.Enabled := rbFile.Checked;
  sbFile.Enabled := rbFile.Checked;
  edtDir.Enabled := rbDir.Checked;
  sbDir.Enabled := rbDir.Checked;
  cbSubDirs.Enabled := rbDir.Checked;
end;

procedure TCnDTMainForm.btnAboutClick(Sender: TObject);
begin
  InfoDlg(SAbout, SInfoCaption);
end;

procedure TCnDTMainForm.lblURLClick(Sender: TObject);
begin
  RunFile(SCnPackUrl);
end;

procedure TCnDTMainForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TCnDTMainForm.DoCreate;
const
  csLangDir = 'Lang\';
var
  LangID: DWORD;
  I: Integer;
begin
  if CnLanguageManager <> nil then
  begin
    CnHashLangFileStorage.LanguagePath := ExtractFilePath(ParamStr(0)) + csLangDir;
    LangID := GetWizardsLanguageID;
    for I := 0 to CnLanguageManager.LanguageStorage.LanguageCount - 1 do
    begin
      if CnLanguageManager.LanguageStorage.Languages[I].LanguageID = LangID then
      begin
        CnLanguageManager.CurrentLanguageIndex := I;
        TranslateStrings;
        CnLanguageManager.TranslateForm(Self);
        Break;
      end;
    end;
  end;

  inherited;
end;

procedure TCnDTMainForm.TranslateStrings;
begin
  TranslateStr(SErrorCaption, 'SErrorCaption');
  TranslateStr(SInfoCaption, 'SInfoCaption');
  TranslateStr(SSelectDir, 'SSelectDir');
  TranslateStr(SOpenFileError, 'SOpenFileError');
  TranslateStr(SDirNotExists, 'SDirNotExists');
  TranslateStr(SSucc, 'SSucc');
  TranslateStr(SOpenFail, 'SOpenFail');
  TranslateStr(SSaveFail, 'SSaveFail');
  TranslateStr(SInvalidFormat, 'SInvalidFormat');
  TranslateStr(SAbout, 'SAbout');

  csResults[crSucc] := SSucc;
  csResults[crOpenError] := SOpenFail;
  csResults[crSaveError] := SSaveFail;
  csResults[crInvalidFormat] := SInvalidFormat;
end;

end.

