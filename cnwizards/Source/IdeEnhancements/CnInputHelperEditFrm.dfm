inherited CnInputHelperEditForm: TCnInputHelperEditForm
  Left = 406
  Top = 248
  BorderStyle = bsDialog
  Caption = '�Զ������'
  ClientHeight = 220
  ClientWidth = 335
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 321
    Height = 177
    Caption = '������(&S)'
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 24
      Width = 28
      Height = 13
      Caption = '����:'
    end
    object lbl2: TLabel
      Left = 8
      Top = 78
      Width = 28
      Height = 13
      Caption = '����:'
    end
    object lbl3: TLabel
      Left = 8
      Top = 51
      Width = 28
      Height = 13
      Caption = '����:'
    end
    object lbl4: TLabel
      Left = 8
      Top = 105
      Width = 40
      Height = 13
      Caption = '���ȼ�:'
    end
    object lbl5: TLabel
      Left = 144
      Top = 105
      Width = 98
      Height = 13
      Caption = '0..100��0Ϊ��ߡ�'
    end
    object edtName: TEdit
      Left = 64
      Top = 20
      Width = 249
      Height = 21
      TabOrder = 0
    end
    object edtDesc: TEdit
      Left = 64
      Top = 74
      Width = 249
      Height = 21
      TabOrder = 2
    end
    object cbbKind: TComboBox
      Left = 64
      Top = 47
      Width = 249
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = cbbKindChange
      OnClick = cbbKindChange
    end
    object chkAutoIndent: TCheckBox
      Left = 64
      Top = 128
      Width = 249
      Height = 17
      Caption = '�����ı�ģ�������ʱ�Զ�������'
      TabOrder = 4
    end
    object seScope: TCnSpinEdit
      Left = 64
      Top = 101
      Width = 73
      Height = 22
      MaxValue = 100
      MinValue = 0
      TabOrder = 3
      Value = 0
    end
    object chkAlwaysDisp: TCheckBox
      Left = 64
      Top = 150
      Width = 249
      Height = 17
      Caption = '��ʹ��ǰ������ȫƥ��Ҳ��ʾ�б�'
      TabOrder = 5
    end
  end
  object btnHelp: TButton
    Left = 254
    Top = 192
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 3
    OnClick = btnHelpClick
  end
  object btnOK: TButton
    Left = 94
    Top = 192
    Width = 75
    Height = 21
    Caption = 'ȷ��(&O)'
    Default = True
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 174
    Top = 192
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 2
  end
end
