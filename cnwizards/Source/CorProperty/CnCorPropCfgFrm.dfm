object CnCorPropCfgForm: TCnCorPropCfgForm
  Left = 228
  Top = 128
  BorderStyle = bsDialog
  Caption = '�����޸�����������'
  ClientHeight = 380
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblCount: TLabel
    Left = 16
    Top = 352
    Width = 3
    Height = 13
  end
  object btnOK: TButton
    Left = 283
    Top = 351
    Width = 75
    Height = 21
    Action = ActionConfirm
    Default = True
    TabOrder = 4
  end
  object btnCancel: TButton
    Left = 369
    Top = 351
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 5
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 521
    Height = 329
    Caption = '�����޸Ĺ���(&R)'
    TabOrder = 0
    object ListView: TListView
      Left = 8
      Top = 56
      Width = 505
      Height = 265
      Checkboxes = True
      Columns = <
        item
          Caption = '�����'
          Width = 100
        end
        item
          Caption = '����'
          Width = 100
        end
        item
          Caption = '����'
          Width = 36
        end
        item
          Caption = '����ֵ'
          Width = 100
        end
        item
          Caption = '����'
          Width = 60
        end
        item
          Caption = '�޸�Ϊ'
          Width = 100
        end>
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      ViewStyle = vsReport
      OnChange = ListViewChange
      OnColumnClick = ListViewColumnClick
      OnCompare = ListViewCompare
      OnDblClick = ListViewDblClick
      OnKeyDown = ListViewKeyDown
    end
    object btnAdd: TButton
      Left = 9
      Top = 24
      Width = 75
      Height = 21
      Action = ActionAdd
      TabOrder = 0
    end
    object btnDel: TButton
      Left = 223
      Top = 24
      Width = 75
      Height = 21
      Action = ActionDel
      TabOrder = 2
    end
    object btnLoad: TButton
      Left = 330
      Top = 24
      Width = 75
      Height = 21
      Action = ActionLoad
      TabOrder = 3
    end
    object btnSave: TButton
      Left = 437
      Top = 24
      Width = 75
      Height = 21
      Action = ActionSave
      TabOrder = 4
    end
    object btnEdit: TButton
      Left = 116
      Top = 24
      Width = 75
      Height = 21
      Action = ActionEdit
      TabOrder = 1
    end
  end
  object ckbOpenFile: TCheckBox
    Left = 8
    Top = 344
    Width = 113
    Height = 17
    Caption = '���ļ�ʱ���'
    TabOrder = 1
    Visible = False
  end
  object ckbCloseFile: TCheckBox
    Left = 120
    Top = 344
    Width = 121
    Height = 17
    Caption = '�ر��ļ�ʱ���'
    TabOrder = 2
    Visible = False
  end
  object ckbNewComp: TCheckBox
    Left = 8
    Top = 360
    Width = 109
    Height = 17
    Caption = '��ӿؼ�ʱ���'
    TabOrder = 3
    Visible = False
  end
  object btnHelp: TButton
    Left = 454
    Top = 351
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 6
    OnClick = btnHelpClick
  end
  object ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 429
    Top = 4
    object ActionConfirm: TAction
      Caption = 'ȷ��(&O)'
      OnExecute = ActionConfirmExecute
    end
    object ActionLoad: TAction
      Caption = '����(&L)'
      OnExecute = ActionLoadExecute
    end
    object ActionSave: TAction
      Caption = '����(&S)'
      OnExecute = ActionSaveExecute
    end
    object ActionAdd: TAction
      Caption = '���(&A)'
      OnExecute = ActionAddExecute
    end
    object ActionDel: TAction
      Caption = 'ɾ��(&D)'
      OnExecute = ActionDelExecute
    end
    object ActionEdit: TAction
      Caption = '�༭(&E)'
      OnExecute = ActionEditExecute
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'rul'
    Filter = '�������������ļ�(*.rul)|*.rul'
    Left = 389
    Top = 4
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'rul'
    Filter = '�������������ļ�(*.rul)|*.rul'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 349
    Top = 4
  end
end
