object CnPrefixExecuteForm: TCnPrefixExecuteForm
  Left = 331
  Top = 202
  BorderStyle = bsDialog
  Caption = '���ǰ׺ר��'
  ClientHeight = 260
  ClientWidth = 369
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TButton
    Left = 46
    Top = 232
    Width = 73
    Height = 21
    Caption = '����(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 206
    Top = 232
    Width = 75
    Height = 21
    Cancel = True
    Caption = '�ر�(&C)'
    ModalResult = 2
    TabOrder = 4
  end
  object btnHelp: TButton
    Left = 286
    Top = 232
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 5
    OnClick = btnHelpClick
  end
  object btnConfig: TButton
    Left = 126
    Top = 232
    Width = 75
    Height = 21
    Cancel = True
    Caption = '����(&S)'
    TabOrder = 3
  end
  object gbKind: TGroupBox
    Left = 8
    Top = 8
    Width = 353
    Height = 129
    Caption = '��ѡ����Ҫ����ǰ׺���������(&N)'
    TabOrder = 0
    object rbSelComp: TRadioButton
      Left = 8
      Top = 16
      Width = 310
      Height = 17
      Caption = '��ǰѡ��������'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbCurrForm: TRadioButton
      Left = 8
      Top = 38
      Width = 310
      Height = 17
      Caption = '��ǰ�����ϵ����������'
      TabOrder = 1
    end
    object rbOpenedForm: TRadioButton
      Left = 8
      Top = 60
      Width = 310
      Height = 17
      Caption = '��ǰ�򿪵����д����ϵ������'
      TabOrder = 2
    end
    object rbCurrProject: TRadioButton
      Left = 8
      Top = 82
      Width = 310
      Height = 17
      Caption = '��ǰ�������д����ϵ������'
      TabOrder = 3
    end
    object rbProjectGroup: TRadioButton
      Left = 8
      Top = 104
      Width = 310
      Height = 17
      Caption = '��ǰ���������й������д����ϵ������'
      TabOrder = 4
    end
  end
  object rgCompKind: TRadioGroup
    Left = 8
    Top = 144
    Width = 353
    Height = 81
    Caption = '����б�����(&L)'
    ItemIndex = 0
    Items.Strings = (
      'ǰ׺����ȷ�������'
      'ǰ׺����ȷ�������ǰ׺��������ʽ�������'
      '������������������Ե��������')
    TabOrder = 1
  end
end
