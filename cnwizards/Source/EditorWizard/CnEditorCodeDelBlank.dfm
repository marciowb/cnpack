object CnDelBlankForm: TCnDelBlankForm
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'ɾ������'
  ClientHeight = 170
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TButton
    Left = 34
    Top = 140
    Width = 75
    Height = 21
    Caption = 'ȷ��(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 116
    Top = 140
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 3
  end
  object btnHelp: TButton
    Left = 198
    Top = 140
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 4
    OnClick = btnHelpClick
  end
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 265
    Height = 57
    Caption = '��ѡ��������(&N)'
    TabOrder = 0
    object rbSel: TRadioButton
      Left = 8
      Top = 16
      Width = 249
      Height = 17
      Caption = '��ǰ�༭��ѡ����(&1)��'
      TabOrder = 0
    end
    object rbAll: TRadioButton
      Left = 8
      Top = 32
      Width = 249
      Height = 17
      Caption = '��ǰ�༭�ĵ�Ԫ(&2)��'
      TabOrder = 1
    end
  end
  object grp2: TGroupBox
    Left = 8
    Top = 72
    Width = 265
    Height = 57
    Caption = '����ѡ��(&O)'
    TabOrder = 1
    object rbAllLine: TRadioButton
      Left = 8
      Top = 32
      Width = 249
      Height = 17
      Caption = 'ɾ�����п���(&D)��'
      TabOrder = 1
    end
    object rbMulti: TRadioButton
      Left = 8
      Top = 16
      Width = 249
      Height = 17
      Caption = '�������������кϲ�Ϊһ��(&M)��'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
  end
end
