object CnPalEnhanceForm: TCnPalEnhanceForm
  Left = 340
  Top = 195
  BorderStyle = bsDialog
  Caption = 'IDE ��������չר������'
  ClientHeight = 435
  ClientWidth = 448
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grpPalEnh: TGroupBox
    Left = 8
    Top = 8
    Width = 433
    Height = 145
    Caption = '��������չ����(&P)'
    TabOrder = 0
    object chkAddTabs: TCheckBox
      Left = 8
      Top = 16
      Width = 409
      Height = 17
      Caption = 
        '��������ĵ����˵������ Tabs ��������� Delphi 5 �� BCB 5��' +
        '��'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object chkMultiLine: TCheckBox
      Left = 8
      Top = 36
      Width = 337
      Height = 17
      Caption = '����������ҳ��Ϊ���з�ʽ��'
      TabOrder = 1
    end
    object chkDivTabMenu: TCheckBox
      Left = 8
      Top = 76
      Width = 409
      Height = 17
      Caption = '��Ļ�ռ䲻��ʱ�۵� Tabs �Ӳ˵����������� Delphi 7 �����°汾����'
      TabOrder = 3
    end
    object chkCompFilter: TCheckBox
      Left = 8
      Top = 96
      Width = 409
      Height = 17
      Caption = '�������������"�������"��ť���������� Delphi 7 �����°汾����'
      TabOrder = 4
    end
    object chkButtonStyle: TCheckBox
      Left = 8
      Top = 56
      Width = 337
      Height = 17
      Caption = '����������ҳ��Ϊƽ�水ť���'
      TabOrder = 2
    end
    object chkLockToolbar: TCheckBox
      Left = 8
      Top = 116
      Width = 409
      Height = 17
      Caption = '���� IDE �����ڵĹ������Խ�ֹ�϶���'
      TabOrder = 5
    end
  end
  object btnHelp: TButton
    Left = 366
    Top = 404
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 5
    OnClick = btnHelpClick
  end
  object btnOK: TButton
    Left = 206
    Top = 404
    Width = 75
    Height = 21
    Caption = 'ȷ��(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object btnCancel: TButton
    Left = 286
    Top = 404
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 4
  end
  object grpMisc: TGroupBox
    Left = 8
    Top = 156
    Width = 433
    Height = 41
    Caption = '������չ����(&T)'
    TabOrder = 1
    object chkMenuLine: TCheckBox
      Left = 8
      Top = 16
      Width = 409
      Height = 17
      Caption = '�Զ���ʾ IDE ���˵��Ŀ�ݼ��»��ߣ��������� Delphi 7����'
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 0
    end
  end
  object grpMenu: TGroupBox
    Left = 8
    Top = 204
    Width = 433
    Height = 193
    Caption = '���˵�����(&W)'
    TabOrder = 2
    object lbl1: TLabel
      Left = 24
      Top = 72
      Width = 64
      Height = 13
      Caption = '���ò˵���:'
    end
    object lbl2: TLabel
      Left = 24
      Top = 44
      Width = 52
      Height = 13
      Caption = '�˵�����:'
    end
    object lbl3: TLabel
      Left = 240
      Top = 72
      Width = 88
      Height = 13
      Caption = 'Ҫ�ƶ��Ĳ˵���:'
    end
    object chkMoveWizMenus: TCheckBox
      Left = 8
      Top = 16
      Width = 401
      Height = 17
      Caption = '�ƶ����˵��ϵĲ˵�������˵��¡�'
      TabOrder = 0
      OnClick = UpdateControls
    end
    object edtMoveToUser: TEdit
      Left = 88
      Top = 40
      Width = 113
      Height = 21
      TabOrder = 1
      OnClick = UpdateControls
    end
    object tlb1: TToolBar
      Left = 205
      Top = 87
      Width = 23
      Height = 90
      Align = alNone
      AutoSize = True
      Caption = 'tlb1'
      EdgeBorders = []
      Images = dmCnSharedImages.Images
      TabOrder = 2
      object btnDelete: TToolButton
        Left = 0
        Top = 2
        ImageIndex = 15
        Wrap = True
        OnClick = btnDeleteClick
      end
      object btnUp: TToolButton
        Left = 0
        Top = 24
        ImageIndex = 44
        Wrap = True
        OnClick = btnUpClick
      end
      object btnDown: TToolButton
        Left = 0
        Top = 46
        ImageIndex = 45
        Wrap = True
        OnClick = btnDownClick
      end
      object btnAdd: TToolButton
        Left = 0
        Top = 68
        ImageIndex = 14
        OnClick = btnAddClick
      end
    end
    object lstSource: TListBox
      Left = 24
      Top = 88
      Width = 177
      Height = 89
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 3
      OnClick = UpdateControls
      OnDblClick = btnAddClick
    end
    object lstDest: TListBox
      Left = 232
      Top = 88
      Width = 185
      Height = 89
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 4
      OnClick = UpdateControls
      OnDblClick = btnDeleteClick
    end
  end
end
