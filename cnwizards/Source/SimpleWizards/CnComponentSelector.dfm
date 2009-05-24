object CnComponentSelectorForm: TCnComponentSelectorForm
  Left = 235
  Top = 111
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = '���ѡ�񹤾�'
  ClientHeight = 483
  ClientWidth = 568
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
  object gbFilter: TGroupBox
    Left = 8
    Top = 8
    Width = 177
    Height = 137
    Caption = '�����������(&F)'
    TabOrder = 0
    object rbCurrForm: TRadioButton
      Left = 8
      Top = 16
      Width = 160
      Height = 17
      Caption = '�������������'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = DoUpdateListControls
    end
    object rbCurrControl: TRadioButton
      Left = 8
      Top = 38
      Width = 160
      Height = 17
      Caption = '��ǰ��ѡ�ؼ����ӿؼ�'
      TabOrder = 1
      OnClick = DoUpdateListControls
    end
    object rbSpecControl: TRadioButton
      Left = 8
      Top = 60
      Width = 160
      Height = 17
      Caption = 'ָ���ؼ����ӿؼ�'
      TabOrder = 2
      OnClick = DoUpdateListControls
    end
    object cbbFilterControl: TComboBox
      Left = 24
      Top = 84
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      Sorted = True
      TabOrder = 3
      OnChange = DoUpdateList
    end
    object cbIncludeChildren: TCheckBox
      Left = 8
      Top = 112
      Width = 161
      Height = 17
      Caption = '�����༶�ӿؼ�'
      TabOrder = 4
      OnClick = DoUpdateList
    end
  end
  object gbByName: TGroupBox
    Left = 192
    Top = 8
    Width = 201
    Height = 137
    Caption = '����������͹���(&N)'
    TabOrder = 1
    object edtByName: TEdit
      Left = 24
      Top = 40
      Width = 169
      Height = 21
      TabOrder = 1
      OnChange = DoUpdateList
    end
    object cbByName: TCheckBox
      Left = 8
      Top = 16
      Width = 185
      Height = 17
      Caption = '����������ƹ���'
      TabOrder = 0
      OnClick = DoUpdateListControls
    end
    object cbByClass: TCheckBox
      Left = 8
      Top = 64
      Width = 185
      Height = 17
      Caption = '����������͹���'
      TabOrder = 2
      OnClick = DoUpdateListControls
    end
    object cbbByClass: TComboBox
      Left = 24
      Top = 84
      Width = 169
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      Sorted = True
      TabOrder = 3
      OnChange = DoUpdateList
    end
    object cbSubClass: TCheckBox
      Left = 24
      Top = 112
      Width = 169
      Height = 17
      Caption = '��������'
      TabOrder = 4
      OnClick = DoUpdateList
    end
  end
  object gbComponentList: TGroupBox
    Left = 8
    Top = 152
    Width = 553
    Height = 297
    Caption = '����б�(&M)'
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 88
      Height = 13
      Caption = '�ɹ�ѡ������:'
    end
    object Label2: TLabel
      Left = 312
      Top = 16
      Width = 76
      Height = 13
      Caption = '��ѡ������:'
    end
    object Label4: TLabel
      Left = 8
      Top = 273
      Width = 52
      Height = 13
      Caption = '����ʽ:'
    end
    object lbSource: TListBox
      Left = 8
      Top = 32
      Width = 233
      Height = 233
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 0
      OnDblClick = actAddExecute
    end
    object btnAdd: TButton
      Left = 248
      Top = 40
      Width = 57
      Height = 21
      Action = actAdd
      TabOrder = 2
    end
    object btnAddAll: TButton
      Left = 248
      Top = 64
      Width = 57
      Height = 21
      Action = actAddAll
      TabOrder = 3
    end
    object btnDelete: TButton
      Left = 248
      Top = 88
      Width = 57
      Height = 21
      Action = actDelete
      TabOrder = 4
    end
    object btnDeleteAll: TButton
      Left = 248
      Top = 112
      Width = 57
      Height = 21
      Action = actDeleteAll
      TabOrder = 5
    end
    object btnSelAll: TButton
      Left = 248
      Top = 192
      Width = 57
      Height = 21
      Action = actSelAll
      TabOrder = 6
    end
    object btnSelNone: TButton
      Left = 248
      Top = 216
      Width = 57
      Height = 21
      Action = actSelNone
      TabOrder = 7
    end
    object btnSelInvert: TButton
      Left = 248
      Top = 240
      Width = 57
      Height = 21
      Action = actSelInvert
      TabOrder = 8
    end
    object lbDest: TListBox
      Left = 312
      Top = 32
      Width = 233
      Height = 233
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 1
      OnDblClick = actDeleteExecute
    end
    object cbbSourceOrderStyle: TComboBox
      Left = 64
      Top = 270
      Width = 113
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 9
      OnChange = DoUpdateSourceOrder
      Items.Strings = (
        'Ĭ��˳��'
        '�������������'
        '�������������')
    end
    object cbbSourceOrderDir: TComboBox
      Left = 184
      Top = 270
      Width = 81
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 10
      OnChange = DoUpdateSourceOrder
      Items.Strings = (
        '����'
        '����')
    end
    object btnMoveToTop: TButton
      Left = 280
      Top = 270
      Width = 63
      Height = 21
      Action = actMoveToTop
      TabOrder = 11
    end
    object btnMoveToBottom: TButton
      Left = 347
      Top = 270
      Width = 63
      Height = 21
      Action = actMoveToBottom
      TabOrder = 12
    end
    object btnMoveUp: TButton
      Left = 415
      Top = 270
      Width = 63
      Height = 21
      Action = actMoveUp
      TabOrder = 13
    end
    object btnMoveDown: TButton
      Left = 482
      Top = 270
      Width = 63
      Height = 21
      Action = actMoveDown
      TabOrder = 14
    end
  end
  object btnHelp: TButton
    Left = 486
    Top = 456
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 7
    OnClick = btnHelpClick
  end
  object btnOK: TButton
    Left = 326
    Top = 456
    Width = 75
    Height = 21
    Caption = 'ȷ��(&O)'
    Default = True
    TabOrder = 5
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 406
    Top = 456
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 6
  end
  object gbTag: TGroupBox
    Left = 400
    Top = 8
    Width = 161
    Height = 137
    Caption = '��� Tag ����(&T)'
    TabOrder = 2
    object lblTag: TLabel
      Left = 87
      Top = 72
      Width = 4
      Height = 13
      Caption = '-'
    end
    object cbByTag: TCheckBox
      Left = 8
      Top = 16
      Width = 129
      Height = 17
      Caption = '������� Tag ����'
      TabOrder = 0
      OnClick = DoUpdateListControls
    end
    object cbbByTag: TComboBox
      Left = 24
      Top = 40
      Width = 129
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = DoUpdateListControls
      Items.Strings = (
        '��� Tag ����'
        '��� Tag С��'
        '��� Tag ����'
        '��� Tag ����')
    end
    object seTagStart: TCnSpinEdit
      Left = 24
      Top = 69
      Width = 57
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 0
      OnChange = DoUpdateList
    end
    object seTagEnd: TCnSpinEdit
      Left = 99
      Top = 69
      Width = 54
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 0
      OnChange = DoUpdateList
    end
  end
  object cbDefaultSelAll: TCheckBox
    Left = 8
    Top = 459
    Width = 225
    Height = 17
    Caption = 'ѡ��Ϊ��ʱĬ��Ϊȫ��ѡ��'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object ActionList: TActionList
    Left = 528
    Top = 8
    object actAdd: TAction
      Category = 'AddDelete'
      Caption = '>'
      OnExecute = actAddExecute
    end
    object actAddAll: TAction
      Category = 'AddDelete'
      Caption = '>>'
      OnExecute = actAddAllExecute
    end
    object actDelete: TAction
      Category = 'AddDelete'
      Caption = '<'
      OnExecute = actDeleteExecute
    end
    object actDeleteAll: TAction
      Category = 'AddDelete'
      Caption = '<<'
      OnExecute = actDeleteAllExecute
    end
    object actSelAll: TAction
      Category = 'Selection'
      Caption = 'ȫѡ(&A)'
      OnExecute = actSelAllExecute
    end
    object actSelNone: TAction
      Category = 'Selection'
      Caption = '��ѡ(&D)'
      OnExecute = actSelNoneExecute
    end
    object actSelInvert: TAction
      Category = 'Selection'
      Caption = '����(&I)'
      OnExecute = actSelInvertExecute
      OnUpdate = DoActionListUpdate
    end
    object actMoveToTop: TAction
      Category = 'Move'
      Caption = '�Ƶ�����'
      OnExecute = actMoveToTopExecute
    end
    object actMoveToBottom: TAction
      Category = 'Move'
      Caption = '�Ƶ��ײ�'
      OnExecute = actMoveToBottomExecute
    end
    object actMoveUp: TAction
      Category = 'Move'
      Caption = '����һ��'
      OnExecute = actMoveUpExecute
    end
    object actMoveDown: TAction
      Category = 'Move'
      Caption = '����һ��'
      OnExecute = actMoveDownExecute
    end
  end
end
