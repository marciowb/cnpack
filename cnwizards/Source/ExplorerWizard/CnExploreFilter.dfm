object CnExploreFilterForm: TCnExploreFilterForm
  Left = 229
  Top = 202
  BorderStyle = bsDialog
  Caption = '�ļ�����'
  ClientHeight = 361
  ClientWidth = 435
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object tlb: TToolBar
    Left = 0
    Top = 0
    Width = 435
    Height = 22
    AutoSize = True
    Caption = 'tlb'
    DisabledImages = dmCnSharedImages.DisabledImages
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    Images = dmCnSharedImages.Images
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object btnNew: TToolButton
      Left = 0
      Top = 0
      Hint = '�½�'
      AutoSize = True
      Caption = '�½�'
      ImageIndex = 12
      ParentShowHint = False
      ShowHint = True
      OnClick = btnNewClick
    end
    object btnDelete: TToolButton
      Left = 23
      Top = 0
      Hint = 'ɾ��'
      AutoSize = True
      Caption = 'ɾ��'
      ImageIndex = 13
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDeleteClick
    end
    object btnDefault: TToolButton
      Left = 46
      Top = 0
      Hint = 'Ĭ���ļ���������'
      AutoSize = True
      Caption = 'Ĭ������'
      ImageIndex = 19
      OnClick = btnDefaultClick
    end
    object btn4: TToolButton
      Left = 69
      Top = 0
      Width = 8
      Caption = 'btn4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnClear: TToolButton
      Left = 77
      Top = 0
      Hint = '����'
      AutoSize = True
      Caption = '����'
      ImageIndex = 31
      OnClick = btnClearClick
    end
    object btn3: TToolButton
      Left = 100
      Top = 0
      Width = 8
      Caption = 'btn3'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btnFilter: TToolButton
      Left = 108
      Top = 0
      Hint = '�˳�'
      AutoSize = True
      Caption = '�˳�'
      ImageIndex = 0
      OnClick = btnFilterClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 275
    Width = 435
    Height = 67
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 2
    object grp: TGroupBox
      Left = 8
      Top = 8
      Width = 417
      Height = 49
      Caption = '��������'
      TabOrder = 0
      object chkFolder: TCheckBox
        Left = 12
        Top = 22
        Width = 97
        Height = 17
        Caption = '�ļ���'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkFiles: TCheckBox
        Left = 109
        Top = 22
        Width = 97
        Height = 17
        Caption = '�ļ�'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object chkHider: TCheckBox
        Left = 206
        Top = 22
        Width = 171
        Height = 17
        Caption = '���ص��ļ�(��)'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
    end
  end
  object stat: TStatusBar
    Left = 0
    Top = 342
    Width = 435
    Height = 19
    Panels = <
      item
        Width = 300
      end>
    ParentFont = True
    SimplePanel = True
    UseSystemFont = False
  end
  object lvFilter: TListView
    Left = 0
    Top = 22
    Width = 435
    Height = 253
    Align = alClient
    Columns = <
      item
        Caption = '����'
        Width = 100
      end
      item
        AutoSize = True
        Caption = '��չ��'
        MinWidth = 100
      end>
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
    OnDblClick = lvFilterDblClick
  end
end
