object CnEditorZoomFullScreenForm: TCnEditorZoomFullScreenForm
  Left = 464
  Top = 252
  BorderStyle = bsDialog
  Caption = '���봰��ȫ��Ļ�л�����'
  ClientHeight = 131
  ClientWidth = 248
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 233
    Height = 89
    Caption = '����(&S)'
    TabOrder = 0
    object cbAutoZoom: TCheckBox
      Left = 8
      Top = 16
      Width = 217
      Height = 17
      Caption = 'IDE �������Զ������봰����󻯡�'
      TabOrder = 0
    end
    object chkAutoHideMainForm: TCheckBox
      Left = 8
      Top = 40
      Width = 217
      Height = 17
      Caption = '���봰�����ʱ�Զ����������ڡ�'
      TabOrder = 1
    end
    object chkRestoreNormal: TCheckBox
      Left = 8
      Top = 64
      Width = 217
      Height = 17
      Caption = 'ȡ��ȫ��ʱ�ָ�������״̬��'
      TabOrder = 2
    end
  end
  object btnOK: TButton
    Left = 86
    Top = 104
    Width = 75
    Height = 21
    Caption = 'ȷ��(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 166
    Top = 104
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 2
  end
end
