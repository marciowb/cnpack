inherited CnSrcEditorGroupReplaceForm: TCnSrcEditorGroupReplaceForm
  Left = 218
  Top = 62
  BorderStyle = bsDialog
  Caption = '���滻����'
  ClientHeight = 460
  ClientWidth = 473
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 457
    Height = 145
    Caption = '�б�(&L)'
    TabOrder = 0
    object ListView: TListView
      Left = 8
      Top = 16
      Width = 361
      Height = 121
      Columns = <
        item
          Caption = '����'
          Width = 150
        end
        item
          Caption = '��ݼ�'
          Width = 130
        end
        item
          Caption = '�滻��'
          Width = 60
        end>
      HideSelection = False
      MultiSelect = True
      OwnerData = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnData = ListViewData
      OnKeyUp = ListViewKeyUp
      OnMouseUp = ListViewMouseUp
      OnSelectItem = ListViewSelectItem
    end
    object btnAdd: TButton
      Left = 376
      Top = 16
      Width = 73
      Height = 21
      Caption = '����(&A)'
      TabOrder = 1
      OnClick = btnAddClick
    end
    object btnDelete: TButton
      Left = 376
      Top = 42
      Width = 73
      Height = 21
      Caption = 'ɾ��(&R)'
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object btnImport: TButton
      Left = 376
      Top = 91
      Width = 73
      Height = 21
      Caption = '����(&I)'
      TabOrder = 5
      OnClick = btnImportClick
    end
    object btnExport: TButton
      Left = 376
      Top = 116
      Width = 73
      Height = 21
      Caption = '����(&X)'
      TabOrder = 6
      OnClick = btnExportClick
    end
    object btnUp: TButton
      Left = 376
      Top = 66
      Width = 34
      Height = 21
      Caption = '��(&U)'
      TabOrder = 3
      OnClick = btnUpClick
    end
    object btnDown: TButton
      Left = 415
      Top = 66
      Width = 34
      Height = 21
      Caption = '��(&D)'
      TabOrder = 4
      OnClick = btnDownClick
    end
  end
  object grp2: TGroupBox
    Left = 8
    Top = 160
    Width = 457
    Height = 265
    Caption = '���滻��(&E)'
    TabOrder = 1
    object lbl1: TLabel
      Left = 8
      Top = 20
      Width = 28
      Height = 13
      Caption = '����:'
    end
    object lbl4: TLabel
      Left = 8
      Top = 44
      Width = 40
      Height = 13
      Caption = '��ݼ�:'
    end
    object lbl2: TLabel
      Left = 8
      Top = 188
      Width = 40
      Height = 13
      Caption = 'Դ�ı�:'
    end
    object lbl3: TLabel
      Left = 8
      Top = 214
      Width = 40
      Height = 13
      Caption = '�滻Ϊ:'
    end
    object lbl5: TLabel
      Left = 8
      Top = 69
      Width = 40
      Height = 13
      Caption = '�滻��:'
    end
    object edtCaption: TEdit
      Left = 56
      Top = 16
      Width = 393
      Height = 21
      TabOrder = 0
      OnChange = ControlChanged
    end
    object HotKey: THotKey
      Left = 56
      Top = 41
      Width = 393
      Height = 19
      HotKey = 0
      InvalidKeys = [hcNone, hcShift]
      Modifiers = []
      TabOrder = 1
      OnExit = ControlChanged
    end
    object lvItems: TListView
      Left = 56
      Top = 65
      Width = 313
      Height = 113
      Columns = <
        item
          Caption = 'Դ�ı�'
          Width = 95
        end
        item
          Caption = '�滻Ϊ'
          Width = 95
        end
        item
          Caption = '���Դ�Сд'
        end
        item
          Caption = '����ƥ��'
        end>
      HideSelection = False
      MultiSelect = True
      OwnerData = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 2
      ViewStyle = vsReport
      OnData = lvItemsData
      OnKeyUp = lvItemsKeyUp
      OnMouseUp = lvItemsMouseUp
      OnSelectItem = lvItemsSelectItem
    end
    object btnItemAdd: TButton
      Left = 376
      Top = 65
      Width = 73
      Height = 21
      Caption = '����(&A)'
      TabOrder = 3
      OnClick = btnItemAddClick
    end
    object btnItemDelete: TButton
      Left = 376
      Top = 91
      Width = 73
      Height = 21
      Caption = 'ɾ��(&R)'
      TabOrder = 4
      OnClick = btnItemDeleteClick
    end
    object btnItemUp: TButton
      Left = 376
      Top = 115
      Width = 34
      Height = 21
      Caption = '��(&U)'
      TabOrder = 5
      OnClick = btnItemUpClick
    end
    object btnItemDown: TButton
      Left = 415
      Top = 115
      Width = 34
      Height = 21
      Caption = '��(&D)'
      TabOrder = 6
      OnClick = btnItemDownClick
    end
    object edtSource: TEdit
      Left = 56
      Top = 184
      Width = 393
      Height = 21
      TabOrder = 7
      OnChange = ItemControlChanged
    end
    object edtDest: TEdit
      Left = 56
      Top = 210
      Width = 393
      Height = 21
      TabOrder = 8
      OnChange = ItemControlChanged
    end
    object chkIgnoreCase: TCheckBox
      Left = 56
      Top = 237
      Width = 161
      Height = 17
      Caption = '���Դ�Сд��'
      TabOrder = 9
      OnClick = ItemControlChanged
    end
    object chkWholeWord: TCheckBox
      Left = 248
      Top = 237
      Width = 161
      Height = 17
      Caption = '����ƥ�䡣'
      TabOrder = 10
      OnClick = ItemControlChanged
    end
  end
  object btnHelp: TButton
    Left = 392
    Top = 432
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 4
    OnClick = btnHelpClick
  end
  object btnOK: TButton
    Left = 232
    Top = 432
    Width = 75
    Height = 21
    Caption = 'ȷ��(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 312
    Top = 432
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 3
  end
  object dlgOpen: TOpenDialog
    DefaultExt = 'xml'
    Filter = '���滻�����ļ�(*.xml)|*.xml'
    Options = [ofFileMustExist, ofEnableSizing]
    Left = 8
    Top = 424
  end
  object dlgSave: TSaveDialog
    DefaultExt = 'xml'
    Filter = '���滻�����ļ�(*.xml)|*.xml'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 40
    Top = 424
  end
end
