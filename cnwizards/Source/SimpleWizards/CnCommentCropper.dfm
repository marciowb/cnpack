object CommentCropForm: TCommentCropForm
  Left = 235
  Top = 155
  BorderStyle = bsDialog
  Caption = 'ɾ��ע��'
  ClientHeight = 354
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbKind: TGroupBox
    Left = 320
    Top = 8
    Width = 217
    Height = 209
    Caption = '��ѡ��������(&N)'
    TabOrder = 1
    object rbSelEdit: TRadioButton
      Left = 8
      Top = 24
      Width = 200
      Height = 17
      Caption = '��ǰ�༭��ѡ����(&1)��'
      TabOrder = 0
      TabStop = True
      OnClick = UpdateClick
    end
    object rbCurrUnit: TRadioButton
      Left = 8
      Top = 54
      Width = 200
      Height = 17
      Caption = '��ǰ�༭�ĵ�Ԫ(&2)��'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = UpdateClick
    end
    object rbOpenedUnits: TRadioButton
      Left = 8
      Top = 85
      Width = 200
      Height = 17
      Caption = '��ǰ���д򿪵ĵ�Ԫ(&3)��'
      TabOrder = 2
      TabStop = True
      OnClick = UpdateClick
    end
    object rbCurrProject: TRadioButton
      Left = 8
      Top = 115
      Width = 200
      Height = 17
      Caption = '��ǰ�����е����е�Ԫ(&4)��'
      TabOrder = 3
      TabStop = True
      OnClick = UpdateClick
    end
    object rbProjectGroup: TRadioButton
      Left = 8
      Top = 146
      Width = 200
      Height = 17
      Caption = '��ǰ�������е����е�Ԫ(&5)��'
      TabOrder = 4
      TabStop = True
      OnClick = UpdateClick
    end
    object rbDirectory: TRadioButton
      Left = 8
      Top = 176
      Width = 200
      Height = 17
      Caption = 'ָ��Ŀ¼(&6)��'
      TabOrder = 5
      TabStop = True
      OnClick = UpdateClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 300
    Height = 209
    Caption = '����ѡ��(&P)'
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 136
      Width = 156
      Height = 13
      Caption = '���ִ�֮���԰�Ƕ��ŷָ���'
    end
    object rbCropComment: TRadioButton
      Left = 8
      Top = 18
      Width = 281
      Height = 17
      Caption = 'ɾ��ע�Ϳ���������ݡ�'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbExAscii: TRadioButton
      Left = 8
      Top = 38
      Width = 281
      Height = 17
      Caption = 'ֻɾ��ע���е���չ ASCII �ַ���'
      TabOrder = 1
    end
    object chkCropDirective: TCheckBox
      Left = 8
      Top = 58
      Width = 281
      Height = 17
      Caption = '���� Delphi ����ָ����Ƽ�����'
      Enabled = False
      TabOrder = 2
    end
    object chkCropTodo: TCheckBox
      Left = 8
      Top = 78
      Width = 281
      Height = 17
      Caption = '���� Todo List��'
      TabOrder = 3
    end
    object chkReserve: TCheckBox
      Left = 8
      Top = 118
      Width = 286
      Height = 17
      Caption = '�����������������ִ���ͷ�Ŀ�ע��'
      TabOrder = 5
      OnClick = chkReserveClick
    end
    object edReserveStr: TEdit
      Left = 24
      Top = 154
      Width = 260
      Height = 21
      TabOrder = 6
    end
    object chkCropProjectSrc: TCheckBox
      Left = 8
      Top = 98
      Width = 281
      Height = 17
      Caption = '������ĿԴ�ļ���'
      TabOrder = 4
    end
    object chkMergeBlank: TCheckBox
      Left = 8
      Top = 181
      Width = 286
      Height = 17
      Caption = '������Ϻ�ϲ����ڿ��С�'
      Checked = True
      State = cbChecked
      TabOrder = 7
      OnClick = chkReserveClick
    end
  end
  object btnOK: TButton
    Left = 302
    Top = 323
    Width = 75
    Height = 21
    Caption = '����(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object btnCancel: TButton
    Left = 382
    Top = 323
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 4
  end
  object btnHelp: TButton
    Left = 462
    Top = 323
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 5
    OnClick = btnHelpClick
  end
  object grpDir: TGroupBox
    Left = 8
    Top = 224
    Width = 529
    Height = 89
    Caption = 'ָ��Ŀ¼(&L)'
    TabOrder = 2
    object lbl1: TLabel
      Left = 8
      Top = 19
      Width = 55
      Height = 13
      Caption = 'Ŀ¼��(&D):'
      FocusControl = cbbDir
    end
    object lbl2: TLabel
      Left = 8
      Top = 43
      Width = 66
      Height = 13
      Caption = '�ļ�����(&E):'
      FocusControl = cbbMask
    end
    object btnSelectDir: TButton
      Left = 496
      Top = 16
      Width = 21
      Height = 21
      Caption = '...'
      TabOrder = 1
      OnClick = btnSelectDirClick
    end
    object cbbDir: TComboBox
      Left = 88
      Top = 16
      Width = 401
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object cbbMask: TComboBox
      Left = 88
      Top = 40
      Width = 401
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        '.pas;.dpr'
        '.cpp;.c;.hpp;.h;.cxx;.cc;.hxx;.hh;.asm'
        '.pas;.dpr;cpp;.c;.hpp;.h;.cxx;.cc;.hxx;.hh;.asm')
    end
    object chkSubDirs: TCheckBox
      Left = 88
      Top = 64
      Width = 105
      Height = 17
      Caption = '������Ŀ¼(&S)'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
end
