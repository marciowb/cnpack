object CnPrefixConfigForm: TCnPrefixConfigForm
  Left = 303
  Top = 149
  BorderStyle = bsDialog
  Caption = '���ǰ׺ר������'
  ClientHeight = 485
  ClientWidth = 416
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
  object grp_Config: TGroupBox
    Left = 8
    Top = 8
    Width = 401
    Height = 217
    Caption = '��ʾ����(&D)'
    TabOrder = 0
    object cbAutoPopSuggestDlg: TCheckBox
      Left = 24
      Top = 34
      Width = 370
      Height = 17
      Caption = '����������޸��������ʱ�����Ի���'
      TabOrder = 1
    end
    object cbPopPrefixDefine: TCheckBox
      Left = 24
      Top = 51
      Width = 370
      Height = 17
      Caption = '��ʾ����δ����ǰ׺�����ǰ׺����'
      TabOrder = 2
    end
    object cbAllowClassName: TCheckBox
      Left = 24
      Top = 68
      Width = 370
      Height = 17
      Caption = '����ʹ��������������������'
      TabOrder = 3
    end
    object cbAutoPrefix: TCheckBox
      Left = 8
      Top = 16
      Width = 385
      Height = 17
      Caption = '�����Զ��޸����ǰ׺'
      TabOrder = 0
      OnClick = cbAutoPrefixClick
    end
    object cbDelOldPrefix: TCheckBox
      Left = 24
      Top = 86
      Width = 370
      Height = 17
      Caption = '�Զ�����ʱ�滻ԭ���ǰ׺��'
      TabOrder = 4
    end
    object cbUseUnderLine: TCheckBox
      Left = 24
      Top = 104
      Width = 370
      Height = 17
      Caption = '���θ���ʱ���������ǰ׺������»��ߡ�'
      TabOrder = 5
    end
    object cbPrefixCaseSens: TCheckBox
      Left = 24
      Top = 121
      Width = 370
      Height = 17
      Caption = 'ǰ׺���ִ�Сд��'
      TabOrder = 6
    end
    object chkUseActionName: TCheckBox
      Left = 24
      Top = 138
      Width = 370
      Height = 17
      Caption = '���������ʱ������չ����� Action �����ơ�'
      TabOrder = 7
      OnClick = cbAutoPrefixClick
    end
    object chkWatchActionLink: TCheckBox
      Left = 40
      Top = 156
      Width = 353
      Height = 17
      Caption = '��������� Action ʱ�Զ���������'
      TabOrder = 8
    end
    object chkUseFieldName: TCheckBox
      Left = 23
      Top = 174
      Width = 370
      Height = 17
      Caption = '���������ʱ������� DataField ���Ե����ݡ�'
      TabOrder = 9
      OnClick = cbAutoPrefixClick
    end
    object chkWatchFieldLink: TCheckBox
      Left = 40
      Top = 191
      Width = 353
      Height = 17
      Caption = '������� DataField ���Ա��ʱ�Զ���������'
      TabOrder = 10
    end
  end
  object gbList: TGroupBox
    Left = 8
    Top = 232
    Width = 401
    Height = 217
    Caption = '���ǰ׺����(&P)'
    TabOrder = 1
    object lbl1: TLabel
      Left = 8
      Top = 24
      Width = 28
      Height = 13
      Caption = 'ǰ׺:'
    end
    object lbl2: TLabel
      Left = 8
      Top = 198
      Width = 184
      Height = 13
      Caption = 'ע:δѡ�м��������������ԡ�'
    end
    object ListView: TListView
      Left = 8
      Top = 48
      Width = 385
      Height = 145
      Checkboxes = True
      Columns = <
        item
          Caption = '�������'
          Width = 240
        end
        item
          Caption = '���ǰ׺'
          Width = 120
        end>
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      TabOrder = 4
      ViewStyle = vsReport
      OnChange = ListViewChange
      OnClick = ListViewClick
      OnColumnClick = ListViewColumnClick
      OnCompare = ListViewCompare
    end
    object edtPrefix: TEdit
      Left = 56
      Top = 20
      Width = 105
      Height = 21
      TabOrder = 0
      OnKeyPress = edtPrefixKeyPress
    end
    object btnModify: TButton
      Left = 168
      Top = 20
      Width = 49
      Height = 21
      Caption = '�޸�(&M)'
      TabOrder = 1
      OnClick = btnModifyClick
    end
    object btnImport: TButton
      Left = 232
      Top = 20
      Width = 75
      Height = 21
      Caption = '����(&C)'
      TabOrder = 2
      OnClick = btnImportClick
    end
    object btnExport: TButton
      Left = 312
      Top = 20
      Width = 75
      Height = 21
      Caption = '����(&H)'
      TabOrder = 3
      OnClick = btnExportClick
    end
  end
  object btnOK: TButton
    Left = 174
    Top = 456
    Width = 75
    Height = 21
    Caption = 'ȷ��(&O)'
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 254
    Top = 456
    Width = 75
    Height = 21
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 3
  end
  object btnHelp: TButton
    Left = 334
    Top = 456
    Width = 75
    Height = 21
    Caption = '����(&H)'
    TabOrder = 4
    OnClick = btnHelpClick
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'ini'
    Filter = '���ǰ׺�����ļ�(*.ini)|*.ini'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 336
    Top = 24
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'ini'
    Filter = '���ǰ׺�����ļ�(*.ini)|*.ini'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 368
    Top = 24
  end
end
