object CnReplaceWizardForm: TCnReplaceWizardForm
  Left = 306
  Top = 155
  BorderStyle = bsDialog
  Caption = '�����ļ��滻����'
  ClientHeight = 331
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object tbOptions: TGroupBox
    Left = 8
    Top = 88
    Width = 193
    Height = 113
    Caption = 'ѡ��(&O)'
    TabOrder = 1
    object cbCaseSensitive: TCheckBox
      Left = 8
      Top = 16
      Width = 105
      Height = 17
      Caption = '���ִ�Сд(&I)'
      TabOrder = 0
    end
    object cbWholeWord: TCheckBox
      Left = 8
      Top = 39
      Width = 129
      Height = 17
      Caption = 'ֻƥ����������(&W)'
      TabOrder = 1
    end
    object cbRegEx: TCheckBox
      Left = 8
      Top = 63
      Width = 169
      Height = 17
      Caption = '��������֧��������ʽ(&U)'
      TabOrder = 2
    end
    object cbANSICompatible: TCheckBox
      Left = 8
      Top = 86
      Width = 169
      Height = 17
      Caption = 'Ansi���ݷ�ʽ����(����)(&N)'
      TabOrder = 3
    end
  end
  object gbText: TGroupBox
    Left = 8
    Top = 8
    Width = 385
    Height = 73
    Caption = '�ı�(&T)'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 66
      Height = 13
      Caption = '�����ı�(&F):'
    end
    object Label2: TLabel
      Left = 8
      Top = 44
      Width = 54
      Height = 13
      Caption = '�滻Ϊ(&P):'
    end
    object cbbSrc: TComboBox
      Left = 88
      Top = 16
      Width = 289
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object cbbDst: TComboBox
      Left = 88
      Top = 40
      Width = 289
      Height = 21
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object rgReplaceStyle: TRadioGroup
    Left = 208
    Top = 88
    Width = 185
    Height = 113
    Caption = '��Χ(&A)'
    ItemIndex = 0
    Items.Strings = (
      '��ǰ��Ԫ(&1)'
      '��ǰ�����������ļ�(&2)'
      '��ǰ���������ļ�(&3)'
      '��ǰ�򿪵������ļ�(&4)'
      'ָ��Ŀ¼(&5)')
    TabOrder = 2
    OnClick = rgReplaceStyleClick
  end
  object gbDir: TGroupBox
    Left = 8
    Top = 208
    Width = 385
    Height = 89
    Caption = 'ָ��Ŀ¼(&L)'
    TabOrder = 3
    object Label3: TLabel
      Left = 8
      Top = 19
      Width = 55
      Height = 13
      Caption = 'Ŀ¼��(&D):'
      FocusControl = cbbDir
    end
    object Label4: TLabel
      Left = 8
      Top = 43
      Width = 66
      Height = 13
      Caption = '�ļ�����(&E):'
      FocusControl = cbbMask
    end
    object btnSelectDir: TButton
      Left = 352
      Top = 16
      Width = 21
      Height = 21
      Caption = '...'
      TabOrder = 2
      OnClick = btnSelectDirClick
    end
    object cbbDir: TComboBox
      Left = 88
      Top = 16
      Width = 257
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnDropDown = cbbDirDropDown
    end
    object cbbMask: TComboBox
      Left = 88
      Top = 40
      Width = 257
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        '.pas;.dpr'
        '.cpp;.c;.hpp;.h;.cxx;.cc;.hxx;.hh;.asm'
        '.pas;.dpr;cpp;.c;.hpp;.h;.cxx;.cc;.hxx;.hh;.asm')
    end
    object cbSubDirs: TCheckBox
      Left = 88
      Top = 64
      Width = 105
      Height = 17
      Caption = '������Ŀ¼(&S)'
      TabOrder = 3
    end
  end
  object btnReplace: TButton
    Left = 158
    Top = 304
    Width = 75
    Height = 21
    Caption = '��ʼ�滻(&R)'
    TabOrder = 4
    OnClick = btnReplaceClick
  end
  object btnClose: TButton
    Left = 238
    Top = 304
    Width = 75
    Height = 21
    Cancel = True
    Caption = '�ر�(&C)'
    ModalResult = 2
    TabOrder = 5
  end
  object btnHelp: TButton
    Left = 318
    Top = 304
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 6
    OnClick = btnHelpClick
  end
end
