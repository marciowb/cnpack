object CnIdentRenameForm: TCnIdentRenameForm
  Left = 352
  Top = 202
  BorderStyle = bsDialog
  Caption = '��ʶ���滻'
  ClientHeight = 211
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '����'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object lblReplacePromt: TLabel
    Left = 8
    Top = 16
    Width = 6
    Height = 12
  end
  object grpBrowse: TGroupBox
    Left = 8
    Top = 72
    Width = 225
    Height = 97
    Caption = '�滻��Χ(&R)'
    TabOrder = 0
    object rbCurrentProc: TRadioButton
      Left = 8
      Top = 20
      Width = 185
      Height = 17
      Caption = '��ǰ�������̻���(&1)'
      TabOrder = 0
    end
    object rbCurrentInnerProc: TRadioButton
      Left = 8
      Top = 44
      Width = 185
      Height = 17
      Caption = '��ǰ���ڲ���̻���(&2)'
      TabOrder = 1
    end
    object rbUnit: TRadioButton
      Left = 8
      Top = 68
      Width = 161
      Height = 17
      Caption = '������Ԫ(&3)'
      TabOrder = 2
    end
  end
  object edtRename: TEdit
    Left = 8
    Top = 40
    Width = 225
    Height = 20
    TabOrder = 1
    OnKeyDown = edtRenameKeyDown
  end
  object btnOK: TButton
    Left = 78
    Top = 180
    Width = 75
    Height = 21
    Caption = 'ȷ��(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 158
    Top = 180
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 3
  end
end
