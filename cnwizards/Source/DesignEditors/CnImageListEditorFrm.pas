{******************************************************************************}
{                       CnPack For Delphi/C++Builder                           }
{                     �й����Լ��Ŀ���Դ�������������                         }
{                   (C)Copyright 2001-2011 CnPack ������                       }
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

unit CnImageListEditorFrm;

interface
{* |<PRE>
================================================================================
* ������ƣ����������ԡ�����༭����
* ��Ԫ���ƣ�֧������������ ImageList �༭������
* ��Ԫ���ߣ��ܾ��� zjy@cnpack.org
* ��    ע��
* ����ƽ̨��Win7 + Delphi 7
* ���ݲ��ԣ�
* �� �� �����õ�Ԫ�ʹ����е��ַ����Ѿ����ػ�����ʽ
* ��Ԫ��ʶ��$Id: $
* �޸ļ�¼��
*           2011.07.04 V1.0
*               ������Ԫ
================================================================================
|</PRE>}

{$I CnWizards.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CnWizMultiLang, ExtCtrls, StdCtrls, ImgList, ComCtrls;

type
  TCnImageListEditorForm = class(TCnTranslateForm)
    pnlLeft: TPanel;
    spl1: TSplitter;
    pnlSearch: TPanel;
    grp1: TGroupBox;
    grp2: TGroupBox;
    btnAdd: TButton;
    btnReplace: TButton;
    btnDelete: TButton;
    btnClear: TButton;
    btnExport: TButton;
    lvList: TListView;
    cbbSize: TComboBox;
    grp3: TGroupBox;
    lbl1: TLabel;
    btnSearch: TButton;
    lv2: TListView;
    btnSearchAdd: TButton;
    btnPrev: TButton;
    btnNext: TButton;
    btnFirst: TButton;
    btnLast: TButton;
    btnSearchReplace: TButton;
    pnl3: TPanel;
    imgSelected: TImage;
    lbl2: TLabel;
    cbbTransparentColor: TComboBox;
    lbl3: TLabel;
    cbbFillColor: TComboBox;
    btnOK: TButton;
    btnCancel: TButton;
    btnApply: TButton;
    btnHelp: TButton;
    btnShowSearch: TButton;
    cbbKeyword: TComboBox;
    rgOptions: TRadioGroup;
    lbl4: TLabel;
    cbb1: TComboBox;
    btnGoto: TButton;
    il1: TImageList;
  private
    { Private declarations }
    FComponent: TCustomImageList;
  public
    { Public declarations }
  end;

procedure ShowCnImageListEditorForm(AComponent: TCustomImageList);

implementation

{$R *.dfm}

procedure ShowCnImageListEditorForm(AComponent: TCustomImageList);
begin
  with TCnImageListEditorForm.Create(nil) do
  try
    FComponent := AComponent;
    ShowModal;
  finally
    Free;
  end;
end;

end.
