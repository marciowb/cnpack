object CnDUnitSetForm: TCnDUnitSetForm
  Left = 349
  Top = 263
  BorderStyle = bsDialog
  Caption = 'DUnit ר��'
  ClientHeight = 170
  ClientWidth = 268
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
  object gbxSetup: TGroupBox
    Left = 12
    Top = 12
    Width = 246
    Height = 113
    Caption = 'ѡ��'
    TabOrder = 0
    object chbxUnitHead: TCheckBox
      Left = 16
      Top = 81
      Width = 161
      Height = 17
      Caption = '���뵥Ԫͷע��'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object chbxInitClass: TCheckBox
      Left = 16
      Top = 60
      Width = 161
      Height = 17
      Caption = '��ʼ��������'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object rbCreateApplication: TRadioButton
      Left = 16
      Top = 16
      Width = 169
      Height = 17
      Caption = '�½� DUnit ���Թ���'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbCreateUnit: TRadioButton
      Left = 16
      Top = 38
      Width = 169
      Height = 17
      Caption = '�½� DUnit ���Ե�Ԫ'
      TabOrder = 1
    end
  end
  object btnOK: TButton
    Left = 11
    Top = 137
    Width = 75
    Height = 21
    Caption = 'ȷ��(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 97
    Top = 137
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 2
  end
  object btnHelp: TButton
    Left = 182
    Top = 137
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 3
    OnClick = btnHelpClick
  end
end
