object CnPropEditorCustomizeForm: TCnPropEditorCustomizeForm
  Left = 384
  Top = 202
  BorderStyle = bsDialog
  Caption = '�Զ������Ա༭��'
  ClientHeight = 269
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 345
    Height = 225
    Caption = '�Զ�������(&P)'
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 16
      Width = 276
      Height = 13
      Caption = '��Ҫע��������б���ʽΪ ClassName.PropName��'
    end
    object mmoProp: TMemo
      Left = 8
      Top = 32
      Width = 329
      Height = 185
      TabOrder = 0
    end
  end
  object btnOK: TButton
    Left = 118
    Top = 240
    Width = 75
    Height = 21
    Caption = 'ȷ��(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 198
    Top = 240
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 2
  end
  object btnHelp: TButton
    Left = 279
    Top = 240
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 3
    OnClick = btnHelpClick
  end
end
