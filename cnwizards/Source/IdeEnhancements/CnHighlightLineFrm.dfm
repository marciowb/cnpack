object CnHighlightLineForm: TCnHighlightLineForm
  Left = 289
  Top = 249
  BorderStyle = bsDialog
  Caption = '������������'
  ClientHeight = 200
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '����'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 345
    Height = 152
    Caption = '������������(&L)'
    TabOrder = 0
    object lblLineWidth: TLabel
      Left = 240
      Top = 28
      Width = 36
      Height = 12
      Caption = '�߿�'
    end
    object lblLineType: TLabel
      Left = 16
      Top = 28
      Width = 36
      Height = 12
      Caption = '���ͣ�'
    end
    object seLineWidth: TCnSpinEdit
      Left = 288
      Top = 24
      Width = 41
      Height = 21
      MaxValue = 5
      MinValue = 1
      TabOrder = 1
      Value = 1
    end
    object cbbLineType: TComboBox
      Left = 80
      Top = 24
      Width = 129
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
      OnDrawItem = cbbLineTypeDrawItem
      Items.Strings = (
        '0'
        '1'
        '2'
        '3')
    end
    object chkLineEnd: TCheckBox
      Left = 16
      Top = 56
      Width = 313
      Height = 17
      Caption = '�ڹؼ�����Զ˻��ơ�[���Ͷ˵�'
      TabOrder = 2
    end
    object chkLineClass: TCheckBox
      Left = 16
      Top = 116
      Width = 321
      Height = 17
      Caption = '��������ʱ���� class/interface/record �������ṹ'
      TabOrder = 5
    end
    object chkLineHori: TCheckBox
      Left = 16
      Top = 76
      Width = 313
      Height = 17
      Caption = '�ؼ�����δ����ʱ���ƺ���'
      TabOrder = 3
      OnClick = chkLineHoriClick
    end
    object chkLineHoriDot: TCheckBox
      Left = 32
      Top = 96
      Width = 305
      Height = 17
      Caption = '����ʹ��ϸ���߻���'
      TabOrder = 4
    end
  end
  object btnOK: TButton
    Left = 118
    Top = 168
    Width = 75
    Height = 21
    Caption = 'ȷ��(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 198
    Top = 168
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 2
  end
  object btnHelp: TButton
    Left = 278
    Top = 168
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 3
    OnClick = btnHelpClick
  end
end
