object CnMsdnConfigForm: TCnMsdnConfigForm
  Left = 330
  Top = 250
  BorderStyle = bsDialog
  Caption = 'MSDN ר������'
  ClientHeight = 329
  ClientWidth = 401
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
    Left = 156
    Top = 300
    Width = 75
    Height = 21
    Caption = 'ȷ��(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 236
    Top = 300
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 3
  end
  object grpToolbar: TGroupBox
    Left = 8
    Top = 8
    Width = 385
    Height = 65
    Caption = '������(&T)'
    TabOrder = 0
    object lblMaxHistory: TLabel
      Left = 8
      Top = 40
      Width = 136
      Height = 13
      Caption = '�����������������ʷ��:'
    end
    object lblHistoryUnit: TLabel
      Left = 240
      Top = 40
      Width = 12
      Height = 13
      Caption = '��'
    end
    object cbShowToolbar: TCheckBox
      Left = 8
      Top = 16
      Width = 145
      Height = 17
      Caption = '��ʾ MSDN ��������'
      TabOrder = 0
    end
    object seMaxHistory: TCnSpinEdit
      Left = 152
      Top = 36
      Width = 81
      Height = 22
      MaxLength = 2
      MaxValue = 99
      MinValue = 1
      TabOrder = 1
      Value = 10
      OnKeyPress = seMaxHistoryKeyPress
    end
    object btnSetShortCut: TButton
      Left = 292
      Top = 36
      Width = 85
      Height = 21
      Caption = '���ÿ�ݼ�(&K)'
      TabOrder = 2
      OnClick = btnSetShortCutClick
    end
  end
  object grpSetMsdn: TGroupBox
    Left = 8
    Top = 80
    Width = 385
    Height = 212
    Caption = '���� MSDN(&S)'
    TabOrder = 1
    object rbDefault: TRadioButton
      Left = 8
      Top = 16
      Width = 220
      Height = 17
      Caption = 'ʹ��Ĭ�� MSDN��'
      TabOrder = 0
    end
    object rbFollow: TRadioButton
      Left = 8
      Top = 40
      Width = 220
      Height = 17
      Caption = 'ʹ�������һ�� MSDN��'
      TabOrder = 1
      OnClick = rbFollowClick
    end
    object lstMsdn: TListBox
      Left = 8
      Top = 64
      Width = 368
      Height = 89
      ItemHeight = 13
      TabOrder = 2
      OnClick = lstMsdnClick
    end
    object rbWeb: TRadioButton
      Left = 8
      Top = 160
      Width = 273
      Height = 17
      Caption = 'ʹ������ MSDN(%s Ϊ�����ؼ���)��'
      TabOrder = 4
    end
    object edtWeb: TEdit
      Left = 8
      Top = 181
      Width = 368
      Height = 21
      TabOrder = 5
      OnChange = edtWebChange
    end
    object btnDefaultURL: TButton
      Left = 292
      Top = 156
      Width = 85
      Height = 21
      Caption = 'Ĭ�� URL(&D)'
      TabOrder = 3
      OnClick = btnDefaultURLClick
    end
  end
  object btnHelp: TButton
    Left = 318
    Top = 300
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 4
    OnClick = btnHelpClick
  end
end
