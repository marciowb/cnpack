object CnWizBootForm: TCnWizBootForm
  Left = 215
  Top = 134
  Width = 549
  Height = 392
  BorderIcons = [biSystemMenu]
  Caption = 'CnPack IDE ר����������'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lvWizardsList: TListView
    Left = 0
    Top = 22
    Width = 541
    Height = 324
    Align = alClient
    Checkboxes = True
    Columns = <
      item
        Caption = '���'
        Width = 40
      end
      item
        Caption = 'ר������'
        Width = 180
      end
      item
        Caption = 'ר��ID'
        Width = 150
      end
      item
        Caption = 'ר������'
        Width = 150
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnClick = lvWizardsListClick
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 541
    Height = 22
    AutoSize = True
    Caption = 'ToolBar1'
    DisabledImages = dmCnSharedImages.DisabledImages
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    Images = dmCnSharedImages.Images
    TabOrder = 1
    object tbnSelectAll: TToolButton
      Left = 0
      Top = 0
      Hint = 'ѡ������ר��'
      Caption = 'ȫ��ѡ��(&W)'
      ImageIndex = 61
      ParentShowHint = False
      ShowHint = True
      OnClick = tbnSelectAllClick
    end
    object tbnUnSelect: TToolButton
      Left = 23
      Top = 0
      Hint = 'ȡ��ѡ��ר��'
      Caption = 'ȡ��ѡ��(&N)'
      ImageIndex = 62
      ParentShowHint = False
      ShowHint = True
      OnClick = tbnUnSelectClick
    end
    object tbnReverseSelect: TToolButton
      Left = 46
      Top = 0
      Hint = '����ѡ��ר��'
      Caption = '����ѡ��(&V)'
      ImageIndex = 63
      ParentShowHint = False
      ShowHint = True
      OnClick = tbnReverseSelectClick
    end
    object ToolButton5: TToolButton
      Left = 69
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object tbtnOK: TToolButton
      Left = 77
      Top = 0
      Hint = '����ѡ���ר����'
      Caption = '����ѡ��(&L)'
      ImageIndex = 39
      ParentShowHint = False
      ShowHint = True
      OnClick = tbtnOKClick
    end
    object tbtnCancel: TToolButton
      Left = 100
      Top = 0
      Hint = 'ȡ����ǰѡ��'
      Caption = 'ȡ����ǰѡ��(&C)'
      ImageIndex = 13
      ParentShowHint = False
      ShowHint = True
      OnClick = tbtnCancelClick
    end
  end
  object stbStatusbar: TStatusBar
    Left = 0
    Top = 346
    Width = 541
    Height = 19
    AutoHint = True
    Panels = <
      item
        Bevel = pbNone
        Width = 160
      end
      item
        Text = '��ǰר�ң�'
        Width = 120
      end
      item
        Text = '����ר�ң�'
        Width = 120
      end
      item
        Width = 50
      end>
    ParentFont = True
    SimplePanel = False
    UseSystemFont = False
  end
end
