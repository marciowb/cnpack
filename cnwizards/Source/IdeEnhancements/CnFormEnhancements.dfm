object CnFormEnhanceConfigForm: TCnFormEnhanceConfigForm
  Left = 304
  Top = 124
  BorderStyle = bsDialog
  Caption = '�����������չר������'
  ClientHeight = 381
  ClientWidth = 489
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
  PixelsPerInch = 96
  TextHeight = 13
  object grpFlatPanel: TGroupBox
    Left = 8
    Top = 8
    Width = 233
    Height = 337
    Caption = '�����������(&P)'
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 254
      Width = 52
      Height = 13
      Caption = 'ˮƽƫ��:'
    end
    object Label2: TLabel
      Left = 24
      Top = 279
      Width = 52
      Height = 13
      Caption = '��ֱƫ��:'
    end
    object Label3: TLabel
      Left = 24
      Top = 229
      Width = 52
      Height = 13
      Caption = 'ͣ��λ��:'
    end
    object Label4: TLabel
      Left = 8
      Top = 163
      Width = 76
      Height = 13
      Caption = '�����������:'
    end
    object cbbSnapPos: TComboBox
      Left = 104
      Top = 225
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 8
      OnChange = UpdateControls
    end
    object btnCustomize: TButton
      Left = 8
      Top = 304
      Width = 89
      Height = 21
      Caption = '�������(&T)'
      TabOrder = 11
      OnClick = btnCustomizeClick
    end
    object btnExport: TButton
      Left = 104
      Top = 304
      Width = 57
      Height = 21
      Caption = '����(&X)'
      TabOrder = 12
      OnClick = btnExportClick
    end
    object btnImport: TButton
      Left = 170
      Top = 304
      Width = 55
      Height = 21
      Caption = '����(&M)'
      TabOrder = 13
      OnClick = btnImportClick
    end
    object ListView: TListView
      Left = 8
      Top = 16
      Width = 217
      Height = 89
      Columns = <
        item
          Caption = '���'
          Width = 38
        end
        item
          Caption = '����������'
          Width = 95
        end
        item
          Caption = 'ͣ��λ��'
          Width = 60
        end>
      ColumnClick = False
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = btnCustomizeClick
      OnSelectItem = ListViewSelectItem
    end
    object btnAdd: TButton
      Left = 8
      Top = 112
      Width = 65
      Height = 21
      Caption = '���(&A)'
      TabOrder = 1
      OnClick = btnAddClick
    end
    object btnDelete: TButton
      Left = 84
      Top = 112
      Width = 65
      Height = 21
      Caption = 'ɾ��(&D)'
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object btnDefault: TButton
      Left = 160
      Top = 112
      Width = 65
      Height = 21
      Caption = 'Ĭ��(&F)'
      TabOrder = 3
      OnClick = btnDefaultClick
    end
    object rbAllowDrag: TRadioButton
      Left = 8
      Top = 184
      Width = 217
      Height = 17
      Caption = '�����϶��˸���������塣'
      TabOrder = 6
      OnClick = UpdateControls
    end
    object rbAutoSnap: TRadioButton
      Left = 8
      Top = 205
      Width = 217
      Height = 17
      Caption = '�Զ�ͣ������ƴ��帽����'
      Checked = True
      TabOrder = 7
      TabStop = True
      OnClick = UpdateControls
    end
    object seOffsetX: TCnSpinEdit
      Left = 104
      Top = 249
      Width = 121
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 9
      Value = 0
      OnChange = UpdateControls
    end
    object seOffsetY: TCnSpinEdit
      Left = 104
      Top = 274
      Width = 121
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 10
      Value = 0
      OnChange = UpdateControls
    end
    object edtName: TEdit
      Left = 104
      Top = 160
      Width = 121
      Height = 21
      TabOrder = 5
      OnChange = UpdateControls
    end
    object cbAllowShow: TCheckBox
      Left = 8
      Top = 136
      Width = 217
      Height = 17
      Caption = '��ʾ�˸���������塣'
      TabOrder = 4
      OnClick = UpdateControls
    end
  end
  object btnClose: TButton
    Left = 326
    Top = 352
    Width = 75
    Height = 21
    Cancel = True
    Caption = '�ر�(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btnHelp: TButton
    Left = 406
    Top = 352
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 3
    OnClick = btnHelpClick
  end
  object grp1: TGroupBox
    Left = 248
    Top = 8
    Width = 233
    Height = 337
    Caption = '�������Ա༭��(&P)'
    TabOrder = 1
    object lbl3: TLabel
      Left = 24
      Top = 158
      Width = 52
      Height = 13
      Caption = 'ˮƽƫ��:'
    end
    object lbl4: TLabel
      Left = 24
      Top = 183
      Width = 52
      Height = 13
      Caption = '��ֱƫ��:'
    end
    object lbl5: TLabel
      Left = 24
      Top = 133
      Width = 52
      Height = 13
      Caption = 'ͣ��λ��:'
    end
    object lbl6: TLabel
      Left = 8
      Top = 208
      Width = 156
      Height = 13
      Caption = '���������б�(�����ȼ�����):'
    end
    object lbl1: TLabel
      Left = 24
      Top = 41
      Width = 64
      Height = 13
      Caption = '���������:'
    end
    object lbl2: TLabel
      Left = 24
      Top = 66
      Width = 64
      Height = 13
      Caption = '����ֵ���:'
    end
    object cbbSnapPosPropBar: TComboBox
      Left = 104
      Top = 129
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      OnChange = UpdateControls
    end
    object rbAllowDragPropBar: TRadioButton
      Left = 8
      Top = 88
      Width = 217
      Height = 17
      Caption = '�����϶��������Ա༭����'
      TabOrder = 3
      OnClick = UpdateControls
    end
    object rbAutoSnapPropBar: TRadioButton
      Left = 8
      Top = 109
      Width = 217
      Height = 17
      Caption = '�Զ�ͣ������ƴ��帽����'
      Checked = True
      TabOrder = 4
      TabStop = True
      OnClick = UpdateControls
    end
    object sePropBarX: TCnSpinEdit
      Left = 104
      Top = 153
      Width = 121
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 6
      Value = 0
      OnChange = UpdateControls
    end
    object sePropBarY: TCnSpinEdit
      Left = 104
      Top = 178
      Width = 121
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 7
      Value = 0
      OnChange = UpdateControls
    end
    object chkShowPropBar: TCheckBox
      Left = 8
      Top = 16
      Width = 217
      Height = 17
      Caption = '��ʾ�������Ա༭����'
      TabOrder = 0
      OnClick = UpdateControls
    end
    object mmoFreq: TMemo
      Left = 8
      Top = 224
      Width = 217
      Height = 101
      ScrollBars = ssVertical
      TabOrder = 8
      OnExit = UpdateControls
    end
    object seNameWidth: TCnSpinEdit
      Left = 104
      Top = 36
      Width = 121
      Height = 22
      MaxValue = 300
      MinValue = 20
      TabOrder = 1
      Value = 20
      OnChange = UpdateControls
    end
    object seValueWidth: TCnSpinEdit
      Left = 104
      Top = 61
      Width = 121
      Height = 22
      MaxValue = 300
      MinValue = 20
      TabOrder = 2
      Value = 20
      OnChange = UpdateControls
    end
  end
end
