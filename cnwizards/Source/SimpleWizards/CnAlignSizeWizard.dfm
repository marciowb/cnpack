object CnNonArrangeForm: TCnNonArrangeForm
  Left = 360
  Top = 192
  BorderStyle = bsDialog
  Caption = '���в��������'
  ClientHeight = 301
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnShow = UpdateControls
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 196
    Height = 81
    Caption = '����ѡ��(&A)'
    TabOrder = 0
    object Label1: TLabel
      Left = 160
      Top = 26
      Width = 24
      Height = 13
      Caption = '����'
    end
    object Label2: TLabel
      Left = 160
      Top = 49
      Width = 24
      Height = 13
      Caption = '����'
    end
    object rbRow: TRadioButton
      Left = 16
      Top = 24
      Width = 97
      Height = 17
      Caption = '�����ţ�ÿ��'
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = UpdateControls
    end
    object rbCol: TRadioButton
      Left = 16
      Top = 47
      Width = 97
      Height = 17
      Caption = '�����ţ�ÿ��'
      TabOrder = 3
      OnClick = UpdateControls
    end
    object sePerRow: TCnSpinEdit
      Left = 112
      Top = 22
      Width = 41
      Height = 22
      MaxLength = 1
      MaxValue = 1000
      MinValue = 1
      TabOrder = 0
      Value = 3
    end
    object sePerCol: TCnSpinEdit
      Left = 112
      Top = 45
      Width = 41
      Height = 22
      MaxLength = 1
      MaxValue = 1000
      MinValue = 1
      TabOrder = 1
      Value = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 96
    Width = 393
    Height = 105
    Caption = 'λ��ѡ��(&P)'
    TabOrder = 1
    object Label5: TLabel
      Left = 26
      Top = 51
      Width = 60
      Height = 13
      Caption = '�ര���Ե'
    end
    object Label6: TLabel
      Left = 226
      Top = 51
      Width = 36
      Height = 13
      Caption = '���ء�'
    end
    object Label7: TLabel
      Left = 26
      Top = 75
      Width = 252
      Height = 13
      Caption = 'ע��δѡ��ʱ���������ϵ����в����������'
    end
    object Label8: TLabel
      Left = 26
      Top = 26
      Width = 108
      Height = 13
      Caption = '���к��Զ����ڴ���'
    end
    object cbbMoveStyle: TComboBox
      Left = 168
      Top = 23
      Width = 81
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = UpdateControls
      Items.Strings = (
        '���Ͻ�'
        '���Ͻ�'
        '���½�'
        '���½�'
        '����')
    end
    object seSizeSpace: TCnSpinEdit
      Left = 168
      Top = 47
      Width = 49
      Height = 22
      MaxLength = 3
      MaxValue = 100
      MinValue = 0
      TabOrder = 1
      Value = 3
    end
  end
  object btnOK: TButton
    Left = 166
    Top = 272
    Width = 75
    Height = 21
    Anchors = [akTop, akRight]
    Caption = 'ȷ��(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object btnCancel: TButton
    Left = 246
    Top = 272
    Width = 75
    Height = 21
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 4
  end
  object btnHelp: TButton
    Left = 326
    Top = 272
    Width = 75
    Height = 21
    Anchors = [akTop, akRight]
    Caption = '����(&H)'
    TabOrder = 5
    OnClick = btnHelpClick
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 208
    Width = 393
    Height = 57
    Caption = '˳��ѡ��(&S)'
    TabOrder = 2
    object chkSortbyClassName: TCheckBox
      Left = 16
      Top = 24
      Width = 265
      Height = 17
      Caption = '����������ַ�����˳������'
      TabOrder = 0
      OnClick = UpdateControls
    end
  end
  object grpSpace: TGroupBox
    Left = 216
    Top = 8
    Width = 185
    Height = 81
    Caption = '���м��(&I)'
    TabOrder = 6
    object lblPixel2: TLabel
      Left = 141
      Top = 49
      Width = 36
      Height = 13
      Caption = '���ء�'
    end
    object lblPixel1: TLabel
      Left = 141
      Top = 26
      Width = 36
      Height = 13
      Caption = '���ء�'
    end
    object lblRow: TLabel
      Left = 16
      Top = 26
      Width = 48
      Height = 13
      Caption = '�м�ࣺ'
    end
    object lblCol: TLabel
      Left = 16
      Top = 49
      Width = 48
      Height = 13
      Caption = '�м�ࣺ'
    end
    object seColSpace: TCnSpinEdit
      Left = 84
      Top = 45
      Width = 45
      Height = 22
      MaxLength = 3
      MaxValue = 1000
      MinValue = 0
      TabOrder = 0
      Value = 3
    end
    object seRowSpace: TCnSpinEdit
      Left = 84
      Top = 22
      Width = 45
      Height = 22
      MaxLength = 3
      MaxValue = 1000
      MinValue = 0
      TabOrder = 1
      Value = 3
    end
  end
end
