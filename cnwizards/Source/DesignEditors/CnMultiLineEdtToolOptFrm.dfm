inherited CnMultiLineEditorToolsOptionForm: TCnMultiLineEditorToolsOptionForm
  Left = 364
  Top = 337
  BorderStyle = bsDialog
  Caption = '�ַ����༭��������������'
  ClientHeight = 218
  ClientWidth = 354
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 8
    Top = 8
    Width = 337
    Height = 174
    ActivePage = tsQuoted
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object tsQuoted: TTabSheet
      Caption = '����ת��'
      object lbl1: TLabel
        Left = 16
        Top = 16
        Width = 132
        Height = 13
        Caption = '��ӻ�ɾ�����õ��ַ���'
      end
      object lbl2: TLabel
        Left = 16
        Top = 72
        Width = 144
        Height = 13
        Caption = '���е����еķָ��ַ�����'
      end
      object lbl9: TLabel
        Left = 16
        Top = 44
        Width = 144
        Height = 13
        Caption = 'ȥ�����ü�ķָ��ַ�����'
      end
      object edtQuotedChar: TEdit
        Left = 204
        Top = 12
        Width = 105
        Height = 21
        MaxLength = 1
        TabOrder = 0
        OnExit = edtQuotedCharExit
      end
      object edtLineSep: TEdit
        Left = 204
        Top = 68
        Width = 105
        Height = 21
        TabOrder = 2
      end
      object edtUnQuotedSep: TEdit
        Left = 204
        Top = 40
        Width = 105
        Height = 21
        MaxLength = 1
        TabOrder = 1
        OnExit = edtQuotedCharExit
      end
    end
    object tsLineMove: TTabSheet
      Caption = '���ƶ�'
      ImageIndex = 3
      object lbl3: TLabel
        Left = 16
        Top = 16
        Width = 168
        Height = 13
        Caption = '�ƶ�����ӻ�ɾ���Ŀո���Ŀ��'
      end
      object lbl4: TLabel
        Left = 34
        Top = 64
        Width = 144
        Height = 13
        Caption = '�Ʊ���滻Ϊ�ո����Ŀ��'
      end
      object chkMoveReplaceTab: TCheckBox
        Left = 16
        Top = 40
        Width = 297
        Height = 17
        Caption = '�ƶ�ǰ�滻�Ʊ��Ϊ�ո�'
        TabOrder = 1
        OnClick = chkMoveReplaceTabClick
      end
      object seMoveSpaces: TCnSpinEdit
        Left = 264
        Top = 11
        Width = 49
        Height = 21
        MaxLength = 2
        MaxValue = 64
        MinValue = 1
        TabOrder = 0
        Value = 2
      end
      object seTabAsSpaces: TCnSpinEdit
        Left = 264
        Top = 59
        Width = 49
        Height = 21
        MaxLength = 2
        MaxValue = 64
        MinValue = 1
        TabOrder = 2
        Value = 2
      end
    end
    object tsSQLFormatter: TTabSheet
      Caption = 'SQL����ʽ��'
      ImageIndex = 2
      object grpSQLIndent: TGroupBox
        Left = 8
        Top = 68
        Width = 313
        Height = 73
        Caption = ' �����뻻�� '
        TabOrder = 1
      end
      object grpSQLCase: TGroupBox
        Left = 8
        Top = 4
        Width = 313
        Height = 61
        Caption = ' ��Сд '
        TabOrder = 0
        object lbl5: TLabel
          Left = 16
          Top = 16
          Width = 48
          Height = 13
          Caption = '�ؼ��֣�'
        end
        object lbl6: TLabel
          Left = 164
          Top = 16
          Width = 36
          Height = 13
          Caption = '������'
        end
        object lbl7: TLabel
          Left = 16
          Top = 40
          Width = 36
          Height = 13
          Caption = '������'
        end
        object lbl8: TLabel
          Left = 164
          Top = 40
          Width = 36
          Height = 13
          Caption = '������'
        end
        object cbb1: TComboBox
          Left = 68
          Top = 12
          Width = 85
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            '��д'
            'Сд'
            '����ĸ��д'
            '������')
        end
        object cbb2: TComboBox
          Left = 216
          Top = 12
          Width = 85
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            '��д'
            'Сд'
            '����ĸ��д'
            '������')
        end
        object cbb3: TComboBox
          Left = 68
          Top = 36
          Width = 85
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
          Items.Strings = (
            '��д'
            'Сд'
            '����ĸ��д'
            '������')
        end
        object cbb4: TComboBox
          Left = 216
          Top = 36
          Width = 85
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 3
          Items.Strings = (
            '��д'
            'Сд'
            '����ĸ��д'
            '������')
        end
      end
    end
  end
  object btnOK: TButton
    Left = 187
    Top = 189
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = 'ȷ��(&O)'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 270
    Top = 189
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'ȡ��(&C)'
    ModalResult = 2
    TabOrder = 2
  end
end
