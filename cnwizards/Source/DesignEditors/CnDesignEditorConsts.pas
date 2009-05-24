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

unit CnDesignEditorConsts;
{* |<PRE>
================================================================================
* ������ƣ����������ԡ�����༭����
* ��Ԫ���ƣ���������༭���������嵥Ԫ
* ��Ԫ���ߣ�CnPack������
* ��    ע��
* ����ƽ̨��PWin2000 + Delphi 5.01
* ���ݲ��ԣ�PWin9X/2000/XP + Delphi 5/6
* �� �� �����õ�Ԫ�е��ַ��������ϱ��ػ�����ʽ
* ��Ԫ��ʶ��$Id: CnDesignEditorConsts.pas,v 1.8 2009/01/02 08:36:28 liuxiao Exp $
* �޸ļ�¼��2003.03.14 V1.2
*               �����˱��ػ��ַ���
*           2003.03.01 V1.0
*               ������Ԫ
================================================================================
|</PRE>}

interface

uses
  Windows;

{$I CnWizards.inc}

//==============================================================================
// ��Ҫ���ػ����ַ���
//==============================================================================

var
  SCnPropertyEditor: string = '���Ա༭��';
  SCnComponentEditor: string = '����༭��';
  SCnDesignEditorNameStr: string = '����: ';
  SCnDesignEditorStateStr: string = '״̬: ';
  SCnPropEditorConfigFormCaption: string = '%s - ���Թ���';

  // �༭������
  SCnStringPropEditorName: string = '�ַ������������Ա༭��';
  sCnHintPropEditorName: string = 'Hint ���Ա༭��';
  SCnStringsPropEditorName: string = '�ַ����б����Ա༭��';
  SCnFileNamePropEditorName: string = '�ļ������Ա༭��';
  SCnSizeConstraintsPropEditorName: string = 'Constraints ���Ա༭��';
  SCnFontPropEditorName: string = '�������Ա༭��';
  SCnControlScrollBarPropEditorName: string = '�ؼ����������Ա༭��';
  SCnBooleanPropEditorName: string = '�������Ա༭��';
  SCnAlignPropEditorName: string = 'Align���Ա༭��';
  SCnSetPropEditorName: string = '�������Ա༭��';
  SCnNamePropEditorName: string = '��������Ա༭��';

  // �༭��˵��
  SCnStringPropEditorComment: string = '����༭�����ı����ַ����ͱ������ԡ�';
  sCnHintPropEditorComment: string = '����༭�����ı��� Hint ���ԣ�֧�ֳ���ʽ�Ͷ̸�ʽ��';
  SCnStringsPropEditorComment: string = '�ṩ���๦�ܵ��ַ����б����Ա༭����';
  SCnFileNamePropEditorComment: string = '����ʹ�ô��ļ��Ի�����ѡ���ļ�����';
  SCnSizeConstraintsPropEditorComment: string = '���Է�������ÿؼ�����������С�ߴ硣';
  SCnFontPropEditorComment: string = '��ǿ���������Ա༭����������ʾ�����������Ϣ��';
  SCnControlScrollBarPropEditorComment: string = '��ǿ�Ŀؼ����������Ա༭����������ʾ�������Ϣ��';
  SCnBooleanPropEditorComment: string = '����Ϊ����������ʾһ������';
  SCnAlignPropEditorComment: string = '����ΪAlign��������ͼ��';
  SCnSetPropEditorComment: string = 'Ϊ�����������������б����ü�ֱ�����뼯��ֵ�Ĺ��ܡ�';
  SCnNamePropEditorComment: string = 'ʹ�����ǰ׺��׼���淶������ơ�';

  // TCnMultiLineEditorForm
  SCnPropEditorNoMatch: string = 'û�з���ƥ����ַ�����';
  SCnPropEditorReplaceOK: string = '�滻��ɣ�һ��������%D���滻��';
  SCnPropEditorCursorPos: string = '��꣺[%D:%D]';
  SCnPropEditorSaveText: string = '��ǰ�ı�δ���棬Ҫ������';


  // TCnSizeConstraintsEditorForm
  SCnSizeConsInputError: string = '������������Ч��������';
  SCnSizeConsInputNeg: string = '���������븺����';

  // TCnNamePropEditor
  SCnPrefixWizardNotExist: string = '���ǰ׺ר��û���ҵ����뿪����ר�ң�';

implementation

end.
